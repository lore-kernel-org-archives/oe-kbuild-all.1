Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B798C4E4C59
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Sep 2026 22:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790719528; cv=none; b=r2ehgTnTblT71pV0Xru6Bkh0cnWs5aD+cOBfQOvBDTGp9+tDgAjowDHtW2IEyFQwp5NAPd3wlPJt1ml8VNcs8la6T0fdZE76RIcq4K5dM53F4MujRlnS+63y6H4rvIszB5Qg0ZKbrWqKti0Bw1C3H+FFBOk9eMBpo/b1fbaCpZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790719528; c=relaxed/simple;
	bh=7e8Ys85ls0dluWCq5I59HupKc3Cog8UIWaiU9XhmFlI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DV0gb0mRMNKZ/u1fTklcPYO45zPGY33gFcr611SBe2ckv10LHnOs9BpxuiHpxsUH54x2I+enZmNK9DVwG/IIEarbWvQsg4srSIh2DZ/2KYfhuFIczIHq3zKRRGvYQDjGN5yVWHXbpAHir+FDw/r3DaF2bwfAscOUqW+6CnZbanw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H9vmhCHx; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H9vmhCHx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790719524; x=1822255524;
  h=date:from:to:cc:subject:message-id;
  bh=7e8Ys85ls0dluWCq5I59HupKc3Cog8UIWaiU9XhmFlI=;
  b=H9vmhCHxj42f2MrphJh3zFYVd0ZV3fuN2k3HWqO45LVxXOb8csmP3D07
   rmPglJtaSgNYHibrHGIUUCjm4KI4+f2v09QhthMwvFGtbe5dLu724vS+u
   PbAQofJ3n0Sbg0U7WfVgr7RSqTv8DBXw3ztWcOvNZbD3MZDX6CjSGJ726
   YtLN66siSL86/MX20FfhWDREHGiaMlHyA273n2SwvEMFXPwgrwIVqBsZG
   fpaxSz72vXj2wUbeC04P8oxi86uuaol5xDKlwbOu7qSLS/5v0JvbmE1Ke
   uBuA7h/YnskARNsRv+V4SrUWAAdzW5C3UDfEumZmj+mFYpdmflVFeUCVO
   A==;
X-CSE-ConnectionGUID: DYFWNGWGR2aDpcnCFZjCqw==
X-CSE-MsgGUID: ioTyENcjRLydLT57yaoojg==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="108938651"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="108938651"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 15:05:23 -0700
X-CSE-ConnectionGUID: R+0p5DrTSNONYY8rPXkIpg==
X-CSE-MsgGUID: gZM8Gfb/SJy9Wrd2D4dtpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="274101335"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 29 Sep 2026 15:05:22 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBfwu-000000001Zf-0BTe;
	Tue, 29 Sep 2026 22:05:20 +0000
Date: Wed, 30 Sep 2026 00:05:10 +0200
From: kernel test robot <lkp@intel.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: [linuxppc:next-test 3/37]
 arch/powerpc/kernel/irq.c:116:undefined reference to `irq_proc_emit_counts'
Message-ID: <202609300040.mopAJGuz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linuxppc/linux next-test
head:   0b8b0c17a8998709ecb2852d56442ea981102941
commit: fbb22ceaaf8f9c6786e6ff5da1962fe6ac0fc904 [3/37] powerpc/irq: Make irqstats array based
config: powerpc64-randconfig-r2100-20260929 (https://download.01.org/0day-ci/archive/20260930/202609300040.mopAJGuz-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609300040.mopAJGuz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609300040.mopAJGuz-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `irq_proc_emit_counts'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: arch/powerpc/kernel/irq.o: in function `arch_show_interrupts':
>> arch/powerpc/kernel/irq.c:116:(.text+0x49f8): undefined reference to `irq_proc_emit_counts'


vim +116 arch/powerpc/kernel/irq.c

   109	
   110	int arch_show_interrupts(struct seq_file *p, int prec)
   111	{
   112		const struct irq_stat_info *info = irq_stat_info;
   113	
   114		for (unsigned int i = 0; i < ARRAY_SIZE(irq_stat_info); i++, info++) {
   115			seq_printf(p, "%*s:", prec, info->symbol);
 > 116			irq_proc_emit_counts(p, &irq_stat.counts[i]);
   117			seq_puts(p, info->text);
   118		}
   119	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
