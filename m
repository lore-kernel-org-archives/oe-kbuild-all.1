Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444066;
	b=xxqHt1c52YvidTGjUf+NbiiYfmcRkfrtMTsQdO+tolV/vemJJ/byD2WbUEfoVTOmxCBJ
	 BSs9/n4cU8t8YyF1qemWChcXd7mPUBv9Cesgo5hi3V63QhTmwtU//J6QMRERQsWAOGPbR
	 l59AAgg2AeeagzKvwwYXM5MhsSCeCg5ItX5r1ZQuCWPQz01WNuaVFfkHQKbRmM/cex9w+
	 T/tmXAKLnKfApKw8L7oO89eT7sMyeJt9fZOprDlWo/bou5EoWqpGEm41JtCCKOuHc+pAx
	 jgxwfzDtxhzUd3wdwUe4Cn+GI+QNdwiAdfqSdmssl3n7jhtN/BKiUe3P7rkgyrzIIfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444066;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=soXPHNrlC+K9hzcz2ros2E9+STw8+JlZAj9YF0ZQeRM=;
	b=4wCSq0O6Fp+Y7Y1u1743D5AntDTxnBCXQ17mjJ9Y/wMrQIVrVeKe4ftVfjhlijuxwYMV
	 u5cYrxh3Qadus+tfVEJ1I4SbU86okV/dCJ6fth0pkJC4nWMFAkD9ySo5nSRm/yKeB9oRj
	 +WveRCoAYM4biaS9+3phnEbpIejAPo1IsGVvLIZab5uyDKMFLt5e4yZP0tLFebHC7QY+L
	 5MChCWJRrC+t0fKWuciiSCfqsLN488DdVZlFTG7fampYXmKMrjtRVoGnRmIw5ODmf/A7y
	 IU94O91zbc2S7INCIASoCrG7lZL0/JtGoAxdvY6HJUOXQsCjIteO3CYJlPfzgx17R8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J968iNty;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38098606A321
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Nov 2026 00:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38098606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J968iNty
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794444067; x=1825980067;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4uJfis9jIEhjxc17iF7LaSJGR1dtbAC0EB7+KB9AUhk=;
  b=J968iNtyzXbyIwhX9DOwEng41v1/TZ3SNr7ort1VWxt/LaA9x/kZf7O5
   HThQU2Vbv3+sJTbXLa35SdbT9Aku+xrWU9velqofeDOLjse685ieTPr+o
   5Myid+XuO2TknH68qmtje6gXBtJIVAieTBkT/5TKdsFCdz/0+KuiAO70l
   wM0qzTKCHfDqGrFIri97dIqPSEG3GtUCPRWsrWXyNNnvy7Etn90jviJOt
   6QrxYImGmwn5ZffRTDGXhrCjHa5pKA0ckMVvfg2UMlAamOiXq8yKd2vv5
   bHGEUyaqUPfBF35+6aXfK1Y+n5TOzGMS/mlFdrzvsZma2qj7Q/C9VmDag
   A==;
X-CSE-ConnectionGUID: +DoVfm51R7SolQ17beKyrg==
X-CSE-MsgGUID: 5lvzUSvZQBaYgAjp2b/9ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3103050"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3103050"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 16:41:06 -0800
X-CSE-ConnectionGUID: Ur78ar/STFG8P5N+655ZiA==
X-CSE-MsgGUID: wu/saDbJQCmymWk1qTGM/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8489130"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Nov 2026 16:41:02 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRIs7-0000000106l-0m9c;
	Thu, 12 Nov 2026 00:40:59 +0000
Date: Thu, 12 Nov 2026 08:40:35 +0800
From: kernel test robot <lkp@intel.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] phy: qcom: qusb2: Add charger detection support
Message-ID: <202611120841.GECRO9c3-lkp@intel.com>
References: <20261111-shikra-qusb2-charger-det-v1-2-5a9d919c66b5@oss.qualcomm.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111-shikra-qusb2-charger-det-v1-2-5a9d919c66b5@oss.qualcomm.com>

Hi Krishna,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4]

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-Kurapati/dt-bindings-phy-qcom-qusb2-Add-support-for-remote-endpoints/20261111-230126
base:   6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
patch link:    https://lore.kernel.org/r/20261111-shikra-qusb2-charger-det-v1-2-5a9d919c66b5%40oss.qualcomm.com
patch subject: [PATCH 2/2] phy: qcom: qusb2: Add charger detection support
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20261112/202611120841.GECRO9c3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611120841.GECRO9c3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611120841.GECRO9c3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'is_phy_enabled' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'vbus_active' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'id_state' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'usb_psy' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'port_det_w' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'port_state' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'dcd_timeout' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'dcp_charger' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'connector_role_sw' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'controller_role_sw' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'current_role' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'role_lock' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'is_phy_enabled' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'vbus_active' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'id_state' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'usb_psy' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'port_det_w' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'port_state' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'dcd_timeout' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'dcp_charger' not described in 'qusb2_phy'
   Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'connector_role_sw' not described in 'qusb2_phy'
   Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'controller_role_sw' not described in 'qusb2_phy'
   Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'current_role' not described in 'qusb2_phy'
   Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'role_lock' not described in 'qusb2_phy'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
