# Card Listing Redesign - Small PRD

## Problem statement

The current Cards page separates cards into **My Cards** and **Team Expense Cards**, and only shows cards for the selected Account. This makes it hard for members to understand all cards available to the business at a glance, who owns each card, and which Account or Budget the card is linked to.

Today, around 90% of users have one Account, but Budgets introduce more account-like places where cards can be issued. Customers currently need to use the Account selector to find cards issued under a different Account or Budget, which is not intuitive. We already have customer feedback that some users are unable to find cards issued under a different Account.

The page also has two separate **Order** entry points: one for ordering a card for yourself and one for ordering cards for team members. The target journey requires one **Order card** CTA that routes users to a single entry page where they choose whether they want a card for themselves or a Team card.

## MVP framing

Improve card-management clarity by helping users find all visible cards across Accounts and Budgets from one Cards page, understand whether each card is their own, a team member's, or a co-Director's, and start card ordering from one market-standard entry point.

## Goals

- Show all cards in one unified listing.
- Make each card's owner, ownership context, and linked Account or Budget clear.
- Replace separate self/team order entry points with one **Order card** CTA.
- Add a single order entry page where users select **Card for themselves** or **Team card**.
- Keep card management as the primary task on the page, with cashback offers treated as secondary content.

## Non-goals

- Changing card eligibility, KYC, approval, or permission rules.
- Changing card controls, limits, cashback offers, or transaction details.
- Introducing new card types.

## Scope

| In scope | Out of scope |
| --- | --- |
| One card listing for all visible cards | New card products or card types |
| Cardholder name, ownership context, linked Account or Budget, and card state on each card item | Changes to eligibility or approval logic |
| One primary **Order card** CTA | Redesign of card detail, limits, or transaction screens |
| Order entry page with **Card for themselves** and **Team card** options | Changes to cashback offer mechanics |
| Account/Budget filtering within the card listing | Showing inactive or cancelled cards in the main list |
| Empty state for users with no cards to show | New permission model |

## User stories

- As a business member, I can view all cards in one list so that I can understand the business's card setup quickly.
- As a business member, I can identify whether a card is my card, a Team card, or a co-Director card so that I understand card ownership without separate page sections.
- As a multi-account or Budgets user, I can identify which Account or Budget each card spends from so that I do not need to switch Accounts just to find a card.
- As an Admin, I can start one order journey and choose **Card for themselves** or **Team card** so that card issuing follows one consistent entry point.

## Requirements

1. Replace **My Cards** and **Team Expense Cards** with a single card listing.
2. Each card item must show:
   - Cardholder name.
   - A clear "You" indicator when the card belongs to the signed-in user.
   - Ownership context: **My card**, **Team card**, or **Co-Director card**.
   - Linked Account or Budget.
   - Card state: **Active**, **Pending**, or **Frozen**.
3. **Frozen** should be shown as a label on the card item for an active card that is currently frozen.
4. The default listing must show cards across all Accounts and Budgets visible to the user, not only the currently selected Account.
5. The listing should include an Account/Budget filter so users can narrow cards when needed.
6. The main listing should show only cards that are relevant for day-to-day card management:
   - **Active** cards.
   - **Frozen** active cards.
   - **Pending** cards.
   - **Pending** means a team member has not completed onboarding after downloading the app to get the card grant.
   - Inactive and cancelled cards are not part of the main list in the MVP.
7. Cashback offers should sit below the unified card list as a secondary module, not between the page header/action and the cards.
8. Provide one primary **Order card** CTA.
9. The **Order card** CTA must open an order entry page with two options:
   - **Card for themselves**.
   - **Team card**.
10. Only Admins, including co-Directors with Admin rights, can issue cards to team members.
11. Provide a dedicated empty state when the user has no cards to show.
    - The empty state should explain that there are no active, frozen, or pending cards to show.
    - If the user is eligible to order a card, include the primary **Order card** CTA.
12. Existing eligibility, validation, and permission rules continue to apply.

## Product decisions

- The default view shows all cards across all visible Accounts and Budgets.
- Users can filter the card listing by Account or Budget.
- The listing should keep **My card** and **Team card** as ownership context, not as separate page sections.
- Co-Director cards should be distinguishable from other Team cards because co-Directors effectively have Admin rights.
- The main listing shows **Active**, **Frozen**, and **Pending** cards only.
- Only Admins, including co-Directors with Admin rights, can issue cards to team members.
- One **Order card** CTA is mandatory because the journey needs one standard entry point before the user chooses **Card for themselves** or **Team card**.
- Recommendation: place cashback offers below the card list as a secondary benefits module. This keeps the primary card-management workflow uninterrupted while preserving access to offers.

## Success metrics

| Metric | Baseline | Target |
| --- | --- | --- |
| Successful card orders from the Cards page | Current completion rate for existing self/team order entry points, measured before launch | +3-5% relative uplift in completed card orders per Cards page visitor |
| Card-order journey drop-off | Current drop-off from **Order** tap to submitted card order, measured before launch | 5-8% relative reduction in drop-off |
| Support contacts about finding personal/team cards | Current monthly volume of support contacts tagged to card discovery, team cards, Budgets, or account/card visibility | 10% reduction against baseline |
| Card discovery in usability testing | Current design benchmark, if available; otherwise first test round becomes baseline | 85% of participants can find a card issued under a different Account or Budget without using the global Account selector |
| Owner and Account/Budget identification in usability testing | Current design benchmark, if available; otherwise first test round becomes baseline | 85% of participants can identify cardholder, ownership context, and linked Account or Budget without facilitator help |
| Correct order entry selection in usability testing | Current design benchmark, if available; otherwise first test round becomes baseline | 85% of eligible participants can choose **Card for themselves** or **Team card** correctly from the order entry page |

## Risks and mitigations

| Risk | Mitigation |
| --- | --- |
| Users with many cards may find a single list hard to scan. | Include clear metadata and Account/Budget filtering. |
| Cross-account listing may conflict with existing Account selector expectations. | Default to all Accounts/Budgets, label each card's Account or Budget clearly, and provide filtering. |
| Co-Director cards may be confused with regular Team cards. | Add a clear co-Director ownership indicator while avoiding separate page sections. |
| One order entry point may hide different permission states. | Keep existing permission checks and explain unavailable options in the order entry page and downstream flow. |
| Cashback and promotional cards may distract from card management. | Move cashback below the unified card list as secondary content. |

## Open questions

- What user journey drop-off data should be used as the pre-launch baseline once available?
