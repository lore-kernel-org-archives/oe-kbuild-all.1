Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B6112FF69
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 05:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778909428; cv=none; b=VZYWpmxwivovDjPvXOcVlbwLhHPMp19CnEQqMxaifD9RBT6DGQ99RwrncrUiIbPa9M6zlWaN04Rs/FPRTpT5BvGtpijyH3WsyWbqyu16qSLye04Rzj/pcd6Cq0MzCZcwUB54eOSTP43pXIedvMPbjKVnYLnIQcb5DqIdlfL7usU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778909428; c=relaxed/simple;
	bh=S2QY+Te8Q/f7ojUiaXzNolhnjZrkivhw2805zk4OJ/4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UxZ69Yiv+dT/dRXOlpL/i7dXetssD/c9kipG9uYNiT+pKcn3Jt2324P3rF6MpshavkHK1iNMGdaIES7ghEZbqH8E/aTaj9jGOw8VnezoIOcRXIdtdz6v6OM2mEe7Bckfh/QmOg7iMrqPhzTTswxXs585X2+IcfZzR4A11vLKJzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M6TkpQzT; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M6TkpQzT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778909426; x=1810445426;
  h=date:from:to:cc:subject:message-id;
  bh=S2QY+Te8Q/f7ojUiaXzNolhnjZrkivhw2805zk4OJ/4=;
  b=M6TkpQzTNNjj3HdnMS3cKOfnSrwKCjRHxSsrEFPjw61jMnW0bjMHiZlK
   x060lCcAZErG6MK5oLwou98+jx+72R2kJQeRw7TKw634mG+qC6T0K70A2
   L5GXhdKzrvBy5KRVdpX8oIvHcOOphDp+z6UVLIhin2qiTuCloT+JVQOKY
   601NYPcGbOBxP7gfx/bYcEfaKhIlPKkqGOmt/wSL+0CPKQS2QTvLTJZQm
   2w/X4ulZbJZPAQ2Ah1Dlmc7g3mjquCvNRIx+2gfvOUChb0yB4wQSJZN26
   eewMH25nt4y1YUN23xDXfmequbMz/4zvLZaXEt6h8DTaqoZ4oJzET6sk3
   w==;
X-CSE-ConnectionGUID: pNT9jlQTTxyeiTn7DVFCkw==
X-CSE-MsgGUID: qyeEHvkZQ2mX5GS6vQ5sRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="105317736"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="105317736"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 22:30:26 -0700
X-CSE-ConnectionGUID: rY3tkLH3QP+7uRwHbbo+4g==
X-CSE-MsgGUID: n2d88G9DQgSyzY3Y/LFSwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="262664437"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 15 May 2026 22:30:24 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO7bS-000000009Ez-0GkW;
	Sat, 16 May 2026 05:30:22 +0000
Date: Sat, 16 May 2026 07:29:57 +0200
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Dmitry Ilvokhin <d@ilvokhin.com>
Subject: [tglx-devel:irq/proc 15/16] kernel/irq/settings.h:29:33:
 error: 'GOT_YOU_MORON' undeclared
Message-ID: <202605160758.XbQgId6G-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irq/proc
head:   5233c5982cba9a3a71013abef4ddce2835d3e493
commit: e58cc4735e7d227ad24307bbb3f9601ee67d44f5 [15/16] genirq/proc: Runtime size the chip name
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260516/202605160758.XbQgId6G-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160758.XbQgId6G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605160758.XbQgId6G-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/irq/internals.h:78,
                    from kernel/irq/irqdomain.c:23:
   kernel/irq/irqdomain.c: In function 'irq_domain_disassociate':
>> kernel/irq/settings.h:29:33: error: 'GOT_YOU_MORON' undeclared (first use in this function)
      29 | #define IRQ_NOREQUEST           GOT_YOU_MORON
         |                                 ^~~~~~~~~~~~~
   kernel/irq/irqdomain.c:647:35: note: in expansion of macro 'IRQ_NOREQUEST'
     647 |         irq_set_status_flags(irq, IRQ_NOREQUEST);
         |                                   ^~~~~~~~~~~~~
   kernel/irq/settings.h:29:33: note: each undeclared identifier is reported only once for each function it appears in
      29 | #define IRQ_NOREQUEST           GOT_YOU_MORON
         |                                 ^~~~~~~~~~~~~
   kernel/irq/irqdomain.c:647:35: note: in expansion of macro 'IRQ_NOREQUEST'
     647 |         irq_set_status_flags(irq, IRQ_NOREQUEST);
         |                                   ^~~~~~~~~~~~~
   kernel/irq/irqdomain.c: In function 'irq_domain_associate_locked':
