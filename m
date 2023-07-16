Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9EC161
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jul 2023 02:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689474492; x=1721010492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yVh2LVI41BwiiCFR47WqmBhoPnMQLsQDttZvoKF6OTk=;
  b=UIMEMUlVFQvYffx2xBfZn+GZvKtKWjRxAERQgl8oq2QmCbwUiD6a59LY
   l8h4gBAHetXYPBLHK+CvwP6XoHBbdivdN+uN7uCY4VxEyHA88QuvvTI21
   2j4zXOu87+0FJVat4en3Xe/3v8ox5isvCM58yGmBPcbxvaRCvski5Zv50
   QA/hqr/kvp6Xb/c4Vv84HTf2d0ZJBi8IR9i9oMMo0iH8ZQfQSkKBdkmf2
   WV5Mvd7OofMfoxcWLRTV/p4QmbiYoxg57wdIuiVyp1OSYkjEbIFi74qLG
   5eGjgnPSFdYKlT13xBG3D23Uaf47OHl/ogq0+1k6CVsQ3vBSSd15KFfMR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="363186006"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="363186006"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 19:28:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="846875961"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="846875961"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 15 Jul 2023 19:28:10 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKrUX-0008U9-2K;
	Sun, 16 Jul 2023 02:28:09 +0000
Date: Sun, 16 Jul 2023 10:28:08 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 347/365]
 include/linux/hugetlb.h:475:16: warning: 'struct hstate' declared inside
 parameter list will not be visible outside of this definition or declaration
Message-ID: <202307161028.nRUjR1mt-lkp@intel.com>
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
commit: 9e8a1c802ea25a508f001252830b3e5a5cf907d1 [347/365] mm: hugetlb: Move and expose hugetlbfs_zero_partial_page
config: arm-randconfig-r046-20230716 (https://download.01.org/0day-ci/archive/20230716/202307161028.nRUjR1mt-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161028.nRUjR1mt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161028.nRUjR1mt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/migrate.h:8,
                    from fs/btrfs/inode.c:32:
>> include/linux/hugetlb.h:475:16: warning: 'struct hstate' declared inside parameter list will not be visible outside of this definition or declaration
     475 |         struct hstate *h, struct address_space *mapping, loff_t start, loff_t end) {}
         |                ^~~~~~


vim +475 include/linux/hugetlb.h

   473	
   474	static inline void hugetlb_zero_partial_page(
 > 475		struct hstate *h, struct address_space *mapping, loff_t start, loff_t end) {}
   476	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
