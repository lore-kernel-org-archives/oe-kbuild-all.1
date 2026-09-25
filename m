Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB0546C4AC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 13:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343247; cv=none; b=PkWlCI6E9Oa0zlGiF3RMjb0PrTrazuTE0MDFInBj4MTj6LUv1KeoE/AW/D1FCnGpX2wSRYucj6MylvFoiunfVzm3bTp19yv7DGLnnC1LeOe15/dPMkIrwTVTcwM/MoNRcmBh5tZ+j99sTYVBTx0l19pn3CsjmovI0uxIfXekuRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343247; c=relaxed/simple;
	bh=qfOdDbXfHdVjgyI0lqDXu3cKCF+Km8hfXNGh2m+iB84=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UbwIpIekocpOGCIHdSoVT/T6SJPsp3YmpOvz/gIAWn0OnUB0mevGy/Wsw5RWOpruG+C61t6Y9kHsVnGNCQbulZ8XrjtFIpDUyu1/BVdYUzepYivHkphNrTir3t+/RbhtA+Q8IYfQTHu83TwWnzoxIJiLkiE8szNQS5hM+vPHhf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZhXcAzjJ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZhXcAzjJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790343245; x=1821879245;
  h=date:from:to:cc:subject:message-id;
  bh=qfOdDbXfHdVjgyI0lqDXu3cKCF+Km8hfXNGh2m+iB84=;
  b=ZhXcAzjJEiRlQxU2m0vpSPjEAIw4fngETLrG77ieoBh8sLsHEQyNs2fu
   fJ5uWZCDAzyFIx4tCAjn3LWe+DL/QEsBhw7NP2/v/9VgiyNeLaePYwxME
   nL1bklcoPDIWg226uIFSv8A0mk3cqmrlL1TnOlA8u/QRI2F8SygVHZjMd
   wTLPpjyZB88i62djlJHeTe0zGd5N8Lk6QmSODydQBoeA7qRIMhELDjMgz
   P3U6sambb54DxVAxhbktZa02XlmqsRak3jOyqQsdmdkaFO9vCm/dYfwci
   08w+bpuNjVrN12FXJ7waOd6WpmJY5Pm9I8hIkH0DP8GxYfXswwfl3RFal
   w==;
X-CSE-ConnectionGUID: bYqVrzShR9OfjCbHtCybHg==
X-CSE-MsgGUID: RYt6/NRkSS6L50TyhwHtjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="101703605"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="101703605"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 06:34:04 -0700
X-CSE-ConnectionGUID: ixpT7yvaTv2Ano8yohutvw==
X-CSE-MsgGUID: W7c32IU6QtGlx6lc8KRLVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="273567838"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 25 Sep 2026 06:34:02 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA63s-000000000ly-1u7p;
	Fri, 25 Sep 2026 13:34:00 +0000
Date: Fri, 25 Sep 2026 15:33:38 +0200
From: kernel test robot <lkp@intel.com>
To: Andrew Gaylard <ag@ffroot.co.za>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linusw@kernel.org>
Subject: [linux-next:master 7217/10113] Warning:
 drivers/pinctrl/sunplus/sppctl.c:228 function parameter 'bit_off' not
 described in 'sppctl_gmx_set'
Message-ID: <202609251541.FiNQ82je-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
commit: 7dcf87d2dbbe8c9c1efb69fe9be728a3dfd51d3d [7217/10113] pinctrl: fix PINCTRL_SPPCTL=m
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260925/202609251541.FiNQ82je-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251541.FiNQ82je-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609251541.FiNQ82je-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/pinctrl/sunplus/sppctl.c:175 function parameter 'pctl' not described in 'sppctl_func_set'
   Warning: drivers/pinctrl/sunplus/sppctl.c:175 function parameter 'func' not described in 'sppctl_func_set'
   Warning: drivers/pinctrl/sunplus/sppctl.c:175 function parameter 'val' not described in 'sppctl_func_set'
   Warning: drivers/pinctrl/sunplus/sppctl.c:228 function parameter 'pctl' not described in 'sppctl_gmx_set'
   Warning: drivers/pinctrl/sunplus/sppctl.c:228 function parameter 'reg_off' not described in 'sppctl_gmx_set'
>> Warning: drivers/pinctrl/sunplus/sppctl.c:228 function parameter 'bit_off' not described in 'sppctl_gmx_set'
   Warning: drivers/pinctrl/sunplus/sppctl.c:228 function parameter 'bit_sz' not described in 'sppctl_gmx_set'
   Warning: drivers/pinctrl/sunplus/sppctl.c:228 function parameter 'val' not described in 'sppctl_gmx_set'
   Warning: drivers/pinctrl/sunplus/sppctl.c:261 function parameter 'chip' not described in 'sppctl_first_get'
   Warning: drivers/pinctrl/sunplus/sppctl.c:261 function parameter 'offset' not described in 'sppctl_first_get'
   Warning: drivers/pinctrl/sunplus/sppctl.c:296 function parameter 'chip' not described in 'sppctl_master_get'
   Warning: drivers/pinctrl/sunplus/sppctl.c:296 function parameter 'offset' not described in 'sppctl_master_get'
   Warning: drivers/pinctrl/sunplus/sppctl.c:695 function parameter 'offset' not described in 'sppctl_fully_pinmux_conv'
   Warning: drivers/pinctrl/sunplus/sppctl.c:175 function parameter 'pctl' not described in 'sppctl_func_set'
   Warning: drivers/pinctrl/sunplus/sppctl.c:175 function parameter 'func' not described in 'sppctl_func_set'
   Warning: drivers/pinctrl/sunplus/sppctl.c:175 function parameter 'val' not described in 'sppctl_func_set'
   Warning: drivers/pinctrl/sunplus/sppctl.c:228 function parameter 'pctl' not described in 'sppctl_gmx_set'
   Warning: drivers/pinctrl/sunplus/sppctl.c:228 function parameter 'reg_off' not described in 'sppctl_gmx_set'
>> Warning: drivers/pinctrl/sunplus/sppctl.c:228 function parameter 'bit_off' not described in 'sppctl_gmx_set'
   Warning: drivers/pinctrl/sunplus/sppctl.c:228 function parameter 'bit_sz' not described in 'sppctl_gmx_set'
   Warning: drivers/pinctrl/sunplus/sppctl.c:228 function parameter 'val' not described in 'sppctl_gmx_set'
   Warning: drivers/pinctrl/sunplus/sppctl.c:261 function parameter 'chip' not described in 'sppctl_first_get'
   Warning: drivers/pinctrl/sunplus/sppctl.c:261 function parameter 'offset' not described in 'sppctl_first_get'
   Warning: drivers/pinctrl/sunplus/sppctl.c:296 function parameter 'chip' not described in 'sppctl_master_get'
   Warning: drivers/pinctrl/sunplus/sppctl.c:296 function parameter 'offset' not described in 'sppctl_master_get'
   Warning: drivers/pinctrl/sunplus/sppctl.c:695 function parameter 'offset' not described in 'sppctl_fully_pinmux_conv'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
