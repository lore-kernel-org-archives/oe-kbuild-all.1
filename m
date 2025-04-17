Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A1624EA9A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 13:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744897967; cv=none; b=JUfvnvh2EiemDetGnLDjJ7MX9Mzxmq8ZOFKqGu8iRPjgg25lnmt2QJtkuIRnErDFKQojclV+MyJjxwBWi2oFjfKsdAelRtxezwpnYS+nzBKqBtzwuZaF8jWZQTWSh/0CQsTHp7ylB/48Try2JJi9d74zvG48L3/qnzQZbjlc5BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744897967; c=relaxed/simple;
	bh=Zogzz42ONYxFjQx9SrjQfKzb4o4vc2LFj9Is38wYmsw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MVhdgACAnIug9v2sY2Wsnio93btH2Td2bnAIICeQW/AG+yn53bkiv+uAAhLXMYcYw1y2gisOi+Nd7rXw5BhoMT5ekIoRY/06cRoGfCyWjgJJFW78lb/wejlHWVXYYAIHeQlDJL4D28Aebm2ZVFyEytePOORFwgVYuyD9YBB9dt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fvt3lrya; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fvt3lrya"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744897966; x=1776433966;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zogzz42ONYxFjQx9SrjQfKzb4o4vc2LFj9Is38wYmsw=;
  b=fvt3lryaIF19IIj5ZFbLSCT/TWRx42j4KB6qm3vOF+//xoSyjF9+Mlxu
   ZtTg7/2M2ZaBGvufFLF8iPyBa5ViXqGXYu9CahqaIFNDTd6tdMrygYVo9
   6/TheHX1N2sBmLI3q5rI7njLM7+2Z1gm/VDfkY23V2ZllznmwSAw473cz
   yC3ZH9isfy5qGErpcrc4ZyGm5h0TKzTLY63y8PHE+tmMlWuS1bNDIN02G
   H68eniHzoYiHQ0qoHDo1tUdFKD8HISzRdryua9mLmVPpq+nzeBclwp78y
   yc0JIvucObIZOW5iwV4AYFS24jRVWysA1f86S/kUGvWd/A259qSg6QBQO
   A==;
X-CSE-ConnectionGUID: Xkj/wAV/RFODKh5AseQyiQ==
X-CSE-MsgGUID: iSRbyMBSSouoIvcbz+HB0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="45621842"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="45621842"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 06:52:44 -0700
X-CSE-ConnectionGUID: /Jz8iOIgTEOR31kfZamPdw==
X-CSE-MsgGUID: AKLXxNPuTq2AqCfZZIY8Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="130752781"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Apr 2025 06:52:42 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5PfU-000N7n-0E;
	Thu, 17 Apr 2025 13:52:40 +0000
Date: Thu, 17 Apr 2025 21:52:05 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 4503/4779] kismet: WARNING: unmet direct
 dependencies detected for OF_GPIO when selected by GPIO_TB10X
Message-ID: <202504172141.HKrHSGeu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bc8aa6cdadcc00862f2b5720e5de2e17f696a081
commit: 90d80a3dc4fb24446d9d423c1c8967a63f136b0b [4503/4779] gpio: tb10x: enable building the module with COMPILE_TEST=y
config: x86_64-kismet-CONFIG_OF_GPIO-CONFIG_GPIO_TB10X-0-0 (https://download.01.org/0day-ci/archive/20250417/202504172141.HKrHSGeu-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250417/202504172141.HKrHSGeu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504172141.HKrHSGeu-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_GPIO when selected by GPIO_TB10X
   WARNING: unmet direct dependencies detected for OF_GPIO
     Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
     Selected by [y]:
     - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
