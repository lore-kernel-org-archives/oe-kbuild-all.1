Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F982BD580
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Oct 2025 21:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761947973; cv=none; b=jmBHR563VAmtzgfhEDs8hFMRihSKXp6fGfgcTSzH2Xe3F0thDOxZ9h/HpDefg4FLXITfxA6ForWXhrrAlkHbnMFOgFjnVyms4peCZvHtrcONyFrkdvcs03/007FdPqQU51B0+23lb8NmxmaOItg7CyzCguO7bwRAqJdNKQfaHRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761947973; c=relaxed/simple;
	bh=JaavnNff5O5plTYTOSSMlvq5RFAK+SDIp/rJCsp+pRI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H+6qlVRzPikB4r1i4bSSe04HwBFiwl49fg3mV1sjVYbwCI3nGD5mCzDjpctICXg+9ZsgPXJ5P0zrso+j9zsrZzmpoqiW71CleHzWN1dXgrf0jFa8Zc92kIBgac+tZ5hR8WPw/p2561x1iy+x4KrtmIlTTeSPjFjDL6Vgn3qY1Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=faxq1rNH; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="faxq1rNH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761947971; x=1793483971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JaavnNff5O5plTYTOSSMlvq5RFAK+SDIp/rJCsp+pRI=;
  b=faxq1rNHJzKIAhOqOxfkTEfmJOALsoh+NM9yKa5dFSXcq2Enj4e2+32c
   NMSVbu5fgNgSzYYz0wHnrpKtBjBN7VFBEamTyYUwC6wcZwsw5Lkgsd/FJ
   danK5GmhRkOipsFK+YT55nGS7OR0igx8mDluTqqKIMm1NOqI0v+DD/iTP
   /ByGVMqyYejNYC9LoE0iFeyJgvyZPPVMBe58OUbULW6fZFmxokmen+q5P
   vte6FSX6+xaIQ5CrQSmZJ1nEP2GRHbRA9QNSDgvSz1DZDTdThGPiS2m6P
   7+pb+Gj3fme6kvhZsIl13b2fvlB1LygAYMfLFkvdoBG+RFAxic8NXNIFt
   Q==;
X-CSE-ConnectionGUID: FAF+EhyeRjW7lb6mJl7Ehg==
X-CSE-MsgGUID: y7ANvvb8TDqWBhKGyELKIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="74409176"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; 
   d="scan'208";a="74409176"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 14:59:31 -0700
X-CSE-ConnectionGUID: yD+e/AZOQ8mCNNBKGpauYg==
X-CSE-MsgGUID: U6GL7Mk0SJS3JV/fvKaa7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; 
   d="scan'208";a="186024587"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 31 Oct 2025 14:59:29 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vEx9b-000000001DA-24rv;
	Fri, 31 Oct 2025 21:59:27 +0000
Date: Fri, 31 Oct 2025 22:58:56 +0100
From: kernel test robot <lkp@intel.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [linux-next:master 3825/5383]
 arch/arm64/boot/dts/qcom/sm8550-qrd.dtb:
 /soc@0/cci@ac16000/i2c-bus@0/sensor@10: failed to match any schema with
 compatible: ['samsung,s5k3m5']
Message-ID: <202510312235.aVM8Og4b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   98bd8b16ae57e8f25c95d496fcde3dfdd8223d41
commit: 3f857377578740f73fbead7f154a56db20e05f82 [3825/5383] arm64: dts: qcom: sm8550-qrd: Enable CAMSS and S5K3M5 camera sensor
config: arm64-randconfig-2052-20251031 (https://download.01.org/0day-ci/archive/20251031/202510312235.aVM8Og4b-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema version: 2025.9.dev12+gd6be03029
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510312235.aVM8Og4b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510312235.aVM8Og4b-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3963.27-4018.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:4132.22-4222.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: /soc@0/cci@ac16000/i2c-bus@0/sensor@10: failed to match any schema with compatible: ['samsung,s5k3m5']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
