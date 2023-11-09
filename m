Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CA9225D8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 17:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hbF7IyRm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699551547; x=1731087547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oNOe5l4fdRB0ajuwjXG6C+asgvasqM5b+SFJVSaFlaE=;
  b=hbF7IyRmj39Oc2IBrMykzXnX4nx8Rs40GefpbJbgPEFtY8+VQHRi80GJ
   /Hm2jI6XnSS9DPb7OU6U/gK/gkd4bfm6gxIXVETPCKN6/t0N46l1Jc3Uu
   VrpZSdArZ6AARC0zh/a5Y2ySy7wJiTvDwISv6LW5oF7vpn/SUWap5MkM2
   lslt6uev3biIlOpgcLzDh4pxywBJ7GhSkyRGiuMswi4TerqC6Falghkif
   MsEhti0y89JYsilMzXQbrd658od69+A5ExMHpwdTIQDXOnrmpwih2z6/T
   QrX2FFXc2byFySKTvIB5pgw6d7cr5gDqaTP7RSu2CBTf7dlrGzuENXWyq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="375074318"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="375074318"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 09:39:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="907206195"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="907206195"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2023 09:39:05 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r18zf-0008zd-2s;
	Thu, 09 Nov 2023 17:39:03 +0000
Date: Fri, 10 Nov 2023 01:27:16 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:iommufd-v5.19-rc5 93/104]
 drivers/iommu/intel/nested.c:288:22: warning: no previous prototype for
 'intel_nested_domain_alloc'
Message-ID: <202311100046.JykPZiGi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git iommufd-v5.19-rc5
head:   f200d9a1de755f3bb98e21535e22b9adf6ba83f7
commit: 3d58f63f746cd38647d80d943335de4e5972bbf0 [93/104] iommu/vt-d: Add support for nested mode translation
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20231110/202311100046.JykPZiGi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311100046.JykPZiGi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311100046.JykPZiGi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/intel/nested.c:288:22: warning: no previous prototype for 'intel_nested_domain_alloc' [-Wmissing-prototypes]
     288 | struct iommu_domain *intel_nested_domain_alloc(struct iommu_domain *s2_domain,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/intel_nested_domain_alloc +288 drivers/iommu/intel/nested.c

   287	
 > 288	struct iommu_domain *intel_nested_domain_alloc(struct iommu_domain *s2_domain,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
