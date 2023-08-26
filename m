Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3E718F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 00:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693008447; x=1724544447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y97dN7yKehjEhnD/lOskLTHSrudz7EOGxMDGB4M0GNQ=;
  b=P+OKrLxjL48GUjlX53EsNMaeU6HsHqGZI1b5zql+m+rSZLbUMDRn943Z
   9RW6HWQCjLgI+Z6E/ndNcRAkbcrl6NubUUSVcH6nUKmkpDFMMevd7yOhc
   pKzVILoekEQj06sfmVbJsei9PZ4ETCJ3+HU5JC3OdAEhxSYAX376txz8l
   po9HLVpfVu1A+s+mFS5zs5eZpZUftNMMI3d0NE24XNj9bj6WNib2RwX6k
   CKXywqOnxZFMFItdSGUdvuzlc9Z2itp+vGkxcQejoYKKxF40n2EntFe19
   e7gJKYzmYK8mUaG9EjMeJy5PwfyQCjBqt/JlGjvFPmvlsw+SSsYmTyStQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="359823653"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="359823653"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 17:07:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="807693532"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="807693532"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 25 Aug 2023 17:07:25 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZgpo-00049b-1h;
	Sat, 26 Aug 2023 00:07:24 +0000
Date: Sat, 26 Aug 2023 08:06:49 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.5-rc1 138/150] fs/resctrl/rdtgroup.c:850:24:
 error: implicit declaration of function 'iommu_get_group_kset'; did you mean
 'iommu_group_get'?
Message-ID: <202308260737.qAn48aMP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi James,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.5-rc1
head:   b35e256b516ef563cb57da2628dc19bcd600e35f
commit: 9e9af35cd8e4b32e9ccba2fa49c1ce600b3066b8 [138/150] fs/resctrl: Add support for assigning iommu_groups to resctrl groups
config: i386-buildonly-randconfig-005-20230826 (https://download.01.org/0day-ci/archive/20230826/202308260737.qAn48aMP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260737.qAn48aMP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260737.qAn48aMP-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/resctrl/rdtgroup.c: In function 'show_rdt_iommu':
>> fs/resctrl/rdtgroup.c:850:24: error: implicit declaration of function 'iommu_get_group_kset'; did you mean 'iommu_group_get'? [-Werror=implicit-function-declaration]
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
