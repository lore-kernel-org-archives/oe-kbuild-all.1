Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17FC4301CA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Mar 2026 21:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772572885; cv=none; b=uokrSjWTKaSij9ncijqaIG1MuaYBOybZ8KHU3gl97twDjAUsNMfKQMRmetUq7wjE99zZwPCOSPfPp4SFz9YmLzVvjfi7/sGD1yKOvWIEI412Ll8RHry3ZqqO5Zw943+lgFi//J0oH2V9ePcpFix3hy4YgJZQfpamyhJ94Lb+Gqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772572885; c=relaxed/simple;
	bh=vgxUhFYe0SRr1mcqnDGHsjNnh+2kSt0nFqBWftRkUKM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JKvoOlV1GZYDuQwdamEzvG/jIuFHspfSPpLCyLTyDB6ImCmXzM8Jml+kAL7iQ9KnNxMcJRLCKhD+XLakF4yONE04rdvffzcEHSXruxdfOeIVJjW5NPo6yCgycusJHp469vjboLl7Il5eiLcTmhqdgTvXiLFmHAdEucuLO1bhw3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WVveo8me; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WVveo8me"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772572883; x=1804108883;
  h=date:from:to:cc:subject:message-id;
  bh=vgxUhFYe0SRr1mcqnDGHsjNnh+2kSt0nFqBWftRkUKM=;
  b=WVveo8me5/F+PQSuTKbM9Gdt2+8RoZrjxqJ/ah61PJwnL8mOcUu1wn9e
   y9MbYb2ZXnnSbzWjZdo9BR/SW5AeopjQC0N6q6SMzH6xxzhZxN/I5lc5B
   2h81X8Xv2T/4zYgWWpfc5svKEwEfgzKFfsxaueQMEiHI5vAnXzMxN5rVy
   ck+Qvtl7WmUai0j3cAijkdCIRghj0yxhh43fcJ3Y8zFPA8x0wsMBNmQHJ
   tcltiYwNBwtLI/Naqo+X16xj/YNthd5o+ZH37VUGAZ3ENXj/E8qjquiHy
   zADM/VFIzhyc6Li2CyTFomDphGoUtfm7tcboCB+piocJBeq7B/KsRXwF5
   A==;
X-CSE-ConnectionGUID: HslSeu5+T+Okx+MqpxsLxQ==
X-CSE-MsgGUID: Fy9OV3gETt69RKddfB//Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73531767"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="73531767"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 13:21:23 -0800
X-CSE-ConnectionGUID: pm0WRCPbRyG2lvhPHsMpTw==
X-CSE-MsgGUID: dk3qru71THKKBx5cgYCz9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="244905546"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 03 Mar 2026 13:21:21 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxXB9-000000001Xt-0jUB;
	Tue, 03 Mar 2026 21:21:19 +0000
Date: Tue, 03 Mar 2026 22:21:15 +0100
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irq/core 7/14]
 kernel/irq/irqdesc.c:163:undefined reference to `irq_proc_calc_prec'
Message-ID: <202603032214.LAs1zim8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irq/core
head:   33fdf3e4fead20d38be1457c46d97b35a5dc6f05
commit: 776922cd595626fd29e8a5b672db3c15c3ccb826 [7/14] genirq: Calculate precision only when required
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260303/202603032214.LAs1zim8-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260303/202603032214.LAs1zim8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603032214.LAs1zim8-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-gnu-ld: kernel/irq/irqdesc.o: in function `irq_set_nr_irqs':
>> kernel/irq/irqdesc.c:163:(.init.text+0xbc): undefined reference to `irq_proc_calc_prec'
   s390x-linux-gnu-ld: kernel/irq/irqdesc.o: in function `early_irq_init':
   kernel/irq/irqdesc.c:575:(.init.text+0x302): undefined reference to `irq_proc_calc_prec'
   s390x-linux-gnu-ld: kernel/irq/irqdesc.o: in function `irq_expand_nr_irqs':
>> kernel/irq/irqdesc.c:546:(.ref.text+0x120): undefined reference to `irq_proc_calc_prec'


vim +163 kernel/irq/irqdesc.c

   153	
   154	/**
   155	 * irq_set_nr_irqs() - Set the number of interrupts supported by the system.
   156	 * @nr: New number of interrupts.
   157	 *
   158	 * Return: @nr.
   159	 */
   160	unsigned int __init irq_set_nr_irqs(unsigned int nr)
   161	{
   162		total_nr_irqs = nr;
 > 163		irq_proc_calc_prec();
   164		return nr;
   165	}
   166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
