Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD18C155A5B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Apr 2024 23:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714088486; cv=none; b=VkUvagooGE6GFXCZ44+JlQm0w35pgZg3QoMLp0on37aTc78weVTcMB3/8B/NcbsIRH/ZPbbV7QkSDzFR0w1pnqw6SwEcHvGuxKT1IjKjSfwuqtQVrGwyBYrwra5kFonXZ3P0AByKg5Rtq379EEX2K66jtTTZUv98NQc4r78ywKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714088486; c=relaxed/simple;
	bh=tWowxu/rOqWlSAyXQV1TlAc9TP25DUbLNPGlcDNsLBw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rYU69trBWsJSzxoyXUEi1uUycC2qoLlNc6AbP761bKIOMMbI4ZCldoj9NtnKf+wR0eFwRzKqRHeuqMJd8TCFSCmgD9yIWCoIcAWYJ81oDOE3vScU+gHjBr8i5rP7DiwIyXg75YTVprE7xW2OUF5MNT5N3JNadV3jBl3mqKOCfUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JZT752pd; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JZT752pd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714088484; x=1745624484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tWowxu/rOqWlSAyXQV1TlAc9TP25DUbLNPGlcDNsLBw=;
  b=JZT752pd0NCFsAPgMOdLY1HXhwVMK1tBnGaylBHPvYncNrchshbwOAnm
   6J5zeqHfSjjn0NxfNsT0MNfcbQO+ou8NfK/QnJ6EtVhDCNwQk5IdfLJE6
   fcz+Y8h1PASwARCq7pigJmpJNCozQaCaEZMhVPqujJdYjLAf6oVLnRUY8
   IOPumBWlATz1ucndfcOLG0fhLrBxbeOxWSsCiYU7Mc94YpvIfnWmIKHCv
   WqjayZDQiG1sAxxnRofbsPmGIWUmJz/5zIDB6S6j/OWyerY9zz3JygPst
   ChghWtm6vmOld4tacrVI27WuRQRa3LTFT8pgFxPo7rdIObBVKr/v9GutS
   Q==;
X-CSE-ConnectionGUID: EjKQI3IPS0SaxlCw62OYPg==
X-CSE-MsgGUID: D+zFdUBPRpGahHeVtgfbRQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20500331"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="20500331"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 16:41:23 -0700
X-CSE-ConnectionGUID: rGL7NKQ8Stq+IF5ardyqeA==
X-CSE-MsgGUID: Si96QER1SbWGuudjmlrhug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="30045744"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Apr 2024 16:41:22 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s08iN-00031Y-1z;
	Thu, 25 Apr 2024 23:41:19 +0000
Date: Fri, 26 Apr 2024 07:41:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 3158/22214]
 drivers/perf/arm_smmuv3_pmu.c:459:9: warning: no previous prototype for
 'smmu_pmu_event_show'
Message-ID: <202404260704.Qvd9eJqD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   28b2caccd679faae83cc61e008d7cc8009933988
commit: d80280f7df4f4be25d67a6460b63b3d2e0b5170d [3158/22214] perf: add arm64 smmuv3 pmu driver
config: arm64-randconfig-002-20240426 (https://download.01.org/0day-ci/archive/20240426/202404260704.Qvd9eJqD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240426/202404260704.Qvd9eJqD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404260704.Qvd9eJqD-lkp@intel.com/

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
