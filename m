Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550523FB87
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Apr 2024 14:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711981292; cv=none; b=GVTiNCPzaWsNIASaSEcImfMqQ5yPmy5o+69nzslGCuXz20XjrC9jvcgnVksigS4PztCYXIcIa+skb/ZW4UPIhoqsQNmu9jDLkSe/Uqx2iQ1QWj/w05tgBcDAFuF3fBkiGRtxajHyooQ9qpRa6wNmVhExKG1FI+hAiHUgNTfI8Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711981292; c=relaxed/simple;
	bh=Y3iC7Guigto6APqj928YbEg9ZXITRZybElLdcaLuYJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sm0WuTjrzc0M12rtLJ0y+/khJAQPLis8dPhfS1T4ly8UNnjy2PRMmXX0mPsz5W1QFr4+vYdRZOAGG5PrvwEm5pGzrT7EgbTxQOlBnaYkqc5+OLdHE8rlo5NDY0NTToEv15VHMscOezoeSHAWFYoUe4LxLwASfADsREh59F9l77E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e2QdMJhU; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e2QdMJhU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711981290; x=1743517290;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y3iC7Guigto6APqj928YbEg9ZXITRZybElLdcaLuYJ8=;
  b=e2QdMJhUQMK1D0UvQRrtqEQYhOh2bonwIHzGSFx8dRnuUvqoUDfcDXmp
   aw07LT77d1OhsdmwtdVXoajeDdm/bShGqtL3AT28zwtCOOckYYwzz2L7f
   KgmEHQHE/lBJpNICWNssKJM5DkWnl52d5hV4EJ09ksgPCoiCUkiF/lwWP
   4LAzexKkklH/kNc7ePBNOlKipPI3bB2QVhMX+1mAU4XdgnOZB0L3xBn8r
   A/HxeuF7YeA9TAPBNBnZxQEaHPhxgY5PYDNbunZVabHa/UlFseHeCmD/5
   8zNtHYToGDFpWqMWgNncERZsDcR7dNA8q+kLkYI0BXaC/DBECTJ9lat3F
   Q==;
X-CSE-ConnectionGUID: KZwH8blPRqO0mDR+ywmOOQ==
X-CSE-MsgGUID: LPJtQeYhSc+RW/T/PRcLZw==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="10066636"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="10066636"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 07:21:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="48718554"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 01 Apr 2024 07:21:25 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrIXK-0000ML-1t;
	Mon, 01 Apr 2024 14:21:22 +0000
Date: Mon, 1 Apr 2024 22:20:58 +0800
From: kernel test robot <lkp@intel.com>
To: Varadarajan Narayanan <quic_varada@quicinc.com>, andersson@kernel.org,
	konrad.dybcio@linaro.org, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, djakov@kernel.org, dmitry.baryshkov@linaro.org,
	quic_anusha@quicinc.com, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 4/5] clk: qcom: ipq9574: Use icc-clk for enabling NoC
 related clocks
Message-ID: <202404012258.MFriF5BV-lkp@intel.com>
References: <20240328075936.223461-5-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328075936.223461-5-quic_varada@quicinc.com>

Hi Varadarajan,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on robh/for-next linus/master v6.9-rc2 next-20240328]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Varadarajan-Narayanan/dt-bindings-interconnect-Add-Qualcomm-IPQ9574-support/20240328-160522
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20240328075936.223461-5-quic_varada%40quicinc.com
patch subject: [PATCH v5 4/5] clk: qcom: ipq9574: Use icc-clk for enabling NoC related clocks
config: powerpc64-randconfig-r132-20240331 (https://download.01.org/0day-ci/archive/20240401/202404012258.MFriF5BV-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240401/202404012258.MFriF5BV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404012258.MFriF5BV-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: drivers/clk/qcom/common.o: in function `qcom_cc_really_probe':
>> common.c:(.text+0x980): undefined reference to `devm_icc_clk_register'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
