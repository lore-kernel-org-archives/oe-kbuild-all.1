Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439BD2475CF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 02:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768616941; cv=none; b=baFbfddQ2q3w0SSFOgjV1tqEYJe5iAuObwfidmrSIkY4+cgA6fM+M4ns83eFRGxB0nC+B0V52C1Lfm0Rt6RFRMS8NBJ5oOnSuxWeNGrjsgYxbOuRs+swdqkYB4zI3lGlHiuDMrE08SbuL6zz34J7xqcKjida445IU5e7wgV7Ro4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768616941; c=relaxed/simple;
	bh=Jo/25SQgzAOvgChPeJam2KMsMYB5plK9YXynfv3qmZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GPdIQFnmRL3dhD86sTZC6hbQbIbUbgLUaH4WS3XFCBBg3fWqsC6NCNloVn8PgSyWfVBFObgJYPnuk70vpJh7jWDD8ZZGPmky6cgrYh/88ktf+36P5TZVszVvNeaThgJgUp0LEHo8ZZ/Om4myK5GUssKpS0rOKJVuG2wSNLrTgX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R2yjPw9M; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R2yjPw9M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768616940; x=1800152940;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jo/25SQgzAOvgChPeJam2KMsMYB5plK9YXynfv3qmZc=;
  b=R2yjPw9MZOtvFAz9FWgK9zXpsm0ktq8tOFQARzBYPwhLe+H6gTFvYAGJ
   LrCTPdynERh+gbdiVLT1UsfaseV8f7EGs6v443h06iQcKJXmioj2Zkd4l
   JboaWuSZleNF+8xhg00GiE63TZuuQyT0eLjT9Y19pwCtLIh0g1IEzt3jW
   /afV0w4tPnNIUWu+el5VhZ1dQ3/SnyV7Xb1tu7okWoC3wZ9lo3uA7DQNv
   3HkgecaTX9Gihmu8FA3kXcvuJtwIU648Snqj0vBsnrAb3Ni1g8j2HufKv
   BrxwzHWT4UxSbtq2tG8AYXFrH/3yr8nHweKMocqxBwM1SJtKoyfkWW0Z7
   Q==;
X-CSE-ConnectionGUID: oLKs3XlWR/OGds0YesVhzA==
X-CSE-MsgGUID: GNYsyw0LQhO3mWkxhbK3Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="81376175"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="81376175"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 18:28:57 -0800
X-CSE-ConnectionGUID: aF33mX85SVadnHfNWLC48A==
X-CSE-MsgGUID: mTJOT2ocTB+KYWcp+FgpYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="242943173"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Jan 2026 18:28:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgw3D-00000000LTY-3xQV;
	Sat, 17 Jan 2026 02:28:31 +0000
Date: Sat, 17 Jan 2026 10:27:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
	NeilBrown <neil@brown.name>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH] nfsd: fix NULL pointer dereference in check_export()
Message-ID: <202601171021.4DQZyXiU-lkp@intel.com>
References: <20260116-nfsd-fixes-v1-1-019689b72747@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116-nfsd-fixes-v1-1-019689b72747@kernel.org>

Hi Jeff,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 983d014aafb14ee5e4915465bf8948e8f3a723b5]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeff-Layton/nfsd-fix-NULL-pointer-dereference-in-check_export/20260117-022519
base:   983d014aafb14ee5e4915465bf8948e8f3a723b5
patch link:    https://lore.kernel.org/r/20260116-nfsd-fixes-v1-1-019689b72747%40kernel.org
patch subject: [PATCH] nfsd: fix NULL pointer dereference in check_export()
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20260117/202601171021.4DQZyXiU-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171021.4DQZyXiU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601171021.4DQZyXiU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/nfsd/export.c: In function 'check_export':
>> fs/nfsd/export.c:408:47: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     408 |         struct export_operations *export_op = inode->i_sb->s_export_op;
         |                                               ^~~~~


vim +/const +408 fs/nfsd/export.c

   404	
   405	static int check_export(const struct path *path, int *flags, unsigned char *uuid)
   406	{
   407		struct inode *inode = d_inode(path->dentry);
 > 408		struct export_operations *export_op = inode->i_sb->s_export_op;
   409	
   410		/*
   411		 * We currently export only dirs, regular files, and (for v4
   412		 * pseudoroot) symlinks.
   413		 */
   414		if (!S_ISDIR(inode->i_mode) &&
   415		    !S_ISLNK(inode->i_mode) &&
   416		    !S_ISREG(inode->i_mode))
   417			return -ENOTDIR;
   418	
   419		/*
   420		 * Mountd should never pass down a writeable V4ROOT export, but,
   421		 * just to make sure:
   422		 */
   423		if (*flags & NFSEXP_V4ROOT)
   424			*flags |= NFSEXP_READONLY;
   425	
   426		/* There are four requirements on a filesystem to be exportable:
   427		 * 1: It must define sb->s_export_op
   428		 * 2: We must be able to identify the filesystem from a number.
   429		 *       either a device number (so FS_REQUIRES_DEV needed)
   430		 *       or an FSID number (so NFSEXP_FSID or ->uuid is needed).
   431		 * 3: We must be able to find an inode from a filehandle.
   432		 *       This means that s_export_op must be set.
   433		 * 4: We must not currently be on an idmapped mount.
   434		 */
   435		if (!export_op) {
   436			dprintk("%s: fs doesn't define export_operations!\n", __func__);
   437			return -EINVAL;
   438		}
   439	
   440		if (!(inode->i_sb->s_type->fs_flags & FS_REQUIRES_DEV) &&
   441		    !(*flags & NFSEXP_FSID) &&
   442		    uuid == NULL) {
   443			dprintk("exp_export: export of non-dev fs without fsid\n");
   444			return -EINVAL;
   445		}
   446	
   447		if (!exportfs_can_decode_fh(export_op)) {
   448			dprintk("exp_export: export of invalid fs type.\n");
   449			return -EINVAL;
   450		}
   451	
   452		if (is_idmapped_mnt(path->mnt)) {
   453			dprintk("exp_export: export of idmapped mounts not yet supported.\n");
   454			return -EINVAL;
   455		}
   456	
   457		if (export_op->flags & EXPORT_OP_NOSUBTREECHK &&
   458		    !(*flags & NFSEXP_NOSUBTREECHECK)) {
   459			dprintk("%s: %s does not support subtree checking!\n",
   460				__func__, inode->i_sb->s_type->name);
   461			return -EINVAL;
   462		}
   463		return 0;
   464	}
   465	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
