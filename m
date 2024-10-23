Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEDA14EC62
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 20:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729714329; cv=none; b=A9tXWry2OUxLw+G3QEAXHUGcIQV87/0/EUx6bZ5GdG954uRBL0SdeM9YFeNjtmP0sobhfHpsH0nAvtBe3ZHFuERKiN1VD9svA8wmcROaJz6vC8H4NryDFMMkxS46a12b79gv8LaA2EfXQ7EI479DBpRAfVo7nlhTmcsoR3UcBoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729714329; c=relaxed/simple;
	bh=HdTRkDxFrJR8Q2hULPLGC8J+zsTrQo4fLXyjqIdT7yY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FRjwA654kAiW9yM7vR84fzdRTOb0aUoiWdABCVtLDE+pbrhoeyHxn8amyewKwhuknN1Pp0Wehk06GinQOgaayP3VycNCB2MS7RbER/riMYQrfk8MH5j1/RpULrOJAY6exnqNm904TqubPoHCAeL0L4SOS/+aM+QheJgDkP+pFtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IyR0lqj8; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IyR0lqj8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729714328; x=1761250328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HdTRkDxFrJR8Q2hULPLGC8J+zsTrQo4fLXyjqIdT7yY=;
  b=IyR0lqj8WAFqhBLbjeOeyGiUiIR+sA7Kxp8obyW8f95xSt01cboR1726
   zHF19HxZdBH3h8wGAVpskgJnib9B8a8VvdK8cx5WZwaMcmPqP6Qd+4B74
   2qFLmLQQNvp0V0c9Lg//HF4voMHnzo4D13posox3LCY7ADFBjaXNOjiXy
   qeaV0CIqPx3vIhVaw++1nbH99arnn122Fg1CjG7DCqXYfj4EGObo7JbuJ
   H5w0YkP8B9tA1wSkj3MPNsPuwKHeJSsbw1CY9qKtcd9e18K32McgIBaej
   5ZXL/aoQfxHXrMPAMERZp3ezppPZTeu5NUPvPRvOmAMVxc8rpLOtclHfq
   w==;
X-CSE-ConnectionGUID: x/nc9NkHQfmtfsBmXBvzrQ==
X-CSE-MsgGUID: xPMeXZ0lTF6DWAxOaORKxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29187462"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29187462"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 13:12:08 -0700
X-CSE-ConnectionGUID: cg8qjjuBT7uc9cXzDAHAHw==
X-CSE-MsgGUID: r4Jz442tTL6GB7t/o0ye3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="80785028"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Oct 2024 13:12:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3hi8-000VSu-1F;
	Wed, 23 Oct 2024 20:12:04 +0000
Date: Thu, 24 Oct 2024 04:11:43 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>
Subject: [linux-next:master 5865/6433]
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb: usbphy@5b100000: 'nxp,sim' is
 a required property
Message-ID: <202410240411.1YzFzxxo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ceab669fdf7b7510b4e4997b33d6f66e433a96db
commit: 78009bc3ffe128f492df3c5c6c049892971559d6 [5865/6433] arm64: dts: imx8qxp-mek: add usbotg1 and related node
config: arm64-randconfig-051-20241023 (https://download.01.org/0day-ci/archive/20241024/202410240411.1YzFzxxo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410240411.1YzFzxxo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410240411.1YzFzxxo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb: esai@59010000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb: usbphy@5b100000: 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
