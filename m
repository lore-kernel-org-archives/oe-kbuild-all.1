Content-Type: multipart/mixed; boundary="===============5117932767380700416=="
MIME-Version: 1.0
From: Andrea Arcangeli <aarcange@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: [aa:mapcount_deshare 20/27] mm/gup.c:2756:3: error: implicit declaration of function 'mm_set_has_pinned_flag'
Date: Tue, 11 May 2021 11:27:49 -0400
Message-ID: <YJqidUiqsgfibl+R@redhat.com>
In-Reply-To: <YJqWdPZEro8Thkcr@t490s>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5117932767380700416==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 11, 2021 at 10:36:36AM -0400, Peter Xu wrote:
> On Tue, May 11, 2021 at 10:23:39AM -0400, Peter Xu wrote:
> > On Tue, May 11, 2021 at 08:31:23AM -0400, Andrea Arcangeli wrote:
> > > Hello,
> > > =

> > > thanks to the report.
> > > =

> > > Peter, this isn't immediately clear to me, is it perhaps something
> > > related to clang?
> > > =

> > > This is commit 8dec302e87453234fc7ac1cf4d09e4d577a06cf3
> > =

> > Andrea,
> > =

> > I guess it's probably a NOMMU arm config so the helper got opted out as=
 I
> > errornously put it into a CONFIG_MMU block without noticing..
> > =

> > So we may need to squash below into that commit.
> > =

> > I really should think of something to avoid such errors in the future, =
as this
> > is the 2nd time happening at least this year..  Probably I should alway=
s start
> > adding helpers at the beginning of files so I won't overlook any macros=
..
> > =

> > Thanks,
> > =

> > ----8<----
> > diff --git a/mm/gup.c b/mm/gup.c
> > index bb130723a6717..0223644d0c61a 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -392,6 +392,17 @@ void unpin_user_pages(struct page **pages, unsigne=
d long npages)
> >  }
> >  EXPORT_SYMBOL(unpin_user_pages);
> >  =

> > +/*
> > + * Set the MMF_HAS_PINNED if not set yet; after set it'll be there for=
 the mm's
> > + * lifecycle.  Avoid setting the bit unless necessary, or it might cau=
se write
> > + * cache bouncing on large SMP machines for concurrent pinned gups.
> > + */
> > +static inline void mm_set_has_pinned_flag(unsigned long *mm_flags)
> > +{
> > +       if (!test_bit(MMF_HAS_PINNED, mm_flags))
> > +               set_bit(MMF_HAS_PINNED, mm_flags);
> > +}
> > +
> >  #ifdef CONFIG_MMU
> >  static struct page *no_page_table(struct vm_area_struct *vma,
> >                 unsigned int flags)
> > @@ -1270,17 +1281,6 @@ int fixup_user_fault(struct mm_struct *mm,
> >  }
> >  EXPORT_SYMBOL_GPL(fixup_user_fault);
> >  =

> > -/*
> > - * Set the MMF_HAS_PINNED if not set yet; after set it'll be there for=
 the mm's
> > - * lifecycle.  Avoid setting the bit unless necessary, or it might cau=
se write
> > - * cache bouncing on large SMP machines for concurrent pinned gups.
> > - */
> > -static inline void mm_set_has_pinned_flag(unsigned long *mm_flags)
> > -{
> > -       if (!test_bit(MMF_HAS_PINNED, mm_flags))
> > -               set_bit(MMF_HAS_PINNED, mm_flags);
> > -}
> > -
> >  /*
> >   * Please note that this function, unlike __get_user_pages will not
> >   * return 0 for nr_pages > 0 without FOLL_NOWAIT
> > ----8<----
> =

> Btw, there's also a space issue with the patch (we need to reindent
> mm_set_has_pinned_flag so to use tabs rather than spaces), otherwise chec=
kpatch
> seems to complain.  Sorry about both issues!

Right, noticed the space issue but I didn't report it because it was
secondary.

Agreed it looks the nommu issue. In the patch the nommu bit didn't
showup since context was missing.

Thanks!
Andrea

--===============5117932767380700416==--

