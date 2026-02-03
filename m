Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632A5395DA3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Feb 2026 09:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770111543; cv=none; b=gMj9hN/H5EcrBka6E/PioVkHHzTiK+1BkmMjWXokZEfmcpri0ll00U8qjvv/9Uyq3sdtKYSCTMmhs84EA8QypAiVzn/C/j7/1LWqK0up8ukyDEvMo8/59VbdmnUFEdZJybE/212XOfQordpnwCD/60T4Zuwgm4alB7E0roSTzpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770111543; c=relaxed/simple;
	bh=JETUDfXJWpuasD5RC30mNqsS19vq93d+UKPHZ9O+kfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CCxDQcV8l767ozOVcLDQSjbfMU/a/2ZKQFz6uNUZnVdyITK9in0D4I5yczlmuTVx1wRwYEhvnKru+oWwHQjwjTiy9wQwY7GGrwHo+A3SrKyKWf3ui9V7lKjoHRymiVInyz6atFeOULNsqpxZaznzcZEQ794DRHLOgkVYV3NTPfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eNcv693e; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eNcv693e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770111542; x=1801647542;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JETUDfXJWpuasD5RC30mNqsS19vq93d+UKPHZ9O+kfY=;
  b=eNcv693efjMsn//Fe6y3mFZnVrESOFLx2lQ2c9VIMN/rgslfNk6E6JYC
   Z94h9OhLsC0cZk7BKlIYVhDKCGR0ADqHcyXmWMBeai2gEn0NT4BKFakfR
   8mgODf8o6WlGrk4PndoovvURL6eZwBNWRQob6WOKNHZLB6S8Mqvg2tl69
   sbglEr6mwycFddq2xxi3VSUtTrzx2Lr7m2ViQN9e+Dg6SVjeQ7DVurh2M
   3K1Q3tR6athDWFz8HEBwfrQ/VybTKNhtJlRkEgU4ayEIuGC/3zlCQqMyQ
   B6cW2hZDRoxrkjZHZVzbc/KYJsrjSwgl0nIQYPEx+356UAwNdy62Io9HC
   A==;
X-CSE-ConnectionGUID: fFd3iqixSUmRCgiomPXSrA==
X-CSE-MsgGUID: BsqBWqjFTFKvG6AuSOCRgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="75132246"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="75132246"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 01:39:01 -0800
X-CSE-ConnectionGUID: qUM240VDS9e7bDs8vuRRaQ==
X-CSE-MsgGUID: zQGNZEhWTx+NKuXecJbkTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="209918788"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Feb 2026 01:39:00 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnCs4-00000000gVE-0yVe;
	Tue, 03 Feb 2026 09:38:56 +0000
Date: Tue, 3 Feb 2026 17:38:48 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 3/8] pinctrl: qcom: Allow exposing reference clocks
 living in TLMM reg space
Message-ID: <202602031722.geKxk6lP-lkp@intel.com>
References: <20260202-topic-8750_tcsr-v1-3-cd7e6648c64f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-topic-8750_tcsr-v1-3-cd7e6648c64f@oss.qualcomm.com>

Hi Konrad,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 4c87cdd0328495759f6e9f9f4e1e53ef8032a76f]

url:    https://github.com/intel-lab-lkp/linux/commits/Konrad-Dybcio/dt-bindings-Move-qcom-sm8750-tcsr-from-clock-tcsr-to-mfd-tcsr/20260202-231030
base:   4c87cdd0328495759f6e9f9f4e1e53ef8032a76f
patch link:    https://lore.kernel.org/r/20260202-topic-8750_tcsr-v1-3-cd7e6648c64f%40oss.qualcomm.com
patch subject: [PATCH RFC 3/8] pinctrl: qcom: Allow exposing reference clocks living in TLMM reg space
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260203/202602031722.geKxk6lP-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602031722.geKxk6lP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602031722.geKxk6lP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pinctrl/qcom/pinctrl-msm.c:85 struct member 'ref_clks' not described in 'msm_pinctrl'
>> Warning: drivers/pinctrl/qcom/pinctrl-msm.c:85 struct member 'ref_clks' not described in 'msm_pinctrl'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
