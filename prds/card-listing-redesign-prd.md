# Card Listing Redesign - Small PRD

## Problem statement

The current Cards page separates cards into **My Cards** and **Team Expense Cards**, and only shows cards for the selected Account. This makes it hard for members to understand all cards available to the business at a glance, who owns each card, what role that person has, and which Account the card is linked to.

The page also has two separate **Order** entry points: one for ordering a card for yourself and one for ordering cards for team members. This splits what should be a single issue-card journey.

## Goals

- Show all cards in one unified listing.
- Make each card's owner, owner role, and linked Account clear.
- Replace separate self/team order entry points with one issue-card journey.
- Allow the requester to assign a new card to themselves or an existing team member during that journey.
- Keep card management as the primary task on the page, with cashback offers treated as secondary content.

## Non-goals

- Changing card eligibility, KYC, approval, or permission rules.
- Changing card controls, limits, cashback offers, or transaction details.
- Introducing new card types.

## Scope

| In scope | Out of scope |
| --- | --- |
| One card listing for all visible cards | New card products or card types |
| Cardholder name, role, linked Account, and active/pending state on each card item | Changes to eligibility or approval logic |
| One primary issue/order-card CTA | Redesign of card detail, limits, or transaction screens |
| Assignee selection inside the issue-card journey | Changes to cashback offer mechanics |
| Account filtering within the card listing | Showing inactive, frozen, or cancelled cards in the main list |

## User stories

- As a business member, I can view all cards in one list so that I can understand the business's card setup quickly.
- As a Director, I can see each cardholder's name, role, and linked Account so that I can manage cards with confidence.
- As a multi-account user, I can identify which Account each card spends from so that I understand card-account relationships without switching Accounts.
- As a Director, I can start one issue-card journey and choose myself or a team member as the assignee so that I do not need to pick between separate order buttons.

## Requirements

1. Replace **My Cards** and **Team Expense Cards** with a single card listing.
2. Each card item must show:
   - Cardholder name.
   - A clear "You" indicator when the card belongs to the signed-in user.
   - Cardholder role: **Director** or **Team Expense Member**.
   - Linked Account.
   - Card status: **Active** or **Pending**.
3. The default listing must show cards across all Accounts visible to the user, not only the currently selected Account.
4. The listing should include an Account filter so users can narrow cards by Account when needed.
5. The main listing should show only **Active** and **Pending** cards.
   - **Pending** means a Team Expense Member has not completed onboarding after downloading the app to get the card grant.
   - Inactive, frozen, and cancelled card states should be surfaced on card detail pages, not in the main listing.
6. Cashback offers should sit below the unified card list as a secondary module, not between the page header/action and the cards.
7. Provide one primary **Order card** or **Issue card** CTA.
8. Only **Directors** can issue cards to other team members.
9. The issue-card journey must include assignee selection:
   - Myself.
   - Existing team member.
10. Existing eligibility, validation, and permission rules continue to apply.

## Product decisions

- The default view shows all cards across all visible Accounts.
- Users can filter the card listing by Account.
- Role labels are **Director** and **Team Expense Member**.
- Directors can see their own card, co-Director cards, and Team Expense Member cards.
- The main listing shows **Active** and **Pending** cards only.
- Only Directors can issue cards to team members.
- Recommendation: place cashback offers below the card list as a secondary benefits module. This keeps the primary card-management workflow uninterrupted while preserving access to offers.

## Success metrics

- Increase successful card orders from the Cards page by [OPEN QUESTION: target % and baseline].
- Reduce card-order journey drop-off by [OPEN QUESTION: target % and baseline].
- Reduce support contacts about finding personal/team cards by [OPEN QUESTION: target % and baseline].
- Improve usability-test success for identifying card owner and linked Account to [OPEN QUESTION: target %].

## Risks and mitigations

| Risk | Mitigation |
| --- | --- |
| Users with many cards may find a single list hard to scan. | Include clear metadata and consider filters/search as a follow-up. |
| Cross-account listing may conflict with existing Account selector expectations. | Default to all Accounts, label each Account clearly, and provide an Account filter. |
| Role naming may be inconsistent across systems. | Use the agreed labels: Director and Team Expense Member. |
| One issue-card journey may hide different permission states. | Keep existing permission checks and explain unavailable assignee options in-flow. |
| Cashback and promotional cards may distract from card management. | Move cashback below the unified card list as secondary content. |

## Open questions

- What are the baseline and target values for the success metrics?
- Should the initial version include search in addition to Account filtering?
- Should the list have a separate empty state for users with no active or pending cards?
