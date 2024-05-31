Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28509C8E9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 May 2024 01:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717118542; cv=none; b=jXV7Up1prZU6WmQ6XNXpea6ZhOefikvc62MyfuCZz5WaAme8upuJQyI+sca3JeODxF//nc165kXe4qCaKFGVVu5S0eQIXkr+TC4N+TUhWXsojf28iMfbiQGo/Iyodx5TF0j+2bhB/2q7Qe0DD7f0a8bC6VidDIV2MXpidZaNNik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717118542; c=relaxed/simple;
	bh=t7mcpL9wJU6meE+UoG9k9HAWtkHILajD3sSqYI9gQt8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RL4EStBiSR7fAbz/YOq+qovghGC/8ysOTCqFB1MKRSKrDspGWlqis0y1SDSsNduKPA0BOxh+CtCuVPCQXG+bW0N1Q+ZJflJJvsVBwRyS7rp8mkklY9VmNHM3DHvpKy0CR+wlnNXdSJ9RAzS/fd/xzjcHdkVutYQw22ik0kreCyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CPW03c/g; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CPW03c/g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717118540; x=1748654540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t7mcpL9wJU6meE+UoG9k9HAWtkHILajD3sSqYI9gQt8=;
  b=CPW03c/gf/NYWSoNmSO3uz5TqNjhkck34hcCLmT5jAOL14VPbK/KFRNS
   xj6+0wHQU1if/iODmsh49YIkIaBHlfBTruKRyaVtokwt0Leu/ckMqKAxA
   o9RhiEf3fgyD8rAeLoI4K4OWoycj8v2ivstVizui9eynRLfVZlUcDMUI9
   0FaeKqkN+rVwotFHiva5THWuqrNTra48zI2LX+XfAgi7GLXZc0vagGTE0
   P7VScbhXEdaLSHe3BjcYv05PVlNsGMMmsBcmEEl6U3IFvbH6Pi+1Hz41a
   CJbMY7+L+iTrcmQWFsDFzvl634EtFpmOJtx+HZc3OhKwx9b4s/5Hff92w
   g==;
X-CSE-ConnectionGUID: fQ0Pfw6+Rbi2VbibfK7qrQ==
X-CSE-MsgGUID: +b5t2usBTEuoHaxRcGNrew==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13771273"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="13771273"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 18:22:19 -0700
X-CSE-ConnectionGUID: +7OVKxlzRuK4RC9JPCjfhw==
X-CSE-MsgGUID: RcmCEqGTQFOLoXBHMtruhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="41069748"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 30 May 2024 18:22:19 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCqyG-000GL7-0Z;
	Fri, 31 May 2024 01:22:16 +0000
Date: Fri, 31 May 2024 09:21:41 +0800
From: kernel test robot <lkp@intel.com>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bjorn Andersson <andersson@kernel.org>
Subject: [linux-next:master 1810/2527]
 drivers/clk/qcom/camcc-sm7150.c:1900:15: sparse: sparse: symbol
 'camcc_sm7150_hws' was not declared. Should it be static?
Message-ID: <202405310927.8DwxnKbA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9d99040b1bc8dbf385a8aa535e9efcdf94466e19
commit: 9f0532da42261476561c0a683097f6de82e7c3ed [1810/2527] clk: qcom: Add Camera Clock Controller driver for SM7150
config: microblaze-randconfig-r113-20240531 (https://download.01.org/0day-ci/archive/20240531/202405310927.8DwxnKbA-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240531/202405310927.8DwxnKbA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405310927.8DwxnKbA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/qcom/camcc-sm7150.c:1900:15: sparse: sparse: symbol 'camcc_sm7150_hws' was not declared. Should it be static?

vim +/camcc_sm7150_hws +1900 drivers/clk/qcom/camcc-sm7150.c

  1899	
> 1900	struct clk_hw *camcc_sm7150_hws[] = {
  1901		[CAMCC_PLL0_OUT_EVEN] = &camcc_pll0_out_even.hw,
  1902		[CAMCC_PLL0_OUT_ODD] = &camcc_pll0_out_odd.hw,
  1903		[CAMCC_PLL1_OUT_EVEN] = &camcc_pll1_out_even.hw,
  1904		[CAMCC_PLL2_OUT_EARLY] = &camcc_pll2_out_early.hw,
  1905		[CAMCC_PLL3_OUT_EVEN] = &camcc_pll3_out_even.hw,
  1906		[CAMCC_PLL4_OUT_EVEN] = &camcc_pll4_out_even.hw,
  1907	};
  1908	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
