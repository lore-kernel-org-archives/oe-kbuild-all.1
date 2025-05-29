Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A143253F1D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 May 2025 05:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748498080; cv=none; b=X8iJYIqw2SsLDx3Utlp7zuk/VsF7Ejijj/IINKc8yS3L/yNmA0JsiQNdoc2+vwALcIaFZJwm0VkHd17jun14048QL6w4LzZdzhNo1LWoSEPaPXCN1xrm1gN7QUZmo18F3iHdbgq956yICtuWMSNF9AP4dW+PS/PsHAIk1LDficU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748498080; c=relaxed/simple;
	bh=TC2QWRF59/EvAVzt7w/Jxoc/U8WbN0YCuAU6WPL/qs8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=foZzG3+ktWjfksohFh5kFzkK5O1sy4juppTmQrJ5LT8rYtxiD52dSBRXHJURnvDVVm2fnb5eDEZ10PPwqxJzUmgXn0jHD60q5GOksk7+gvsHnNRPd9TOwVAu/W7f3f09Hhe+k0l7SMqDFIZbFKBOZRFP4Dtrke9CxLq/4Ttr8CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OPQVYVGq; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OPQVYVGq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748498078; x=1780034078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TC2QWRF59/EvAVzt7w/Jxoc/U8WbN0YCuAU6WPL/qs8=;
  b=OPQVYVGqIFqdlexVde8OZZJCz6/INcOaQ/qOyltXdFbAVGDqkYow+6Ro
   OgANHiOPMVpJVLZiNNW2uizCv8UDCtofqRTkKwB6SM9X1y97ll4cpDns8
   CKPBROEAor9MOdb0vgrBSEaT5ecj5i5H/FB1mJu+zEI8POecFnTZypAs7
   eb37YUiIFNYcb9OxbyQWlQblEUY5/364/+un3eXx0CQQIP3ubUnu5NW/J
   iAldszEEXlXtTUjdFOxJ2veC/qHeEr1s1MwuFhhR5w/zPDzis1UrNDEmj
   bILwpeL0fUzbPWZ0tX3XmsF3ukcCcYaMz/XCJr2yYpMUFw5Za9TzV1Ik4
   g==;
X-CSE-ConnectionGUID: yArbTLS+Rl2e5Gtg9gXFhg==
X-CSE-MsgGUID: 3u6qoaZzTA+ACLj5eZHnUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="53172753"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; 
   d="scan'208";a="53172753"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 22:54:35 -0700
X-CSE-ConnectionGUID: r5YQ554ATiSztuVEN2J33g==
X-CSE-MsgGUID: 1iFxjW+AQumw8qwuMG6UwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; 
   d="scan'208";a="148745650"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 May 2025 22:54:34 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKWDn-000WMv-2N;
	Thu, 29 May 2025 05:54:31 +0000
Date: Thu, 29 May 2025 13:53:44 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:b4/pinctrl-const-desc 6/21] kismet: WARNING: unmet
 direct dependencies detected for OF_GPIO when selected by PINCTRL_K210
Message-ID: <202505291337.mvf5HMJq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux b4/pinctrl-const-desc
head:   d3256768ab6f3fe1b0747b929de9979f953cda3a
commit: fcc37ff0732f38ecd89c97becc32f422d6aa9f6f [6/21] pinctrl: Allow compile testing for K210, TB10X and ZYNQ
config: x86_64-kismet-CONFIG_OF_GPIO-CONFIG_PINCTRL_K210-0-0 (https://download.01.org/0day-ci/archive/20250529/202505291337.mvf5HMJq-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250529/202505291337.mvf5HMJq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505291337.mvf5HMJq-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_GPIO when selected by PINCTRL_K210
   WARNING: unmet direct dependencies detected for OF_GPIO
     Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
     Selected by [y]:
     - PINCTRL_K210 [=y] && PINCTRL [=y] && (RISCV && SOC_CANAAN_K210 && OF [=n] || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
