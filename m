Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A63168C3
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 18:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gtRippKG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699207243; x=1730743243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zbb5aJhbHCHx2O3u+iqxQCrnJSiJgDocaOae21o0AUY=;
  b=gtRippKG73XtBBrgJX5GSpqAaANJ1Iivwm+Jl3eqtsioJPNCtbAIqRkt
   2J0mf/6psC5n40a2FkhLn/hqMUAYpY05GuSG5xcRsKOVFqRMZaz84DhUC
   972u8Vfz36KwAzn0KES+02JemBEwZgqRJPxsKb24cCLNQFNNRUGIN+83k
   XtlD3lbQ4RdNPMb6Foh/dR8dpYyiQgQtFr8PFeD1nrnioQaF8C2TzOlXa
   /sFo0d52s4JQChmoPiwiRW6aJLDqJdflMbv0mhKhCI4ZnNhoF8L8s35vM
   2teJAcMrIS4nA1MsnHQaQnlUwU68UAMSzkOtqYVHgvYoVWqEkB0koG+Tg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="453469442"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="453469442"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 10:00:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="905846234"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="905846234"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 Nov 2023 10:00:38 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzhQK-0005gV-01;
	Sun, 05 Nov 2023 18:00:36 +0000
Date: Mon, 6 Nov 2023 01:59:58 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/020-dart 14/21]
 drivers/iommu/io-pgtable-dart.c:483:21: warning: variable 'ptep' set but not
 used
Message-ID: <202311060102.uTpDrM5U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/020-dart
head:   4bac41589d221bb76b4396d6c85a0de2438021dc
commit: bb407f0f8c929f47757df63eba3ebf391fd825c6 [14/21] iommu: io-pgtable: Add 4-level page table support
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20231106/202311060102.uTpDrM5U-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311060102.uTpDrM5U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311060102.uTpDrM5U-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/io-pgtable-dart.c: In function 'apple_dart_free_pgtable':
>> drivers/iommu/io-pgtable-dart.c:483:21: warning: variable 'ptep' set but not used [-Wunused-but-set-variable]
     483 |         dart_iopte *ptep;
         |                     ^~~~


vim +/ptep +483 drivers/iommu/io-pgtable-dart.c

   479	
   480	static void apple_dart_free_pgtable(struct io_pgtable *iop)
   481	{
   482		struct dart_io_pgtable *data = io_pgtable_to_data(iop);
 > 483		dart_iopte *ptep;
   484		int i;
   485	
   486		for (i = 0; i < (1 << data->tbl_bits) && data->pgd[i]; ++i) {
   487			ptep = data->pgd[i];
   488			apple_dart_free_pgtables(data, data->pgd[i], data->levels - 1);
   489		}
   490	
   491		kfree(data);
   492	}
   493	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
