Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4E748BD2C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 May 2026 16:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997792; cv=none; b=Ib+BMGmmmRmJPEuwMwJH62fzzK1emoT6PcEQYyHD2aaxeCFMJAEaYAnxqCFGuBqjq4aAsFze2bGrFpNQ/OyiVp0rlEm6z3YKbpgDcdAPF2M/zU002rGbivBOatUEN615Pg/ADKhdEjo5D4yw4PVexZ64+YHhG2Q7JcUH311SGe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997792; c=relaxed/simple;
	bh=s4fm0PP8nSo7Lq28CwvuCdQuyAqiY4aS0vrgu0mSxo0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Pk30Zy65zPt5iCyFTS8tal4St6UfI+uBmT0ciInQeKop8emxFuFZ0HsePJUQLLm9IHXZaFGrrjKSA+yCRJzBuXClSgSskO/J6KSMSzBRuoBLhiJ90cdU16QiC0nW6ARrFv1LfwLnK9OFTVpR0X9v+K+gIy4YWBdscDeiwXkdKI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FoLQKcO9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FoLQKcO9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777997789; x=1809533789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s4fm0PP8nSo7Lq28CwvuCdQuyAqiY4aS0vrgu0mSxo0=;
  b=FoLQKcO9A14AYqjJzMX4hv+96cZN/M/qzvl91konWOfaGj3f5+V2SE1W
   aqnqfckvYa7EGkUbRdz8bf6Y2L8nCv0fgLzMY/gocX8+w479sCx0r+ZbE
   pAVrIFNBUcIdUeSsUpQwfk1lYSe9MSvXakvTLWjBypEH8ZCCAmyrSDa85
   Uyif/SR1uptVSojNxIt5e3J/XKBSOh4WGElw/YLiRRnKq6pWPWHTWFI7B
   hWU2Oxe/fXwNdvTqlYvmdP3s8OwgUX5GkCiZFilLhXWfTKj59PiqCLX8q
   mlqUIgArpixwXSCPxkgfFw97U00ZrRVD5YVPhFESt2MXDxlePavCxG4vB
   g==;
X-CSE-ConnectionGUID: j1Z8nuF0TkCWyMlfVflOSg==
X-CSE-MsgGUID: YLL+VmOWRC2tLGrFMmbSeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="104322507"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="104322507"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 09:16:09 -0700
X-CSE-ConnectionGUID: pet8ZI4GRbKoCicdEV0frQ==
X-CSE-MsgGUID: Ui82/TkfTPSn9S9ClXxR3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="236114766"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 May 2026 09:16:08 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKIRI-000000000HN-3uVp;
	Tue, 05 May 2026 16:16:04 +0000
Date: Wed, 06 May 2026 00:15:18 +0800
From: kernel test robot <lkp@intel.com>
To: "Duje =?utf-8?Q?Mihanovi=C4=87"?= <duje@dujemihanovic.xyz>
Cc: oe-kbuild-all@lists.linux.dev, Stephen Boyd <sboyd@kernel.org>
Subject: [linux-next:master 1589/2999]
 drivers/clk/mmp/clk-pxa1908-apbc.c:117:2-3: Unneeded semicolon
Message-ID: <202605060038.2KOj54Kk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4cd074ae20bbcc293bbbce9163abe99d68ae6ae0
commit: fcfae77b39cea1e129f86eb88bfd6ca34506effe [1589/2999] clk: mmp: pxa1908-apbc: Add reset cells
config: arm64-randconfig-r061-20260505 (https://download.01.org/0day-ci/archive/20260506/202605060038.2KOj54Kk-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605060038.2KOj54Kk-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clk/mmp/clk-pxa1908-apbc.c:117:2-3: Unneeded semicolon

vim +117 drivers/clk/mmp/clk-pxa1908-apbc.c

    99	
   100	/* Taken from clk-of-pxa1928.c */
   101	static void pxa1908_clk_reset_init(struct device_node *np,
   102					   struct pxa1908_clk_unit *pxa_unit)
   103	{
   104		struct mmp_clk_reset_cell *cells;
   105		int nr_cells = ARRAY_SIZE(apbc_gate_clks);
   106	
   107		cells = kzalloc_objs(*cells, nr_cells);
   108		if (!cells)
   109			return;
   110	
   111		for (int i = 0; i < nr_cells; i++) {
   112			cells[i].clk_id = apbc_gate_clks[i].id;
   113			cells[i].reg = pxa_unit->base + apbc_gate_clks[i].offset;
   114			cells[i].bits = BIT(2);
   115			cells[i].flags = 0;
   116			cells[i].lock = apbc_gate_clks[i].lock;
 > 117		};
   118	
   119		mmp_clk_reset_register(np, cells, nr_cells);
   120	}
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
