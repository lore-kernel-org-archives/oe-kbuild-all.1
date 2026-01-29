Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1520819D071
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jan 2026 04:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769659745; cv=none; b=rnsEnR/t9RtucgqW6Rw1HkedtJHaudUyXX2JLKTMeEtCPObwI6gjEa7F4eSNDkKfAN503GMn1l2HAoFBdlsTvn+TB5pBT5d0oZPkD2+fxvnsq2ncBEqyO+ym5HAbVJ+JFKno5mhphsuF/Y9l0Lj++bRXZGBVJcdiGIiO8XZ+lZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769659745; c=relaxed/simple;
	bh=qEazyJX37gHz3OzHx3mLoYcnGO6EZn7nFpQJsVpAumY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LlL0HgyTTDvUsfgB1gW+XHPuqgdKvQs1Yw5KNP3yzAIOKpyxNnEDJ7xdgNTz3ebkeoXEDKMHyvBuS5vGit6RonL8Ekkf9qEVi7fUSSoTaes10tdky9zfbsG8QQX7zz17tTd+HLT212Kvhd0n/YnOBrOa4UcQoKIHe5FYMT5lKrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZrZ9cVcu; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZrZ9cVcu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769659744; x=1801195744;
  h=date:from:to:cc:subject:message-id;
  bh=qEazyJX37gHz3OzHx3mLoYcnGO6EZn7nFpQJsVpAumY=;
  b=ZrZ9cVcuVD755uuo9QwexRAa1XTmLrBNvX+oxZc5yJE03qIipVQmHnLx
   UUasDFKVXgl8cRSUcG67wX31xP3LKcHeMrIBu4SaO/3P0iRjQuli84/Kq
   1FEcTga7VtPlslscHljWHR19bh4Gen4Zrc82gAqpCS71dkyDENtp4Uiq1
   aULWAV68TxVwWMwOyVj9HpzCtpVnVHKzWnIe7rSRdl6dOcKRnrRCN6cTC
   ITk+aSVdcBISYC88Kw0ndkGPFqqiazqFr9choV8L6XGqSkw28IYa4yYMw
   pqlLJ4YaAQLUrTtNoYbk2zsGAm1Rreb/L3cb9TbG7g5RHylCiUprhQCl/
   Q==;
X-CSE-ConnectionGUID: PKG7czcOSmadY0vjDLaRkg==
X-CSE-MsgGUID: eME2KfYuSa2tnlpLAgNaFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="81616621"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="81616621"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 20:09:04 -0800
X-CSE-ConnectionGUID: U4DT4yVETNq3Rn4QGFXaWA==
X-CSE-MsgGUID: Sd6kSmL/SYGvj4bTAkrcMg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Jan 2026 20:09:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlJL2-00000000b4S-1XEl;
	Thu, 29 Jan 2026 04:09:00 +0000
Date: Thu, 29 Jan 2026 12:08:12 +0800
From: kernel test robot <lkp@intel.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ulfh-pm:debug_pm 3/6] pm_domain_oc_test.c:undefined
 reference to `__devm_auxiliary_device_create'
Message-ID: <202601291213.xloFtcAy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git debug_pm
head:   343b4c4cd555617755b4fd2772fddfc707a5b9fd
commit: 6e4d6debe879d027cf24ef477d85aaf18d57ffc4 [3/6] pmdomain: Add driver for onecell PM domain providers
config: arm-u8500_defconfig (https://download.01.org/0day-ci/archive/20260129/202601291213.xloFtcAy-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601291213.xloFtcAy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601291213.xloFtcAy-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/pmdomain/pm_domain_oc_test.o: in function `pm_domain_oc_test_probe':
>> pm_domain_oc_test.c:(.text+0x58): undefined reference to `__devm_auxiliary_device_create'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
