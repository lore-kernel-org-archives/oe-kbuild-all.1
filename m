Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F892AE8D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jan 2026 16:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769271505; cv=none; b=Pn+oVLAsnI4TR/HtG+EC4syIaeSUOERqYWdaLyQWlYtmH2qW6g+JhpGuZFa4vthhMZtZ3vBbEvs0QcbQSykx/4AwFeNB95iQgIsthlQDSV1DA7Gv1XLfvozCbT2IGxdJhg6fz2N8YM0Wg8QrN+SYc3ZCoZHhc8DyPYg+xRy5g7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769271505; c=relaxed/simple;
	bh=8Nmwr8sH3rGeGT/1bqOHTCpN9zRDVKd6PxHYSAe/vkU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lIDiBdeOQOrMBHI7hel6i8jxcDYyOfQ2jzFt5zBSfkFP39iIjZc/vWczMzsq44hMAeewLufXwNZtt9eiqEUfZG7krGc6+V6I5VsI/xedHFcrskStZMmziVWHrq7RZceOD0BRoxDdHT/FrsEzc9AlWQ23D++WcYOaXLW2qurD454=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GIeWZnYh; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GIeWZnYh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769271503; x=1800807503;
  h=date:from:to:cc:subject:message-id;
  bh=8Nmwr8sH3rGeGT/1bqOHTCpN9zRDVKd6PxHYSAe/vkU=;
  b=GIeWZnYhBlwhoGPPboR5+kro+2pwTGDhfv7jntjfC0c3g8Hwc1vKTaCr
   bLT6ZBXHEwWMfiJQi+wStFBm6OIoWgg7q8x6f4gl+J2RdWgH8tclPz1nj
   yfvDvp8FbMB/6SJTry8NZ0wS1c/35C3G8Z04gnVQNoMMcxgIdRXBHdKET
   ouTkH1o5rl/wuYsIJF+9yZu8YBjP7SBvziEvYECc61IYdYGjS6OCZsgzb
   pCch3B1UT8rRCv6qEjxwrAdGPaEmfPwYH5MtikFqxgamNIQqEaadw1H3n
   A6LPJFIeBundqiDKxcL6vDjboXqJWDOzOH+ktFrgyTq0jdW23ae5hkDcG
   Q==;
X-CSE-ConnectionGUID: mgtSTlQuRhmTrzmpbLvJ1w==
X-CSE-MsgGUID: 98s19p3wR7eA1BqsP51E1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="81863841"
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="81863841"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 08:18:22 -0800
X-CSE-ConnectionGUID: 0PKSLjfwR7e7QKS3Ek7Wbw==
X-CSE-MsgGUID: ffC0GWUMQl6oJYZKi4ZgeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="207706757"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Jan 2026 08:18:21 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjgL4-00000000VKI-2sBY;
	Sat, 24 Jan 2026 16:18:18 +0000
Date: Sun, 25 Jan 2026 00:18:17 +0800
From: kernel test robot <lkp@intel.com>
To: Oder Chiou <oder_chiou@realtek.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 2982/9539] rt5575.c:undefined reference
 to `rt5575_spi_get_device'
Message-ID: <202601250010.EUnVkmCH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
commit: 420739112e95c9bb286b4e87875706925970abd3 [2982/9539] ASoC: rt5575: Add the codec driver for the ALC5575
config: sparc64-randconfig-r132-20260124 (https://download.01.org/0day-ci/archive/20260125/202601250010.EUnVkmCH-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601250010.EUnVkmCH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601250010.EUnVkmCH-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: sound/soc/codecs/rt5575.o: in function `rt5575_fw_load_by_spi':
>> rt5575.c:(.text+0x254): undefined reference to `rt5575_spi_get_device'
>> sparc64-linux-ld: rt5575.c:(.text+0x2c0): undefined reference to `rt5575_spi_fw_load'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
