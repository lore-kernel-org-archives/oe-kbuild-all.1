Content-Type: multipart/mixed; boundary="===============1461939270998725588=="
MIME-Version: 1.0
From: Roman Gushchin <guro@fb.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] mm: memcg/slab: fix slab statistics in !SMP configuration
Date: Fri, 02 Oct 2020 10:55:06 -0700
Message-ID: <20201002175506.GB2954069@carbon.dhcp.thefacebook.com>
In-Reply-To: <20201002053405.GA30771@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1461939270998725588==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2020 at 01:34:06PM +0800, Philip Li wrote:
> On Thu, Oct 01, 2020 at 05:55:59PM -0700, Roman Gushchin wrote:
> > On Fri, Oct 02, 2020 at 08:08:40AM +0800, kbuild test robot wrote:
> > > Hi Roman,
> > > =

> > > Thank you for the patch! Yet something to improve:
> > > =

> > > [auto build test ERROR on mmotm/master]
> > =

> > It's a bogus error, the patch was applied onto mmotm/master, which does=
n't
> > contain necessary slab controller patches.
> sorry for the wrong report, and thanks for the input, we will check
> this to see whether we can find an appropriate base for this case.

I wonder if you can look at the "Fixes" tag if the patch contains one?

> Meanwhile, you can give a try to use --base option when git format patch,=
 which
> helps us to have more clue when looking for base info.

Will do.

Thanks!
--===============1461939270998725588==--

