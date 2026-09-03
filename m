Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA9F3D6494
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Sep 2026 19:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788462322; cv=none; b=uFpn0Kg4RLDoVeHmY/OlH4hanE3TNqLVVLt2vKvlQUYd7jdAaNpI/bvqhTQWHXGGVocnumNS88l+6/unWJyGLEaGdkh49AZmaJ0xtXlmKi7VIfQaKdMOKBlndHaw6hkvfrV8okcJZwFLuHWNzaqqfFcWMx+1R9nbZ6cY1k5G+1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788462322; c=relaxed/simple;
	bh=1sXZ15jbc2KYZB0v6qs6FOh1hPhzYSl8byujb3eWHa8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nxHGC2qS983iDa4JJIGztIjp3Ko8WvHnu7dd809TvEIZt2DHLsIg+VJ4dC3qif4Sxi99btCIQCF958IsiIVuGUd70fU3b+0UxgaXTYFgXDLYy0kvotxDqQWvAd79cmxnHYsdLbHkA5vfOhrveQaROR9oWzcbJ1dBzxtQn7zPq64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N0hf7lP2; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N0hf7lP2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788462312; x=1819998312;
  h=date:from:to:cc:subject:message-id;
  bh=1sXZ15jbc2KYZB0v6qs6FOh1hPhzYSl8byujb3eWHa8=;
  b=N0hf7lP203iTC8rwZslKhZIfSCu/Bz45ZEdz/28DR4QQOKcMGxl5MfW+
   NE7nBdYcBOxKAkQzSCN7PyKNcQcGsIpZzSsW6dhyVPkiOVz6/i70czxP1
   P0xfxuHWEkzrmrPAY9IYhKzJ6n3YQw7COLB9e60uhIuy1L+f7owUm2jqT
   h7wlIohX5U3ZUmFS9jojF1I6B1GOxaLYGHZu9SZl4EUJu10iSVrdOifXG
   yoeICPTy2Xu0HELbK9t+GXzbiOqxJatQlX+KSHIgRqacobHK0nTGHEFwS
   IafsXiWArrQr879tOgt6yqW6mKDazp5u7lyw+C8ochyK1p1LtvoMOObFJ
   A==;
X-CSE-ConnectionGUID: CGoA4M/PSc+gCL1zIUFc4w==
X-CSE-MsgGUID: pkmcVqt9RQeWwDI2O/ulbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="99287448"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="99287448"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 12:05:06 -0700
X-CSE-ConnectionGUID: MYcMRSbqTai4zDAK62mvfA==
X-CSE-MsgGUID: /M3g/KdwTw6LAjv+b7/Kag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="275087371"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Sep 2026 12:05:04 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2Ck9-000000005H4-3agw;
	Thu, 03 Sep 2026 19:05:01 +0000
Date: Fri, 04 Sep 2026 03:04:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 278/278]
 arch/x86/kernel/alternative.c:1541:2-3: Unneeded semicolon
Message-ID: <202609040346.phua4Qfw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   ae917b3c7332e08006443a49c261aa97ce703103
commit: 1f6e6683c46612baf01555e214d863aaa03c399b [278/278] x86/alternative: Relax text_poke_bp() constraint
config: i386-randconfig-r061-20260903 (https://download.01.org/0day-ci/archive/20260904/202609040346.phua4Qfw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609040346.phua4Qfw-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/kernel/alternative.c:1541:2-3: Unneeded semicolon

vim +1541 arch/x86/kernel/alternative.c

  1509	
  1510	static void text_poke_loc_init(struct text_poke_loc *tp, void *addr,
  1511				       const void *opcode, size_t len, const void *emulate)
  1512	{
  1513		struct insn insn;
  1514		int ret, i;
  1515	
  1516		memcpy((void *)tp->text, opcode, len);
  1517		if (!emulate)
  1518			emulate = opcode;
  1519	
  1520		ret = insn_decode_kernel(&insn, emulate);
  1521		BUG_ON(ret < 0);
  1522	
  1523		tp->rel_addr = addr - (void *)_stext;
  1524		tp->len = len;
  1525		tp->opcode = insn.opcode.bytes[0];
  1526	
  1527		switch (tp->opcode) {
  1528		case RET_INSN_OPCODE:
  1529		case JMP32_INSN_OPCODE:
  1530		case JMP8_INSN_OPCODE:
  1531			/*
  1532			 * Control flow instructions without implied execution of the
  1533			 * next instruction can be padded with INT3.
  1534			 */
  1535			for (i = insn.length; i < len; i++)
  1536				BUG_ON(tp->text[i] != INT3_INSN_OPCODE);
  1537			break;
  1538	
  1539		default:
  1540			BUG_ON(len != insn.length);
> 1541		};
  1542	
  1543	
  1544		switch (tp->opcode) {
  1545		case INT3_INSN_OPCODE:
  1546		case RET_INSN_OPCODE:
  1547			break;
  1548	
  1549		case CALL_INSN_OPCODE:
  1550		case JMP32_INSN_OPCODE:
  1551		case JMP8_INSN_OPCODE:
  1552			tp->disp = insn.immediate.value;
  1553			break;
  1554	
  1555		default: /* assume NOP */
  1556			switch (len) {
  1557			case 2: /* NOP2 -- emulate as JMP8+0 */
  1558				BUG_ON(memcmp(emulate, ideal_nops[len], len));
  1559				tp->opcode = JMP8_INSN_OPCODE;
  1560				tp->disp = 0;
  1561				break;
  1562	
  1563			case 5: /* NOP5 -- emulate as JMP32+0 */
  1564				BUG_ON(memcmp(emulate, ideal_nops[NOP_ATOMIC5], len));
  1565				tp->opcode = JMP32_INSN_OPCODE;
  1566				tp->disp = 0;
  1567				break;
  1568	
  1569			default: /* unknown instruction */
  1570				BUG();
  1571			}
  1572			break;
  1573		}
  1574	}
  1575	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
