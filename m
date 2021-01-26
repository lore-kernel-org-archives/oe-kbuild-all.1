Content-Type: multipart/mixed; boundary="===============8058976746066543983=="
MIME-Version: 1.0
From: Dennis Zhou <dennis@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] percpu: fix clang modpost warning in pcpu_build_alloc_info()
Date: Tue, 26 Jan 2021 05:11:32 +0000
Message-ID: <YA+khB+34zmp+Aj7@google.com>
In-Reply-To: <CAKwvOdnxnooqtyeSem63V_P5980jc0Z2PDG=0iM8ixeYTSaTCg@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8058976746066543983==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Nick,

On Mon, Jan 25, 2021 at 10:27:11AM -0800, Nick Desaulniers wrote:
> On Mon, Jan 25, 2021 at 3:07 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > On Tue, Jan 5, 2021 at 1:55 AM Dennis Zhou <dennis@kernel.org> wrote:
> > >
> > > On Mon, Jan 04, 2021 at 04:46:51PM -0700, Nathan Chancellor wrote:
> > > > On Thu, Dec 31, 2020 at 09:28:52PM +0000, Dennis Zhou wrote:
> > > > >
> > >
> > > Hi Nathan,
> > >
> > > >
> > > > Hi Dennis,
> > > >
> > > > I did a bisect of the problematic config against defconfig and it p=
oints
> > > > out that CONFIG_GCOV_PROFILE_ALL is in the bad config but not the g=
ood
> > > > config, which makes some sense as that will mess with clang's inlin=
ing
> > > > heuristics. It does not appear to be the single config that makes a
> > > > difference but it gives some clarity.
> > > >
> > >
> > > Ah, thanks. To me it's kind of a corner case that I don't have a lot =
of
> > > insight into. __init code is pretty limited and this warning is really
> > > at the compilers whim. However, in this case only clang throws this
> > > warning.
> > >
> > > > I do not personally have any strong opinions around the patch but i=
s it
> > > > really that much wasted memory to just annotate mask with __refdata?
> > >
> > > It's really not much memory, 1 bit per max # of cpus. The reported
> > > config is on the extreme side compiling with 8k NR_CPUS, so 1kb. I'm
> > > just not in love with the idea of adding a patch to improve readabili=
ty
> > > and it cost idle memory to resolve a compile time warning.
> > >
> > > If no one else chimes in in the next few days, I'll probably just app=
ly
> > > it and go from there. If another issue comes up I'll drop this and tag
> > > it as __refdata.
> >
> > I've come across this one again in linux-next today, and found that
> > I had an old patch for it already, that I had never submitted:
> >
> > From 7d6f40414490092b86f1a64d8c42426ee350da1a Mon Sep 17 00:00:00 2001
> > From: Arnd Bergmann <arnd@arndb.de>
> > Date: Mon, 7 Dec 2020 23:24:20 +0100
> > Subject: [PATCH] mm: percpu: fix section mismatch warning
> >
> > Building with arm64 clang sometimes (fairly rarely) shows a
> > warning about the pcpu_build_alloc_info() function:
> >
> > WARNING: modpost: vmlinux.o(.text+0x21697c): Section mismatch in
> > reference from the function cpumask_clear_cpu() to the variable
> > .init.data:pcpu_build_alloc_info.mask
> > The function cpumask_clear_cpu() references
> > the variable __initdata pcpu_build_alloc_info.mask.
> > This is often because cpumask_clear_cpu lacks a __initdata
> > annotation or the annotation of pcpu_build_alloc_info.mask is wrong.
> >
> > What appears to be going on here is that the compiler decides to not
> > inline the cpumask_clear_cpu() function that is marked 'inline' but not
> > 'always_inline', and it then produces a specialized version of it that
> > references the static mask unconditionally as an optimization.
> >
> > Marking cpumask_clear_cpu() as __always_inline would fix it, as would
> > removing the __initdata annotation on the variable.  I went for marking
> > the function as __attribute__((flatten)) instead because all functions
> =

> I had to look this one up; it's new to me!
> https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#Common=
-Function-Attributes
> https://awesomekling.github.io/Smarter-C++-inlining-with-attribute-flatte=
n/
> =

> Seems pretty cool/flexible to control inlining on the caller side!
> =

> At the least though, we should avoid open coding the function attributes.=
  See
> include/linux/compiler_attributes.h
> =


Arnd do you mind spinning a new version to add __flatten to
compiler_attributes.h?

> Testing quickly in godbolt, __flatten__ has been supported since at
> least clang 3.5 and gcc 4.4, FWIW (so it doesn't need a
> __has_attribute guard).
> =


Thanks for testing this!

Thanks,
Dennis
--===============8058976746066543983==--

