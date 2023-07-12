Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F783FFE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 11:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60674C433C8;
	Wed, 12 Jul 2023 11:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689160210;
	bh=39wbeC46xBU+aebKVuRHWzCgIK4Wt5S050ChSTqVZt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZoxXmW8kcd/6xAYK8h795BAo3CMm1go1R6LFeN3HGU28VdYA8a9MOrFDm4CGw1Sil
	 FyaUnnYDDrAnT1clxG1dmNIBXakouYV3lLSfgwTUjqfszYQVqx73B6fYOM4QPUc9sy
	 qmgxOc98qHxagx+QuY4KraHNQDoglWdTq0X5A73wraz3JQGfKJANUddBJULiGAn/Zs
	 LbatxGF5JJ/x2qn/fdR4Wst+AbxZPTSYXQun9nR/ngixxiAIQezPyGenZDvZCYFiG3
	 uvSE7I/gmcW55h2EsepPkgB+8/n2Vgd8lQdwf9MSX75w2ICqkFqJLHCMbrjDNZwNQP
	 V/x1irEQHoLcg==
Date: Wed, 12 Jul 2023 13:10:06 +0200
From: Christian Brauner <brauner@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Jan Kara <jack@suse.cz>
Subject: Re: [jlayton:mgctime 50/118] fs/hostfs/hostfs_kern.c:520:36: error:
 incompatible type for argument 2 of 'inode_set_ctime_to_ts'
Message-ID: <20230712-jungpflanze-kilowatt-835f9a9500d8@brauner>
References: <202307120235.UI0A6Op0-lkp@intel.com>
 <20230712-anorak-milan-27f887149be5@brauner>
 <88f8baec599aaedc79da058e288086238a01f46f.camel@kernel.org>
 <9b053f2717e99494f83271c2693eee6a99b55660.camel@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9b053f2717e99494f83271c2693eee6a99b55660.camel@kernel.org>

On Wed, Jul 12, 2023 at 06:35:08AM -0400, Jeff Layton wrote:
> On Wed, 2023-07-12 at 06:18 -0400, Jeff Layton wrote:
> > On Wed, 2023-07-12 at 12:08 +0200, Christian Brauner wrote:
> > > On Wed, Jul 12, 2023 at 02:30:10AM +0800, kernel test robot wrote:
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git mgctime
> > > > head:   61142a4e29e09f59b3b640f0f691e00af4c4a6f9
> > > > commit: 2ceaa835b4f50d1b0c0fa678f352bb4f6f5f8062 [50/118] hostfs: convert to ctime accessor functions
> > > > config: um-defconfig (https://download.01.org/0day-ci/archive/20230712/202307120235.UI0A6Op0-lkp@intel.com/config)
> > > > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > > > reproduce: (https://download.01.org/0day-ci/archive/20230712/202307120235.UI0A6Op0-lkp@intel.com/reproduce)
> > > > 
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > > Closes: https://lore.kernel.org/oe-kbuild-all/202307120235.UI0A6Op0-lkp@intel.com/
> > > > 
> > > > All errors (new ones prefixed by >>):
> > > > 
> > > >    fs/hostfs/hostfs_kern.c: In function 'hostfs_inode_update':
> > > > > > fs/hostfs/hostfs_kern.c:520:36: error: incompatible type for argument 2 of 'inode_set_ctime_to_ts'
> > > >      520 |         inode_set_ctime_to_ts(ino, &st->ctime);
> > > >          |                                    ^~~~~~~~~~
> > > >          |                                    |
> > > >          |                                    const struct hostfs_timespec *
> > > >    In file included from fs/hostfs/hostfs_kern.c:9:
> > > >    include/linux/fs.h:1499:73: note: expected 'struct timespec64' but argument is of type 'const struct hostfs_timespec *'
> > > >     1499 |                                                       struct timespec64 ts)
> > > >          |                                                       ~~~~~~~~~~~~~~~~~~^~
> > > 
> > > This bug is also present in the patches I applied. I've fixed it up the
> > > following way:
> > > 
> > > diff --git a/fs/hostfs/hostfs_kern.c b/fs/hostfs/hostfs_kern.c
> > > index 182af84a9c12..1f24ed13cf40 100644
> > > --- a/fs/hostfs/hostfs_kern.c
> > > +++ b/fs/hostfs/hostfs_kern.c
> > > @@ -517,7 +517,8 @@ static int hostfs_inode_update(struct inode *ino, const struct hostfs_stat *st)
> > >                 (struct timespec64){ st->atime.tv_sec, st->atime.tv_nsec };
> > >         ino->i_mtime =
> > >                 (struct timespec64){ st->mtime.tv_sec, st->mtime.tv_nsec };
> > > -       inode_set_ctime_to_ts(ino, &st->ctime);
> > > +       inode_set_ctime_to_ts(ino, (struct timespec64){ st->ctime.tv_sec,
> > > +                                                       st->ctime.tv_nsec });
> > >         ino->i_size = st->size;
> > >         ino->i_blocks = st->blocks;
> > >         return 0;
> > > 
> > > Let me know if that's wrong.
> > > 
> > 
> > That should work, but it's not quite as clean looking as:
> > 
> >     inode_set_ctime(ino, st->ctime.tv_sec, st->ctime.tv_nsec);
> > 
> > I'm having trouble build testing this though as I don't have a config
> > that enables CONFIG_HOSTFS, and I'm not quite sure how to get there.
> 
> 
> Yeah, I'm not sure what I'm doing wrong, but when I take the config file
> associated with this bug report and run it through make oldconfig,
> CONFIG_HOSTFS ends up being disabled. I've not been able to test this
> properly.
> 
> Is there some trick to building a proper UML kernel these days?

So what I end up doing is:

cd kernel-repo/
mkdir build
cp /boot/$config build/.config
make ARCH=um O=build.v1/ fs/hostfs/hostfs_kern.o

that should be enough to test whether this compiles. With your change
applied:

> make -j7 ARCH=um O=build.v1/ fs/hostfs/hostfs_kern.o
  GEN     Makefile
  DESCEND bpf/resolve_btfids
  INSTALL libsubcmd_headers
  CALL    ../scripts/checksyscalls.sh
  CC      fs/hostfs/hostfs_kern.o