>> kernel/irq/settings.h:29:33: error: 'GOT_YOU_MORON' undeclared (first use in this function)
      29 | #define IRQ_NOREQUEST           GOT_YOU_MORON
         |                                 ^~~~~~~~~~~~~
   kernel/irq/irqdomain.c:707:38: note: in expansion of macro 'IRQ_NOREQUEST'
     707 |         irq_clear_status_flags(virq, IRQ_NOREQUEST);
         |                                      ^~~~~~~~~~~~~
   kernel/irq/irqdomain.c: In function 'irq_domain_insert_irq':
>> kernel/irq/settings.h:29:33: error: 'GOT_YOU_MORON' undeclared (first use in this function)
      29 | #define IRQ_NOREQUEST           GOT_YOU_MORON
         |                                 ^~~~~~~~~~~~~
   kernel/irq/irqdomain.c:1332:38: note: in expansion of macro 'IRQ_NOREQUEST'
    1332 |         irq_clear_status_flags(virq, IRQ_NOREQUEST);
         |                                      ^~~~~~~~~~~~~
   kernel/irq/irqdomain.c: In function 'irq_domain_remove_irq':
>> kernel/irq/settings.h:29:33: error: 'GOT_YOU_MORON' undeclared (first use in this function)
      29 | #define IRQ_NOREQUEST           GOT_YOU_MORON
         |                                 ^~~~~~~~~~~~~
   kernel/irq/irqdomain.c:1339:36: note: in expansion of macro 'IRQ_NOREQUEST'
    1339 |         irq_set_status_flags(virq, IRQ_NOREQUEST);
         |                                    ^~~~~~~~~~~~~


vim +/GOT_YOU_MORON +29 kernel/irq/settings.h

009b4c3b8ad584 Thomas Gleixner 2011-02-07  24  
a005677b3dd05d Thomas Gleixner 2011-02-08  25  #define IRQ_PER_CPU		GOT_YOU_MORON
a005677b3dd05d Thomas Gleixner 2011-02-08  26  #define IRQ_NO_BALANCING	GOT_YOU_MORON
876dbd4cc1b35c Thomas Gleixner 2011-02-08  27  #define IRQ_LEVEL		GOT_YOU_MORON
1ccb4e612f68ce Thomas Gleixner 2011-02-09  28  #define IRQ_NOPROBE		GOT_YOU_MORON
1ccb4e612f68ce Thomas Gleixner 2011-02-09 @29  #define IRQ_NOREQUEST		GOT_YOU_MORON
7f1b1244e159a8 Paul Mundt      2011-04-07  30  #define IRQ_NOTHREAD		GOT_YOU_MORON
1ccb4e612f68ce Thomas Gleixner 2011-02-09  31  #define IRQ_NOAUTOEN		GOT_YOU_MORON
1ccb4e612f68ce Thomas Gleixner 2011-02-09  32  #define IRQ_NESTED_THREAD	GOT_YOU_MORON
31d9d9b6d83030 Marc Zyngier    2011-09-23  33  #define IRQ_PER_CPU_DEVID	GOT_YOU_MORON
b39898cd4077f4 Thomas Gleixner 2013-11-06  34  #define IRQ_IS_POLLED		GOT_YOU_MORON
e9849777d0e27c Thomas Gleixner 2015-10-09  35  #define IRQ_DISABLE_UNLAZY	GOT_YOU_MORON
83cfac95c01817 Marc Zyngier    2020-05-19  36  #define IRQ_HIDDEN		GOT_YOU_MORON
c2b1063e8feb21 Thomas Gleixner 2021-04-02  37  #define IRQ_NO_DEBUG		GOT_YOU_MORON
37f8fe5168e28a Thomas Gleixner 2026-04-01  38  #define IRQ_RESERVED		GOT_YOU_MORON
a005677b3dd05d Thomas Gleixner 2011-02-08  39  #undef IRQF_MODIFY_MASK
a005677b3dd05d Thomas Gleixner 2011-02-08  40  #define IRQF_MODIFY_MASK	GOT_YOU_MORON
a005677b3dd05d Thomas Gleixner 2011-02-08  41  

:::::: The code at line 29 was first introduced by commit
:::::: 1ccb4e612f68ceefb888c2c6c1def6294ea8666d genirq: Wrap the remaning IRQ_* flags

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
