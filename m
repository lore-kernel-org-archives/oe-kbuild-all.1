Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBE92EEE7B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Sep 2026 01:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789088448; cv=none; b=pV3a/mmQvE6Mqv8NpHk8rW2KaFu4Hvf0ENQSE0jiFijaFj5+muZ+oA7d0IsZf8U+Idl027Gdt9qWcKPanSeHhoEhXMzj+lTzgkvgWVx8rpN3yHE1L6FgsGpHvXMa9VR1YLgFDai6U4RYhYm5mITxRJlO5EZvY3L498MpmOVr6sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789088448; c=relaxed/simple;
	bh=v5D3ugaPQ3fO/i4Yi+b2IQHa+VWDLJaxPYBnY4bANFw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Rc2I1KKdJ+53F/HrXYdo/xpVsCH+6Ez/N5VhOD7BDOv3nnl2HcWDe99Lcb4qQ2bKcag8+qUsJIkim2k2Jru4zWgUMeKDfJOjlDLr24ID/dGbvNY87y7MhVHrYgTbU3oaJyr/5YwlwsZq/fSujMDJDZeH/5+X0mGIvLnZcLnUSYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hW2xc9vg; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hW2xc9vg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789088447; x=1820624447;
  h=date:from:to:cc:subject:message-id;
  bh=v5D3ugaPQ3fO/i4Yi+b2IQHa+VWDLJaxPYBnY4bANFw=;
  b=hW2xc9vg1LNsKXKF925dD80XZKhwABkCwBxk4a6/XybPSek9MzASVDpA
   uj5lREvA0QYgjng4ZvEXMNIrgQ77Vr/4GRnGyui2UW1XCv73MUWhJ1ozC
   gnL/s922z+8iUA5Nolx9SQMYSVzsVFpn+9WFvBFI8Suj6lEUWcoMTZje6
   4SFDA9O9MfJK5IXivc1DrZ3Y9HshUo59Iuwo8fiTU/VWOUgJHOhNEl7kO
   Sdt1AkyOALFojA2kUnuV56RJ+jrTOZxQ/UtFYnnn2qZvHgXrYXpZIiX+R
   STKQTFoYE9Wk8UpSkIEpVfB1cbHPxYL184VXfZfZO9E0fsHmxluFP2HWh
   w==;
X-CSE-ConnectionGUID: P54tHojAQdy3wx9q0Murww==
X-CSE-MsgGUID: sBzBqEdHTqilKn5ShVn41g==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="99881617"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="99881617"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 18:00:47 -0700
X-CSE-ConnectionGUID: Bk3APgQeRrGpHnXMb6lFQg==
X-CSE-MsgGUID: L8uMhEdYQIefg+mEbhJMDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="101610"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 10 Sep 2026 18:00:45 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4pdD-000000000Zv-06MR;
	Fri, 11 Sep 2026 01:00:43 +0000
Date: Fri, 11 Sep 2026 03:00:24 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 7/7]
 arch/arm64/boot/dts/qcom/purwa-iot-evk-el2.dtb: phy@1bd4000
 (qcom,x1p42100-qmp-gen4x4-pcie-phy): 'qcom,4ln-config-sel' is a required
 property
Message-ID: <202609110203.lBkmK280-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android-mainline-riscv64
head:   121ea1ece9487e8deae20bc5a48794afa81424c3
commit: bde860892c92a43624a7bcf932a1d375b1ad43eb [7/7] arm64: dts: qcom: purwa: Add EL2 overlay for purwa-iot-evk
config: arm64-randconfig-2054-20260910 (https://download.01.org/0day-ci/archive/20260911/202609110203.lBkmK280-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609110203.lBkmK280-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bde860892c92 ("arm64: dts: qcom: purwa: Add EL2 overlay for purwa-iot-evk")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609110203.lBkmK280-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/purwa-iot-evk-el2.dtb: phy@1bd4000 (qcom,x1p42100-qmp-gen4x4-pcie-phy): 'qcom,4ln-config-sel' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
