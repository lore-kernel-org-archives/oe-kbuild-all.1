Content-Type: multipart/mixed; boundary="===============8521287956708371759=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [tip:x86/mm 1/23] arch/x86/mm/init.c:75:6: warning: no previous prototype for function 'x86_has_pat_wp'
Date: Wed, 20 May 2020 09:24:04 +0800
Message-ID: <20200520012404.GA3992@intel.com>
In-Reply-To: <CAKwvOdkPW2p-4fDUNT6so3DrxiJgtUNEFPJcHNf7VROozc4wjQ@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8521287956708371759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2020 at 06:07:14PM -0700, Nick Desaulniers wrote:
> On Tue, May 19, 2020 at 5:53 PM Philip Li <philip.li@intel.com> wrote:
> >
> > On Tue, May 19, 2020 at 05:26:18PM -0700, Nick Desaulniers wrote:
> > > I think having in the top of the warning that this is a W=3D1 build w=
ill
> > > make it more obvious.
> > >
> > > I get that -Wmissing-prototypes can be noisy, but it's trivial to fix.
> > > I do worry what other warnings lurk in W=3D1 though...
> > with some monitoring, so far, issue like unused-but-set-variable is qui=
te
> > helpful. We will keep monitor for other issues and feedbacks.
> =

> Hey, I'm always happy to see more warnings turned on.  In our
> experience, we had to get a sense of how many instances of a newly
> enabled warning there are, and estimate how much time it would take to
> fix them all.  It's further complicated by the fix going into
> different maintainers' trees and reaching mainline at different points
> in time, while regressions continue to sneak in until the warning is
> enabled.
thanks and agree all the thinking here. For the 0-day ci side, we will
be very careful, since the mechanism for us is to notify newly introduced
problems from developer's patch, this can allow relatively min effort
to solve the new problems.

The other consideration is we test a lot of developer's tree and mailing
list before they are upstream, we also hope such shift left testing can
expose these warnings in new patches before maintainer's trees. Of course,
there're extra reports due to W=3D1 against stable or mainline, while the
number is small comparing to developer and mailing list part.

> =

> It may be time to consider "promoting" some warnings from W=3D1 to be on
> by default.  But that takes careful manual review and estimation of
> the work involved.  Turning on W=3D1 may be blasting people with a lot
> of new warnings, but if developers treat them with the same respect as
> the default enabled ones for Kbuild then I'm not complaining.
> -- =

> Thanks,
> ~Nick Desaulniers
--===============8521287956708371759==--

