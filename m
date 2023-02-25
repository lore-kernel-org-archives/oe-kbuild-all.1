Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE547C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Feb 2023 08:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677314966; x=1708850966;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ARm6x+Y+C/bn0on6Sz2xcuF1Bl3xJyqCi6G46xhCbc=;
  b=kyxlJWcaDJ7Caf/QnOTc43PtxiXSZi3+T1XxnKToMWmW5FnvPsG5Vix/
   R4j4T1jBu6tP80VYjPAIP0I69wNxvxp2CbsrLYRKF/Zn1qSaz1OIV/yT6
   LgtXYPgKqRwf1KqwfrGL48xDImmBmLxP5x3hoKSSflxTk6ZgJWUtU9s2o
   GNVJZvEh0TdEOxvbGrL9kUuZZzBoeDEPWfHkL6n177pt551f3tsghofNr
   v+SjZ/ju8ogDkkyBJNDiMlms/eB1+x2ZeZc8b0BxhHZtXipNqg4HkbghB
   SJCBu8Pk2qLigguDQxDCLkD/XBOfY4Y+SUJKk5Oe4DCeKx9G1hLcFz6LQ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="317406724"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="317406724"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 00:49:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="675215352"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="675215352"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 25 Feb 2023 00:49:24 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVqF9-00034N-39;
	Sat, 25 Feb 2023 08:49:23 +0000
Date: Sat, 25 Feb 2023 16:48:36 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:af/dev.btrfs 10/11] fs/btrfs/super.c:352:26:
 error: assignment to expression with array type
Message-ID: <202302251642.n9lUOVD7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block af/dev.btrfs
head:   91361976f98a5766c0c00110ad28f6dd3b3a7de3
commit: 3afc14e1a169a4643f51ebdcf743a8efdb7f78b2 [10/11] btrfs: Add wq_cpu_set mount option
config: x86_64-randconfig-a015 (https://download.01.org/0day-ci/archive/20230225/202302251642.n9lUOVD7-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/ammarfaizi2/linux-block/commit/3afc14e1a169a4643f51ebdcf743a8efdb7f78b2
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block af/dev.btrfs
        git checkout 3afc14e1a169a4643f51ebdcf743a8efdb7f78b2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302251642.n9lUOVD7-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/btrfs/super.c: In function 'parse_wq_cpu_set':
>> fs/btrfs/super.c:352:26: error: assignment to expression with array type
     352 |         info->wq_cpu_set = mask;
         |                          ^


vim +352 fs/btrfs/super.c

   323	
   324	static int parse_wq_cpu_set(struct btrfs_fs_info *info, const char *set)
   325	{
   326		cpumask_var_t mask;
   327		char *set_copy;
   328		int ret;
   329	
   330		set_copy = kstrdup(set, GFP_KERNEL);
   331		if (!set_copy)
   332			return -ENOMEM;
   333	
   334		if (!alloc_cpumask_var(&mask, GFP_KERNEL)) {
   335			ret = -ENOMEM;
   336			goto out_fail;
   337		}
   338	
   339		wq_cpu_set_fix_cpulist(set_copy);
   340		ret = cpulist_parse(set_copy, mask);
   341		if (ret) {
   342			btrfs_err(info, "failed to parse wq_cpu_set: %d", ret);
   343			goto out_fail_cpu;
   344		}
   345	
   346		if (cpumask_empty(mask)) {
   347			ret = -EINVAL;
   348			btrfs_err(info, "wq_cpu_set cannot be empty");
   349			goto out_fail_cpu;
   350		}
   351	
 > 352		info->wq_cpu_set = mask;
   353		info->wq_cpu_set_str = set_copy;
   354		btrfs_set_and_info(info, WQ_CPU_SET, "using wq_cpu_set=%s", set_copy);
   355		return 0;
   356	
   357	out_fail_cpu:
   358		free_cpumask_var(mask);
   359	out_fail:
   360		kfree(set_copy);
   361		return ret;
   362	}
   363	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
