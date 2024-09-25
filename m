Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AED11870
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Sep 2024 17:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727286636; cv=none; b=PoDJl6t9QdIJ7r3P9gDD6kjvQeIRGbAlDib8NI6uVLv3vYCdHy0KANZdyjQAYmlcohHcSoBwywWDseufT1Du3UJhOvg7R061BbQFoJnF1+OLGRq1sXoOJhXUrH3Y25zM5M61SKwADiOdwte8j1h4yFW7eLKPXYV7UY4QDcAiGIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727286636; c=relaxed/simple;
	bh=l3/HZB3JS14+w2j9WQ++CEwFxxCX8kbjUxflp8QRxiM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sRPFH4mWorkauBsUTUUcAaDGCcVh6bSeJ73Ulj928hi6qig6w4XbGGwIsbZMqbJTn71Zo95B3LRWTx25kHlTokVP8R1sIVn2zt+xX3IcfBaXIV51+CHuMd6cKwPt4DddCDviTMCVPrwM1DnddwD5wpYRqTF+BnsTDnez46c2DxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YaZKEJM9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YaZKEJM9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727286635; x=1758822635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l3/HZB3JS14+w2j9WQ++CEwFxxCX8kbjUxflp8QRxiM=;
  b=YaZKEJM90oaKmskusoM5Yx/O0VJKfsqOPtuYRrRbVqhVkgYBILi6vjP+
   iZ2oHD7NM28PeNH462Eumno8UninKKBYk7n0OYZaIJIQG37/ALPdLYj8I
   XCfUBGYlymFwp5/Ri9PLJjJHfxG1+ypHcsP2qXOrVQIoy7ln/KOOo+E0n
   4khw1kFfb9hdrJyF41S6uIxEBI+5yjlTIvYPhfwl+qL54EFP5lBF/EhVh
   egzIPIS/sfKTmHQ0nHgqg6oDE1gS3sWH9VfYqycNVU+wyZ0jaIOOJAjjV
   VrJxJNm/nKcwLudRALr3O7G6Cz5Dh/eKvLo6nivgG4/p191iotWkDMEhJ
   A==;
X-CSE-ConnectionGUID: p7tJaqLzRBSBjTo/EsINnQ==
X-CSE-MsgGUID: urb/JHREQFaEIWlUPwKWRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="51767543"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="51767543"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 10:50:34 -0700
X-CSE-ConnectionGUID: iyqeW2hrRiWENx51hv/FIQ==
X-CSE-MsgGUID: 6Q6KimS1RD2vWFARxpTlXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="72316335"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Sep 2024 10:50:33 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stW9m-000JqF-1H;
	Wed, 25 Sep 2024 17:50:30 +0000
Date: Thu, 26 Sep 2024 01:50:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 3158/23766]
 drivers/perf/arm_smmuv3_pmu.c:459:9: warning: no previous prototype for
 'smmu_pmu_event_show'
Message-ID: <202409260104.P8TNlohM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Neil,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ecca3ab84cbf3cf5ec32574bcec8a068e79d14df
commit: d80280f7df4f4be25d67a6460b63b3d2e0b5170d [3158/23766] perf: add arm64 smmuv3 pmu driver
config: arm64-randconfig-004-20240925 (https://download.01.org/0day-ci/archive/20240926/202409260104.P8TNlohM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409260104.P8TNlohM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409260104.P8TNlohM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/perf/arm_smmuv3_pmu.c:459:9: warning: no previous prototype for 'smmu_pmu_event_show' [-Wmissing-prototypes]
     459 | ssize_t smmu_pmu_event_show(struct device *dev,
         |         ^~~~~~~~~~~~~~~~~~~


vim +/smmu_pmu_event_show +459 drivers/perf/arm_smmuv3_pmu.c

   458	
 > 459	ssize_t smmu_pmu_event_show(struct device *dev,
   460				    struct device_attribute *attr, char *page)
   461	{
   462		struct perf_pmu_events_attr *pmu_attr;
   463	
   464		pmu_attr = container_of(attr, struct perf_pmu_events_attr, attr);
   465	
   466		return sprintf(page, "event=0x%02llx\n", pmu_attr->id);
   467	}
   468	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
