Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635603;
	b=NJx7xO85qeh0JoryUqFI8sO67cP7fvLjIisZm8428wCz3EUg7GaTo6Ex4bwZsB+UttO6
	 zEzOrLmvVN23kQBgUSq59CujlYcw1gfSiymOR28XIaOwSFOE4K3xnCH4PcXaZbQ3tyh65
	 ebgM0Fd1Fr1BUHWkJW/KvJN1l7nHsCLdVdwGfsJqzIiesXc6Q3bJVdazV0byugml1sspF
	 eFrOxLyjmOnFyjoyj8ZjoWXbYr9vnsEia59X0TB9ZGhtYdoXwYyLEfEua0LaRKPmhKC8/
	 dwHcgCCvMAmhwH1T3qXvQg8w/SNNFhJYvNmq/KlTXpaWNpravysPUwtySXWaFSzPWqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635603;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Hd545vBhpMv1XoWhf8EUzRO63kSNT9l/DjBNTB7Mu1c=;
	b=s9KBn7FALYxkAnILOT8BZm6Ln5y20Mf4w5jGHiGVA1f3jeFCAJ1kdnSJrWe79dH4D684
	 ho9WVj9c1YctnvXnInd+MUiQyHtXNY5oYh6i5iYHkU06r3TdlBAmOBxfIpa4VWW21wrmb
	 gPR3KnbmCVfXUSFuNLopocJC4w9YGUUj9wbeByDor3ty4i6ELeJc5kbPcLBOqUxvN+2io
	 ZGdTJTtMiPioFnB7+T5SoI1Ooeyx2BzvF9vHIhYDu25GNRGj5jWU2qgWQhOcZMyj2oXID
	 PhW8SoAmUkHklZrJGxMFz2kutanXApP9OuTQxtR80gPvCpo+WIyJeEwuDMjNtjYPG4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I9X40eic;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A26606A327
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Nov 2026 19:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46A26606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I9X40eic
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795635602; x=1827171602;
  h=date:from:to:cc:subject:message-id;
  bh=xwTcBsDQaBoK0a2RuBsNaET+NfNwQTePnK7F94PtwV8=;
  b=I9X40eicsols0KwQsiafk09D95y+z4+YQWJr/gc5Pj2T86gjy0nqc2gw
   3aPw+FIjweMJ9uK5Hu5+pXOZ/H+iO6ZVNK8gLsPpcdivkLdDo35jHs5r4
   zrcdqbW38qQIBKod9NeMssm72++bXDCpo7JJ0sV+Hdw9rhfNYS17AfmjD
   DwVYXRw0r1niHtecqP5/LEiHK1IB47wLp99M3lp62P9x+tkKbhvOZGke5
   Vx89zaTG8azW13wjeflzIcFhj4X6NwlpMtruxV5rMBe7ahPaj6VnsVa9N
   BZxmWDzq9u/lPgqE8QtC9scLV9yAqe1OdFrkrlP4+xMQXl6mdq8Vnh3ho
   Q==;
X-CSE-ConnectionGUID: MroAwlAiQGqPkB2Mg8IVjw==
X-CSE-MsgGUID: vuS12WgcTV2vI80K+B+TxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4536643"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4536643"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 11:40:01 -0800
X-CSE-ConnectionGUID: BAt440ldTxy7it8WbaZleA==
X-CSE-MsgGUID: +YTnWM1lQ/+R7NklNC1VBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11835849"
Received: from igk-lkp-server01.igk.intel.com (HELO a03d4d989450) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 25 Nov 2026 11:40:00 -0800
Received: from kbuild by a03d4d989450 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWIqS-0000000004b-2ltA;
	Wed, 25 Nov 2026 19:39:56 +0000
