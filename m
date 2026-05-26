Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E70F18B0F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 20:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779828936; cv=none; b=GHUJd9vqKtsS6FPCPGFcVQspVmQfqi/CDDBSv1UuTT5WEz+p9yfF4aBN2O9RleKrUfDE/2TVVvd9i6DhHUoQeYkoEM/9RUmdSyI64NzazQsW+fbrscfaA8z98n7dqEoLOrtkVOsYDc9q9br9e92vrX5CjlwDL7s5UzbG26vq85s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779828936; c=relaxed/simple;
	bh=YQc9Cu1uI984RwhExx6v8tO+p8KEdpAeX15bgS5RhD4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f3GlgFgZqYWTYP5/HiWogCzc9oQprasVMIzTKwMk7MesHbnOvW2A11pE0TxeXGXOd3T5vjRSGqI7qfNLc4VHbvTo+aFZDyAjQoyFKJQh3N+BNW4WDNHeYVU6PEiFjc7Uql49IdX3uAu1C0iVDj48fP2AbH2LTo7MPo64obyPJEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TbY6Qvr1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TbY6Qvr1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779828935; x=1811364935;
  h=date:from:to:cc:subject:message-id;
  bh=YQc9Cu1uI984RwhExx6v8tO+p8KEdpAeX15bgS5RhD4=;
  b=TbY6Qvr12GnF6tTyP+BZwL2k76GN7NAH+1pxIFmYGFpOtHkgRBSZvmEO
   dPUzwRQzNcYP+CSLYhyUPdJNh5RXmKuqeykwxmq/fK8DJUwT1WAkaEZhb
   dsDJcdjuiK5CYYf7YlnKr2BziqEDF+HAxuBsUfoya96zuQ8k1lYRbGLwf
   CXK6jTRHUfMKkp+W1NTVHA8D6qx2rtMupXS0rEScjuMRPJ513BUSce1Hn
   kk2DA5dqbHouzTZFYCSTVQNx5dvE1KtjO9FH21oTUsZ2YrtqhVHMrhZc1
   dY6cP+2O6HMFgd5twCsj7NYo4IPG5s902QzqwwnTWV/Yy5+xEFlzFQWgV
   Q==;
X-CSE-ConnectionGUID: Rh5kG4++QjStbE87zKgEDg==
X-CSE-MsgGUID: SWmZEG4tSUCeaimGne7Shg==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="68179871"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="68179871"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 13:55:35 -0700
X-CSE-ConnectionGUID: 4kxFY6uiTdS/N0qJ+elTtg==
X-CSE-MsgGUID: 7niRRALnT7ugho6yd9H9NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="280152042"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 May 2026 13:55:33 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRyoC-0000000032A-1ASU;
	Tue, 26 May 2026 20:55:28 +0000
Date: Wed, 27 May 2026 04:54:59 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 7381/8275] Warning:
 sound/soc/codecs/max98090.c:2353 function parameter 'data' not described in
 'max98090_set_jack'
Message-ID: <202605270411.oPtYP6rg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e7e28506af98ce4e1059e5ec59334b335c00a246
commit: e2c428c3832ef054f494bf5dcd0f740616f9bcae [7381/8275] ASoC: codecs: max98090: use component set_jack callback
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260527/202605270411.oPtYP6rg-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260527/202605270411.oPtYP6rg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605270411.oPtYP6rg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: sound/soc/codecs/max98090.c:2353 function parameter 'data' not described in 'max98090_set_jack'
>> Warning: sound/soc/codecs/max98090.c:2353 function parameter 'data' not described in 'max98090_set_jack'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
