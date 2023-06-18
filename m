Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FB01386
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jun 2023 09:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687081334; x=1718617334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MYFGM3quGiHYtKRiHiEh1c2zPHRsDGLZiUD11jt1zTI=;
  b=aCBf/pLAtErDZFvTyZQMnzbQ2WDP2nzh/2kDLX5GsWaRynqoUE3IMVj+
   G+2fQuNJiYvmllhzW5G6/fM3xU88NkF/N4v4dvj/t54l6amwnTE04xO5D
   y+ICET9Xb/sH4v9RJqP2o5MK5skUHrvApAY4wsjpJz/k7A1Ot+gDjhK9R
   E7KBz4yWejS/TiQ2BJkJDd7n6h/aw74kkQtdx/MWn/Ly8E8iSjwG6tdkK
   1EaTn4ynPM2fEQ1uW0b6QJfWl7BbB7ToLVIO5BwiAKwovBxr/heL/h3bb
   Wo3j0MqYNyzPwHxWTGVDOE08Y3i+nGes3xA5G2wxn7ju08zhjRdsnViwl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="445843633"
X-IronPort-AV: E=Sophos;i="6.00,252,1681196400"; 
   d="scan'208";a="445843633"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2023 02:42:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="1043576982"
X-IronPort-AV: E=Sophos;i="6.00,252,1681196400"; 
   d="scan'208";a="1043576982"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 18 Jun 2023 02:42:13 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAovE-0003cm-16;
	Sun, 18 Jun 2023 09:42:12 +0000
Date: Sun, 18 Jun 2023 17:41:32 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <j.granados@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [joelgranados:jag/sysctl-testing-for-0day 16/17]
 mm/hugetlb_vmemmap.c:600:25: error: too many arguments to function
 'register_sysctl_init'
Message-ID: <202306181715.Kn90NFdU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Joelgranados/linux.git jag/sysctl-testing-for-0day
head:   cbba378db4b97256c72560da5762aaed778957c0
commit: b1f6ed030567099a052906e9af1bdc6e6f9e5285 [16/17] sysctl: Add size to register_sysctl_init
config: s390-randconfig-c041-20230618 (https://download.01.org/0day-ci/archive/20230618/202306181715.Kn90NFdU-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306181715.Kn90NFdU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306181715.Kn90NFdU-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/hugetlb_vmemmap.c: In function 'hugetlb_vmemmap_init':
>> mm/hugetlb_vmemmap.c:600:25: error: too many arguments to function 'register_sysctl_init'
     600 |                         register_sysctl_init("vm", hugetlb_vmemmap_sysctls,
         |                         ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/key.h:17,
                    from include/linux/cred.h:13,
                    from include/linux/sched/signal.h:10,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:976,
                    from include/linux/bootmem_info.h:5,
                    from mm/hugetlb_vmemmap.c:15:
   include/linux/sysctl.h:258:20: note: declared here
     258 | static inline void register_sysctl_init(const char *path, struct ctl_table *table)
         |                    ^~~~~~~~~~~~~~~~~~~~


vim +/register_sysctl_init +600 mm/hugetlb_vmemmap.c

   590	
   591	static int __init hugetlb_vmemmap_init(void)
   592	{
   593		const struct hstate *h;
   594	
   595		/* HUGETLB_VMEMMAP_RESERVE_SIZE should cover all used struct pages */
   596		BUILD_BUG_ON(__NR_USED_SUBPAGE * sizeof(struct page) > HUGETLB_VMEMMAP_RESERVE_SIZE);
   597	
   598		for_each_hstate(h) {
   599			if (hugetlb_vmemmap_optimizable(h)) {
 > 600				register_sysctl_init("vm", hugetlb_vmemmap_sysctls,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
