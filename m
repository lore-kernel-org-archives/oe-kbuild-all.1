Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA0513A401
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jun 2024 09:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718701484; cv=none; b=gzBupETePKOPRLiaqSsHRQe90W/B0Brxt1tsEOkilrzWcuk9XtzroWYY2L2L/ik+HaNd9/npyb/x8aRnf/4U5TEcJdig1gw/nDf8exYaKYIdtXFJP8TpW0BY9Fm8cqEmEybVfsPkDXDQT5WlUa/D/B+cL4HpJkvZtUxuvkSuIr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718701484; c=relaxed/simple;
	bh=YxdPpXVNotEQUg6GUjOwFn1TDMIqcGpwM/Q+98b/fSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aO9ae6kdfC0EtdghWQJOETuJBqbIoELIGWs9gCzdcMmkvqz2snzoZulYyiF94oCLSMSZPyqoNWTrv1kHVCaGUEKvNI9IKnsZMnybr/X1TNGjZKPn1H9hcp+u5nae/+6UZMbUweVF5qg2yfWG9sO1MfYq66va+XRwrQZVGjDbbO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XgAe8omT; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XgAe8omT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718701482; x=1750237482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YxdPpXVNotEQUg6GUjOwFn1TDMIqcGpwM/Q+98b/fSQ=;
  b=XgAe8omT/G1HnGbu0ef37nPsbrMM3X4fk4Wnoiz0LylvRrjtBdUq7Jfn
   S9yu+nqsIzC4+i7eEOD9twGAm2rGyQin3UtWStiTjVyocv/rasdQb5eo8
   s9cRRTLLoplkGtOIBFrkG7kecA/2Xn/zgPf/17LPtQwxxPMUwbxq62d3w
   TQ++WrW8l9qbahBQdo9Q1qwczp7PRO3ravgcu5U/IjoWEuqwhtnX+YbbT
   cIJRMGgVIqDrmzoMCSZHW19Av0W/EegtXh52AXQHiwahc7vITdsK+32Pt
   HucanzQX7NBT4NOloUI9J0ritCSiFzrt8f8caV3ctFdYZY4FxWQ7PoQHy
   Q==;
X-CSE-ConnectionGUID: j50WIV/LSM+MR5cKB965ZQ==
X-CSE-MsgGUID: FH5JFHhiTJO8eJeWANdH3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26964322"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="26964322"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 02:04:41 -0700
X-CSE-ConnectionGUID: hy6RYiFSQWyt1VuHCOo0Vw==
X-CSE-MsgGUID: Y73zF2VtT+uIEsoN6gdWcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="45941198"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Jun 2024 02:04:40 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJUla-0005Ll-0k;
	Tue, 18 Jun 2024 09:04:38 +0000
Date: Tue, 18 Jun 2024 17:04:19 +0800
From: kernel test robot <lkp@intel.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bjorn Andersson <andersson@kernel.org>
Subject: [linux-next:master 1797/6646]
 arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dtb: usb@8af8800:
 interrupts: [[0, 62, 4]] is too short
Message-ID: <202406181646.71Yw7tdw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   76db4c64526c5e8ba0f56ad3d890dce8f9b00bbc
commit: e6d33c8b2f8063e1f195cfc0e7f1c9e21066d13b [1797/6646] arm64: dts: qcom: add TP-Link Archer AX55 v1
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20240618/202406181646.71Yw7tdw-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240618/202406181646.71Yw7tdw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406181646.71Yw7tdw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dtb: usb@8af8800: interrupts: [[0, 62, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dtb: usb@8af8800: interrupt-names: ['hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dtb: usb@8af8800: interrupts: [[0, 62, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dtb: usb@8af8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dtb: usb@8af8800: interrupt-names: ['hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
