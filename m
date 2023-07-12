Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A01F441F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 10:35:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC63C433C8;
	Wed, 12 Jul 2023 10:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689158109;
	bh=xTddMLEVeR5URjwY2eqhfvxpVX/aHvw646pUf+J7QII=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jXi08kRyiMIRdQ5HOckylwit8aDuoqBjzHZcCNR4IfOvPqtVVZwAvqXLuq6iBbf43
	 Gwb4LuHHlgH/7fv1frDTPZ6+/jS1M9CG3YohfNdF21OroE41zgG1I1+aRbszM48xQI
	 s6V6c/Akdq6c8ArDPQMRe8/vpxTZCdTDzSDRJfyAXI5PZBJCakqL3MV82turhaw+Sk
	 OePZSNNoyqpY+GyHifzow0a267GAnzo+P+8Q3C+AQ9AbsRaWh9BOmoUfnB8e+yKrT6
	 fxDnAbT3C8uMq7fmJGeUq39OW+HIWcRXK9XoYBOZpL9YnkyWWVUKPk9+/IJlMLcPSD
	 7lnfyjh8Vrgag==
Message-ID: <9b053f2717e99494f83271c2693eee6a99b55660.camel@kernel.org>
Subject: Re: [jlayton:mgctime 50/118] fs/hostfs/hostfs_kern.c:520:36: error:
 incompatible type for argument 2 of 'inode_set_ctime_to_ts'
From: Jeff Layton <jlayton@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Jan
 Kara <jack@suse.cz>
Date: Wed, 12 Jul 2023 06:35:08 -0400
In-Reply-To: <88f8baec599aaedc79da058e288086238a01f46f.camel@kernel.org>
References: <202307120235.UI0A6Op0-lkp@intel.com>
	 <20230712-anorak-milan-27f887149be5@brauner>
	 <88f8baec599aaedc79da058e288086238a01f46f.camel@kernel.org>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2023-07-12 at 06:18 -0400, Jeff Layton wrote:
> On Wed, 2023-07-12 at 12:08 +0200, Christian Brauner wrote:
> > On Wed, Jul 12, 2023 at 02:30:10AM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux=
.git mgctime
> > > head:   61142a4e29e09f59b3b640f0f691e00af4c4a6f9
> > > commit: 2ceaa835b4f50d1b0c0fa678f352bb4f6f5f8062 [50/118] hostfs: con=
vert to ctime accessor functions
> > > config: um-defconfig (https://download.01.org/0day-ci/archive/2023071=
2/202307120235.UI0A6Op0-lkp@intel.com/config)
> > > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > > reproduce: (https://download.01.org/0day-ci/archive/20230712/20230712=
0235.UI0A6Op0-lkp@intel.com/reproduce)
> > >=20
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > Closes: https://lore.kernel.org/oe-kbuild-all/202307120235.UI0A6Op0=
-lkp@intel.com/
> > >=20
> > > All errors (new ones prefixed by >>):
> > >=20
> > >    fs/hostfs/hostfs_kern.c: In function 'hostfs_inode_update':
> > > > > fs/hostfs/hostfs_kern.c:520:36: error: incompatible type for argu=
ment 2 of 'inode_set_ctime_to_ts'
> > >      520 |         inode_set_ctime_to_ts(ino, &st->ctime);
> > >          |                                    ^~~~~~~~~~
> > >          |                                    |
> > >          |                                    const struct hostfs_tim=
espec *
> > >    In file included from fs/hostfs/hostfs_kern.c:9:
> > >    include/linux/fs.h:1499:73: note: expected 'struct timespec64' but=
 argument is of type 'const struct hostfs_timespec *'
> > >     1499 |                                                       stru=
ct timespec64 ts)
> > >          |                                                       ~~~~=
~~~~~~~~~~~~~~^~
> >=20
> > This bug is also present in the patches I applied. I've fixed it up the
> > following way:
> >=20
> > diff --git a/fs/hostfs/hostfs_kern.c b/fs/hostfs/hostfs_kern.c
> > index 182af84a9c12..1f24ed13cf40 100644
> > --- a/fs/hostfs/hostfs_kern.c
> > +++ b/fs/hostfs/hostfs_kern.c
> > @@ -517,7 +517,8 @@ static int hostfs_inode_update(struct inode *ino, c=
onst struct hostfs_stat *st)
> >                 (struct timespec64){ st->atime.tv_sec, st->atime.tv_nse=
c };
> >         ino->i_mtime =3D
> >                 (struct timespec64){ st->mtime.tv_sec, st->mtime.tv_nse=
c };
> > -       inode_set_ctime_to_ts(ino, &st->ctime);
> > +       inode_set_ctime_to_ts(ino, (struct timespec64){ st->ctime.tv_se=
c,
> > +                                                       st->ctime.tv_ns=
ec });
> >         ino->i_size =3D st->size;
> >         ino->i_blocks =3D st->blocks;
> >         return 0;
> >=20
> > Let me know if that's wrong.
> >=20
>=20
> That should work, but it's not quite as clean looking as:
>=20
>     inode_set_ctime(ino, st->ctime.tv_sec, st->ctime.tv_nsec);
>=20
> I'm having trouble build testing this though as I don't have a config
> that enables CONFIG_HOSTFS, and I'm not quite sure how to get there.


Yeah, I'm not sure what I'm doing wrong, but when I take the config file
associated with this bug report and run it through make oldconfig,
CONFIG_HOSTFS ends up being disabled. I've not been able to test this
properly.

Is there some trick to building a proper UML kernel these days?
--=20
Jeff Layton <jlayton@kernel.org>
