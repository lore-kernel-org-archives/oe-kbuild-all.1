Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BB248F846
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Oct 2026 23:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791934977; cv=none; b=DTSxnalXJXt4P7DzH1uX6HxfHpS0JbYDwRAPEpmqUG1cxn2dVyMjbtIN8JrHvCarTwdiU0yipJfCpHQttv9gGsCN60JGCkjl1PTkaeJp/glYI3TzW+rEpH4IHNgf5jRi/XbSsTO+qB55slgtb2XZ/2AV/L19DT/1GHcb4ZT/pM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791934977; c=relaxed/simple;
	bh=ZqBX1F4TzVFuwg6P7ND9qgmJiW8UuB2qjqC4M2yGsIM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FIs27+PpbkKsWglxhf7M26uzvWLv0mcercYeNeGW/JPalWmFKi1XtXQXvjIieS116mT/GcSeWb6uVmq6h3w/kkBxNALnKQybBmFOr9/e7tIedzcZBNp9SIoywjoWOBvPa/TmLdwkJcWD9AkGtr98zGFKf/c8c091lLulBw7N6zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c7t1ptYG; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c7t1ptYG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791934975; x=1823470975;
  h=date:from:to:cc:subject:message-id;
  bh=ZqBX1F4TzVFuwg6P7ND9qgmJiW8UuB2qjqC4M2yGsIM=;
  b=c7t1ptYGDXfQOkNyKkBs9ChAqNCtlpLLMp0Wr6ckv+QFaDvgm4CgED7e
   erRLJcjpV71im9WDQMRdTUoNOhrVUMkwc+vMJ36tcPJY/WNVPrBxKun4Y
   /LSZey+b821GA/zXLwwsRLe41fyOFY1UCuQN9foLNK8vYt5ykwiSU25ih
   p2HSBT0bSHF6gzL+D4WyioEY7n0nuUqoyk3ZWj6LpG+K/y/V+R8lK2M6A
   Gaz01ok3Ef5bhcff8s/EWtoFZUV9gF6QThKLcwjje3V5ukpMpWbh3QyUb
   7qVSKdjI59XdhpDQact+dMl/MPzIcEDohwgmrygdev+2e0j7fTgJZhKtZ
   Q==;
X-CSE-ConnectionGUID: KBXx/bUmQkGdWHqFYRPIwg==
X-CSE-MsgGUID: kFQyXw3cSVGBG+EDbqVUWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="693350"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="693350"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 16:42:54 -0700
X-CSE-ConnectionGUID: Fvw3PbHzT2Ga3dqf+RfyvA==
X-CSE-MsgGUID: gJQQYdbrSeGBZEc3a0xdwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1633581"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 13 Oct 2026 16:42:53 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGm8x-00000000AkB-0ET1;
	Tue, 13 Oct 2026 23:42:51 +0000
Date: Wed, 14 Oct 2026 01:42:20 +0200
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [linux-next:master 15606/16498]
 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dtb:
 nand-controller@ff100000 (xlnx,zynqmp-nand-controller): Unevaluated
 properties are not allowed ('num-cs' was unexpected)
Message-ID: <202610140136.3ah4vXZA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1fffefb00cc0b0da1f2ae24e3d33364530ea6515
commit: 8e301fd598806b9480b00a2c16314140de7c4db6 [15606/16498] dt-bindings: mtd: arasan: Add "power-domains" for ZynqMP
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261014/202610140136.3ah4vXZA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261014/202610140136.3ah4vXZA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610140136.3ah4vXZA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dtb: nand-controller@ff100000 (xlnx,zynqmp-nand-controller): Unevaluated properties are not allowed ('num-cs' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/arasan,nand-controller.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
