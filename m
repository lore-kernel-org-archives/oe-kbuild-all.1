Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726D03054E8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 23:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763767982; cv=none; b=ht0WTmT9vR7OYVpKGxjXshGzgp+/sCfgLfyl52D4yy+qRKPBk1oiaPp3d4X7xiNa+qLIPAacHcaR9bs1l/qbO48tY6v6pqKt/xULeADW2t4Qj3SdL4DcILzn5Z6AbRjM1vIVQ20PxwB+YIBQNxC1nNyQx3kWNc2g4eGSQfFg9as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763767982; c=relaxed/simple;
	bh=7e/OywSfjN3V4dfdc4AgQmSDQi5nH2XNCUPfZKYstgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsuFlSUhn0QfpYeHigK58+98m51Qmd2F5Bjk3G+gFtvusW2ffj5fu/ftpD5KVFqnUlkVLUPoy2AIPZLmLT4IRH2gxEJJye5uOdVRD8vj/3YnyzX1qmDRdDLF9fWLjQXMrcWB63AoorPKaNlz3MALHtYqU7jgohc9EgLmffluIF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YFj5d5wt; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YFj5d5wt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763767980; x=1795303980;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7e/OywSfjN3V4dfdc4AgQmSDQi5nH2XNCUPfZKYstgQ=;
  b=YFj5d5wtZo+KOXC7q0Pdr9a5CPy57KhOw+mUU0byDsNIc95eB6AApf/M
   skG+NwxHcRGVbFpGyp6jbf5SLK4PFWY444Pj3EFWshFBP9gsqqXnXcVnq
   2QWDO+SYRk1ZroixYhQFiLx1oydTQf4dZMg5werdZD2pLP4BwUgWgwSYL
   zYbkQ3F6V3G2pvZEmLTOTMch2fQ2nSH0dBv6arazeY8I6naWpysaeWF4l
   xQaO0xHdSftKtESrC+KYVghOjw0zwB8etO3xfrQc82zV/ZsfORTl90K2T
   iQQBGeH7dJvGgUO4KXqP5NGbAsppkuyD8Ko5pwNupazgYUgTsn2i7g/Hb
   g==;
X-CSE-ConnectionGUID: FMGJem4QSy6IpnwZiVqDtw==
X-CSE-MsgGUID: VH9y62aoR0KxOfH4Xd3WDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65805223"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="65805223"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 15:32:59 -0800
X-CSE-ConnectionGUID: W2bgZCByRye64MRGO3SmBQ==
X-CSE-MsgGUID: eBzKsCaGTC+Y+K+Fc9bR1Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Nov 2025 15:32:56 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMacY-0006yR-1S;
	Fri, 21 Nov 2025 23:32:54 +0000
Date: Sat, 22 Nov 2025 07:32:06 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Kuai <yukuai@fnnas.com>, axboe@kernel.dk,
	linux-block@vger.kernel.org, tj@kernel.org, nilay@linux.ibm.com,
	ming.lei@redhat.com, bvanassche@acm.org
Cc: oe-kbuild-all@lists.linux.dev, yukuai@fnnas.com
Subject: Re: [PATCH v2 4/9] blk-mq-debugfs: warn about possible deadlock
Message-ID: <202511220719.yaFySU2X-lkp@intel.com>
References: <20251121062829.1433332-5-yukuai@fnnas.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121062829.1433332-5-yukuai@fnnas.com>

Hi Yu,

kernel test robot noticed the following build errors:

[auto build test ERROR on axboe/for-next]
[also build test ERROR on linus/master v6.18-rc6 next-20251121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Kuai/blk-mq-debugfs-factor-out-a-helper-to-register-debugfs-for-all-rq_qos/20251121-143315
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-next
patch link:    https://lore.kernel.org/r/20251121062829.1433332-5-yukuai%40fnnas.com
patch subject: [PATCH v2 4/9] blk-mq-debugfs: warn about possible deadlock
config: parisc-randconfig-002-20251122 (https://download.01.org/0day-ci/archive/20251122/202511220719.yaFySU2X-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511220719.yaFySU2X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511220719.yaFySU2X-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bug.h:5,
                    from include/linux/vfsdebug.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from block/blk-mq-debugfs.c:7:
   block/blk-mq-debugfs.c: In function 'debugfs_create_files':
>> block/blk-mq-debugfs.c:628:35: error: 'struct request_queue' has no member named 'blkcg_mutex'
     628 |         lockdep_assert_not_held(&q->blkcg_mutex);
         |                                   ^~
   arch/parisc/include/asm/bug.h:86:32: note: in definition of macro 'WARN_ON'
      86 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   include/linux/lockdep.h:288:9: note: in expansion of macro 'lockdep_assert'
     288 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_HELD)
         |         ^~~~~~~~~~~~~~
   include/linux/lockdep.h:288:24: note: in expansion of macro 'lockdep_is_held'
     288 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_HELD)
         |                        ^~~~~~~~~~~~~~~
   block/blk-mq-debugfs.c:628:9: note: in expansion of macro 'lockdep_assert_not_held'
     628 |         lockdep_assert_not_held(&q->blkcg_mutex);
         |         ^~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for GPIO_SYSCON
   Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
   Selected by [y]:
   - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF_GPIO [=y] && (ARCH_AT91 || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]


vim +628 block/blk-mq-debugfs.c

   612	
   613	static void debugfs_create_files(struct request_queue *q, struct dentry *parent,
   614					 void *data,
   615					 const struct blk_mq_debugfs_attr *attr)
   616	{
   617		/*
   618		 * Creating new debugfs entries with queue freezed has the risk of
   619		 * deadlock.
   620		 */
   621		WARN_ON_ONCE(q->mq_freeze_depth != 0);
   622		/*
   623		 * debugfs_mutex should not be nested under other locks that can be
   624		 * grabbed while queue is frozen.
   625		 */
   626		lockdep_assert_not_held(&q->elevator_lock);
   627		lockdep_assert_not_held(&q->rq_qos_mutex);
 > 628		lockdep_assert_not_held(&q->blkcg_mutex);
   629	
   630		if (IS_ERR_OR_NULL(parent))
   631			return;
   632	
   633		for (; attr->name; attr++)
   634			debugfs_create_file_aux(attr->name, attr->mode, parent,
   635					    (void *)attr, data, &blk_mq_debugfs_fops);
   636	}
   637	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
