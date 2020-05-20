Content-Type: multipart/mixed; boundary="===============2661974822652047969=="
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [tip:x86/mm 1/23] arch/x86/mm/init.c:75:6: warning: no previous prototype for function 'x86_has_pat_wp'
Date: Tue, 19 May 2020 18:07:14 -0700
Message-ID: <CAKwvOdkPW2p-4fDUNT6so3DrxiJgtUNEFPJcHNf7VROozc4wjQ@mail.gmail.com>
In-Reply-To: <20200520005218.GA3101@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2661974822652047969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2020 at 5:53 PM Philip Li <philip.li@intel.com> wrote:
>
> On Tue, May 19, 2020 at 05:26:18PM -0700, Nick Desaulniers wrote:
> > I think having in the top of the warning that this is a W=3D1 build will
> > make it more obvious.
> >
> > I get that -Wmissing-prototypes can be noisy, but it's trivial to fix.
> > I do worry what other warnings lurk in W=3D1 though...
> with some monitoring, so far, issue like unused-but-set-variable is quite
> helpful. We will keep monitor for other issues and feedbacks.

Hey, I'm always happy to see more warnings turned on.  In our
experience, we had to get a sense of how many instances of a newly
enabled warning there are, and estimate how much time it would take to
fix them all.  It's further complicated by the fix going into
different maintainers' trees and reaching mainline at different points
in time, while regressions continue to sneak in until the warning is
enabled.

It may be time to consider "promoting" some warnings from W=3D1 to be on
by default.  But that takes careful manual review and estimation of
the work involved.  Turning on W=3D1 may be blasting people with a lot
of new warnings, but if developers treat them with the same respect as
the default enabled ones for Kbuild then I'm not complaining.
-- =

Thanks,
~Nick Desaulniers
--===============2661974822652047969==--

