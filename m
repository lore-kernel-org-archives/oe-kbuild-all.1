Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D5C28BAAE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jun 2025 13:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751289188; cv=none; b=mMOOwUz6GYtSKTHh/ocyPVAKjIEMtZkdPRNrWIcfItdckiWt8DvRgbKGTS60ta4AkCbbTLEPP20c2uHNDGtjD3PrcYdUWMB8qNqVKc6Lb3QWCvgblLrL0UcOFJa58j0JtM1hz4SdqN5Vtehi/Wh1NRlpQZsltO/R5IqAlXa15WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751289188; c=relaxed/simple;
	bh=6ZppXIKhrWXa0Uh21dOc+c/VzBXXWM6iT8+gj016BSk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jQf33UE3NyP1c5bOp/HHabsj74RmwF6fpeXHUtHBPS7b/4j/LlAuTyFRbn024bqoZHDcKrqNiTq6EGo74D7mMwO1RvUpcJ7rYGHDDRmuxVTvZy34XhSkdvuo71kf/zrXIGQwpSj0BLz0FBxEOpaqVY89IkY2EpRGhR5iYbEYCJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jQvHmdGV; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jQvHmdGV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751289186; x=1782825186;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6ZppXIKhrWXa0Uh21dOc+c/VzBXXWM6iT8+gj016BSk=;
  b=jQvHmdGVn4CdBKeN1uuFHRFLntC3Q1srJpOj+6/kBD0j6WF8+0IGrcIM
   KiolZOBrVVlaUx1i6sJIXPlWXQ9y6jIn+YODNvUGKxNv5uRkBQF8Aa7UJ
   2+BIaRmpSbmkhm9Xpn4S8+8wXy8yfYC3ny7t7G2C6UuQtZM4CEeOWI2kW
   k9Fn8vDe0BRFsDTUzbwBcNI+ETDGTkXosC9DHzr/ZhA9pf2d2ix4roUiN
   6WyoCVOch0QwazJCtM36H/QQ0dkilUd/gIjJ/U4QeH+ldYHNAWZ9sZzmz
   Hx2TV+o/xTAJpOXMzKSB24h0NQR8v7WVUFhqaqVk5hULAaW/aLBfIJw2J
   w==;
X-CSE-ConnectionGUID: TWRUEqEZR3i80Fz4UdGQaA==
X-CSE-MsgGUID: NVOfbdPZSliDp1TUUyfNlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64110577"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="64110577"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 06:13:06 -0700
X-CSE-ConnectionGUID: ajbmOzRGTmGgROOFIGXLUA==
X-CSE-MsgGUID: I1oNkW57TzSbPthaTjgaWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="157480904"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Jun 2025 06:13:04 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWEJi-000Z0u-27;
	Mon, 30 Jun 2025 13:13:02 +0000
Date: Mon, 30 Jun 2025 21:12:25 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irq/msi 6/12] kernel/irq/debugfs.c:105:24: error:
 'IRQD_IRQ_MASKED' undeclared here (not in a function); did you mean
 'IRQD_IRQ_STARTED'?
