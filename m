Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4B337A82D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jul 2026 22:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783894777; cv=none; b=ZUG7XUxw1tLCjhLWAONe72E89KueG/fRzJndlQCi8kTiE7b/u0impqBrQ/tTR15MtGB0cAqZsJ2Er7RrQhMThDw24k95sfwYObxGhayjsJGO2mvIcFRfGO2cY3ee9VTSI/RaGvx4vj0gXqxMAtRdrgyDBj8dEhEUt8mSaZXny5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783894777; c=relaxed/simple;
	bh=KVESXTVwWIg2ywZDtqYnassFYXe2oTHubexVg6ps/hg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jytjMkfrxgqsr82ytZmKGr1qHIDvTdOo+mg/juIdLg88+EG6ubXl21EvdWvHDQtM+M3O6hjJUrKSF805imTs+RAXxcqsxyLWHO5WaV2OewTJ7O/B3To0/yBBqXI9ZClFfWv99oklqo9tETeMXnoKaVN+bV8vSot02EkbmQX7VIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aRcjZVE2; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aRcjZVE2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783894774; x=1815430774;
  h=date:from:to:cc:subject:message-id;
  bh=KVESXTVwWIg2ywZDtqYnassFYXe2oTHubexVg6ps/hg=;
  b=aRcjZVE2Jk4FuMh6gupCbTgJIbtAROD+sCNmolbQQscCfPUp57mA8Xib
   y0S8T4qCRtXpKZonQtd+2QrwRxc1u9v40plVvvzt67QCNltdVmWUEzyJY
   VYJf6crv69ucKi7F/hRQuqnfhXD18ikqORe+rsWQ5IfK4Lk1UiHOB3RP7
   tuQtUIUWzW7lShNu2FSLlV65UmVIWW5CBJmQdM0QNmxHMN0rOWGLJiEmi
   M/sDU4MBjZwt181/XOgCNOXYF05Gcst3d86NVb8Bb+s0fCKY6R6UGDlbi
   sMfzB4q9P7RS6nah0V+tbkWAqDG1UL1twMNKdkmyBZDMr5tPQduXJJo/A
   Q==;
X-CSE-ConnectionGUID: 3d6o6aS0S6CEryHlaec+Sg==
X-CSE-MsgGUID: dwnYnVGkQJu4OntE9PwZGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101933797"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="101933797"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 15:19:33 -0700
X-CSE-ConnectionGUID: 7Qcs6SeoTEer5G5wGgxC3A==
X-CSE-MsgGUID: giXlVFa8QFWVhmg5qMxP7A==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 12 Jul 2026 15:19:32 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wj2WH-00000000LB4-1eJw;
	Sun, 12 Jul 2026 22:19:29 +0000
Date: Mon, 13 Jul 2026 06:19:14 +0800
From: kernel test robot <lkp@intel.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Thomas Gleixner <tglx@kernel.org>,
 Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: [linux-next:master 4015/5655] qcom-pdc.c:undefined reference
 to `qcom_scm_is_available'
Message-ID: <202607130658.YPpqdAa8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bee763d5f341b99cf472afeb508d4988f62a6ca1
commit: ad01c2b2f29163ca0bbe1fd4f9343fbc5119c239 [4015/5655] irqchip/qcom-pdc: Configure PDC to pass through mode
config: arm64-randconfig-001-20260712 (https://download.01.org/0day-ci/archive/20260713/202607130658.YPpqdAa8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260713/202607130658.YPpqdAa8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607130658.YPpqdAa8-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/irqchip/qcom-pdc.o: in function `qcom_pdc_probe':
>> qcom-pdc.c:(.text+0x1e88): undefined reference to `qcom_scm_is_available'
>> aarch64-linux-ld: qcom-pdc.c:(.text+0x1ea0): undefined reference to `qcom_scm_io_writel'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
