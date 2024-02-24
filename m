Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB12A2374B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 12:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708779252; cv=none; b=ZiWlDpJjC14+DwKpImnEBPoBacVVbgbncQ/neQRiG4dNHNM6AdBPTgEl7p/HtyqIobgS16aqJJHvmKklw+cQovr18FtM8FN45jFW1zDMzzW2YjpuWUs8g+Nw4sFjLwvLUJf7u2jnqOf03SOe9UmF/DkKwRaLQVBS3L9RaXvRUl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708779252; c=relaxed/simple;
	bh=/MGewwL7JRVAIlyrQdZqly7lGf7g9eU1Rhg1GM49+ZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HgicNQyF4hcAkk2cJa8W5MCdzMtHHdakYx09r1CUfpiBJtTjcmaFZMnXMpkbyOQATydU8UlaIJ/4qfgBNEens+PH5hnnjJurbYbZ2xJz4Ky8TAbRZpBOsG08wUYacGg2tWq7c6Vf73Xpz/PGjrXoOWkV+hjs+FYH5y5oBvoCEq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZfI0EnM5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZfI0EnM5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708779250; x=1740315250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/MGewwL7JRVAIlyrQdZqly7lGf7g9eU1Rhg1GM49+ZI=;
  b=ZfI0EnM5/usOkVXxWEyMcxPit2KozVj36jXsO6YIPkchbMYpzgVHDoxI
   MFM8TiN+uGTiP29qLLbPgCOYYUW1zxUb2qAdPjuAdMn9BAKC5zrFQWWWd
   iJHOkaKhZemMB01bVrizRB7VUrywbDs4eYPqdn0rS/OR/mCKWjWCwwDkV
   fSFFwF+YCZyZQ4Tcxqk07l7Q+oqqR+oiNej98eQNzFnUGF+jB9yMV9AEz
   0YXOxsMUnujtO4P6IscJQtQTUYzCtBlYcDluuLVuRHiGZo9OqIwLA48Fr
   RsCGFmpYzmpKc6iERxjYI8FVuDpkTFz/EpVmTfdJRF+ok4ZWszUmUKUlN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="20550350"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="20550350"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 04:54:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="37190254"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 24 Feb 2024 04:54:07 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdrXL-0008Wm-15;
	Sat, 24 Feb 2024 12:54:02 +0000
Date: Sat, 24 Feb 2024 20:53:21 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.phytium 38/41]
 drivers/pwm/pwm-phytium.c:182:13: warning: variable 'reg' set but not used
Message-ID: <202402242057.8bRWI3iA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.phytium
head:   974a90e098c75ef0e62d4bbbde4535368a61f98b
commit: b12112fafd081884ccd1c123360335d6cdad284c [38/41] Add PWM supprt on Phytium SoCs
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240224/202402242057.8bRWI3iA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402242057.8bRWI3iA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402242057.8bRWI3iA-lkp@intel.com/

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
