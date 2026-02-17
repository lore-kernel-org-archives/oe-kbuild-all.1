Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225A71A3154
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 02:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771294271; cv=none; b=AOwwEcdEDhxtktUGwW7QK0DW8VTxg0CT6fCo2r++x507spjiVawtuuyIwEBkBpmj3WcdT+ypPoB468upV2a+fbfyXdocQqUOTdp4ZdwrW3+f6yDA6kWQlFo3CpYmJJU1FXxombeJSenCw8C/iHTDcS4Ma1EadFr2tsGOfCRc/+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771294271; c=relaxed/simple;
	bh=0qymbNElgib6r1FznhZrtBtEs7BBV4CRV8trvFO2AVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kmad7vw/5EaJJ5fYiA9jG7KrE7/zCW6TauRvRbiFIVVrh/AtGUWMnAj77bFKih2Zc/CKm+C9J03OZIu90T3HneobjQ/1WKwMyfu+WzhLSwaNA/a/vge8vFe7ytx/cSip23qNM8CVyTcmRVla0wBeJh4VIEEnqJI8R/rXJYKkaQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=irUTmhPN; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="irUTmhPN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771294270; x=1802830270;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0qymbNElgib6r1FznhZrtBtEs7BBV4CRV8trvFO2AVo=;
  b=irUTmhPNO9qEU272azGm4TsNP8u3QDBYG8XZzbqcWyZ7i2Ae9X/Tut3S
   PYSzJoxNzwfTOakk88A5K32qPaJN9AFZJvtCfvZ43GcSb40X1pEd/bRDE
   L8XweOutRygf42Z7AK/vf6h/S3cTeflljtejhAJw/iAKGKz/1V+wJjMLE
   qY0WLCuXxs97hBwByOP2LEdwXsnXrFaweadaj+jDqD7TBh2/cXezGsohV
   rSYnoJfD7IQuLLo/6xXgZL1dc1I1RVUdU3/MEV+YE1le8olDc6saUTvAD
   D3wmXZa/En+zr7pOGGh3C2wNoXmWrdz+hzK7r0kOP3RaSgSKx7n/gP828
   g==;
X-CSE-ConnectionGUID: PmMJVpNbSZGELcNCwZhDFg==
X-CSE-MsgGUID: dNcwEcQ1RHaTBqooaBF9zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="71563058"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="71563058"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 18:11:09 -0800
X-CSE-ConnectionGUID: rPAGHqP/QWucPPRrEkZIKw==
X-CSE-MsgGUID: QFF6m9X/RK2X2EkSyTn2FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="213762143"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Feb 2026 18:11:06 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsAYI-000000010WG-43j6;
	Tue, 17 Feb 2026 02:11:02 +0000
Date: Tue, 17 Feb 2026 10:10:16 +0800
From: kernel test robot <lkp@intel.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v3 6/6] clk: qcom: Add TCSR clock driver for Eliza
Message-ID: <202602171020.eP0Y69zD-lkp@intel.com>
References: <20260216-eliza-clocks-v3-6-8afc5a7e3a98@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216-eliza-clocks-v3-6-8afc5a7e3a98@oss.qualcomm.com>

Hi Abel,

kernel test robot noticed the following build errors:

[auto build test ERROR on 635c467cc14ebdffab3f77610217c1dacaf88e8c]

url:    https://github.com/intel-lab-lkp/linux/commits/Abel-Vesa/dt-bindings-clock-qcom-document-the-Eliza-Global-Clock-Controller/20260216-215148
base:   635c467cc14ebdffab3f77610217c1dacaf88e8c
patch link:    https://lore.kernel.org/r/20260216-eliza-clocks-v3-6-8afc5a7e3a98%40oss.qualcomm.com
patch subject: [PATCH v3 6/6] clk: qcom: Add TCSR clock driver for Eliza
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260217/202602171020.eP0Y69zD-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171020.eP0Y69zD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171020.eP0Y69zD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/qcom/tcsrcc-eliza.c:126:10: error: 'TCSR_HDMI_CLKREF_EN' undeclared here (not in a function); did you mean 'TCSR_UFS_CLKREF_EN'?
     126 |         [TCSR_HDMI_CLKREF_EN] = &tcsr_hdmi_clkref_en.clkr,
         |          ^~~~~~~~~~~~~~~~~~~
         |          TCSR_UFS_CLKREF_EN
>> drivers/clk/qcom/tcsrcc-eliza.c:126:10: error: array index in initializer not of integer type
   drivers/clk/qcom/tcsrcc-eliza.c:126:10: note: (near initialization for 'tcsr_cc_eliza_clocks')
   drivers/clk/qcom/tcsrcc-eliza.c:127:35: warning: initialized field overwritten [-Woverride-init]
     127 |         [TCSR_PCIE_0_CLKREF_EN] = &tcsr_pcie_0_clkref_en.clkr,
         |                                   ^
   drivers/clk/qcom/tcsrcc-eliza.c:127:35: note: (near initialization for 'tcsr_cc_eliza_clocks[0]')
>> drivers/clk/qcom/tcsrcc-eliza.c:128:10: error: 'TCSR_PCIE_1_CLKREF_EN' undeclared here (not in a function); did you mean 'TCSR_PCIE_0_CLKREF_EN'?
     128 |         [TCSR_PCIE_1_CLKREF_EN] = &tcsr_pcie_1_clkref_en.clkr,
         |          ^~~~~~~~~~~~~~~~~~~~~
         |          TCSR_PCIE_0_CLKREF_EN
   drivers/clk/qcom/tcsrcc-eliza.c:128:10: error: array index in initializer not of integer type
   drivers/clk/qcom/tcsrcc-eliza.c:128:10: note: (near initialization for 'tcsr_cc_eliza_clocks')
   drivers/clk/qcom/tcsrcc-eliza.c:129:32: warning: initialized field overwritten [-Woverride-init]
     129 |         [TCSR_UFS_CLKREF_EN] = &tcsr_ufs_clkref_en.clkr,
         |                                ^
   drivers/clk/qcom/tcsrcc-eliza.c:129:32: note: (near initialization for 'tcsr_cc_eliza_clocks[1]')


vim +126 drivers/clk/qcom/tcsrcc-eliza.c

   124	
   125	static struct clk_regmap *tcsr_cc_eliza_clocks[] = {
 > 126		[TCSR_HDMI_CLKREF_EN] = &tcsr_hdmi_clkref_en.clkr,
   127		[TCSR_PCIE_0_CLKREF_EN] = &tcsr_pcie_0_clkref_en.clkr,
 > 128		[TCSR_PCIE_1_CLKREF_EN] = &tcsr_pcie_1_clkref_en.clkr,
   129		[TCSR_UFS_CLKREF_EN] = &tcsr_ufs_clkref_en.clkr,
   130		[TCSR_USB2_CLKREF_EN] = &tcsr_usb2_clkref_en.clkr,
   131		[TCSR_USB3_CLKREF_EN] = &tcsr_usb3_clkref_en.clkr,
   132	};
   133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
