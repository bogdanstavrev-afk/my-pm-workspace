# Card Listing Redesign - Small PRD

## Problem statement

The current Cards page separates cards into **My Cards** and **Team Expense Cards**, and only shows cards for the selected Account. This makes it hard for members to understand all cards available to the business at a glance, who owns each card, what role that person has, and which Account the card is linked to.

The page also has two separate **Order** entry points: one for ordering a card for yourself and one for ordering cards for team members. This splits what should be a single issue-card journey.

## Goals

- Show all cards in one unified listing.
- Make each card's owner, owner role, and linked Account clear.
- Replace separate self/team order entry points with one issue-card journey.
- Allow the requester to assign a new card to themselves or an existing team member during that journey.

## Non-goals

- Changing card eligibility, KYC, approval, or permission rules.
- Changing card controls, limits, cashback offers, or transaction details.
- Introducing new card types.

## Scope

| In scope | Out of scope |
| --- | --- |
| One card listing for all visible cards | New card products or card types |
| Cardholder name, role, and linked Account on each card item | Changes to eligibility or approval logic |
| One primary issue/order-card CTA | Redesign of card detail, limits, or transaction screens |
| Assignee selection inside the issue-card journey | Changes to cashback offer mechanics |

## User stories

- As a business member, I can view all cards in one list so that I can understand the business's card setup quickly.
- As an admin, I can see each cardholder's name, role, and linked Account so that I can manage cards with confidence.
- As a multi-account user, I can identify which Account each card spends from so that I understand card-account relationships without switching Accounts.
- As a requester, I can start one issue-card journey and choose myself or a team member as the assignee so that I do not need to pick between separate order buttons.

## Requirements

1. Replace **My Cards** and **Team Expense Cards** with a single card listing.
2. Each card item must show:
   - Cardholder name.
   - A clear "You" indicator when the card belongs to the signed-in user.
   - Cardholder role.
   - Linked Account.
   - Card status where currently available.
3. The listing must support cards across Accounts visible to the user, not only the currently selected Account.
4. Provide one primary **Order card** or **Issue card** CTA.
5. The issue-card journey must include assignee selection:
   - Myself.
   - Existing team member.
6. Existing eligibility, validation, and permission rules continue to apply.

## Success metrics

- Increase successful card orders from the Cards page by [OPEN QUESTION: target % and baseline].
- Reduce card-order journey drop-off by [OPEN QUESTION: target % and baseline].
- Reduce support contacts about finding personal/team cards by [OPEN QUESTION: target % and baseline].
- Improve usability-test success for identifying card owner and linked Account to [OPEN QUESTION: target %].

## Risks and mitigations

| Risk | Mitigation |
| --- | --- |
| Users with many cards may find a single list hard to scan. | Include clear metadata and consider filters/search as a follow-up. |
| Cross-account listing may conflict with existing Account selector expectations. | Label each Account clearly and confirm desired selector behaviour before build. |
| Role naming may be inconsistent across systems. | Use the existing team/member role source of truth. |
| One issue-card journey may hide different permission states. | Keep existing permission checks and explain unavailable assignee options in-flow. |
| Cashback and promotional cards may distract from card management. | Keep these modules visually separate from the unified card list. |

## Open questions

- Should the default listing show all visible Accounts, or should users be able to filter by Account?
- Which role labels should be displayed, and what is the source of truth?
- Should inactive, frozen, cancelled, and pending cards appear in the same list?
- Where should cashback offers sit relative to the unified card list?
- Which users can issue cards to other team members?
