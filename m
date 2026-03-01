Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466B222339
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Mar 2026 00:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772323870; cv=none; b=KKPiPZ6v/N44KA5dYH8XNEBV1TtO2Cbx8yYzFOGUJAmh2QPwjBh5xNhaMmiMyGAKLLEUCgIJwGLTTsJGkqR7Fri8yU4g/KbKKiKwDfBQ1PtESHR4JGcM4CNdxdXgxqimHOjW00aqRyfz75kkO13WAWpYm6Rs0pD+FM/JyeIbFjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772323870; c=relaxed/simple;
	bh=cbg2/R1oVcjwzm4KdWINBjjxdIz99tDIJCocr9vEaUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OHmaMc6KQZxA/YDvJvpgINkZgXhzCyUF7mOe1uDEh4QeRkElmT9Vd5Rhf1C0KpPV3RIcMUaSwe4JjLIk1kseeYnaTkEJGUi0rEQ1vYm+YJvIC3YMPaF6YMCQeTCApjixgkRrWo14xTuXSR+QesVLCpQNsH8T56UC0mlgGZ8PO18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WaeIrr92; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WaeIrr92"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772323868; x=1803859868;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cbg2/R1oVcjwzm4KdWINBjjxdIz99tDIJCocr9vEaUw=;
  b=WaeIrr92CB37DVW3+ubdWeA994G3hDWZEFxmZ22UmBNaRfHxQeIxDbYx
   eJI1vXoePrUadMg28RkJGrN6d+J8FcsqAXJUHvx3Zbp2spyICGkqnF1tp
   XbknW33cnhmDoJeWo0x72yopvazxLZ8kn+yH9oTtvz1kPWLHCdaYUSDWJ
   V3z8oajcccPVJNHW/RWoo75qpCkyVJv/O83lpju5e2ibvuvCKfv8c9D14
   TK98/fMSsERyaJSkyAEnx78fYbtMLfJE3y328zY0qfugvUuxyMTbIC9Cn
   40EiG80EKpDDIWDVSg9BsupQT7hYlD2uvc9MreJTUeAY80ETfEPF6waIQ
   g==;
X-CSE-ConnectionGUID: r9XfDtNVQXel9S/2kqURMQ==
X-CSE-MsgGUID: oVmgPyVESBuEhIm/dyw0mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11715"; a="73559849"
X-IronPort-AV: E=Sophos;i="6.21,317,1763452800"; 
   d="scan'208";a="73559849"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 16:11:07 -0800
X-CSE-ConnectionGUID: qsReXaFfQcyFy3Lmlpt7JQ==
X-CSE-MsgGUID: rcZKqE0YTtOv9QKrvyR1hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,317,1763452800"; 
   d="scan'208";a="215345491"
Received: from lkp-server01.sh.intel.com (HELO 59784f1c7b2a) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Feb 2026 16:11:05 -0800
Received: from kbuild by 59784f1c7b2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwUOl-000000000Fd-0h5s;
	Sun, 01 Mar 2026 00:11:03 +0000
Date: Sun, 1 Mar 2026 08:10:35 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: ubwc: disable bank swizzling for Glymur
 platform
Message-ID: <202603010855.ObqylIRA-lkp@intel.com>
References: <20260228-fix-glymur-ubwc-v1-1-d80e3fe0dcc7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228-fix-glymur-ubwc-v1-1-d80e3fe0dcc7@oss.qualcomm.com>

Hi Dmitry,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/soc-qcom-ubwc-disable-bank-swizzling-for-Glymur-platform/20260301-040744
base:   6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
patch link:    https://lore.kernel.org/r/20260228-fix-glymur-ubwc-v1-1-d80e3fe0dcc7%40oss.qualcomm.com
patch subject: [PATCH] soc: qcom: ubwc: disable bank swizzling for Glymur platform
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260301/202603010855.ObqylIRA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260301/202603010855.ObqylIRA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603010855.ObqylIRA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/qcom/ubwc_config.c:234:26: error: expected '}' before ';' token
     234 |         .ubwc_swizzle = 0;
         |                          ^
   drivers/soc/qcom/ubwc_config.c:231:54: note: to match this '{'
     231 | static const struct qcom_ubwc_cfg_data glymur_data = {
         |                                                      ^


vim +234 drivers/soc/qcom/ubwc_config.c

   230	
   231	static const struct qcom_ubwc_cfg_data glymur_data = {
   232		.ubwc_enc_version = UBWC_5_0,
   233		.ubwc_dec_version = UBWC_5_0,
 > 234		.ubwc_swizzle = 0;
   235		.ubwc_bank_spread = true,
   236		/* TODO: highest_bank_bit = 15 for LP_DDR4 */
   237		.highest_bank_bit = 16,
   238		.macrotile_mode = true,
   239	};
   240	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
