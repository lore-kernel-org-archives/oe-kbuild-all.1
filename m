Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847223BA222
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 05:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778735520; cv=none; b=PfgPfsv5om6Y1W2mswquhgz9ZAGC8mC/S//IJWo6ovEj7Z4WRIJktJoRec38BspKxixuF3eekzB3TJ0A3OH65108T7uRQMmQrpDucpqHb5qeoe5dv3EpNX3pCkU3PwIgm/WVkS0HlPJzDZUO0Ft2AifFW8rARa0S9x+D25CQrRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778735520; c=relaxed/simple;
	bh=aqOV1mY/tlDOhAsTBbbdmifYKbofag9t7kIJKhAG01M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ke7S3ab+JJhNVIoa9/m7XZGt9UJzG/VqAUc6aCfp4DXREzzcnIoOubUL7/Xh1zwpPYTfK/q47LdcEgYJdtDiyXBJpMUP3oE9pLj+sLq2sOkX0TUQd5PsaioO/SYEUUdWqNAzq4DAQelB/J9/SOjbKbDfktd5RseVjzqjCkiwrBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OcxVZjwV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OcxVZjwV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778735518; x=1810271518;
  h=date:from:to:cc:subject:message-id;
  bh=aqOV1mY/tlDOhAsTBbbdmifYKbofag9t7kIJKhAG01M=;
  b=OcxVZjwVo1XxTtsD9u0VLtIlYJw7XvQpgsOJI/1xd7rK8at11/l9cJcq
   9qV40TOaIDLReoRa2PCp64mK3RhkdrkhjLsspyF43fn9tsv2+lVN2yF3H
   BsaXtFAaYBgvJxJXoAroPqlCe/gUT+l9ciqwc/OAbcZmJfNUEykhBZTlV
   IWRIlvUu/xp75PHvsiqy2chP1Xv4f/dQAiqqcFc2KPFO0VdLPxz0+D9ig
   YC3IpjBv6148IZFcqscp1yoPgMfzma1epnRx/qGB7qbybMPafo+9owLcm
   QJ5qtAf/gTJ5bNCvmRjaBhFrz6I1OBBulutSVAMvobmMuH8ZXvuiLiU8s
   Q==;
X-CSE-ConnectionGUID: h06AulZBStSPuMi71tAKgg==
X-CSE-MsgGUID: vQCdw+/rRBaxeU//ALgDKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="91057360"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="91057360"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 22:11:56 -0700
X-CSE-ConnectionGUID: jTMD2EULTH2F63vBdhvVVw==
X-CSE-MsgGUID: evVYUWuYRLGdmQH04hOasQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="237302802"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 13 May 2026 22:11:54 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNOMR-000000008kz-3f66;
	Thu, 14 May 2026 05:11:51 +0000
Date: Thu, 14 May 2026 07:11:50 +0200
From: kernel test robot <lkp@intel.com>
To: Kendall Willis <k-willis@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Dhruva Gole <d-gole@ti.com>
Subject: arch/arm64/boot/dts/ti/k3-am62d2-evm.dtb: serial@4a00000
 (ti,am64-uart): wakeup-source: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202605140703.86bAmeBg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e1914add2799225a87502051415fc5c32aeb02ae
commit: d170388d5c80d3812811b02fe0ce13a5f90796d0 arm64: dts: ti: k3-am62d2-evm: Set wakeup-source system-states
date:   9 weeks ago
config: arm64-randconfig-2052-20260513 (https://download.01.org/0day-ci/archive/20260514/202605140703.86bAmeBg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140703.86bAmeBg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d170388d5c80 ("arm64: dts: ti: k3-am62d2-evm: Set wakeup-source system-states")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140703.86bAmeBg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am62d2-evm.dtb: serial@4a00000 (ti,am64-uart): wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	[[4, 5, 6, 7]] is not of type 'boolean'
   	[4, 5, 6, 7] is too long
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml
>> arch/arm64/boot/dts/ti/k3-am62d2-evm.dtb: can@4e08000 (bosch,m_can): wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	[[13, 4, 5, 6, 7]] is not of type 'boolean'
   	[13, 4, 5, 6, 7] is too long
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml
>> arch/arm64/boot/dts/ti/k3-am62d2-evm.dtb: can@4e18000 (bosch,m_can): wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	[[13, 4, 5, 6, 7]] is not of type 'boolean'
   	[13, 4, 5, 6, 7] is too long
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml
>> arch/arm64/boot/dts/ti/k3-am62d2-evm.dtb: serial@0 (ti,am64-uart): wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	[[4, 5, 6, 7]] is not of type 'boolean'
   	[4, 5, 6, 7] is too long
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
