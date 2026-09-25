Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F8034FF79
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 10:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790330863; cv=none; b=f/Opx5VIBrvwZNAPdlV9tZ4JIsYun7yiedLf+sCbchS7hc4RlROXUJEf76MvgktpjoXJXyATZqKKv4aDZVllGlQQ5KOvE8z1e8ee6mPTLIBLo0dWFDReqj6xSFk4dFV3pF3I4sOR8Ilt6veVaJUy1JY1xVEQU4Wb4zcZujrFmLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790330863; c=relaxed/simple;
	bh=6aHDM30Rv6T4QBw+7mPW8AfaV0r/c3CaDIKEeIe0R+8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ryxZFqwD3cecFPzNpsisJV9RAUPiVrl2kdLVleYg//zxpcgs9xDn3bDMybMFX1ynRBe9ypVj/Vgh4UMQBO5+C6AxdFRzoSFpKZ0/O+HTCDYMuy93n+xSTOmuLHMpZZA4mLZyRzDDHgaa0AjHUleI1IPigIrjc2kI9a9M+pH3Khw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l9PFNbX4; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l9PFNbX4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790330862; x=1821866862;
  h=date:from:to:cc:subject:message-id;
  bh=6aHDM30Rv6T4QBw+7mPW8AfaV0r/c3CaDIKEeIe0R+8=;
  b=l9PFNbX4FLq1x3wuNj/szntYtyTRtUMulbKEmetAdw/QYwOjTazmPzTq
   gQGGiTM1jSI+O4Ns2J+Siwpaf+uGNgDn1L6dtC0w2/AC9Bxouh8fwzVnj
   51aY4pxnKbRnJudLuIw/PRBg00Huts4SkPHPATqvwmcaJs384MXn4PJPj
   oNshT5MpSUv5SGZHgTOMXROaADHbJ4up/ZEFH6LE1rwN+ZnGG6XxjRLfO
   Ty6QuiL8D5mBhoiVGhPhnAb7r8Ogciy8gHBKNktC+8e8UaAbxAl57CWOv
   CgMZHZtnHJVVinYISg0eK5akJ8P+F3tIsKW4bGC8zV0Hn9cpYckOiXRsS
   A==;
X-CSE-ConnectionGUID: Y/fGOb5sQPuWueBXaQctsA==
X-CSE-MsgGUID: ZQcMoZcGRc+JXTSZDheW8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="101641078"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="101641078"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 03:07:41 -0700
X-CSE-ConnectionGUID: /0jRm9TTRpKUPQn6cP8JlQ==
X-CSE-MsgGUID: CQ8dJ/FRR/yvny+Jec42FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="270771413"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 25 Sep 2026 03:07:39 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA2q9-000000000g6-1cMO;
	Fri, 25 Sep 2026 10:07:37 +0000
Date: Fri, 25 Sep 2026 12:07:11 +0200
From: kernel test robot <lkp@intel.com>
To: Joseph Guo <qijian.guo@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject: [linux-next:master 1369/10113]
 arch/arm64/boot/dts/freescale/imx93w-frdm.dtb: linux,cma (shared-dma-pool):
 Unevaluated properties are not allowed ('alloc-ranges', 'reusable', 'size'
 were unexpected)
Message-ID: <202609251239.kDjJjTEY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
commit: cac63565a186028ed6c6564c277910cdfe592828 [1369/10113] arm64: dts: imx93: Add i.MX93 Wireless FRDM board support
config: arm64-randconfig-2400-20260921 (https://download.01.org/0day-ci/archive/20260925/202609251239.kDjJjTEY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251239.kDjJjTEY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609251239.kDjJjTEY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/freescale/imx93w-frdm.dtb: linux,cma (shared-dma-pool): Unevaluated properties are not allowed ('alloc-ranges', 'reusable', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/freescale/imx93w-frdm.dtb: vdevbuffer@a4020000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
