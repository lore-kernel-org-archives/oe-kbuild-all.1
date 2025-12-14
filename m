Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B630021FF4A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 20:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765745927; cv=none; b=MTyScy0Pv4Zl4MHfgSeiLKVG+v1r+hTnWgQUQAkzA+cU5KHz39rnNaYhG7Cl/JlRDYr/pkh9QjVO8wYZM8aAo0FICpbY/ON7AZN/EmAlvG6IfbO11JIc3Ki1xVIw2+m1OOhq0/INgjkM2mfIQBcViubnAfze+dwxIsCdGi5eX1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765745927; c=relaxed/simple;
	bh=YOnA0CDjHzDVsfBamKRtwix157n3B895BUNPNAVx6BU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AJMCCth4eU6XUpZhusw3DgOeZv6IcoXOOv/+f0JDjYh+mfbhUvMD/t9Oco69MHO4a6EbafAV4uKsNg9WfX0+IR4qULRleGnKHpx+tFO9wrBlGF4b5QASuiQpGHsDUJFG9UOktQK9gLbr78XrLjALYSwGIzioiqe0+YdhWNU+PNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=etFM78gB; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="etFM78gB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765745926; x=1797281926;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YOnA0CDjHzDVsfBamKRtwix157n3B895BUNPNAVx6BU=;
  b=etFM78gBbeyKpEsjvDZxu8VKrKo/CA8RZWAJjAOssBrDvM+ZEIpOneYN
   PS8CErjCMuhs5snGhrlGwPmsqlFnv7nBVXK7zpLNd/ye2/PQEyIk5orVl
   k/KigEsVmwkKF9Dxb6sKTnQMfY/BlDVeh34LTBBPRiSP4qFicgbH01zLP
   D6F7t3ZJWSZ5lSrvq7f2VAraWBqDVexlYe1WIRDbIoJmNf13Sn7HidwV3
   ZrTii2Gp6bmnQfB5TX3aEls9icO1v/2v6S3inZtLqkm3C2TjP2UVYLq6D
   H2od4KCHoWmaB2xTbHKDQ4hxbd2ru6NYFeX2zs85Z2KvMFN2DyGZq6opr
   g==;
X-CSE-ConnectionGUID: WYw2f5L1Sv+KqLRwko+X4w==
X-CSE-MsgGUID: 3eVPfyKZQS6USXibyHVRUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="66641782"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="66641782"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 12:58:45 -0800
X-CSE-ConnectionGUID: X/76HGIaTOKt4O9o6E1JGQ==
X-CSE-MsgGUID: hQ2pDbDTQXyiVByQlMz6rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="196835839"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Dec 2025 12:58:44 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUtAv-000000009Ny-3sN4;
	Sun, 14 Dec 2025 20:58:41 +0000
Date: Mon, 15 Dec 2025 04:58:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:coroutine/base 2/3] arch/x86/net/bpf_jit_comp.c:1657:17:
 sparse: sparse: cast truncates bits from constant value (eb9f12345678eb9f
 becomes 5678eb9f)
Message-ID: <202512150418.NzaZ5Ka0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux coroutine/base
head:   3d1468dcf813bc71d425b7ce656a6877d98684e9
commit: 1c28bfd0bf1dd14f86e6858fe6f4ca67ae4b18ab [2/3] Wire up the JIT
config: x86_64-randconfig-123-20251214 (https://download.01.org/0day-ci/archive/20251215/202512150418.NzaZ5Ka0-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512150418.NzaZ5Ka0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150418.NzaZ5Ka0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/net/bpf_jit_comp.c:1657:17: sparse: sparse: cast truncates bits from constant value (eb9f12345678eb9f becomes 5678eb9f)
   arch/x86/net/bpf_jit_comp.c:1675:17: sparse: sparse: cast truncates bits from constant value (eb9f12345678eb9f becomes 5678eb9f)

vim +1657 arch/x86/net/bpf_jit_comp.c

  1647	
  1648	static void emit_coro_stack_save_rsp_to_r11(u8 **pprog, bool check_overflow)
  1649	{
  1650		u8 *prog = *pprog;
  1651		if (check_overflow) {
  1652			EMIT3(0x48, 0x89, 0xE3);
  1653			EMIT3(0x48, 0x81, 0xE3);
  1654			EMIT(0xFFFFF000, 4);
  1655			EMIT3(0x48, 0x8B, 0x1B);
  1656			EMIT3(0x48, 0x81, 0xFB);
> 1657			EMIT((u32)PRIV_STACK_GUARD_VAL, 4);
  1658			EMIT2(0x75, 0x02);
  1659			EMIT2(0xEB, 0x01);
  1660			EMIT1(0xCC);
  1661		}
  1662		EMIT3(0x49, 0x89, 0xE3);
  1663		*pprog = prog;
  1664	}
  1665	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
