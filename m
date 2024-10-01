Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91BC1BCA11
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 12:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727786482; cv=none; b=bO2PDQCRMn1p3EioKlJsZoWJSmPhZQ7R0UD8cIHrRP1Xh0jLc1d4lenCh/f+9bMdGvoDd4lY+e8R9/Ti0UBj1UV9ebdfgD7II+JWlnbnCrArSxhXPwZGshhBcwZyzEJ8Qqv9kJKrgzxyg3I/h3+GmYXppOcWsJyPK3Yab+7haZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727786482; c=relaxed/simple;
	bh=UscycDsAEU2tQbM/rck5J8ZDoYV4Jxuhljw6M/8ZtK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BM6EWe7PGOevhYTZoTFId9J3ZRZ117PHTEXG/jme52sibobfDd4/VIOpgxNLymK2md4SfzSUIaLmVOt8bmtX0sMMFiUSXMYUoGrlOFhgtL8gX1l+g9gFEEGmaLGv8oFtBowF6QtrnhNCQa9UdwA9o2vL4wmB7Bpe/DHz4d/0JkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NTGblXOe; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NTGblXOe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727786480; x=1759322480;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UscycDsAEU2tQbM/rck5J8ZDoYV4Jxuhljw6M/8ZtK4=;
  b=NTGblXOe3T6Dj13LB6thLpN4KD6ilpH8+aKJyoTELSlN2fIpMjUU0ucs
   yhGkZjtcGhCbS6eugA2m82KyqNEZACzp7mPPbQ2sGTI0ml40lHwNE81nJ
   13JxBGACVLg24mSBSnQo+kGbSjXTOysouWamCDctH5GMti08rY26Q4oq/
   lKJnTAaR7lMvKk/VGTpZOiz1WRuK09Ff0f2FEFWP8IEwPNWHoNzOJvMOV
   7rmvefi2St9vO7m7ZrAZwPGrgrAocUsRj2wNXjHe9KJXM+i6R/GSzhc0g
   lADRaMOkllDNwjSr20PG3Cf7+I/UOKXCr+xz1atbqzcCBW8/GfKAFqouh
   w==;
X-CSE-ConnectionGUID: MhKlrjQ0SpGeH9JDWvC64g==
X-CSE-MsgGUID: SR32UTQGQKWygwYGfK71Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27057625"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="27057625"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 05:41:19 -0700
X-CSE-ConnectionGUID: ZFxHD+7MSKya+1bTHiwJzg==
X-CSE-MsgGUID: HArVwm/zRZGYWEpTetbFtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="73904120"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 Oct 2024 05:41:15 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svcBl-000Qgn-0V;
	Tue, 01 Oct 2024 12:41:13 +0000
Date: Tue, 1 Oct 2024 20:41:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jie Zhan <zhanjie9@hisilicon.com>, viresh.kumar@linaro.org,
	rafael@kernel.org, ionela.voinescu@arm.com, beata.michalska@arm.com,
	wangxiongfeng2@huawei.com
Cc: oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxarm@huawei.com, zhanjie9@hisilicon.com,
	jonathan.cameron@huawei.com, wanghuiqiang@huawei.com,
	zhenglifeng1@huawei.com, lihuisong@huawei.com,
	yangyicong@huawei.com, liaochang1@huawei.com, zengheng4@huawei.com
Subject: Re: [PATCH v4 2/2] cppc_cpufreq: Remove HiSilicon CPPC workaround
Message-ID: <202410012047.ZH3rP9hj-lkp@intel.com>
References: <20240929033214.1039485-3-zhanjie9@hisilicon.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240929033214.1039485-3-zhanjie9@hisilicon.com>

Hi Jie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on rafael-pm/bleeding-edge linus/master v6.12-rc1 next-20241001]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jie-Zhan/cppc_cpufreq-Use-desired-perf-if-feedback-ctrs-are-0-or-unchanged/20240929-114043
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20240929033214.1039485-3-zhanjie9%40hisilicon.com
patch subject: [PATCH v4 2/2] cppc_cpufreq: Remove HiSilicon CPPC workaround
config: riscv-randconfig-r062-20241001 (https://download.01.org/0day-ci/archive/20241001/202410012047.ZH3rP9hj-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241001/202410012047.ZH3rP9hj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410012047.ZH3rP9hj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpufreq/cppc_cpufreq.c:45:3: warning: unused variable 'fie_disabled' [-Wunused-variable]
      45 | } fie_disabled = FIE_UNSET;
         |   ^~~~~~~~~~~~
   1 warning generated.


vim +/fie_disabled +45 drivers/cpufreq/cppc_cpufreq.c

a3f083e04a8766 Zheng Bin     2022-05-21  40  
ae2df912d1a557 Jeremy Linton 2022-09-12  41  static enum {
ae2df912d1a557 Jeremy Linton 2022-09-12  42  	FIE_UNSET = -1,
ae2df912d1a557 Jeremy Linton 2022-09-12  43  	FIE_ENABLED,
ae2df912d1a557 Jeremy Linton 2022-09-12  44  	FIE_DISABLED
ae2df912d1a557 Jeremy Linton 2022-09-12 @45  } fie_disabled = FIE_UNSET;
ae2df912d1a557 Jeremy Linton 2022-09-12  46  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
