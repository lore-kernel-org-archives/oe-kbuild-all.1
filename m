Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B5A49641
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 13:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754572587; cv=none; b=V88NVuaF4eLDBIrwfvM/kd1ub9tN1NRjqmKO2YJ6LXXMmWsdsaCQvF7qgflierVZpWCQSU1U15Q76YHEiwx7mLus2Sghw/+QgPcX1G0Uy0K0NF0bmCkfFTFYFVWAzr5d+UflVKOYFl07AzXxxB/SsgMCFQUYACwn+0tCbTAsOkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754572587; c=relaxed/simple;
	bh=wx2+C1lh/GLZ6cFGI+qyVK3a7eqvin9KAsq7oUE9Ct8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K/+exZEG4+nwxemfJ26h28Oj/EnSbk9dY7w6v55kgAx6q7x+F39Aa1G6vKb24pXtxeg2OV1/lQoIlBoBXFJVqBn/fbwmxaJgqrAQiMeA6BAShU1AcM6WwaNcfqIGF88omyyBJ3zK2+ZCILm4gxwQErrCWus3FpbJq1EvRlpyHnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c2EaGxAl; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c2EaGxAl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754572585; x=1786108585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wx2+C1lh/GLZ6cFGI+qyVK3a7eqvin9KAsq7oUE9Ct8=;
  b=c2EaGxAlf6ZubbgDtyDMvpkHB1qwX0BMa/ecEZ/PoC+pAa+dyYWM7Kin
   7mGr9axGRr4tR0ImwHmQhjeTWzYiSw5aPdhzgVEkC/6XoE7eoowIF1BQn
   5uroZet1MAV7BgOMKtBg+qGX9vmHWZJPeQaI5r7rcA7X8IrXdaGcpZZHz
   zTJxOeRmNWv3l1AZAI+U6WNhHZ6aT727utVPVHg6vTCfS8F0qPvybALw1
   FZu/M4WDPPHun7pJBqyRbin0sijmj9iZbbFP0Cvd5GfcQg1wcjKjhRXh8
   AFtspD+a/Nb1UcroHwbnh1FjnWOkK0nl1/lMDPnHzXS7rEw/tuOzJYIvF
   g==;
X-CSE-ConnectionGUID: m9AvE3VrS7Gb/TdzmcT9Ow==
X-CSE-MsgGUID: IuL61cpORymgX6fwoF0peg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56619974"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56619974"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 06:16:25 -0700
X-CSE-ConnectionGUID: LsiBIG5+QTul1jTRI+H1Bg==
X-CSE-MsgGUID: q1261T5NT5ugAMs7zYt2RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="169182461"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 07 Aug 2025 06:16:24 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk0Tl-0002ok-30;
	Thu, 07 Aug 2025 13:16:21 +0000
Date: Thu, 7 Aug 2025 21:15:59 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 61/61] kismet: WARNING: unmet direct
 dependencies detected for PHY_DW_DPHY when selected by
 VERISILICON_DW_MIPI_DSI
Message-ID: <202508072131.HKhOJ5Dl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   613d77dfd48aefb35495f9e9425ad216f55f1439
commit: 500e70f6113ba8e3d77cbe6c36fb5a5d546e0557 [61/61] anolis: riscv: gpu/drm: add T-HEAD Light support
config: x86_64-kismet-CONFIG_PHY_DW_DPHY-CONFIG_VERISILICON_DW_MIPI_DSI-0-0 (https://download.01.org/0day-ci/archive/20250807/202508072131.HKhOJ5Dl-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250807/202508072131.HKhOJ5Dl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508072131.HKhOJ5Dl-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PHY_DW_DPHY when selected by VERISILICON_DW_MIPI_DSI
   WARNING: unmet direct dependencies detected for PHY_DW_DPHY
     Depends on [n]: HAS_IOMEM [=y] && OF [=n]
     Selected by [y]:
     - VERISILICON_DW_MIPI_DSI [=y] && HAS_IOMEM [=y] && DRM_VERISILICON [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
