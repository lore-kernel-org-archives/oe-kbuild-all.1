Content-Type: multipart/mixed; boundary="===============3425218222814909517=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] mm: memcg/slab: fix slab statistics in !SMP configuration
Date: Tue, 13 Oct 2020 07:05:50 +0800
Message-ID: <20201012230550.GB19671@intel.com>
In-Reply-To: <20201002175506.GB2954069@carbon.dhcp.thefacebook.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3425218222814909517==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2020 at 10:55:06AM -0700, Roman Gushchin wrote:
> On Fri, Oct 02, 2020 at 01:34:06PM +0800, Philip Li wrote:
> > On Thu, Oct 01, 2020 at 05:55:59PM -0700, Roman Gushchin wrote:
> > > On Fri, Oct 02, 2020 at 08:08:40AM +0800, kbuild test robot wrote:
> > > > Hi Roman,
> > > > =

> > > > Thank you for the patch! Yet something to improve:
> > > > =

> > > > [auto build test ERROR on mmotm/master]
> > > =

> > > It's a bogus error, the patch was applied onto mmotm/master, which do=
esn't
> > > contain necessary slab controller patches.
> > sorry for the wrong report, and thanks for the input, we will check
> > this to see whether we can find an appropriate base for this case.
> =

> I wonder if you can look at the "Fixes" tag if the patch contains one?
Thanks for the advice. Yes, we have Fixes tag as part of hint for us
to analzye the possible base. For this case, "Fixes: ea426c2", the commit s=
ha
is a little short than we expected, thus ignored. We have updated matching
rule now to handle such situation.

> =

> > Meanwhile, you can give a try to use --base option when git format patc=
h, which
> > helps us to have more clue when looking for base info.
> =

> Will do.
> =

> Thanks!
--===============3425218222814909517==--

