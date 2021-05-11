Content-Type: multipart/mixed; boundary="===============8746061031683477015=="
MIME-Version: 1.0
From: Miklos Szeredi <mszeredi@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: [kbuild] fs/fuse/dax.c:113 fuse_setup_one_mapping() warn: should 'start_idx << 21' be a 64 bit type?
Date: Tue, 11 May 2021 16:21:32 +0200
Message-ID: <CAOssrKcwq_wFc+B72Vvkaai-TgXoZPTJ9fvBu+BzUg4idnFoZw@mail.gmail.com>
In-Reply-To: <202105032112.SJqOaXpO-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8746061031683477015==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 3, 2021 at 3:27 PM Dan Carpenter <dan.carpenter@oracle.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t  master
> head:   9ccce092fc64d19504fa54de4fd659e279cc92e7
> commit: c2d0ad00d948de73c78f05d2b3e5bdfa605035cc virtiofs: implement dax =
read/write operations
> config: i386-randconfig-m031-20210503 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> New smatch warnings:
> fs/fuse/dax.c:113 fuse_setup_one_mapping() warn: should 'start_idx << 21'=
 be a 64 bit type?

Yes.

But does it make any sense to enable virtiofs and/or dax on 32bit
guest? We sure aren't testing it, as seen from this bug report.

Vivek, what do you think?

Thanks,
Miklos

--===============8746061031683477015==--

