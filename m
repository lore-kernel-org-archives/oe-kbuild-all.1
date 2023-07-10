Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956D3C8CC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jul 2023 08:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688977393; x=1720513393;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qLP7oXVEjz+XEoPK2laAXbmLnvoPgKWHFEhuTSey6B4=;
  b=M8RepAameeAAuzquHD1/H5OFWbK2nH3P0Am1ljgZ07MtbRUfeDDRaqtJ
   2Lpthm7boItgHF59WRx7pjq8ng7kgzO1fg8MLCL8XDVeMDK1eYHbwquVN
   p0JuKSPVUNWTHzi00soN/M1VVgXgz9biE0cuf3ZKpCfTkTkAbda7e7/xt
   6SDZsDJZO+ov7StIkiXg9RW/hHcuRttmW4CgONQuwCjYTv7okHSYuqHCG
   f1JEk/AZQavgkM3WdFN+C4yWhDo/5ht2QPm3YJMBu39GqQup8JnF8WpxC
   IEzvTUGYZgWDQ4ijpEnFOdZx16j0oZzEC/PrwRLj0poTsQrO7JZ2027t4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="361754674"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="361754674"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 01:23:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="714713301"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="714713301"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 10 Jul 2023 01:23:11 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qImAo-0003cW-2P;
	Mon, 10 Jul 2023 08:23:10 +0000
Date: Mon, 10 Jul 2023 16:22:29 +0800
From: kernel test robot <lkp@intel.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lubaolu-intel-iommu:preparatory-io-pgfault-delivery-v1 8/10]
 include/linux/iommu.h:975:1: error: non-void function does not return a
 value
Message-ID: <202307101655.1YSFzPmf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/LuBaolu/intel-iommu.git preparatory-io-pgfault-delivery-v1
head:   69f5e42cc827269a4e5be80e3973bfdb70b3491d
commit: 78b14c2746ce66b7699cddd08dff71fa9ad6abec [8/10] iommu: Add iommu page fault cookie helpers
config: arm-sp7021_defconfig (https://download.01.org/0day-ci/archive/20230710/202307101655.1YSFzPmf-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230710/202307101655.1YSFzPmf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307101655.1YSFzPmf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/fork.c:101:
>> include/linux/iommu.h:975:1: error: non-void function does not return a value [-Werror,-Wreturn-type]
     975 | }
         | ^
   1 error generated.


vim +975 include/linux/iommu.h

   971	
   972	static inline void *iommu_set_device_fault_cookie(struct device *dev,
   973							  ioasid_t pasid, void *cookie)
   974	{
 > 975	}
   976	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
