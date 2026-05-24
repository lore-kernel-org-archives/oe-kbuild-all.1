Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DD93A872E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 May 2026 16:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779639978; cv=none; b=I4tG4/d2KxbJvapBP+i/amxd85J26nag2/OPq4x0IAsNWDYGLOIkyDnj2npO0bxETL3ISMFcvt0OHpSi+x470LAOj4353TJ4OzuakWS6MSwYdEBgCjRpLqmVRAuFzNt5U0O351nlsFARM7PRR3Ay7Io6TiJfjwDE5GsXMXS3HWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779639978; c=relaxed/simple;
	bh=54buDfA42kIH+u8s9dgKB8clROQEB7f4miLEHYJ39Aw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XLigIOliF7xbmCvtqvWlnkvQ/9th/O8zkapxbYNg9KraDNShgo4ok2IYwnNW1u8qqFoDzERNWqxtseSkpedmOZX5emvRh/3D0k7cb9Ovv+W/eTdAHvv0tbYTxe9OZw0FwF4J/AkbMQbVmBomUNVZg5ehfzP/65FMudISjNVgWEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RIAIRBU5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RIAIRBU5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779639975; x=1811175975;
  h=date:from:to:cc:subject:message-id;
  bh=54buDfA42kIH+u8s9dgKB8clROQEB7f4miLEHYJ39Aw=;
  b=RIAIRBU5B+lPmej+G+NKbH38iuw9R36rLRos1dF1tjw59UlmerXbJwgd
   H2ECWM5XygqEWRxG3OE+ti8dNBuESnHm2rs0wk3kASQMrPZ0F+/gmsXBc
   XfupyYdlZlFlVUnaMURh7hFZ3R8tFRi+puCBmYsvq7YkI/NpWuC9KL67F
   ckYd/gXPVlt5pVmnjDOhGH7JAe8Kn3Knvjl4x8Q7S4LvuErZ91N5whBc0
   KmF+mpMqSIwWuMMVXSKCYQH5hkxFCN6emTEO2mj24XGsaXbVfMCSojrNQ
   +N5k+uC52ikr5pkOOJ/ym7hQ3FR6Wyevaih5UhKNBYtDdVmefCkZ2jSvG
   g==;
X-CSE-ConnectionGUID: x8rCPPoWSGuc4DbpPq/nXg==
X-CSE-MsgGUID: 60WqnSHoSV6IhiGo8ZF9oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="105945839"
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="105945839"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 09:26:13 -0700
X-CSE-ConnectionGUID: bUmhDp5MSn2HabuN4qap3w==
X-CSE-MsgGUID: 1KOZgb0YRZOmvMAOidWjeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="241464587"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 May 2026 09:26:12 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRBeT-000000000Qb-1pGb;
	Sun, 24 May 2026 16:26:09 +0000
Date: Mon, 25 May 2026 00:26:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 235/235]
 arch/x86/kernel/alternative.c:1541:2-3: Unneeded semicolon
Message-ID: <202605250044.G8sVBJa6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   8c66939857f7c1785dcf957b4374265db31c6af5
commit: 1f6e6683c46612baf01555e214d863aaa03c399b [235/235] x86/alternative: Relax text_poke_bp() constraint
config: x86_64-randconfig-r064-20260524 (https://download.01.org/0day-ci/archive/20260525/202605250044.G8sVBJa6-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605250044.G8sVBJa6-lkp@intel.com/

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
