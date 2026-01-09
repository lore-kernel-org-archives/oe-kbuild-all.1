Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0670F2030A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 04:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767934523; cv=none; b=XVmqdWovZRl9IcV5HoDxW1nWnqrgznsaiZhGMp0oiECPxId2v7Lw2XNT4ksvv2O8tRpSN95W5r+RxUiQTfAOhwJJasnjhQwftFSHwyvUMhzzh50WCxCP+JQNzDxHlhhRtaIMKXuZs+cfanNHk/HgmqUJpNNsbVZP7I/RzhT3+Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767934523; c=relaxed/simple;
	bh=QdluE71ZMX4HCBO+Sut3Zx3aT/qB2TAAkOB7AtMdKls=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RwDkl738TWZMK/2HsqHgyJErHHtXtrs6PA5agjQv48/Spvmu/ZBLV5XvH0v0oJOeeQEc8Bj4NhE62LRJOaPs1k6TnVRzrHGU4H0hvv2PYqf4sDSxrfwOcpD69CKi0t+XqtnRj0w0NZkCf6QCZgyUWt7j3kOOw/CMWKHk5MsUzdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DdmppdCt; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DdmppdCt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767934521; x=1799470521;
  h=date:from:to:cc:subject:message-id;
  bh=QdluE71ZMX4HCBO+Sut3Zx3aT/qB2TAAkOB7AtMdKls=;
  b=DdmppdCtE6G67MhTirHNVQi2XcaiWzkl71CqK56/3xffbVA/tgYJMGdN
   D3ExmtHZkniMCYrCAamUCuTsSCpODurVPzR1mE5xALUTobou0tuv9l4pf
   /OnEcJGa8gXcgoBFOYVR139N5hxss2cs7fC3Nu7pMgGC0mhS+iIn5xniB
   jxf4tUcCZDTRrUqrzw4eZ26H86xrJWz7bagAvhF4vY2NQ+mEssQw+12Lx
   kKiFe65p8vWf4rpaX5g/j3sZDBuiq3cvTqC09M/Hh9n0U8+ci+j8IEWh4
   eQ4wKvlak1onfmsYZXykIQBi2zCdv8mBWyF1jzvOOMVVVOSREvPoQMZ4J
   w==;
X-CSE-ConnectionGUID: YSq/hz1fTtu+UhrLUDstnA==
X-CSE-MsgGUID: YnTcUPfqSnek27L3rWtRow==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="80037578"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="80037578"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 20:55:21 -0800
X-CSE-ConnectionGUID: 9qJumn8dQEW0BHKvsZavuA==
X-CSE-MsgGUID: 2S1kgmC6QkGHXJEdVir6dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="203450697"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 08 Jan 2026 20:55:19 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ve4Wq-000000001ym-1UqN;
	Fri, 09 Jan 2026 04:55:16 +0000
Date: Fri, 09 Jan 2026 05:54:38 +0100
From: kernel test robot <lkp@intel.com>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>
Subject: 
 arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtb:
 switch@5f (microchip,ksz9893): pinctrl-names: ['default'] is too short
Message-ID: <202601090506.ihUfHn7y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   623fb9912f6af600cda3b6bd166ac738c1115ef4
commit: b26fdab2e1f260cb88eb5686a71da0b2c0490969 arm64: dts: imx8mp-skov: support new 10" panel board
date:   3 months ago
config: arm64-randconfig-2053-20260108 (https://download.01.org/0day-ci/archive/20260109/202601090506.ihUfHn7y-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601090506.ihUfHn7y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601090506.ihUfHn7y-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'fsl,ls2088a' was expected
   	'fsl,lx2160a' was expected
   	'solidrun,lx2160a-cex7' was expected
   	'solidrun,lx2162a-som' was expected
   	'tq,lx2160a-tqmlx2160a' was expected
   	'nxp,s32g2' was expected
   	'nxp,s32g3' was expected
   	'fsl,s32v234' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtb: /: failed to match any schema with compatible: ['skov,imx8mp-skov-revc-jutouch-jt101tm023', 'fsl,imx8mp']
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtb: switch@5f (microchip,ksz9893): pinctrl-names: ['default'] is too short
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtb: /panel: failed to match any schema with compatible: ['jutouch,jt101tm023']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
