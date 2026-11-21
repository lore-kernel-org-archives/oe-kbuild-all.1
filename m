Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795253283;
	b=Hd5kxyNks/T/s4DdIPX4LXyWeRIlj7mapcmf9IZUS0UfUMQcMOFwMh4TNewzCSSaaHaQ
	 jdqtFU6hH7d3OE+z+UkBfJyy4KrJsoGMdBev1qG8/M5RxSvcyQ+OK7srOjDonMGXVGJKV
	 ZVTgxFIZc6ydRqfXfSg0qIVzuPCa2rpiSZaJrNM0QwjXmhlFmZPtV2r0lmP6aUVTn6yJT
	 +16Xw9LhnbsWR6c7iUVxtJY6XB87obvmUzNmHVhO/UCahyxAZJ3pu7FTKTH+V9ESBMqEb
	 mvl3mmoFXKslamJWK9BqqxvuSYes1AvxX4e3YejSoX09MAl9KQ8f0ny2X57F5+BHYqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795253283;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=MQFl1WmMhAgSuxVKiP+GXsd5yUimRz1PCUaWA+EJIV8=;
	b=MLh+Fe2Sr1CRT1zJcFQO/2t6Rb0BTAFprVMTfnPFDb+HfotF4yFJstxsPEPbbSVn1RXI
	 kE9RyyAUltQLbx1kIXC7HOoLomjnLcdHgxjbFtQ+CtqOT1y06T5023anJ66P9yvAP5vpK
	 41phKn72S6thgHWRYMCziG6R9+LEqAaDdRd1KAEpXSnW36wmLAyJ35nljdfH1oa4YPGmG
	 UHkQMD1vF3G+8e2xwtGovpcSTO46IztvuzBQfIIghlP9v/T19N+9kaqjzYhh1tNa6FViL
	 gjqe4VlLuDqc6av45eEP9nUMFtHPTXPb34BjKF+/M+XBx4v+LbgfdmyU6AVjcFD7tow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="BYA/iUQO";
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547A1606A32A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Nov 2026 09:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 547A1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BYA/iUQO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795253282; x=1826789282;
  h=date:from:to:cc:subject:message-id;
  bh=kYHoj80OBUXtZ9fLI+c0BwNATFmdFctKymi/hAzwkdQ=;
  b=BYA/iUQOL/x4RX27CoLwhngj4rWCxhkNBKT58f7YGh2qgNMO3YpR+zd9
   z9RJBldeE5bbBZrf12J36HxKGd3WyONxOFmL9r9uczGZmBd27pqUqLcTq
   O9O6x1ntsCNdO99H0R0OujNIQtrj5hoR0aMMuRRLWs5hE3QLI0bLRdPoE
   cYPAqkd0xdKQ5xlF2JqFz7ofA5K1d0WRzV07v4LtQ/bWpTR1TZT1b1QPc
   gDAtloJhi780yAC8ALMfyYCD9FZmu8AQwS1xp9Tv6qr001b8m4Kwhbi3p
   9h7tH/bKX+y/EJyTl0LVCEIwL+ZELHfuIfLAodohMSsY9goZBdhq7QZRS
   g==;
X-CSE-ConnectionGUID: UhWEDoeCQ4mrNbDbHwtABw==
X-CSE-MsgGUID: vvD2F5s1QReliRw7+FT02Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4018251"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4018251"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 01:28:02 -0800
X-CSE-ConnectionGUID: KJ0R2tfuRhCs/lgdkiqrrA==
X-CSE-MsgGUID: cjaRQ19oR5+wJFTmbH61OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="11157352"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 21 Nov 2026 01:28:01 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUhO2-000000004I1-2J5p;
	Sat, 21 Nov 2026 09:27:58 +0000
Date: Sat, 21 Nov 2026 10:27:43 +0100
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bpf-next:master 38/51] verifier.c:undefined reference to
 `bpf_prog_offload_verifier_prep'
Message-ID: <20261121101737.oofmFOUM-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   9867c61abbd44f7053a871566b3d982f62c6d8dc
commit: 09c84023b0b4ef040548929859de81177a15bab2 [38/51] bpf: Verify in passes
config: sparc64-randconfig-2000-20261121 (https://download.01.org/0day-ci/archive/20261121/20261121101737.oofmFOUM-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121101737.oofmFOUM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261121101737.oofmFOUM-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: kernel/bpf/verifier.o: in function `do_check_block':
   verifier.c:(.text+0x24d0c): undefined reference to `bpf_prog_offload_verify_insn'
   sparc64-linux-ld: kernel/bpf/verifier.o: in function `do_check_all':
>> verifier.c:(.text+0x2770c): undefined reference to `bpf_prog_offload_verifier_prep'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
