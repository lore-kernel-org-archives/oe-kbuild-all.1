Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A4523C51D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 23:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771110543; cv=none; b=GnF/KulEuRVspwjFxFnDtb7hDtBhj0LCdzzrHRWk2zdC5hNfIysKjhcZOdsFyoKx0xw85KffEvISrmrlpKzxwm4TR+n4WpZNx3g21ZkBya/rXiLmQebtWqp6FJcmLwxxTGIy6gxB0SXdkdnNQm2BupIFxUt8GA+nquHyxFtdixc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771110543; c=relaxed/simple;
	bh=SwYX7PQvtvlDrrCxP2OTN5V47sfZ7+wAANIHq40iXxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ngB85d0xTHDMFTlXmkTkoh3lL2v5iL/iJdTDtnaXppW85KOvS8dpHhJ01hBwqBMpfoI9HS5AeoA8D0iGlJHNonSOwnJLe3mLKj5j4SSZwD6LItH8chLIwopxO6fmGGMJAs3L96IjB+WLbTqtm2R4oP89WCrGNTG2jfQzxupxxi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jhhVMamE; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jhhVMamE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771110541; x=1802646541;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SwYX7PQvtvlDrrCxP2OTN5V47sfZ7+wAANIHq40iXxg=;
  b=jhhVMamEJT2FiiR+kOZQNLKIeu/t+d1nGq0fqIcW9b37ISmjJywr8yBd
   CzCpwrH04umnTGPqsV2wvpPcitAyPCEEhs9+j6mFESObOjek5vVdM0DpT
   5W53CLoVNtRGZSs5KXaufYE5dOBAYdWNdcZ6Gp8jC9X52gXpsytZD+Y25
   ziuwTETFgWGJwQFxlD+MAHt8jQNRc/aNa6sEC3gchbP4fFt3/KGeXUyPA
   VsY/IAuS6Ka0t+TjTPZHFIkZTXdtbSUgGZ0ccFA6+kpyYTXoLHiRpynrS
   UmS0qMc1Wu4ksSJIN8aW8PVYLswIFS6yl7Q5vjnQwV3taxSNcvkzO88Pw
   w==;
X-CSE-ConnectionGUID: pIS1VToET1qUb4hcH3dYHA==
X-CSE-MsgGUID: aMWz+KIhRI66rFsq2fIO3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="74851990"
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="74851990"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 15:09:00 -0800
X-CSE-ConnectionGUID: 8fVLUyO7TLyDNPTcEOSluw==
X-CSE-MsgGUID: Cf0+6/DLQAmqmtmBD8K9dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="250913204"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Feb 2026 15:08:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrOkx-00000000x4K-0iTr;
	Sat, 14 Feb 2026 23:08:55 +0000
Date: Sun, 15 Feb 2026 07:08:28 +0800
From: kernel test robot <lkp@intel.com>
To: Anand Moon <linux.amoon@gmail.com>,
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH v8 7/9] thermal/drivers/exynos: Relocate
 exynos_sensor_ops for forward declatition
Message-ID: <202602150700.2ND4y6Yp-lkp@intel.com>
References: <20260214181930.238981-8-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260214181930.238981-8-linux.amoon@gmail.com>

Hi Anand,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 770aaedb461a055f79b971d538678942b6607894]

url:    https://github.com/intel-lab-lkp/linux/commits/Anand-Moon/thermal-drivers-exynos-Refactor-clk_sec-initialization-inside-SOC-specific-case/20260215-022316
base:   770aaedb461a055f79b971d538678942b6607894
patch link:    https://lore.kernel.org/r/20260214181930.238981-8-linux.amoon%40gmail.com
patch subject: [PATCH v8 7/9] thermal/drivers/exynos: Relocate exynos_sensor_ops for forward declatition
config: sparc-randconfig-001-20260215 (https://download.01.org/0day-ci/archive/20260215/202602150700.2ND4y6Yp-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260215/202602150700.2ND4y6Yp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602150700.2ND4y6Yp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/thermal/samsung/exynos_tmu.c:164 struct member 'tzd' not described in 'exynos_tmu_data'
>> Warning: drivers/thermal/samsung/exynos_tmu.c:164 struct member 'tzd' not described in 'exynos_tmu_data'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
