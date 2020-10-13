Content-Type: multipart/mixed; boundary="===============3001964144314827893=="
MIME-Version: 1.0
From: Roman Gushchin <guro@fb.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] mm: memcg/slab: fix slab statistics in !SMP configuration
Date: Mon, 12 Oct 2020 17:31:08 -0700
Message-ID: <20201013003108.GA3687509@carbon.dhcp.thefacebook.com>
In-Reply-To: <20201012230550.GB19671@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3001964144314827893==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2020 at 07:05:50AM +0800, Philip Li wrote:
> On Fri, Oct 02, 2020 at 10:55:06AM -0700, Roman Gushchin wrote:
> > On Fri, Oct 02, 2020 at 01:34:06PM +0800, Philip Li wrote:
> > > On Thu, Oct 01, 2020 at 05:55:59PM -0700, Roman Gushchin wrote:
> > > > On Fri, Oct 02, 2020 at 08:08:40AM +0800, kbuild test robot wrote:
> > > > > Hi Roman,
> > > > > =

> > > > > Thank you for the patch! Yet something to improve:
> > > > > =

> > > > > [auto build test ERROR on mmotm/master]
> > > > =

> > > > It's a bogus error, the patch was applied onto mmotm/master, which =
doesn't
> > > > contain necessary slab controller patches.
> > > sorry for the wrong report, and thanks for the input, we will check
> > > this to see whether we can find an appropriate base for this case.
> > =

> > I wonder if you can look at the "Fixes" tag if the patch contains one?
> Thanks for the advice. Yes, we have Fixes tag as part of hint for us
> to analzye the possible base. For this case, "Fixes: ea426c2", the commit=
 sha
> is a little short than we expected, thus ignored. We have updated matching
> rule now to handle such situation.

Hm, but the patch contains the full 12 chars long sha?

Anyway, thank you for looking into it! It's really great to have
the kernel test robot working.

Thanks!
--===============3001964144314827893==--

