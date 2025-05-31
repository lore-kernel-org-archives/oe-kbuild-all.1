Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8BB238144
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 May 2025 12:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748694792; cv=none; b=mW2v88/gARIQn/7Pv7zwUHa+lTqNPDxriBOzTiZQwFeeVCGM3xZ2Icf5RSLVYjcptAYO4DZ4IJK/D/IX6H7e5k577EddYj6zYDjaY+CtjMNhaCWjcaa3zTNU0Q4Id4m1b5sDfMu/FI02haur7XSbJtI3fPoVxxauK3Hs6M8IqsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748694792; c=relaxed/simple;
	bh=h4E1F0pvhXoi3CIgPyuBPiqSRARHwSonYqOdYyoyTvk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VCyvy8WxzlEKAQs21U+aRF8wq6WzBJkWxiBsBcFP6pv9INyt+PgNjvN5GnpnDmOv/0UlMMYJRGKbh4NVmfTQRqkxnXnPtstHe+Eqc7JSz1u+29Js1jPQHIzvUAVr+wK18NbQWNPivwrWTR5ZA1BMz3cbeT33IG2gDAT+RnJb1UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NAlPIi/F; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NAlPIi/F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748694790; x=1780230790;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h4E1F0pvhXoi3CIgPyuBPiqSRARHwSonYqOdYyoyTvk=;
  b=NAlPIi/Fgh+Rdi9wspNq7pILXUGewgAMJtfe91Z1JP34jqFE4BWkM+Df
   /oZ2Cn9aZoI8dsyxiS5CpeyALYD+G35N/ysU8C+AZTUEiq8w4/C05DVT1
   0R5i3alsMeUs076SrFPMZoxk2ll+RM7w4ZKocu/+QYL9pZF+aoyXN9IDA
   q/08zAVU5AjkATFOdjxW+rDo9JD6NZ7eyMYhsoGvZ6kiVaGyQjSRWSrid
   NGyoOBPPmM4hL1PypXCkKp/ObTLbSUm9jH+F2YId07hPjF0czPh7CG1tU
   BLe7k/yLu0pwvmuJygCF2rYSszqUFYXe4JX1da116jILguNAbqTfn4SKc
   Q==;
X-CSE-ConnectionGUID: aDw6nSl4Qq2qb8MxTy1lPg==
X-CSE-MsgGUID: GvmRUzpgQg6YNHsbLo3ftQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="50643029"
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="50643029"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 05:33:10 -0700
X-CSE-ConnectionGUID: I+Z5wl02SaOrCLbHspORqQ==
X-CSE-MsgGUID: 1i0pRrLNQM2diPHp6WS8Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="174993884"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 May 2025 05:33:08 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLLOc-000YOs-0R;
	Sat, 31 May 2025 12:33:06 +0000
Date: Sat, 31 May 2025 20:32:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-rust 2/2]
 arch/arm64/boot/dts/qcom/msm8992-lg-h815.dtb: usb@f92f8800
 (qcom,msm8994-dwc3): 'oneOf' conditional failed, one must be fixed:
Message-ID: <202505312044.JssJrIoA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-rust
head:   e8191d4b0877b5e3025a126ac1d08756a322d055
commit: ed3c955cab3a9d5a9bce4756e4bd3390f9c23e1f [2/2] arm64: dts: qcom: msm8992-lg-h815: Initial support for LG G4 (H815)
config: arm64-randconfig-051-20250529 (https://download.01.org/0day-ci/archive/20250531/202505312044.JssJrIoA-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505312044.JssJrIoA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505312044.JssJrIoA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/msm8992-lg-h815.dtb: usb@f92f8800 (qcom,msm8994-dwc3): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8992-lg-h815.dtb: usb@f92f8800 (qcom,msm8994-dwc3): 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
