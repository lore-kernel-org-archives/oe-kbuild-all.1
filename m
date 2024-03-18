Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5287C1F959
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Mar 2024 22:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710801079; cv=none; b=kcEuR1Cq4X+wH9v8TxdLDgHwPq9qpaRAWknJvN6WK9TmBE5yWuG1Fc068DeVXq9lHaMO90b7kTKKGyNeyqWBflRq21Ls6RUakuilfUwuOJb3zxeUM/z+e+4o5nk8TpDKpygP1tQW6R+xDRsn9HJgdXYKR7al4m8AL91C2W8KORA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710801079; c=relaxed/simple;
	bh=2SVi5hRpg39sSw4U0/uJ796WPFlL+eVsjOaZTO4WUWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N2X/PGgiSJMoCNy2WvXzutLOY0VlqEktnKjQIlOUz/0MJGfjoFl6FTeVgugVfWNuTqTNiFX2QumaHdl8JnbOfeIuhJpCXEEk+GZtG0DnhO/UtNX92BhkD1I/WYez/8wCfPP7SLoXmd42MIje+PnegxSdPw5WtGbDbxJDvM3QbXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RLIhpUhD; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RLIhpUhD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710801077; x=1742337077;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2SVi5hRpg39sSw4U0/uJ796WPFlL+eVsjOaZTO4WUWc=;
  b=RLIhpUhDsLR1bsnZwvpiPBIcsECtovx4SR7hwuHFF0wNWJI9Vt71GUll
   mqUnXB1j1WWZ8JK9uHRXr+TxwV8x1/JUll3lRZ9BM8KjorgzLD9prcs/F
   brAu84zf9SaMfi3Ng5UV3bnXLFtLl2PahzjhlceCtV6ky3E680CMQfxCk
   OhfUi9xz0BbRiwEE97LqQ1mDQnUMHH6ETAk/s82U/zxHH8Xwbn1z0LjRd
   74cLbcwe1EcBaryi5tuLhjzk4NwdTyr7SjeNDUfpwzTO3ytxc3V/LwNKR
   SNX4QMYPklJTrJSjUOKLOU30iIpJG9jVOe0xF5+n75MEbwaDZkSsVqMFf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="8586842"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="8586842"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 15:31:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="13987550"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Mar 2024 15:31:16 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmLVh-000HHP-0H;
	Mon, 18 Mar 2024 22:31:13 +0000
Date: Tue, 19 Mar 2024 06:30:57 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas Tanure <tanure@linux.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC][PATCH 1/2] clk: meson: T7: add support for Amlogic T7 SoC
 PLL clock driver
Message-ID: <202403190649.jVhVktRI-lkp@intel.com>
References: <20240318114346.112935-2-tanure@linux.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240318114346.112935-2-tanure@linux.com>

Hi Lucas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on robh/for-next krzk/for-next krzk-dt/for-next linus/master v6.8 next-20240318]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lucas-Tanure/clk-meson-T7-add-support-for-Amlogic-T7-SoC-PLL-clock-driver/20240318-194707
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20240318114346.112935-2-tanure%40linux.com
patch subject: [RFC][PATCH 1/2] clk: meson: T7: add support for Amlogic T7 SoC PLL clock driver
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240319/202403190649.jVhVktRI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240319/202403190649.jVhVktRI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403190649.jVhVktRI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/meson/t7-pll.c:87:29: warning: 'meson_pll_clk_no_ops' defined but not used [-Wunused-const-variable=]
      87 | static const struct clk_ops meson_pll_clk_no_ops = {};
         |                             ^~~~~~~~~~~~~~~~~~~~


vim +/meson_pll_clk_no_ops +87 drivers/clk/meson/t7-pll.c

    86	
  > 87	static const struct clk_ops meson_pll_clk_no_ops = {};
    88	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
