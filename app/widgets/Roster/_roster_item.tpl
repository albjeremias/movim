<li
    id="{$contact->jid|cleanupId}"
    title="{$contact->jid}{if="$contact->presence"} - {$contact->presence->presencetext}{/if}"
    name="{$contact->getSearchTerms()}"
    class="block"
    onclick="
        MovimUtils.redirect('{$c->route('contact', $contact->jid)}')
    ">
    {$url = $contact->getPhoto('s')}
    {if="$url"}
        <span class="primary icon bubble
            {if="!$contact->presence || $contact->presence->value > 4"}
                disabled
            {else}
                status {$contact->presence->presencekey}
            {/if}"
            style="background-image: url({$url});">
        </span>
    {else}
        <span class="primary icon bubble color {$contact->jid|stringToColor}
            {if="!$contact->presence || $contact->presence->value > 4"}
                disabled
            {else}
                status {$contact->presence->presencekey}
            {/if}
        ">
            {$contact->truename|firstLetterCapitalize}
        </span>
    {/if}
    {if="$contact->subscription != 'both'"}
    <span class="control icon gray">
        {if="$contact->subscription == 'to'"}
            <i class="zmdi zmdi-arrow-in"></i>
        {elseif="$contact->subscription == 'from'"}
            <i class="zmdi zmdi-arrow-out"></i>
        {else}
            <i class="zmdi zmdi-block"></i>
        {/if}
    </span>
    {/if}
    <p class="normal line">{$contact->truename}</p>
    {if="$contact->group"}
    <p>
        <span class="tag color {$contact->group|stringToColor}">
            {$contact->group}
        </span>
    </p>
    {/if}
</li>
