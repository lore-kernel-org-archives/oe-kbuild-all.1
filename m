Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794115217;
	b=vyfwJEJFXG+/49iImfyXeV6gRFuvQ5r7FpHeaQyFaqLlSmo8H4Dtg4dWYkKMmSz/Su5x
	 h/4auX6H11cL3HZ7b6p1dKBSUBZ6HNyv5cM/t88jyYq0G/SCOmJqZWVX0IuEq8DPq3iL/
	 ovaYJrl2qcLeIDDiULCP0nK0DQivSr64PvQPgoAS2jU4fo2rsv23pu9XEBt/zdRBq1nfm
	 +U0VVMJGAgqCKCfVgk7ihDN3BoR7o52O65mOYiTR0iHKf/aePFWtSg6mvAFv1AYuqEZKp
	 LZVjbAHwKZUnr/OsQgkQk0O70w8GXg9hrAWLJQSYnsDND9Ulw7nrGjDeQl4xOmChfPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794115217;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Ru9NUOugr0AkRMHBKXMYTMA5UjhCAQVFyoKWd52IN3w=;
	b=x+aufJtdfL7r+4GOZHQXAJKHw2cd/pxNeu56PwlyT2hHi8/GwrwNf55MpCWtP1mYhsZI
	 l6ffDV5YAOmTjoJup+jKvZ+e28IBZAUDrq3cQDPctbg3N3hBYi2CGOqcAKAymGsOWwnIj
	 9QYpb0FTd/wiBWPDkL0bH8P/76fwRiP33YvGbllSsU/bd9qabT2tnPB0z+UejdKAdUYQs
	 Rhlv7DDH9+SPAKIYeBTqbcJ3w8/Vj0kkPVcBi8y5hfbKbAAIgspNMyE545gKgQuJGWhIN
	 6G6EG6jHItlWJjU/tZ7P3OyYLmDogxmE4ewWBtXCFaJ3bGGRkZQsj9wuECLugFxhvMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T8WoJLpf;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A33606A31C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Nov 2026 05:20:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4A33606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T8WoJLpf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794115215; x=1825651215;
  h=date:from:to:cc:subject:message-id;
  bh=oM4FMIi5+CkybBcU8Mt58ITW8mtJRYDOMCQ/PyduwFI=;
  b=T8WoJLpfPDFBrxowYoDkPk3PSPFbHbLrROE/rbvFAuTUhMCEakxCNLwN
   lGuxq99QitMsG1Qq5DtrtRef3Jmy8rOfcqlO8xp7RFhCV2RMz3uvBe4PK
   Az3ub8E3MT8n77WcVQjG9TSU3hd2kWk4Txa1ROj8TACFRJDqbkBM1H8q6
   S6vdtdEDPesrNGnOMjG+YUUL5xU+wX55k6hgYv2VotvNS2iLZIDcNnzoh
   w8w0PJ4aJm8CiZ/aghxnqv9oJ5g2vIjRupjtbaV8mcBEX0iwSOWQdc7+/
   EshThLuJ05/qAszeM6hP4Ozy5NHIFxRgolv9yZcpwVlPQ8N5H718NSQ2A
   Q==;
X-CSE-ConnectionGUID: 9LyJitG1SQWs6jKGDRfYNA==
X-CSE-MsgGUID: kdoZtI+kRWCRWHC2wH+ZKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2917883"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2917883"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 21:20:14 -0800
X-CSE-ConnectionGUID: 7jUezlpDQNmafZgfM7NwBQ==
X-CSE-MsgGUID: t5yXXn3URzquZDrhl7Lrww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7936053"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 07 Nov 2026 21:20:13 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPvK6-00000000B1M-2yyH;
	Sun, 08 Nov 2026 05:20:10 +0000
Date: Sun, 08 Nov 2026 06:19:11 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.4-rc 88/154] htmldocs: Warning:
 drivers/net/dsa/mxl862xx/mxl862xx.c references a file that doesn't exist:
 Documentation/networking/devlink/mxl862xx.rst
Message-ID: <202611080607.3KBFUlka-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/frank-w/BPI-R2-4.14 7.4-rc
head:   674a64f97be4d25967f31216ffe7eaefdabf827f
commit: 6a437b7be07f8f29f1f3f13e027468b07ab75bfd [88/154] net: dsa: mxl862xx: recover switch stuck in MCUboot rescue mode
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.23, Python 3.13.5, on linux)
sphinx: sphinx-build 9.2.0
reproduce: (https://download.01.org/0day-ci/archive/20261108/202611080607.3KBFUlka-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611080607.3KBFUlka-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: arch/arm/xen/enlighten.c references a file that doesn't exist: Documentation/devicetree/bindings/arm/xen.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c references a file that doesn't exist: Documentation/networking/devlink/mxl862xx.rst
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.h references a file that doesn't exist: Documentation/networking/devlink/mxl862xx.rst
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/devicetree/dt-object-internal.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,^Documentation/scheduler/sched-pelt

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
