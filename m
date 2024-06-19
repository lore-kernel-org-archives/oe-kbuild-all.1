Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C68382495
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 18:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718820347; cv=none; b=Es30engJqe9xGa5nZy+TqgrxgyY1cU04nGu1LDgQZK07iJ/vV+Y/f7Z4iXgBYB8Z1KYp0umMsK+mZV/xAB/vW+bFB/u8Sn2ZFbNtwyHE8HbyM5T7/gvoblMly8BjAWtCzhtFXlue/ZdxeSqxXW/V5Lxj/SrNsUWjUSzNMT3iXag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718820347; c=relaxed/simple;
	bh=l2glUD/0U57YhygNwHrUhI3jmacXBnEnnVGcWrlt/6g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lKZcN/WS1+MlzkHN0F/T/qhGPirVqWaucdX8GjinXnpnX0kpEWgogKMIzYQV3Gs3kOMfYhTWXNs2sBYUAKby2Si/GTmcl/xaIWJ3vxFxBlLcXhn12vCsiBoPm+H4td2m9SaeqjfFNNDiPTQ7u2LH7wLY623laBKahHB3HZqe0mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fNgmC1YU; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fNgmC1YU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718820345; x=1750356345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l2glUD/0U57YhygNwHrUhI3jmacXBnEnnVGcWrlt/6g=;
  b=fNgmC1YUqKIJ7l0M3sbDGSceGVBEWuHQyo5d/+4RyEMneWluPsDiXXZG
   I7z5PnZkwf9hywLK4LlvHBlHAa2mzfkKce7rhm+G1pzEJj1BMoapNlkRr
   jToisXb1hv4CEJuViSDxrUAP3cUdEndqlzHZAcM2JSdF5Is3LQeVAmfvJ
   Ctisiy9BvnGAh3e/QUzc9SXxC90DqnxpBrutuzmhLfyhbmwoS7vi54u6M
   6hE/89OXl335op+5zG6ofxwi1Y/13zTwrVrNGrSr5q2SIpr0gki3gLwY6
   llQvjw+5KpUj7qu0Ab91oS8EP/vbcLSVe7RFRUjB3NUOoLv7MKWNBWZfi
   g==;
X-CSE-ConnectionGUID: TML4Xoy2TdSS/O6SxoNRHw==
X-CSE-MsgGUID: X6hnujeBQuy9bXgHnA2C8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15535047"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="15535047"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 11:05:45 -0700
X-CSE-ConnectionGUID: XVp0INI9TlGVCVpqZ1MX8g==
X-CSE-MsgGUID: eLbJZNcVSMyFVXrfqPAhIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="41950967"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 19 Jun 2024 11:04:34 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJzfb-0006qb-2Y;
	Wed, 19 Jun 2024 18:04:31 +0000
Date: Thu, 20 Jun 2024 02:04:07 +0800
From: kernel test robot <lkp@intel.com>
To: Dhruva Gole <d-gole@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>, Vibhore Vardhan <vibhore@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 28/137]
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: pinctrl@f4000: 'interrupts' does
 not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
Message-ID: <202406200123.cjDv8wGH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   0ebbfb8c5fa978c93d0174acd6cb1ba3beed9c4a
commit: f50c9f12bc379088c5f1c3156f3c4477436a8bd2 [28/137] HACK: arm64: dts: ti: Configure am62a pinctrl-single for wake-up interrupts
config: arm64-randconfig-051-20240609 (https://download.01.org/0day-ci/archive/20240620/202406200123.cjDv8wGH-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406200123.cjDv8wGH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406200123.cjDv8wGH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: syscon@43000000: 'syscon@4008', 'syscon@4018' do not match any of the regexes: '^chipid@[0-9a-f]+$', '^clock-controller@[0-9a-f]+$', '^mux-controller@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,j721e-system-controller.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
>> arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: pinctrl@f4000: 'interrupts' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
