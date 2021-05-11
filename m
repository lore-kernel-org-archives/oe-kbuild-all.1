Content-Type: multipart/mixed; boundary="===============2334365170254324524=="
MIME-Version: 1.0
From: Vivek Goyal <vgoyal@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: [kbuild] fs/fuse/dax.c:113 fuse_setup_one_mapping() warn: should 'start_idx << 21' be a 64 bit type?
Date: Tue, 11 May 2021 10:51:57 -0400
Message-ID: <20210511145157.GB238488@horse>
In-Reply-To: <CAOssrKcwq_wFc+B72Vvkaai-TgXoZPTJ9fvBu+BzUg4idnFoZw@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2334365170254324524==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 11, 2021 at 04:21:32PM +0200, Miklos Szeredi wrote:
> On Mon, May 3, 2021 at 3:27 PM Dan Carpenter <dan.carpenter@oracle.com>=
 wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git  master
> > head:   9ccce092fc64d19504fa54de4fd659e279cc92e7
> > commit: c2d0ad00d948de73c78f05d2b3e5bdfa605035cc virtiofs: implement da=
x read/write operations
> > config: i386-randconfig-m031-20210503 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > New smatch warnings:
> > fs/fuse/dax.c:113 fuse_setup_one_mapping() warn: should 'start_idx << 2=
1' be a 64 bit type?
> =

> Yes.
> =

> But does it make any sense to enable virtiofs and/or dax on 32bit
> guest? We sure aren't testing it, as seen from this bug report.
> =

> Vivek, what do you think?

Hi Miklos,

We sure are not testing it but looks like it is possible to compile it
on 32 bit systems. =


I can't think of a good reason that why virtiofs DAX should be disabled on =

32 bit systems. So I sent a patch series to fix this warning here.

https://lore.kernel.org/linux-fsdevel/20210506184304.321645-1-vgoyal(a)redh=
at.com/

Thanks
Vivek

--===============2334365170254324524==--

