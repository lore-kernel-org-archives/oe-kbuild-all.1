Received: from mgamail.intel.com (unknown [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA79817F4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Jul 2023 05:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690607891; x=1722143891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aOgSLXEwJDcw3u9TzHA8JZ1aJJbNFrhmarPVlI9IUbE=;
  b=GMyCV1wsPg13picebANhs8WNxGikUhdQUgLN5h1KscZWXCdeQWCvfUid
   BKGrC5lZF8NgYxF8TmBW/mvdn54EvYBydUzPws5AOAWnFutJmzpnht1Im
   RivDZl9oFsIHxP+yFZ1DrkmLTnDWBTURibWNcSTy+kJn4A7cqgArCc/zO
   PjcohrnyYyZxBt2jGlvC5HjhAmOD6dtwyA/H1zvEnfqiplQtdxm5RHfyR
   uAspzIGreSFWbL3ZMMv6ov0mOg0z5z33yj9UkQQnwXZJRcpYcCnnU5d1f
   0XvaNJES/g3r5ySZXeKYb3ENgQXC6biXd1yALqinIXDWA7WiUR7BqtVd5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="348337819"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="348337819"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 22:18:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="974294879"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="974294879"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 28 Jul 2023 22:18:09 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPcLA-0003qp-1B;
	Sat, 29 Jul 2023 05:18:08 +0000
Date: Sat, 29 Jul 2023 13:18:01 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.5-rc1 138/146] fs/resctrl/rdtgroup.c:850:22:
 warning: assignment to 'struct kset *' from 'int' makes pointer from integer
 without a cast
Message-ID: <202307291325.2C4oY1vp-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-r003-20230728 (https://download.01.org/0day-ci/archive/20230729/202307291325.2C4oY1vp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307291325.2C4oY1vp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307291325.2C4oY1vp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/resctrl/rdtgroup.c: In function 'show_rdt_iommu':
   fs/resctrl/rdtgroup.c:850:24: error: implicit declaration of function 'iommu_get_group_kset'; did you mean 'iommu_group_get'? [-Werror=implicit-function-declaration]
     850 |         iommu_groups = iommu_get_group_kset();
         |                        ^~~~~~~~~~~~~~~~~~~~
         |                        iommu_group_get
>> fs/resctrl/rdtgroup.c:850:22: warning: assignment to 'struct kset *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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
