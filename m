Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF4713AF9
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Aug 2023 16:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691511732; x=1723047732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OsITRqgNwXCIK0KS2aTaIIStLnCUjAEdkNww0RNlY0s=;
  b=QRGwkjwEC6f4sBjmO12JGX19jA2kbivICG21bp59qdaUuzIZUtwmFLHa
   il3bm+/yrbfHT/LL68kJa59GpgW/A+A4oqxJsKDWTgVCkSEcVyoqJcdu4
   zhSNOYRv0ov4ty2NkIfmpqsw8rOMsZ1eM2zKKpPY+/CU9B+hcAtkjwZpV
   zf59eLu7oG/5gh3FKtBq+ytbwIOmd25lSVulmyqG4Vdv1Jx9SQYwF21dw
   FJ6zRGWtkFgJGxOCJJWFb4gA1XsxQ4m1lrnDfPXduhS2MCGMN76sM5ZCK
   v4nuivNVMLI/jeqEp0ghLZo9ZIaXQj2xHu5BGZNTGBpihGIfRMaRyTj1K
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="360965136"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="360965136"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 09:20:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="845524430"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="845524430"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2023 09:20:05 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTPRE-0005Si-1V;
	Tue, 08 Aug 2023 16:20:04 +0000
Date: Wed, 9 Aug 2023 00:19:29 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:testing/af/home 6/8]
 fs/btrfs/async-thread.c:411:41: error: 'struct btrfs_fs_info' has no member
 named 'hipri_workers'; did you mean 'fixup_workers'?
Message-ID: <202308090043.lJ8zFk78-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block testing/af/home
head:   8b2a24828c670d20cda3d69f5741e11e89f575f7
commit: 5f3624d1fef48864c37168c21cd1a1a1334649b8 [6/8] btrfs: Add wq_cpu_set=%s mount option
config: microblaze-randconfig-r034-20230808 (https://download.01.org/0day-ci/archive/20230809/202308090043.lJ8zFk78-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308090043.lJ8zFk78-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308090043.lJ8zFk78-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/btrfs/async-thread.c: In function 'btrfs_apply_workqueue_cpu_set':
>> fs/btrfs/async-thread.c:411:41: error: 'struct btrfs_fs_info' has no member named 'hipri_workers'; did you mean 'fixup_workers'?
     411 |         btrfs_apply_wq_cpu_set(fs_info, hipri_workers);
         |                                         ^~~~~~~~~~~~~
   fs/btrfs/async-thread.c:402:47: note: in definition of macro 'btrfs_apply_wq_cpu_set'
     402 |         apply_wq_cpu_set_notice(INFO, (INFO)->WQ->normal_wq, # WQ)
         |                                               ^~


vim +411 fs/btrfs/async-thread.c

   397	
   398	#define apply_wq_cpu_set(INFO, WQ) \
   399		apply_wq_cpu_set_notice(INFO, (INFO)->WQ, # WQ)
   400	
   401	#define btrfs_apply_wq_cpu_set(INFO, WQ) \
   402		apply_wq_cpu_set_notice(INFO, (INFO)->WQ->normal_wq, # WQ)
   403	
   404	
   405	void btrfs_apply_workqueue_cpu_set(struct btrfs_fs_info *fs_info)
   406	{
   407		if (!btrfs_test_opt(fs_info, WQ_CPU_SET))
   408			return;
   409	
   410		btrfs_apply_wq_cpu_set(fs_info, workers);
 > 411		btrfs_apply_wq_cpu_set(fs_info, hipri_workers);
   412		btrfs_apply_wq_cpu_set(fs_info, delalloc_workers);
   413		btrfs_apply_wq_cpu_set(fs_info, flush_workers);
   414		btrfs_apply_wq_cpu_set(fs_info, caching_workers);
   415		btrfs_apply_wq_cpu_set(fs_info, fixup_workers);
   416		apply_wq_cpu_set(fs_info, endio_workers);
   417		apply_wq_cpu_set(fs_info, endio_meta_workers);
   418		apply_wq_cpu_set(fs_info, rmw_workers);
   419		btrfs_apply_wq_cpu_set(fs_info, endio_write_workers);
   420		apply_wq_cpu_set(fs_info, compressed_write_workers);
   421		btrfs_apply_wq_cpu_set(fs_info, endio_freespace_worker);
   422		btrfs_apply_wq_cpu_set(fs_info, delayed_workers);
   423		btrfs_apply_wq_cpu_set(fs_info, qgroup_rescan_workers);
   424		apply_wq_cpu_set(fs_info, discard_ctl.discard_workers);
   425	}
   426	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
