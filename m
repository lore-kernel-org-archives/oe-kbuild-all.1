Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFF121FF4B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 09:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746610197; cv=none; b=OO/na2gGeUtSwFiBT/yZ2tWHwHGJEqkdkhP7MzZfORwoOfN9F50d9Smt+oJeKVZGJc1lwXbgeLZHPvG/A3O3uVMEAC6n7oF75YJw/07RNUNwq1aQO9zM8Qonllf2WPdDt/qF63gKaJ0l1gulr2a0PZZ2uI4n7RAvPM50zEoGr3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746610197; c=relaxed/simple;
	bh=LNyqZSPWaKmHLJXuJWqIwebD1C46H5P79WxKalmtEb0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MxuXkK4FLH6+DhpCf3DXu6kQrPbOiPjWVwVO7BLJnhBwSMCqDIdCPa/rgD/PbSbCHS793lbsCDH3Gd+TfTIXa8rWiylLXfZsM/uCFSs5vkf87RM1hNqVtXg4ROofrLtizBmT1WAYrzMBDxWz+0omm0Z9l1fYk6JRsn4IBz3/Xjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RZX69Ork; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RZX69Ork"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746610195; x=1778146195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LNyqZSPWaKmHLJXuJWqIwebD1C46H5P79WxKalmtEb0=;
  b=RZX69OrkGe7uQKcpDdSuoNK91MnRiM9u8ZAuKnLoYAEY30UaXbTGaVqG
   tmbKb/HYFUAqqTMeO/isoPoJMtLV5mT+Z4KjU468uS1TVQpJy2cCEG5PT
   VWiNK9CJ/nmd2T+TRuMwe+U1xciVRyKmnpoZu6WLw3iRYxpX9SHKt4u7j
   8cF7WOZM5V2hUANb6clEwtzmJMU3JKWG/z3Sh7G4HGNJMHlmVzP+lLcSk
   ekmZD2t4XDvLET4/XBWCKQ8uGe5gzvRAMu1PL0GT/I0IQwuzaqPIeuxY4
   H8TbR8WmM7V5eS9+MABsz0rD8ZwDbhhq3bhkTEB6e4ENakm0DpIQlmOOZ
   g==;
X-CSE-ConnectionGUID: F8z04XpDR/2nrZx0ugQP9Q==
X-CSE-MsgGUID: f4aiazDVSLeZThQUyWwnsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="70834508"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="70834508"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 02:29:55 -0700
X-CSE-ConnectionGUID: yW0qyc5+SumAOQwY0N+ytg==
X-CSE-MsgGUID: /mKmrQlyQOWS1Fx4tfG+DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="140640296"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 May 2025 02:29:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCb67-0007VV-0B;
	Wed, 07 May 2025 09:29:51 +0000
Date: Wed, 7 May 2025 17:29:18 +0800
From: kernel test robot <lkp@intel.com>
To: Zelong Dong <zelong.dong@amlogic.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kelvin Zhang <kelvin.zhang@amlogic.com>
Subject: [linux-next:master 7941/9308]
 arch/arm64/boot/dts/amlogic/amlogic-a5-a113x2-av400.dtb:
 reset-controller@2000 (amlogic,a5-reset): compatible:0: 'amlogic,a5-reset'
 is not one of ['amlogic,meson8b-reset', 'amlogic,meson-gxbb-reset',
 'amlogic,meson-axg-reset', 'amlogic,meson-a1-reset', 'a...
Message-ID: <202505071700.Fos4lWxf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   08710e696081d58163c8078e0e096be6d35c5fad
commit: f0911f29478992f37e91c208fe44c2ea5b378b61 [7941/9308] arm64: dts: amlogic: Add A5 Reset Controller
config: arm64-randconfig-051-20250506 (https://download.01.org/0day-ci/archive/20250507/202505071700.Fos4lWxf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071700.Fos4lWxf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071700.Fos4lWxf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/amlogic/amlogic-a5-a113x2-av400.dtb: reset-controller@2000 (amlogic,a5-reset): compatible:0: 'amlogic,a5-reset' is not one of ['amlogic,meson8b-reset', 'amlogic,meson-gxbb-reset', 'amlogic,meson-axg-reset', 'amlogic,meson-a1-reset', 'amlogic,meson-s4-reset', 'amlogic,c3-reset', 'amlogic,t7-reset']
   	from schema $id: http://devicetree.org/schemas/reset/amlogic,meson-reset.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-a5-a113x2-av400.dtb: reset-controller@2000 (amlogic,a5-reset): compatible: ['amlogic,a5-reset', 'amlogic,meson-s4-reset'] is too long
   	from schema $id: http://devicetree.org/schemas/reset/amlogic,meson-reset.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-a5-a113x2-av400.dtb: /soc/bus@fe000000/reset-controller@2000: failed to match any schema with compatible: ['amlogic,a5-reset', 'amlogic,meson-s4-reset']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
