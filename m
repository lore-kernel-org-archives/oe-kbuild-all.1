Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098591E5210
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 04:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740632056; cv=none; b=Fp8CfGoGk9YnQKbfcRnL7JLk1V784Rf/bK1jjSCjbPZsQHnwhp2JAyAnbax5PBoXf7lgUNuCNs9UM+GHufvnwrv5W4eCXGtg4VA67iMTD4oPVT8v2FCM+R3lrs+7i3UmaXOKPuO9WzxGwJ/dSA+vkSUqGpHr/mn5j6+97HrUOZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740632056; c=relaxed/simple;
	bh=9isQjf7Df6eP9/Ga8LmRbE7aA6sfe0WuwJvWZ8ApWiw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A1EA0dL/SARB6jgp5Sqmv6fQxMEfCtc5guAkYimpAGMpwfxZi36guNfE3sgAC7QnEAI7G3D1ElDaQID/X5kxnYsON7S8Jjx6NSAk8dXLMHiZmvCTQt2oXJJSRT8paXQsw/B8i8wff2dFB5O05SjHaZdGS1hGSJTqRz7CexBRSOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n/3pPGKD; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n/3pPGKD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740632055; x=1772168055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9isQjf7Df6eP9/Ga8LmRbE7aA6sfe0WuwJvWZ8ApWiw=;
  b=n/3pPGKDMy9oc9vkLWgwunTxjmEIpz9z63Xa+Ktvkh1hi5+yGrkBerOd
   pIxN1tLoc5SYxTp2Nu9QP12hxOWE4hH2qVtLr/bG7J3Bxf69L4P8ySZmp
   CCdxdSAhdEZ9ehIWjDdLv8wxcN4FvNo1MSjCuXjJ6o81xOF0Awn9KYS0V
   4s0rYYxxu4dRwAWLRaCqiWJjSINvXidPRQOB12qD6yhQO5LYmwV4Uk2rx
   0FNHW4yvTBwVO0PevINVv4FcD5XsOwYDbVRaKz0wXk88GxHCxUBouGYWL
   cuy/fVyUTmtVUNL9/yuCPJGDCodIdBhhpQh8eg0LgP11nTkUC/Mvmegyt
   Q==;
X-CSE-ConnectionGUID: wjcz/iMuTh2cWT9onDdsnQ==
X-CSE-MsgGUID: M1T6PCIFRqanCbuO9lj5UQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41527839"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="41527839"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 20:54:12 -0800
X-CSE-ConnectionGUID: kOlgBsFpQZ6AKU0yjfxNHQ==
X-CSE-MsgGUID: sfX7wCwNSQGYc6lZGr7d2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="117085437"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 26 Feb 2025 20:54:11 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnVuS-000Crg-2g;
	Thu, 27 Feb 2025 04:54:08 +0000
Date: Thu, 27 Feb 2025 12:53:28 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Burri <markus.burri@mt.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Manuel Traut <manuel.traut@mt.com>
Subject: [linux-next:master 6261/6583]
 arch/arm/boot/dts/nxp/mxs/imx28-tx28.dtb: matrix-keypad: 'gpio-activelow',
 'wakeup-source' do not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202502271244.EFaKXnxb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8433c776e1eb1371f5cd40b5fd3a61f9c7b7f3ad
commit: e51cb50f0bc0724634369e42a826dd302aae787c [6261/6583] dt-bindings: input: matrix_keypad: convert to YAML
config: arm-randconfig-051-20250226 (https://download.01.org/0day-ci/archive/20250227/202502271244.EFaKXnxb-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 204dcafec0ecf0db81d420d2de57b02ada6b09ec)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502271244.EFaKXnxb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502271244.EFaKXnxb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
   arch/arm/boot/dts/nxp/mxs/imx28-tx28.dtb: /apb@80000000/apbx-bus@80040000/lradc@80050000: failed to match any schema with compatible: ['fsl,imx28-lradc']
   arch/arm/boot/dts/nxp/mxs/imx28-tx28.dtb: /apb@80000000/apbx-bus@80040000/i2c@80058000/edt-ft5x06@38: failed to match any schema with compatible: ['edt,edt-ft5x06']
   arch/arm/boot/dts/nxp/mxs/imx28-tx28.dtb: /apb@80000000/apbx-bus@80040000/i2c@80058000/tsc2007@48: failed to match any schema with compatible: ['ti,tsc2007']
   arch/arm/boot/dts/nxp/mxs/imx28-tx28.dtb: /apb@80000000/apbx-bus@80040000/timrot@80068000: failed to match any schema with compatible: ['fsl,imx28-timrot', 'fsl,timrot']
   arch/arm/boot/dts/nxp/mxs/imx28-tx28.dtb: /apb@80000000/apbx-bus@80040000/timrot@80068000: failed to match any schema with compatible: ['fsl,imx28-timrot', 'fsl,timrot']
   arch/arm/boot/dts/nxp/mxs/imx28-tx28.dtb: /sound: failed to match any schema with compatible: ['fsl,imx28-tx28-sgtl5000', 'fsl,mxs-audio-sgtl5000']
   arch/arm/boot/dts/nxp/mxs/imx28-tx28.dtb: /sound: failed to match any schema with compatible: ['fsl,imx28-tx28-sgtl5000', 'fsl,mxs-audio-sgtl5000']
   arch/arm/boot/dts/nxp/mxs/imx28-tx28.dtb: leds: 'user' does not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
>> arch/arm/boot/dts/nxp/mxs/imx28-tx28.dtb: matrix-keypad: 'gpio-activelow', 'wakeup-source' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/gpio-matrix-keypad.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