Date: Wed, 25 Nov 2026 20:39:21 +0100
From: kernel test robot <lkp@intel.com>
To: Likun Gao <Likun.Gao@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [drm-amdgpu:drm-amdgpu-next 190/243] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <20261125203331.xpC788jb-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://gitlab.freedesktop.org/drm/amdgpu/kernel drm-amdgpu-next
head:   a69db917063c539fa09325ea22f3ff7b0626b478
commit: 094d34eeee1d6ca5c564b6463adcfd4d6d3cf5a0 [190/243] drm/amdgpu: add new sdma pkt header
reproduce: (https://download.01.org/0day-ci/archive/20261125/20261125203331.xpC788jb-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#120: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:97:
+/*
+** Definitions for SDMA_PKT_COPY_LINEAR packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#283: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:260:
+/*
+** Definitions for SDMA_PKT_COPY_PHYSICAL_LINEAR packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#494: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:471:
+/*
+** Definitions for SDMA_PKT_COPY_BROADCAST_LINEAR packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#701: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:678:
+/*
+** Definitions for SDMA_PKT_COPY_LINEAR_SUBWIN packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#935: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:912:
+/*
+** Definitions for SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#1188: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:1165:
+/*
+** Definitions for SDMA_PKT_COPY_TILED packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#1422: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:1399:
+/*
+** Definitions for SDMA_PKT_WRITE_UNTILED packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#1564: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:1541:
+/*
+** Definitions for SDMA_PKT_WRITE_TILED packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#1736: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:1713:
+/*
+** Definitions for SDMA_PKT_PTEPDE_COPY packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#1838: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:1815:
+/*
+** Definitions for SDMA_PKT_PTEPDE_COPY_BACKWARDS packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#1946: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:1923:
+/*
+** Definitions for SDMA_PKT_PTEPDE_RMW packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#2067: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:2044:
+/*
+** Definitions for SDMA_PKT_REGISTER_RMW packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#2125: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:2102:
+/*
+** Definitions for SDMA_PKT_WRITE_INCR packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#2218: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:2195:
+/*
+** Definitions for SDMA_PKT_INDIRECT packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#2283: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:2260:
+/*
+** Definitions for SDMA_PKT_SEMAPHORE packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#2333: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:2310:
+/*
+** Definitions for SDMA_PKT_MEM_INCR packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#2383: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:2360:
+/*
+** Definitions for SDMA_PKT_VM_INVALIDATION packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#2446: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:2423:
+/*
+** Definitions for SDMA_PKT_FENCE packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#2533: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:2510:
+/*
+** Definitions for SDMA_PKT_SRBM_WRITE packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#2577: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:2554:
+/*
+** Definitions for SDMA_PKT_PRE_EXE packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#2608: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:2585:
+/*
+** Definitions for SDMA_PKT_COND_EXE packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#2666: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:2643:
+/*
+** Definitions for SDMA_PKT_CONSTANT_FILL packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#2736: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:2713:
+/*
+** Definitions for SDMA_PKT_DATA_FILL_MULTI packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#2807: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:2784:
+/*
+** Definitions for SDMA_PKT_POLL_REGMEM packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#2896: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:2873:
+/*
+** Definitions for SDMA_PKT_POLL_REG_WRITE_MEM packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#2947: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:2924:
+/*
+** Definitions for SDMA_PKT_POLL_DBIT_WRITE_MEM packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#3011: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:2988:
+/*
+** Definitions for SDMA_PKT_POLL_MEM_VERIFY packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#3131: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:3108:
+/*
+** Definitions for SDMA_PKT_ATOMIC packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#3222: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:3199:
+/*
+** Definitions for SDMA_PKT_TIMESTAMP_SET packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#3254: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:3231:
+/*
+** Definitions for SDMA_PKT_TIMESTAMP_GET packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#3304: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:3281:
+/*
+** Definitions for SDMA_PKT_TIMESTAMP_GET_GLOBAL packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#3354: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:3331:
+/*
+** Definitions for SDMA_PKT_TRAP packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#3379: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:3356:
+/*
+** Definitions for SDMA_PKT_DUMMY_TRAP packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#3404: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:3381:
+/*
+** Definitions for SDMA_PKT_GPUVM_INV packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#3503: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:3480:
+/*
+** Definitions for SDMA_PKT_GCR_REQ packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#3567: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:3544:
+/*
+** Definitions for SDMA_PKT_NOP packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#3598: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:3575:
+/*
+** Definitions for SDMA_AQL_PKT_HEADER packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#3652: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:3629:
+/*
+** Definitions for SDMA_AQL_PKT_COPY_LINEAR packet

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#3829: FILE: drivers/gpu/drm/amd/amdgpu/sdma_v8_0_0_pkt_open.h:3806:
+/*
+** Definitions for SDMA_AQL_PKT_BARRIER_OR packet

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
