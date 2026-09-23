Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D88449B21F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 11:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790163789; cv=none; b=dF91Z+AcW8318vDn8Qd2r2eVBGD38EeWpDxmTYth2xuDunzFuImwIu3Kv456bnnfijuQ5jB/uykDoHnUBdDCmOgxnBsNj4ed87qGvf31Eqtm95BuFLvmzVtUBGqepLEPgY7i0PmWTrkkPBVU/a3K6231b3iwRQY0iM139A2u7ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790163789; c=relaxed/simple;
	bh=WiVpX675pmMt0XD9sbezc0iG7Lx5Cp+AA+PF49FSqz4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OvMCswPPRXYlGkVSpR4wcVRQca/Cqst3c88W1nobsI2EgXPA0bNIl5wYWT/xNnoMdazqa7wzroCOAuWEvHnP2LNQQnPGmS/3tpdHaLpe9stqSZz+lTTcAPB3O39ZFHMlleYhqq1ZS/1rXxtxO9dPr88GnFptoDHzV0Mz+Ja4Ywc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BDkDc9fD; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BDkDc9fD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790163787; x=1821699787;
  h=date:from:to:cc:subject:message-id;
  bh=WiVpX675pmMt0XD9sbezc0iG7Lx5Cp+AA+PF49FSqz4=;
  b=BDkDc9fDh9oJA9NKNGV9rp5fg9m1/P1DqLTGmeClcbELLU6zID9C/kAR
   /P7dMo/JaRq9FZyM9tuGQyX5ZkpRyXPv3o5C+iwn8pXEZy1gSlOoyHjVP
   t1hZWuO06CcYrVfNvwMoGbRPi0umpBHlyVjsfZkXg2d0JM0Q7/46sQm0h
   CFjfF49hghFpLTRt5gbPb4N6Sl4Ql1t/MMSraAZBkvEAYIWSADjQZj4Qs
   Tr7jo1kAUmmur31k2b7HeI/4h6gMtGMvi8mloEM67C7pBpahArS69oRe/
   QVvJUK5RIv0ndLrA5tKrGdPs74VegesGRBo0oIMleoudrcPMC3EM/qI4i
   A==;
X-CSE-ConnectionGUID: 5jRKwhjERWaE682SlwbJOQ==
X-CSE-MsgGUID: Bchx55tvSZuQI2lYgVnFuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1364409"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="1364409"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 04:43:05 -0700
X-CSE-ConnectionGUID: Xx3UnJhgQs6j3SQymjzTqw==
X-CSE-MsgGUID: N8BsAHQVQP+7tgFkuqbmfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="281648911"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 23 Sep 2026 04:43:02 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9LNK-000000000dj-2uuz;
	Wed, 23 Sep 2026 11:42:58 +0000
Date: Wed, 23 Sep 2026 13:42:01 +0200
From: kernel test robot <lkp@intel.com>
To: Joseph Guo <qijian.guo@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject: [linux-next:master 1369/8910]
 arch/arm64/boot/dts/freescale/imx93w-frdm.dtb: linux,cma (shared-dma-pool):
 Unevaluated properties are not allowed ('alloc-ranges', 'reusable', 'size'
 were unexpected)
Message-ID: <202609231349.1mBcYySl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a8c591ed6b672915e0be57843f943a2a723aff40
commit: cac63565a186028ed6c6564c277910cdfe592828 [1369/8910] arm64: dts: imx93: Add i.MX93 Wireless FRDM board support
config: arm64-randconfig-2400-20260921 (https://download.01.org/0day-ci/archive/20260923/202609231349.1mBcYySl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231349.1mBcYySl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231349.1mBcYySl-lkp@intel.com/

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
