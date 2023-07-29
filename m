Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B3A1C06
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Jul 2023 07:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690615959; x=1722151959;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HKQl+WHC4yF+B2wgCr3Cv8EiaTct3YdNyk8c+/E6UgQ=;
  b=RC+5Vy2uTpCoTqCWbTIo9L6Yv7/mBARXDr5OXL0idMQka6qaB9d3JTdC
   lXJKvPwdctmcWGqw4clJi2fSwiyHutH58PQuWM5e8orihnGSAWHPBNx8T
   nd10pvkoEgv51MB/YA36aUNuuUOxD3Rk3tVl/1mFer2iKZXY/epemEr7v
   Aj4DSeaMuhWMMcCf3NOHPSfcU1D71lU0LC0/QL9KNZWHrJzMtd8LPFUKM
   XH8cpQMRzbEeo/mQ/aJP4DFtZA1sUFDaD8ssLOWC20EpfPFQXfnonhR5I
   39cdOpJAUV5CKfo7tvr88ueb3IUjhBKE4Cz12CKJWbRxG5yP4KsQ3g56/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="435030642"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="435030642"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 00:32:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="677747694"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="677747694"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 29 Jul 2023 00:32:37 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPeQw-0003uE-2Y;
	Sat, 29 Jul 2023 07:32:23 +0000
Date: Sat, 29 Jul 2023 15:30:58 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.5-rc1 138/146] fs/resctrl/rdtgroup.c:850:24:
 error: implicit declaration of function 'iommu_get_group_kset'; did you mean
 'iommu_group_get'?
Message-ID: <202307291552.hKumxtsD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.5-rc1
head:   8a35b09275f16d009ed31e93b8b4b3004b04bceb
commit: 9e9af35cd8e4b32e9ccba2fa49c1ce600b3066b8 [138/146] fs/resctrl: Add support for assigning iommu_groups to resctrl groups
config: x86_64-buildonly-randconfig-r003-20230728 (https://download.01.org/0day-ci/archive/20230729/202307291552.hKumxtsD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307291552.hKumxtsD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307291552.hKumxtsD-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/resctrl/rdtgroup.c: In function 'show_rdt_iommu':
>> fs/resctrl/rdtgroup.c:850:24: error: implicit declaration of function 'iommu_get_group_kset'; did you mean 'iommu_group_get'? [-Werror=implicit-function-declaration]
     850 |         iommu_groups = iommu_get_group_kset();
         |                        ^~~~~~~~~~~~~~~~~~~~
         |                        iommu_group_get
   fs/resctrl/rdtgroup.c:850:22: warning: assignment to 'struct kset *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     850 |         iommu_groups = iommu_get_group_kset();
         |                      ^
   cc1: some warnings being treated as errors


vim +850 fs/resctrl/rdtgroup.c

   839	
   840	static void show_rdt_iommu(struct rdtgroup *r, struct seq_file *s)
   841	{
   842		struct kset *iommu_groups;
   843		struct iommu_group *group;
   844		struct kobject *group_kobj = NULL;
   845	
   846		if (!IS_ENABLED(CONFIG_RESCTRL_IOMMU) ||
   847		    !static_branch_unlikely(&resctrl_abi_playground))
   848			return;
   849	
 > 850		iommu_groups = iommu_get_group_kset();
   851	
   852		while ((group_kobj = kset_get_next_obj(iommu_groups, group_kobj))) {
   853	
   854			/* iommu_group_get_from_kobj() wants to drop a reference */
   855			kobject_get(group_kobj);
   856	
   857			group = iommu_group_get_from_kobj(group_kobj);
   858			if (!group)
   859				continue;
   860	
   861			if (iommu_matches_rdtgroup(group, r))
   862				seq_printf(s, "iommu_group:%s\n", group_kobj->name);
   863		}
   864	
   865		kset_put(iommu_groups);
   866	}
   867	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
