Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C83A156872
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 12:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728044902; cv=none; b=h35bLZ/OHqtEpKv3dfP6kPr2iKbcPd5vRDyFvI7G2qpXts7Rf2vV7PjB6hHzURs1hYXUlyzk9YMpAobz3ijVKEJ6hptQCuequc5rtP/NsLKVEsx8hg4v3m8bdH4ZKtIt5O9yt0f9FpLCI7WdJIN59+RFVz755iUNVvaugHgHGG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728044902; c=relaxed/simple;
	bh=zTRwmlpkL7vPsawnn0O4su4CFSIhAvyKb6kClpbyqos=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hdahHOWVE0ltKRhD42FtXRJpXiRAjdou6KCPRUmBZBNVUkXX4YvQdHOz1TTcKXcy35t39g8248o8LQprN9wPvl6Uu5+I4BgxgJjLelzI3ZDyvEk6qIL1fJNumyv9vSNdkgQQAhy45JfBpXZ26tuErSMvXQpgf81mnDJX0wPleyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kz9Tf6F4; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kz9Tf6F4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728044900; x=1759580900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zTRwmlpkL7vPsawnn0O4su4CFSIhAvyKb6kClpbyqos=;
  b=Kz9Tf6F4iGFCjwXT4181Hrhm9mHY6igGHCFHaQKHaSpJjpvJA+KCNJZz
   yhDgi4gd6tshZ2mpBoPIWhj806SILjiOA2iw6hmVEVhcroltVGTH6Y8xz
   69SyHhgHKAiJLuTD4aFCwqr6jl1TLGXL9g4CfoJLfPc8y0qcKFbXNN8BK
   syecH3PhVfOVRrL3zhqVLDfxrmkTBMh2gSA4BKWnjWVjUVUyfCs0qlqij
   H2JfXkppkaS6rjxh9p3NQr2SRwbds69okwp7f400Lvlu/YCYimVYZBr2T
   qnnESHXHGK4RpGei5vKqcSHoZLcpnHOjo3L1Hv/F67dYacYmTfmYXf16a
   A==;
X-CSE-ConnectionGUID: IQZ/W6YkRyqOqJcgOSN6/g==
X-CSE-MsgGUID: Piy9jpfATuK9FPUynighRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="30141232"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="30141232"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 05:28:19 -0700
X-CSE-ConnectionGUID: X2qFxdexSnGVUpsqLrYaTw==
X-CSE-MsgGUID: R+xSGLjDSE23s6s2ka2jXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="79659633"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Oct 2024 05:28:16 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swhPp-0001b6-2r;
	Fri, 04 Oct 2024 12:28:13 +0000
Date: Fri, 4 Oct 2024 20:28:08 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 2204/2444]
 drivers/pwm/pwm-phytium.c:182:13: warning: variable 'reg' set but not used
Message-ID: <202410042053.65X6pQX2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   aabcc6dc6d7f9e12baf1f117341469c84afd545d
commit: 620db3bc2413530c9eaa8c3c30efbcf64b84c207 [2204/2444] Add PWM supprt on Phytium SoCs
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241004/202410042053.65X6pQX2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410042053.65X6pQX2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410042053.65X6pQX2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pwm/pwm-phytium.c: In function 'pwm_phytium_set_periodns':
>> drivers/pwm/pwm-phytium.c:182:13: warning: variable 'reg' set but not used [-Wunused-but-set-variable]
     182 |         u32 reg;
         |             ^~~
   drivers/pwm/pwm-phytium.c: In function 'pwm_phytium_set_duty':
   drivers/pwm/pwm-phytium.c:200:13: warning: variable 'reg' set but not used [-Wunused-but-set-variable]
     200 |         u32 reg;
         |             ^~~


vim +/reg +182 drivers/pwm/pwm-phytium.c

   178	
   179	static void pwm_phytium_set_periodns(struct pwm_chip *chip, unsigned int periodns, int n)
   180	{
   181		struct phytium_pwm_chip *our_chip = to_phytium_pwm_chip(chip);
 > 182		u32 reg;
   183		int div = our_chip->state.div;
   184		u64 cycles;
   185	
   186		cycles = clk_get_rate(our_chip->base_clk);
   187		cycles *= (periodns / (div + 1));
   188		do_div(cycles, NSEC_PER_SEC);
   189	
   190		reg = readl(our_chip->base + PWM_N(n) + REG_TPERIOD);
   191		cycles = (cycles & PWM_PERIOD_MASK) - 0x1;
   192		our_chip->state_pm[n].period = cycles;
   193	
   194		writel(cycles, our_chip->base + PWM_N(n) + REG_TPERIOD);
   195	}
   196	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
