Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3721F2B9B9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Nov 2025 12:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762605230; cv=none; b=TyF0RC9dS6hpTgrvf+VIdGplOUVRyfD259Jg7yhOkWFNMnYoeoerjdI9wZOuEm+l8k4SSOoCnXJ3Yd8rVXfRRSGEdZ/FYGOa15FiPtx3P0x39u2GMDrbIqZkMcwxICN0V2wrGVHIJqynjncGsmpXl3B/VGxtWg5EuHD//NWvaC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762605230; c=relaxed/simple;
	bh=k8FeKKKyTWxMCzlO2ToUpsOqrl/hY0TIWxgnSQEIoUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CYDb+pnADro7Vr5ekC0xRXpvBC+AMFDol5CGdej7jMpQWaNHrsY89+E98LTUP9RRcQXZLKjVuCoKQYt/FNbkV6Td0CAU8OClze4l5gXodXPt+nQdvBvRl/od9imMD9q32SVew/CXHxeeOxyuGBUcw3aHdgBaz6DfzQ/0heTs9TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U8Be14cR; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U8Be14cR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762605229; x=1794141229;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k8FeKKKyTWxMCzlO2ToUpsOqrl/hY0TIWxgnSQEIoUA=;
  b=U8Be14cRlylqC+9Fd5k8sQ38K3+ya0OQ1CzH1sM9k160h0gWZwj9AWxu
   DYxDRUlwGA1OkHN+/MCJm+ETvlYrbxi1eLFr+pbrSr5FPCbD7lLnECLxV
   g9bMFOTmMQVVIHToy7Qa6AVgoXkqWzkA9rSxx93PWGE2SRzIYuBBpOaE/
   aEMIpnpKLarEUQoFqscbT/TQ48wEQcj0aiXbPnNnQA2brm5PdjrRrVXuo
   xT5mK+lnRi5zu7gpaIJwUKjxSzSVa4ZePddjC0FZ6eappLiq0jaugqOqJ
   sZMnArpHE1oHptJLtcbXDjFr798PkIY999rejGTtYRjGOCB1BUvHa1qYG
   w==;
X-CSE-ConnectionGUID: RzEjqk3HQfiPrwovC0Ne2Q==
X-CSE-MsgGUID: qZOCe6SsRseP03dlbKD1Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="67341323"
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; 
   d="scan'208";a="67341323"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2025 04:33:48 -0800
X-CSE-ConnectionGUID: jE6zrHbmR/qUn7ucISj+GA==
X-CSE-MsgGUID: P18hk1rQSByQeXvnGLKhcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; 
   d="scan'208";a="187575201"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Nov 2025 04:33:45 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHi8U-0000v5-1l;
	Sat, 08 Nov 2025 12:33:42 +0000
Date: Sat, 8 Nov 2025 20:33:21 +0800
From: kernel test robot <lkp@intel.com>
To: Hrishabh Rajput via B4 Relay <devnull+hrishabh.rajput.oss.qualcomm.com@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/2] firmware: qcom: scm: Register gunyah watchdog
 device
Message-ID: <202511082023.F71T0M1w-lkp@intel.com>
References: <20251107-gunyah_watchdog-v5-1-4c6e3fb6eb17@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-gunyah_watchdog-v5-1-4c6e3fb6eb17@oss.qualcomm.com>

Hi Hrishabh,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6146a0f1dfae5d37442a9ddcba012add260bceb0]

url:    https://github.com/intel-lab-lkp/linux/commits/Hrishabh-Rajput-via-B4-Relay/firmware-qcom-scm-Register-gunyah-watchdog-device/20251108-015559
base:   6146a0f1dfae5d37442a9ddcba012add260bceb0
patch link:    https://lore.kernel.org/r/20251107-gunyah_watchdog-v5-1-4c6e3fb6eb17%40oss.qualcomm.com
patch subject: [PATCH v5 1/2] firmware: qcom: scm: Register gunyah watchdog device
config: riscv-randconfig-r063-20251108 (https://download.01.org/0day-ci/archive/20251108/202511082023.F71T0M1w-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511082023.F71T0M1w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511082023.F71T0M1w-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "arm_smccc_hypervisor_has_uuid" [drivers/firmware/qcom/qcom-scm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
