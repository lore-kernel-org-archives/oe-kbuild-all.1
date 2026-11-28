Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795864045;
	b=GCdDuSNjOMW1aYg9Jst/q2d6pu1w1okJkNkHOVz/XUGPvHBnEWTUJ1hz4z+VT4au5kF9
	 ymbeoV/YUVlt2ivSlQPCdxHOwgeGeJElQOjvT49TwPLss0v9MA1hskgwP4RdGBmp4Alvw
	 pfwW8FfqHSvhMCnrV8gz18+5GyU+DH0RLAqrehABkadZLfN57aJS+btrkQgLgzO2dki5w
	 Nv35epx0KKPlvXjko1Xb7bS8dA+TzLgA05DJFDK1tVjVeXrJCepFZV9qFkL3ZtW1Xoitd
	 SyOWqupJz7L9efzoZmpxubw6+i1JOTurIdQdyCD9awedpkLiaSJkq41fkqM2AlsuWKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795864045;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=1UTKvTNzH8jU0mkZUlp/fSSc9+DNSj/C8DPvhjDwKdk=;
	b=TquZkbt0PcYFQ4pBWDYJxBhPN9cQfwT75UtwbNkHDIZXjw8fh3A82SOTtoTMMb04dXIi
	 aKjdQZJps8IhHnt6GwXCF/r80pz6w0Lxo5NahY+S4O6SAG3Yz9v8cQbqyxHAPUu5UMMHL
	 oaMPQZ+CrE9cD4TxgvOpsnICpkctEWAEP5AvdMWMjPtumwyrIEG3nKfwJeQLHMvpL1mX+
	 7279XbAMilN/Y6U5JzYomN1dAPI/KujayXfOvdgu3NrIq5o3eOPJVY6/VuUgM5MH323ws
	 DJ9hib4wqR6nb8GUWn3kY/OdDGfPfCs+OE1fA2fUOy24B7l9PJ8t3jTRDPSaT6mjrjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SogjkICZ;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAC4606A327
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Nov 2026 11:07:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BAC4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SogjkICZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795864046; x=1827400046;
  h=date:from:to:cc:subject:message-id;
  bh=BzwS4580ttJj3h09y94A8eaAf4HAK6hrBAHNfEzlY74=;
  b=SogjkICZR9ZThO2NsFVlIYm4/Ylf9xviWiEyKBiPhBl89z71Y827H7xM
   eP8poczTv/RDkQLoPMU5c8MbA3EYqQpVm5Y5gY0kMfnd6Swluk61Nl9bd
   w5Qg+fy0XKUUPsO7VA2xAULBT5x+AHMneJOrPSCBxG9IJ+TZKdXrEilyc
   k8KITBFq2FMFJmiHTXNvswJXpzQtdF+7RCM9Iv90nmdC+HBogu05J24ww
   fo7L/tE52frzPvlLPCuhAXOAoWTzbO6CE2Eto8Es2Oq1eDYoGVPO6qjcJ
   en+MQiOv0ZtZrxoYoQkI/OuGuIe5lRPXJq9Hh3NTouqNNEj5KEu3bYp2z
   w==;
X-CSE-ConnectionGUID: 4vviUsBrSE+xow4x49iFYA==
X-CSE-MsgGUID: abcKrCPQT2S9B6kNumjBsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4771559"
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="4771559"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2026 03:07:23 -0800
X-CSE-ConnectionGUID: KO6TOssrRT+/PcTqpMuG4g==
X-CSE-MsgGUID: pISKHny6TGOqYJfPrEcRyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="12416828"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 28 Nov 2026 03:07:22 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xXGH1-000000000ZU-0fm5;
	Sat, 28 Nov 2026 11:07:19 +0000
Date: Sat, 28 Nov 2026 12:06:45 +0100
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Sohil Mehta <sohil.mehta@intel.com>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Subject: ld.lld: error: relocation R_PPC_ADDR16_HA cannot be used
 against symbol 'virt_phys_offset'; recompile with -fPIC
Message-ID: <20261128115906.0jcqIVz1-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7cd8495c0f16275c4f9abe1cef09a7b5fcd6d046
commit: 238be4ba87605da69de2131e8736be7a0d299e00 x86/microcode: Refactor platform ID enumeration into a helper
date:   9 months ago
config: powerpc-randconfig-r2309-20261128 (https://download.01.org/0day-ci/archive/20261128/20261128115906.0jcqIVz1-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 578b1f2d6a9776b63cbb6b86f4cca6208d429f48)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261128/20261128115906.0jcqIVz1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 238be4ba8760 ("x86/microcode: Refactor platform ID enumeration into a helper")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261128115906.0jcqIVz1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_PPC_ADDR16_HA cannot be used against symbol 'virt_phys_offset'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/mm/init_32.o)
   >>> referenced by main.c
   >>>               init/main.o:(virt_to_pfn) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against symbol 'virt_phys_offset'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/mm/init_32.o)
   >>> referenced by main.c
   >>>               init/main.o:(virt_to_pfn) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
