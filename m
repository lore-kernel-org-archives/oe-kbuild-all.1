Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA4433F9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 10:08:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B22F8C433C7;
	Wed, 12 Jul 2023 10:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689156519;
	bh=QWuk0sodx7OzkyZczXvQGP/yYCyHSGX9UaCcRoqjWuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BySwSZe83cEEeJfgtMEzDvCK4u53nJ4Ooc+ZOjCce/pf2Qx010Ga6DTjGtLu3uqJ9
	 KIsfjIpXsLMHjf0AsDSdi9OkPOEFdIjqxTZVlVhNxgMqYSvbXE4OpFz4QbpgameQ9M
	 vAmXdduko47It86QtVHjvlanEdUKK3TIOHiKgQC72Wwl06/rO19fGKAzig18bB7H0z
	 e9CjmbLxp+LN7/vxtVKKkKor0w5S501D+L66u65ohZKQnQb2efE+Gpfq/txiCtEv/7
	 xi1VtHpzP1kbrNpPuM5BhjGwSdgN/xMwff37YglzDsjputIgKvnSpFpGfCMvqkS4Bv
	 OnTnjrCGkppew==
Date: Wed, 12 Jul 2023 12:08:35 +0200
From: Christian Brauner <brauner@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Jan Kara <jack@suse.cz>
Subject: Re: [jlayton:mgctime 50/118] fs/hostfs/hostfs_kern.c:520:36: error:
 incompatible type for argument 2 of 'inode_set_ctime_to_ts'
Message-ID: <20230712-anorak-milan-27f887149be5@brauner>
References: <202307120235.UI0A6Op0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202307120235.UI0A6Op0-lkp@intel.com>

On Wed, Jul 12, 2023 at 02:30:10AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git mgctime
> head:   61142a4e29e09f59b3b640f0f691e00af4c4a6f9
> commit: 2ceaa835b4f50d1b0c0fa678f352bb4f6f5f8062 [50/118] hostfs: convert to ctime accessor functions
> config: um-defconfig (https://download.01.org/0day-ci/archive/20230712/202307120235.UI0A6Op0-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20230712/202307120235.UI0A6Op0-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307120235.UI0A6Op0-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    fs/hostfs/hostfs_kern.c: In function 'hostfs_inode_update':
> >> fs/hostfs/hostfs_kern.c:520:36: error: incompatible type for argument 2 of 'inode_set_ctime_to_ts'
>      520 |         inode_set_ctime_to_ts(ino, &st->ctime);
>          |                                    ^~~~~~~~~~
>          |                                    |
>          |                                    const struct hostfs_timespec *
>    In file included from fs/hostfs/hostfs_kern.c:9:
>    include/linux/fs.h:1499:73: note: expected 'struct timespec64' but argument is of type 'const struct hostfs_timespec *'
>     1499 |                                                       struct timespec64 ts)
>          |                                                       ~~~~~~~~~~~~~~~~~~^~

This bug is also present in the patches I applied. I've fixed it up the
following way:

diff --git a/fs/hostfs/hostfs_kern.c b/fs/hostfs/hostfs_kern.c
index 182af84a9c12..1f24ed13cf40 100644
--- a/fs/hostfs/hostfs_kern.c
+++ b/fs/hostfs/hostfs_kern.c
@@ -517,7 +517,8 @@ static int hostfs_inode_update(struct inode *ino, const struct hostfs_stat *st)
                (struct timespec64){ st->atime.tv_sec, st->atime.tv_nsec };
        ino->i_mtime =
                (struct timespec64){ st->mtime.tv_sec, st->mtime.tv_nsec };
-       inode_set_ctime_to_ts(ino, &st->ctime);
+       inode_set_ctime_to_ts(ino, (struct timespec64){ st->ctime.tv_sec,
+                                                       st->ctime.tv_nsec });
        ino->i_size = st->size;
        ino->i_blocks = st->blocks;
        return 0;

Let me know if that's wrong.

> 
> 
> vim +/inode_set_ctime_to_ts +520 fs/hostfs/hostfs_kern.c
> 
>    510	
>    511	static int hostfs_inode_update(struct inode *ino, const struct hostfs_stat *st)
>    512	{
>    513		set_nlink(ino, st->nlink);
>    514		i_uid_write(ino, st->uid);
>    515		i_gid_write(ino, st->gid);
>    516		ino->i_atime =
>    517			(struct timespec64){ st->atime.tv_sec, st->atime.tv_nsec };
>    518		ino->i_mtime =
>    519			(struct timespec64){ st->mtime.tv_sec, st->mtime.tv_nsec };
>  > 520		inode_set_ctime_to_ts(ino, &st->ctime);
>    521		ino->i_size = st->size;
>    522		ino->i_blocks = st->blocks;
>    523		return 0;
>    524	}
>    525	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
