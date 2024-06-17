Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A08A256A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 04:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718599617; cv=none; b=BO+42iIYgsPUhoz179f4c1M6vLzNt50FrsBPbrBCyhxOr6XWNGazXb8dtOzZB3lcSRLExSsjFS/h1j4kHXNv7igEtywOb8QRqLWziK9yHBpgW7rdg5fxYsDm10n+SaBDG3AX/6kBeyRPFQhV63jVK6ZaXbG1axAuf3I18JaAF2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718599617; c=relaxed/simple;
	bh=whjLoI6ATVHp2pLIwUCKg3fLiuQNfMLZnYy3Hh5xbbE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UDyYhIwj7J8dZu6e3fnY1lVv/Kl3pWRU0gdD7526Zcuwx4Kz55y2dir69i4ZTwPPKiNQR6oZkB5GkRVdQROnjykiFWp8AGX3joJJU3oFB4Op6D214svLoRTO5qjDv6+qqMvLHpLsniKdh9fAWm2RFrIdlmdIp/OMXLu5XnrLiw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jyvv283f; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jyvv283f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718599616; x=1750135616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=whjLoI6ATVHp2pLIwUCKg3fLiuQNfMLZnYy3Hh5xbbE=;
  b=Jyvv283f5caA6jxeb6lf14qQr8HzLBUGPYhnobB843MM0lx82dm6Co9Z
   yKPj+p5DKPjvjFTI9icR6qBGILMieVExU+WgtPqw+N4idg4Nvy92MPVNn
   P/41nc85EdZDgOPqrzw2hQ4YKclll5GH9NGZ5wiKu7jIpXnzvs6pEOxX5
   eXdUFEADW8W1ShX+rwqYvHrTZfkBNVDTIjuqTeEGzU5SKNhaDP/B5pR4S
   XzLitAwGEw23p1DZ8uNUy9QoToV3Ba/4jOB5NQkTyv2Mu5A2rHvtXwslT
   wfO4ZG1MD7RffLLHyPJ3td1OFVQUGtK6VcPI3q8LGVXOulZOY3tisA7ci
   Q==;
X-CSE-ConnectionGUID: lEWfDz/YQbes8VYJBctbjA==
X-CSE-MsgGUID: w9eOJtv1TcC0Z6blOw1foQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="15547494"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="15547494"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 21:46:55 -0700
X-CSE-ConnectionGUID: ogJFKb6MQMediykipKlyyQ==
X-CSE-MsgGUID: M6tS1d78SvC1swk4UUjhJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="41218640"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Jun 2024 21:46:54 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJ4GZ-0003ow-1n;
	Mon, 17 Jun 2024 04:46:51 +0000
Date: Mon, 17 Jun 2024 12:46:31 +0800
From: kernel test robot <lkp@intel.com>
To: Komal Bajaj <quic_kbajaj@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Amrit Anand <quic_amrianan@quicinc.com>
Subject: [qcom:arm64-for-6.11 47/211]
 arch/arm64/boot/dts/qcom/qdu1000-idp.dtb: usb@a6f8800: interrupt-names:0:
 'pwr_event' was expected
Message-ID: <202406171241.YKuCm3SC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.11
head:   f55a758fd355c1b5ed7c73434a99ae07d5741226
commit: dd1bd5bf7420497aace9521d314f6c7e22f22118 [47/211] arm64: dts: qcom: qdu1000: Add USB3 and PHY support
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20240617/202406171241.YKuCm3SC-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406171241.YKuCm3SC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406171241.YKuCm3SC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/qdu1000-idp.dtb: usb@a6f8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/qdu1000-idp.dtb: usb@a6f8800: interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/qdu1000-idp.dtb: usb@a6f8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
>> arch/arm64/boot/dts/qcom/qru1000-idp.dtb: usb@a6f8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/qru1000-idp.dtb: usb@a6f8800: interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/qru1000-idp.dtb: usb@a6f8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
