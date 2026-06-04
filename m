Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D92830D3E7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jun 2026 23:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780616308; cv=none; b=X3K2SGxyKxBedYSmL6y+ygpzLQTGmZ3sLYLbeu5H0g0J/hllv3oRuC802qiO41V2gw9ejeq3Qauy3hO2/fXTcNHR4j1og00IsX+7dBBGfftVwjlIytqiHt00nPygA1PwLS863yzNHX9/zjNz1osoAVXQD+00WMMSgdrkptIqE5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780616308; c=relaxed/simple;
	bh=YpxpRknlCjtfvbaPVm6TiwlKsIKgNkDCdQcJwuZW0NE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=adaYgayib2RGrW1EOHuTYzIWM7T8PYPPZjVmPn9OY1KAvLui7a0BpVPWtrKZv6H7eoAqHtX03qFOmOlZNvfhzBf6X2OuNYTMAfo6CnTHbUZvZp7qBz/GjoWRNTEhyqLiJ9C+nlGz9hiZ1GLsE0ry7vlRutxnsaq2/7KZ9tjrch8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HDOMVoP4; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HDOMVoP4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780616307; x=1812152307;
  h=date:from:to:cc:subject:message-id;
  bh=YpxpRknlCjtfvbaPVm6TiwlKsIKgNkDCdQcJwuZW0NE=;
  b=HDOMVoP4RWHdErkToICsh8EFtYKg9fC3CNJiS1l7J1IxGz6iAOmw/21n
   KKhtERXoAW+Fou1AJGOZjViZ/WlT9Rslez5msUZ8SUf/kQ4Q6ofENI//2
   +2dbCmce6AKtrLCeCIz8kg6NTva3ofFR0EKQmB9Uy3eOwGSvGKp9jdov6
   YlCRe+YJypBW6u0OcRvFRARBPzEsKYEpG8oyKg8cA3sf3yDJhopyTg3dS
   O1QZF55hwJE9pKfxbDSPDHVp6WIQQ7PB/PWwm2Tz4DINaHJS405GikB3j
   28CFipvLeV9d2NVvCRELkCJC5CIvHMbe9FdY37ivPHeHPuuBpt1MZCO9l
   w==;
X-CSE-ConnectionGUID: Vd75B00RQgOfP6rCpiAAaw==
X-CSE-MsgGUID: D/hKlilASZSfWXn4BtLNhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="92136229"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="92136229"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 16:38:26 -0700
X-CSE-ConnectionGUID: S59ZxK3LTKKN1ClL6ofaRw==
X-CSE-MsgGUID: Slzit0ErT0qFLBuVbabqRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="246521855"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Jun 2026 16:38:25 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVHdm-00000000FJe-37iD;
	Thu, 04 Jun 2026 23:38:22 +0000
Date: Fri, 05 Jun 2026 07:37:34 +0800
From: kernel test robot <lkp@intel.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:new_memory_domain_logic 7661/8603]
 mtk-adsp-common.c:undefined reference to `mtk_adsp_ipc_send'
Message-ID: <202606050715.YAEedKXy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jsarha/linux new_memory_domain_logic
head:   2ccc28fc7aca2be88679f0c77b16ae8a7e6727f7
commit: 3e55a76d727eddf6b3bad82139a6788172168a01 [7661/8603] Merge branch 'sound/upstream-20250414' into merge/sound-upstream-20250414
config: arm64-randconfig-003-20260605 (https://download.01.org/0day-ci/archive/20260605/202606050715.YAEedKXy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606050715.YAEedKXy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606050715.YAEedKXy-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: sound/soc/sof/mediatek/mtk-adsp-common.o: in function `mtk_adsp_send_msg':
>> mtk-adsp-common.c:(.text+0x68): undefined reference to `mtk_adsp_ipc_send'
>> mtk-adsp-common.c:(.text+0x68): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `mtk_adsp_ipc_send'
   aarch64-linux-ld: sound/soc/sof/mediatek/mtk-adsp-common.o: in function `mtk_adsp_handle_request':
   mtk-adsp-common.c:(.text+0x134): undefined reference to `mtk_adsp_ipc_send'
   mtk-adsp-common.c:(.text+0x134): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `mtk_adsp_ipc_send'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
