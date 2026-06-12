Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9843FC5B3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 16:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781283131; cv=none; b=qHiseCnQlCXac54kmx6iPWA/GvntEnT2RjpyfzedUF+OUoe4APYpVH/YpX2eQprhToT3krV0FZ5ASCxZoFSou7qj1PUghsmcC6FGezfinTTe+Vg1QSAElrTOL7SwsiGmfT19Z18+j0NVli2MZhPu6IO8/FtzK4fp5v3iFpuIyIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781283131; c=relaxed/simple;
	bh=2tc52j/f4l60rZ7FcztdOAUzGdgJ+TT+P8SSE3qwdpQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kLJUlx9ABnUI3IKYiKFaCqujj3LZV9bIOWXQ4bXiosaYUdsWjNntLTWu3Trvt6wcb/O5imkuAl5QeLW4JncOir624PO4bNu2Br2UVbtVStmGqYLi8u5NWQxa5F+JAafjbimQ+7Ry5WZ8hBhXmWDkeRotAn5o6YmbuV9ZGkq0fjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O46TEbtx; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O46TEbtx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781283131; x=1812819131;
  h=date:from:to:cc:subject:message-id;
  bh=2tc52j/f4l60rZ7FcztdOAUzGdgJ+TT+P8SSE3qwdpQ=;
  b=O46TEbtxtefgvyaI7KRXiUmtzjvcrW9LQK5cOr6RuE+hKbs1E6OK16f9
   BY0cgS85VI7rFI67jZJzWQKluBFqYja3koGit3/y0Dl0xCX7V4DvYjmP5
   fm/XCIpakat52tiO/ujGvmDKsEd2vF27LH1kmlFZHmZ+5XstpiNOIwM1Y
   1LPNvymw1a031Wu9f9sUfJVAYRotmbx21/3SoBsqsoeL/OuN3F6p8G3yV
   pQZ2lxTWP3ldr7RW2p3zaimCWDSsbXgmpc1ARw8pI5aR6mVhgO6ZqvXRw
   MwRYoJGJOcRRXuHOwQjm9d3BO/HPg0KK56jWu2jaCUQeSUHSWG9gaVWo/
   Q==;
X-CSE-ConnectionGUID: wh01IQ7zTn27F2q/R0F/4w==
X-CSE-MsgGUID: KbWgXQoiSC2K11Cgq85ilw==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="82160859"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="82160859"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 09:52:10 -0700
X-CSE-ConnectionGUID: QMk5Km7EQ82Q//UAzOjMrg==
X-CSE-MsgGUID: vRaXCrZWTyKOVW/IaTEpmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="270526056"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 12 Jun 2026 09:52:08 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY570-000000004Hp-1bGP;
	Fri, 12 Jun 2026 16:52:06 +0000
Date: Fri, 12 Jun 2026 18:51:27 +0200
From: kernel test robot <lkp@intel.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: oe-kbuild-all@lists.linux.dev,
 Daniel Lezcano <daniel.lezcano@kernel.org>
Subject: [linux-next:master 6789/13336] FATAL ERROR: Syntax error
 parsing input tree
Message-ID: <202606121812.gcsVdOLk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
commit: b1c8ccdbd4e92db05548bd3ad2a866bacec07490 [6789/13336] dt-bindings: thermal: amlogic: Add support for T7
config: powerpc-randconfig-2052-20260612 (https://download.01.org/0day-ci/archive/20260612/202606121812.gcsVdOLk-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev10+g5d839523d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606121812.gcsVdOLk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606121812.gcsVdOLk-lkp@intel.com/

All errors (new ones prefixed by >>):

   Lexical error: Documentation/devicetree/bindings/thermal/amlogic,thermal.example.dts:59.27-34 Unexpected 'GIC_SPI'
   Lexical error: Documentation/devicetree/bindings/thermal/amlogic,thermal.example.dts:59.38-57 Unexpected 'IRQ_TYPE_LEVEL_HIGH'
   Lexical error: Documentation/devicetree/bindings/thermal/amlogic,thermal.example.dts:60.37-45 Unexpected 'CLKID_TS'
>> FATAL ERROR: Syntax error parsing input tree

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
