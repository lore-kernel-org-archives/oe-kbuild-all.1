Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794790171;
	b=YHAUzIN5YqEPv61HwXwRkU2jwqFMoaaOgcQ7q2zTUJllwJCZ4bGWK1k+G79n3DwZ+JoU
	 KsBesD3iCnm2oYBnfcbMp+k8/Ti6ItkYIqsPasntgjLIUYZxfqlC5K0Hg9qqjFeAoVXMa
	 hKb5D7gl8xZcDl7fgtxmrO3cLx5pMiJX4jLUihU8mAxAlFnWo/9It/Gkyemwt7VXfv6Ac
	 8JMEZpnLEzr2rQbvSoXNPlORwH338KtVdSp6v0UiZpC579du/Nuv9palD136RFeDSg10b
	 VyQsurhsgEKSSPLVxRV7bvuo1ngLRMpCXrTeuMMQVbmWMrCIk3mWTHynLJNmkYlJx5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794790171;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=YPqCXLMfoPgJVwcj7cXpfh9Uiw0sdXsqMAcujHtpPIM=;
	b=WbJXduhc9R+NjehZDN37Chy3efZ9BHxR3Na3WxRE7vsPFh03HKwd2gSxO03VVi6YawoR
	 zIL0u7ssqgei6k9Qll8/KqcbH1e7VQjp6wwoki/uiSosiD5Xd53xhFA5EuviLFRk+O0KF
	 3dXwb8XJZ47T2qNBocOu6DUEywUzG6uWXcm71QVRHysOeN9CO34BCOyz2zlrOKUc6m6tj
	 pWddWpVm5SwMAe1bgbPSZ7WAKptaBr4AwIVJuexCKFWcUB6/H7JQIF4Qe4FsNNPX+BZUL
	 ceRSV/g8X4RZVGAcTHKQ/c2nbvZd1PuONC2OuB7/rfnGYvvkSMKPHivRt6EYhbum/GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hZChdouI;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F143606A31F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 00:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F143606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hZChdouI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794790171; x=1826326171;
  h=date:from:to:cc:subject:message-id;
  bh=hTT06h2LlZnRc5pHrzCkR5qBzwgVXdfq4vpHRo4pYOY=;
  b=hZChdouInFK27yBN/fPjPJfuXTAAmQFO17ybXQC40Aqbndm8S/8QDoPM
   5M45NCWPCpvAFPIP9XNSxy36MkJW0fUtCO4TyvQ3M8oFbRSLHXjNm/IvU
   wSR8sN7RGw4kX0J+UtgXqw+zn3la9BQ1C4vkdI+XPv2NkaNf9dJHF3bjb
   6oz8cvrsHdHzCgkvhHWPClfL3wFcaGqMKP9nciOw/fn9nRgxgq/VWO98r
   DZRT1q1BNXNwvNvVNZYLjT5+qDiQnoUaOnQZQiaywI4lb7flRVmT/buj/
   fgOomBUAkhfTy7wZ0a/2oKlZSXl7L+90Pfqaeb4oz36YXFbi1sUnnmWL5
   w==;
X-CSE-ConnectionGUID: iPplPIFOSjaLNaZGM6Bs+Q==
X-CSE-MsgGUID: iPmQGuhARrenf6XbtjfwBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3392795"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3392795"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 16:49:30 -0800
X-CSE-ConnectionGUID: XBCf6V4VRZijrj8aK0W59Q==
X-CSE-MsgGUID: B/Z81UKjQdCfNUWO9XdBFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9727672"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 15 Nov 2026 16:49:29 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSkuU-000000002Xn-31mY;
	Mon, 16 Nov 2026 00:49:26 +0000
Date: Mon, 16 Nov 2026 01:48:44 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-lts 7/7] Warning:
 drivers/tty/n_gsm.c:4175 function parameter 'dlci' not described in
 'gsm_modem_send_initial_msc'
Message-ID: <202611160122.uaDWwNUn-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Seppo,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18-lts
head:   44c4d19047cd3c9c51c6fa3930c35844b10b5f9a
commit: 3cf0b3c243e56bc43be560617416c1d9f301f44c [7/7] tty: n_gsm: Don't block input queue by waiting MSC
config: arm-randconfig-2200-20261115 (https://download.01.org/0day-ci/archive/20261116/202611160122.uaDWwNUn-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611160122.uaDWwNUn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3cf0b3c243e5 ("tty: n_gsm: Don't block input queue by waiting MSC")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611160122.uaDWwNUn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/tty/n_gsm.c:4175 function parameter 'dlci' not described in 'gsm_modem_send_initial_msc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
