Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9085200A5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 10:18:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCABEC433C8;
	Wed, 12 Jul 2023 10:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689157122;
	bh=Wn0GZvl0RH2mmUtd9F1UyxxLq2VLaJCmRaAaCZKuJmg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=cPrOAibjL/VmpNyw8inXtg8AwL8Pg7Dun8fHdhLXo+UUicXJ0jgNjXq/B0xatuAbI
	 TfC4qbOeWfYIpBq4XdN1UyU2z3adJ0u5ZZeV1wfYy0icweJIfe28uZW5pcFf7C2CIg
	 +pzFcVcH4fh6RWJjx/OWJgrefnEL5Zva9sKGtF7Nd1t0Kpccm0I9X9BMOK7M987mIE
	 OgzazkUoHRcO9IPI+DXC5zQX6v4P5b96zYcqmh/oowhKjgArzbJS58gMGcnQZQI+pB
	 5ilPTOOCuFbKx8zjzHDC/lS0qMXjb+9QwmeRDHCTw9SjMol2rxUlo8fPKN9mhu/YzE
	 rSRbBmBMq6bDg==
Message-ID: <88f8baec599aaedc79da058e288086238a01f46f.camel@kernel.org>
Subject: Re: [jlayton:mgctime 50/118] fs/hostfs/hostfs_kern.c:520:36: error:
 incompatible type for argument 2 of 'inode_set_ctime_to_ts'
From: Jeff Layton <jlayton@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Jan
 Kara <jack@suse.cz>
Date: Wed, 12 Jul 2023 06:18:40 -0400
In-Reply-To: <20230712-anorak-milan-27f887149be5@brauner>
References: <202307120235.UI0A6Op0-lkp@intel.com>
	 <20230712-anorak-milan-27f887149be5@brauner>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2023-07-12 at 12:08 +0200, Christian Brauner wrote:
> On Wed, Jul 12, 2023 at 02:30:10AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.g=
it mgctime
> > head:   61142a4e29e09f59b3b640f0f691e00af4c4a6f9
> > commit: 2ceaa835b4f50d1b0c0fa678f352bb4f6f5f8062 [50/118] hostfs: conve=
rt to ctime accessor functions
> > config: um-defconfig (https://download.01.org/0day-ci/archive/20230712/=
202307120235.UI0A6Op0-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce: (https://download.01.org/0day-ci/archive/20230712/2023071202=
35.UI0A6Op0-lkp@intel.com/reproduce)
> >=20
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202307120235.UI0A6Op0-l=
kp@intel.com/
> >=20
> > All errors (new ones prefixed by >>):
> >=20
> >    fs/hostfs/hostfs_kern.c: In function 'hostfs_inode_update':
> > > > fs/hostfs/hostfs_kern.c:520:36: error: incompatible type for argume=
nt 2 of 'inode_set_ctime_to_ts'
> >      520 |         inode_set_ctime_to_ts(ino, &st->ctime);
> >          |                                    ^~~~~~~~~~
> >          |                                    |
> >          |                                    const struct hostfs_times=
pec *
> >    In file included from fs/hostfs/hostfs_kern.c:9:
> >    include/linux/fs.h:1499:73: note: expected 'struct timespec64' but a=
rgument is of type 'const struct hostfs_timespec *'
> >     1499 |                                                       struct=
 timespec64 ts)
> >          |                                                       ~~~~~~=
~~~~~~~~~~~~^~
>=20
> This bug is also present in the patches I applied. I've fixed it up the
> following way:
>=20
> diff --git a/fs/hostfs/hostfs_kern.c b/fs/hostfs/hostfs_kern.c
> index 182af84a9c12..1f24ed13cf40 100644
> --- a/fs/hostfs/hostfs_kern.c
> +++ b/fs/hostfs/hostfs_kern.c
> @@ -517,7 +517,8 @@ static int hostfs_inode_update(struct inode *ino, con=
st struct hostfs_stat *st)
>                 (struct timespec64){ st->atime.tv_sec, st->atime.tv_nsec =
};
>         ino->i_mtime =3D
>                 (struct timespec64){ st->mtime.tv_sec, st->mtime.tv_nsec =
};
> -       inode_set_ctime_to_ts(ino, &st->ctime);
> +       inode_set_ctime_to_ts(ino, (struct timespec64){ st->ctime.tv_sec,
> +                                                       st->ctime.tv_nsec=
 });
>         ino->i_size =3D st->size;
>         ino->i_blocks =3D st->blocks;
>         return 0;
>=20
> Let me know if that's wrong.
>=20

That should work, but it's not quite as clean looking as:

    inode_set_ctime(ino, st->ctime.tv_sec, st->ctime.tv_nsec);

I'm having trouble build testing this though as I don't have a config
that enables CONFIG_HOSTFS, and I'm not quite sure how to get there.

> >=20
> >=20
> > vim +/inode_set_ctime_to_ts +520 fs/hostfs/hostfs_kern.c
> >=20
> >    510=09
> >    511	static int hostfs_inode_update(struct inode *ino, const struct h=
ostfs_stat *st)
> >    512	{
> >    513		set_nlink(ino, st->nlink);
> >    514		i_uid_write(ino, st->uid);
> >    515		i_gid_write(ino, st->gid);
> >    516		ino->i_atime =3D
> >    517			(struct timespec64){ st->atime.tv_sec, st->atime.tv_nsec };
> >    518		ino->i_mtime =3D
> >    519			(struct timespec64){ st->mtime.tv_sec, st->mtime.tv_nsec };
> >  > 520		inode_set_ctime_to_ts(ino, &st->ctime);
> >    521		ino->i_size =3D st->size;
> >    522		ino->i_blocks =3D st->blocks;
> >    523		return 0;
> >    524	}
> >    525=09
> >=20
> > --=20
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki

--=20
Jeff Layton <jlayton@kernel.org>
