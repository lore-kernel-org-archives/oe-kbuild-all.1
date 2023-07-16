Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89C91867
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jul 2023 03:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689479658; x=1721015658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IWsys1BxcDzXdF1vcNWah0ocril/dkaW5ENvcVQsr/Q=;
  b=Xp8Qc4WCWTpYr2gcaYY9sIrz3BNfKnUdtzf2+eQE/IDDTFIpWnVWqaT7
   vHzPJ7pcQzME56dogYLrnu3Yk1etmMmHaEgOZ8GZOHmSWh6AkJ1JNxg2e
   /7hEyRBOMwIWcupj1nT8B7xhZ5UPN66XkhWw7izai4Xhk6/U4lZs6D6Tf
   MF+gysMrBpmLks1z0apDcoIQCnFrFgQjpKH/7F48Xu1qh0FJrBS4L3p8N
   lXi36N6WZkvh6VXHZj8JqcqJOAZHo3vqDNxSBmuqxSdJK+hSQT8bh1J0C
   pc3yg2JnNKe4E1ASDYTGj4/OV68g7ysi3EWSID9oAACsJnThjMheRfebP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="365769383"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="365769383"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 20:54:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="758006682"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="758006682"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 15 Jul 2023 20:54:12 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKspo-0008Y9-06;
	Sun, 16 Jul 2023 03:54:12 +0000
Date: Sun, 16 Jul 2023 11:54:01 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 356/365]
 include/linux/hugetlb.h:488:16: warning: 'struct resv_map' declared inside
 parameter list will not be visible outside of this definition or declaration
Message-ID: <202307161130.LiXedGlx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   da8c3aa0cbb638a0dff13401bc17f817272110e6
commit: f896a70f60673d612d27d0a8c2a3f37f4c1a6338 [356/365] mm: hugetlb: Parametrize hugetlb functions by resv_map
config: arm-randconfig-r046-20230716 (https://download.01.org/0day-ci/archive/20230716/202307161130.LiXedGlx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161130.LiXedGlx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161130.LiXedGlx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/migrate.h:8,
                    from fs/btrfs/inode.c:32:
   include/linux/hugetlb.h:484:16: warning: 'struct hstate' declared inside parameter list will not be visible outside of this definition or declaration
     484 |         struct hstate *h, struct address_space *mapping, loff_t start, loff_t end) {}
         |                ^~~~~~
>> include/linux/hugetlb.h:488:16: warning: 'struct resv_map' declared inside parameter list will not be visible outside of this definition or declaration
     488 |         struct resv_map *resv_map, struct inode *inode, loff_t lstart, loff_t lend) {}
         |                ^~~~~~~~
   include/linux/hugetlb.h:487:65: warning: 'struct hugepage_subpool' declared inside parameter list will not be visible outside of this definition or declaration
     487 |         struct address_space *mapping, struct hstate *h, struct hugepage_subpool *spool,
         |                                                                 ^~~~~~~~~~~~~~~~
   include/linux/hugetlb.h:487:47: warning: 'struct hstate' declared inside parameter list will not be visible outside of this definition or declaration
     487 |         struct address_space *mapping, struct hstate *h, struct hugepage_subpool *spool,
         |                                               ^~~~~~


vim +488 include/linux/hugetlb.h

   482	
   483	static inline void hugetlb_zero_partial_page(
   484		struct hstate *h, struct address_space *mapping, loff_t start, loff_t end) {}
   485	
   486	static inline void remove_mapping_hugepages(
   487		struct address_space *mapping, struct hstate *h, struct hugepage_subpool *spool,
 > 488		struct resv_map *resv_map, struct inode *inode, loff_t lstart, loff_t lend) {}
   489	static inline void remove_inode_hugepages(struct inode *inode, loff_t lstart, loff_t lend) {}
   490	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