Message-ID: <202506302122.3tzlxRR8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irq/msi
head:   bb7c6edaaaf7191ec2c55df03d729f5e76b3c757
commit: 36eeef04cf76f7a2a109c2aff069bbbffb3f6a64 [6/12] genirq: Rename mask* to mask*fully
config: i386-buildonly-randconfig-004-20250630 (https://download.01.org/0day-ci/archive/20250630/202506302122.3tzlxRR8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506302122.3tzlxRR8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506302122.3tzlxRR8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/irq/debugfs.c:5:
   include/linux/irq.h: In function 'irqd_irq_masked':
   include/linux/irq.h:359:37: error: 'IRQD_IRQ_MASKED_FULL' undeclared (first use in this function); did you mean 'IRQD_IRQ_MASKED_FULLY'?
     359 |         return __irqd_to_state(d) & IRQD_IRQ_MASKED_FULL;
         |                                     ^~~~~~~~~~~~~~~~~~~~
         |                                     IRQD_IRQ_MASKED_FULLY
   include/linux/irq.h:359:37: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/irq.h: In function 'irqd_irq_masked_full':
   include/linux/irq.h:364:37: error: 'IRQD_IRQ_MASKED_FULL' undeclared (first use in this function); did you mean 'IRQD_IRQ_MASKED_FULLY'?
     364 |         return __irqd_to_state(d) & IRQD_IRQ_MASKED_FULL;
         |                                     ^~~~~~~~~~~~~~~~~~~~
         |                                     IRQD_IRQ_MASKED_FULLY
   In file included from kernel/irq/debugfs.c:8:
   kernel/irq/internals.h: In function 'irq_state_set_masked_full':
   kernel/irq/internals.h:248:24: error: 'IRQD_IRQ_MASKED_FULL' undeclared (first use in this function); did you mean 'IRQD_IRQ_MASKED_FULLY'?
     248 |         irqd_set(irqd, IRQD_IRQ_MASKED_FULL);
         |                        ^~~~~~~~~~~~~~~~~~~~
         |                        IRQD_IRQ_MASKED_FULLY
   kernel/irq/debugfs.c: At top level:
>> kernel/irq/debugfs.c:105:24: error: 'IRQD_IRQ_MASKED' undeclared here (not in a function); did you mean 'IRQD_IRQ_STARTED'?
     105 |         BIT_MASK_DESCR(IRQD_IRQ_MASKED),
         |                        ^~~~~~~~~~~~~~~
   kernel/irq/internals.h:495:43: note: in definition of macro 'BIT_MASK_DESCR'
     495 | #define BIT_MASK_DESCR(m)       { .mask = m, .name = #m }
         |                                           ^


vim +105 kernel/irq/debugfs.c

087cdfb662ae50 Thomas Gleixner 2017-06-20   94  
087cdfb662ae50 Thomas Gleixner 2017-06-20   95  static const struct irq_bit_descr irqdata_states[] = {
087cdfb662ae50 Thomas Gleixner 2017-06-20   96  	BIT_MASK_DESCR(IRQ_TYPE_EDGE_RISING),
087cdfb662ae50 Thomas Gleixner 2017-06-20   97  	BIT_MASK_DESCR(IRQ_TYPE_EDGE_FALLING),
087cdfb662ae50 Thomas Gleixner 2017-06-20   98  	BIT_MASK_DESCR(IRQ_TYPE_LEVEL_HIGH),
087cdfb662ae50 Thomas Gleixner 2017-06-20   99  	BIT_MASK_DESCR(IRQ_TYPE_LEVEL_LOW),
087cdfb662ae50 Thomas Gleixner 2017-06-20  100  	BIT_MASK_DESCR(IRQD_LEVEL),
087cdfb662ae50 Thomas Gleixner 2017-06-20  101  
087cdfb662ae50 Thomas Gleixner 2017-06-20  102  	BIT_MASK_DESCR(IRQD_ACTIVATED),
087cdfb662ae50 Thomas Gleixner 2017-06-20  103  	BIT_MASK_DESCR(IRQD_IRQ_STARTED),
087cdfb662ae50 Thomas Gleixner 2017-06-20  104  	BIT_MASK_DESCR(IRQD_IRQ_DISABLED),
087cdfb662ae50 Thomas Gleixner 2017-06-20 @105  	BIT_MASK_DESCR(IRQD_IRQ_MASKED),
087cdfb662ae50 Thomas Gleixner 2017-06-20  106  	BIT_MASK_DESCR(IRQD_IRQ_INPROGRESS),
087cdfb662ae50 Thomas Gleixner 2017-06-20  107  
087cdfb662ae50 Thomas Gleixner 2017-06-20  108  	BIT_MASK_DESCR(IRQD_PER_CPU),
087cdfb662ae50 Thomas Gleixner 2017-06-20  109  	BIT_MASK_DESCR(IRQD_NO_BALANCING),
087cdfb662ae50 Thomas Gleixner 2017-06-20  110  
d52dd44175bd27 Thomas Gleixner 2017-06-20  111  	BIT_MASK_DESCR(IRQD_SINGLE_TARGET),
087cdfb662ae50 Thomas Gleixner 2017-06-20  112  	BIT_MASK_DESCR(IRQD_AFFINITY_SET),
087cdfb662ae50 Thomas Gleixner 2017-06-20  113  	BIT_MASK_DESCR(IRQD_SETAFFINITY_PENDING),
087cdfb662ae50 Thomas Gleixner 2017-06-20  114  	BIT_MASK_DESCR(IRQD_AFFINITY_MANAGED),
aa251fc5b936d3 Marc Zyngier    2020-07-25  115  	BIT_MASK_DESCR(IRQD_AFFINITY_ON_ACTIVATE),
087cdfb662ae50 Thomas Gleixner 2017-06-20  116  	BIT_MASK_DESCR(IRQD_MANAGED_SHUTDOWN),
69790ba92b8d67 Thomas Gleixner 2017-12-29  117  	BIT_MASK_DESCR(IRQD_CAN_RESERVE),
087cdfb662ae50 Thomas Gleixner 2017-06-20  118  
087cdfb662ae50 Thomas Gleixner 2017-06-20  119  	BIT_MASK_DESCR(IRQD_FORWARDED_TO_VCPU),
087cdfb662ae50 Thomas Gleixner 2017-06-20  120  
087cdfb662ae50 Thomas Gleixner 2017-06-20  121  	BIT_MASK_DESCR(IRQD_WAKEUP_STATE),
087cdfb662ae50 Thomas Gleixner 2017-06-20  122  	BIT_MASK_DESCR(IRQD_WAKEUP_ARMED),
aa251fc5b936d3 Marc Zyngier    2020-07-25  123  
aa251fc5b936d3 Marc Zyngier    2020-07-25  124  	BIT_MASK_DESCR(IRQD_DEFAULT_TRIGGER_SET),
aa251fc5b936d3 Marc Zyngier    2020-07-25  125  
aa251fc5b936d3 Marc Zyngier    2020-07-25  126  	BIT_MASK_DESCR(IRQD_HANDLE_ENFORCE_IRQCTX),
90428a8eb4947f Maulik Shah     2020-09-28  127  
90428a8eb4947f Maulik Shah     2020-09-28  128  	BIT_MASK_DESCR(IRQD_IRQ_ENABLED_ON_SUSPEND),
9c15eeb5362c48 James Gowans    2023-06-08  129  
9c15eeb5362c48 James Gowans    2023-06-08  130  	BIT_MASK_DESCR(IRQD_RESEND_WHEN_IN_PROGRESS),
087cdfb662ae50 Thomas Gleixner 2017-06-20  131  };
087cdfb662ae50 Thomas Gleixner 2017-06-20  132  

:::::: The code at line 105 was first introduced by commit
:::::: 087cdfb662ae50e3826e7cd2e54b6519d07b60f0 genirq/debugfs: Add proper debugfs interface

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
