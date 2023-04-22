Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546147F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 01:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682126011; x=1713662011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yEGSNFrsMb+wr2mC9JCDfOyQqkQR2RLXc22/Ktym7PM=;
  b=Xf/mEPBrRosObgx9kPQmMmm4PxNZL87A7RBeauEXVxWJDAnzyQGys2iA
   vVZEXuQAUs5F850OII83IabkTDVKPyf3lP2UGTPNigOBJmwwRZowicqI9
   ph0SOAjfeawqAC0ChJ+xD2WtCIRa3E+n4A05zBsneTXcVh2MWAM7E/TRy
   dox0IdfBwZJwnbMLW4QpFm0DkpTGPkKns/oNCP73G5klj0pzFMNPalZgC
   87uiLvxXCT5IqEQTZUsBeUs5bxhUowcJ+14Z0dUpDQRSdViPhopa0+4bz
   DLU5eE6lYf1t4AsdLAHX9SFdOqXeLu1IcJxmF4SLTdqE6znwlZKzGT1Jl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="330319584"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="330319584"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 18:13:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="938682506"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="938682506"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 21 Apr 2023 18:13:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pq1oe-000gyS-2s;
	Sat, 22 Apr 2023 01:13:28 +0000
Date: Sat, 22 Apr 2023 09:12:53 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof-next:large-block-next 25/25] mm/shmem.c:3838: undefined
 reference to `__umoddi3'
Message-ID: <202304220954.ErZPrdzC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git large-block-next
head:   b53026645e341d12802912ff71ad69f9eab2f5b3
commit: b53026645e341d12802912ff71ad69f9eab2f5b3 [25/25] shmem: add support to customize block size on multiple PAGE_SIZE
config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20230422/202304220954.ErZPrdzC-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/commit/?id=b53026645e341d12802912ff71ad69f9eab2f5b3
        git remote add mcgrof-next https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git
        git fetch --no-tags mcgrof-next large-block-next
        git checkout b53026645e341d12802912ff71ad69f9eab2f5b3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304220954.ErZPrdzC-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: mm/shmem.o: in function `shmem_parse_one':
>> mm/shmem.c:3838: undefined reference to `__umoddi3'
>> ld: mm/shmem.c:3840: undefined reference to `__udivdi3'


vim +3838 mm/shmem.c

  3810	
  3811	static int shmem_parse_one(struct fs_context *fc, struct fs_parameter *param)
  3812	{
  3813		struct shmem_options *ctx = fc->fs_private;
  3814		struct fs_parse_result result;
  3815		unsigned long long size;
  3816		char *rest;
  3817		int opt;
  3818	
  3819		opt = fs_parse(fc, shmem_fs_parameters, param, &result);
  3820		if (opt < 0)
  3821			return opt;
  3822	
  3823		switch (opt) {
  3824		case Opt_size:
  3825			size = memparse(param->string, &rest);
  3826			if (*rest == '%') {
  3827				size <<= PAGE_SHIFT;
  3828				size *= totalram_pages();
  3829				do_div(size, 100);
  3830				rest++;
  3831			}
  3832			if (*rest)
  3833				goto bad_value;
  3834			if (!(ctx->seen & SHMEM_SEEN_BLOCKSIZE) ||
  3835			    ctx->blocksize == shmem_default_bsize())
  3836				ctx->blocks = DIV_ROUND_UP(size, shmem_default_bsize());
  3837			else {
> 3838				if (size < ctx->blocksize || size % ctx->blocksize != 0)
  3839					goto bad_value;
> 3840				ctx->blocks = DIV_ROUND_UP(size, ctx->blocksize);
  3841			}
  3842			ctx->seen |= SHMEM_SEEN_BLOCKS;
  3843			break;
  3844		case Opt_nr_blocks:
  3845			ctx->blocks = memparse(param->string, &rest);
  3846			if (*rest || ctx->blocks > S64_MAX)
  3847				goto bad_value;
  3848			ctx->seen |= SHMEM_SEEN_BLOCKS;
  3849			break;
  3850		case Opt_nr_inodes:
  3851			ctx->inodes = memparse(param->string, &rest);
  3852			if (*rest)
  3853				goto bad_value;
  3854			ctx->seen |= SHMEM_SEEN_INODES;
  3855			break;
  3856		case Opt_mode:
  3857			ctx->mode = result.uint_32 & 07777;
  3858			break;
  3859		case Opt_uid:
  3860			ctx->uid = make_kuid(current_user_ns(), result.uint_32);
  3861			if (!uid_valid(ctx->uid))
  3862				goto bad_value;
  3863			break;
  3864		case Opt_gid:
  3865			ctx->gid = make_kgid(current_user_ns(), result.uint_32);
  3866			if (!gid_valid(ctx->gid))
  3867				goto bad_value;
  3868			break;
  3869		case Opt_huge:
  3870			ctx->huge = result.uint_32;
  3871			if (ctx->huge != SHMEM_HUGE_NEVER &&
  3872			    !(IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
  3873			      has_transparent_hugepage()))
  3874				goto unsupported_parameter;
  3875			ctx->seen |= SHMEM_SEEN_HUGE;
  3876			break;
  3877		case Opt_mpol:
  3878			if (IS_ENABLED(CONFIG_NUMA)) {
  3879				mpol_put(ctx->mpol);
  3880				ctx->mpol = NULL;
  3881				if (mpol_parse_str(param->string, &ctx->mpol))
  3882					goto bad_value;
  3883				break;
  3884			}
  3885			goto unsupported_parameter;
  3886		case Opt_inode32:
  3887			ctx->full_inums = false;
  3888			ctx->seen |= SHMEM_SEEN_INUMS;
  3889			break;
  3890		case Opt_inode64:
  3891			if (sizeof(ino_t) < 8) {
  3892				return invalfc(fc,
  3893					       "Cannot use inode64 with <64bit inums in kernel\n");
  3894			}
  3895			ctx->full_inums = true;
  3896			ctx->seen |= SHMEM_SEEN_INUMS;
  3897			break;
  3898		case Opt_noswap:
  3899			if ((fc->user_ns != &init_user_ns) || !capable(CAP_SYS_ADMIN)) {
  3900				return invalfc(fc,
  3901					       "Turning off swap in unprivileged tmpfs mounts unsupported");
  3902			}
  3903			ctx->noswap = true;
  3904			ctx->seen |= SHMEM_SEEN_NOSWAP;
  3905			break;
  3906		case Opt_bsize:
  3907			ctx->blocksize = result.uint_32;
  3908			ctx->seen |= SHMEM_SEEN_BLOCKSIZE;
  3909			/* Must be >= PAGE_SIZE */
  3910			if (ctx->blocksize < PAGE_SIZE)
  3911				goto bad_value;
  3912			/*
  3913			 * We cap this to allow a block to be at least allowed to
  3914			 * be allocated using the buddy allocator. That's MAX_ORDER
  3915			 * pages. So 4 MiB on x86_64.
  3916			 */
  3917			if (ctx->blocksize > (1 << (MAX_ORDER + PAGE_SHIFT)))
  3918				goto bad_value;
  3919			/* The blocksize must be a multiple of the page size so must be aligned */
  3920			if (!PAGE_ALIGNED(ctx->blocksize))
  3921				goto bad_value;
  3922			break;
  3923		}
  3924		return 0;
  3925	
  3926	unsupported_parameter:
  3927		return invalfc(fc, "Unsupported parameter '%s'", param->key);
  3928	bad_value:
  3929		return invalfc(fc, "Bad value for '%s'", param->key);
  3930	}
  3931	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
