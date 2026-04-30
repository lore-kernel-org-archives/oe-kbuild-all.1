Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC3315C14F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 00:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777508975; cv=none; b=WuF/4dzzbg3eQ/fpNVzYD4Li80dF1h2sQ6MV8SHwLo8MgEyaN3zKyxHflwD7lsjWp0GTH92JzUhCdxps/2NX+WBLZed/33MEF8MCdnifhEh0ohwQ0svLHvcZVuXwV91co7KeQHBS3RRuWKQOE+xvsaVQVKhbOT3dynmnjeLteho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777508975; c=relaxed/simple;
	bh=u+mAU+2ACD5HlTJIsOgQLMOWjvExUPaLvfx7XhWNVcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h+ychkJ9cmoDwWHb3s/+RkpMdNjHKu9dYKZ9tXSsO3cD3z9kpJkEiytOTjPWol8VE2RbSS3LTzyFt0L7JWQ6n3uv9ezXSSGV5GjrvEBHk/6/bVwc2TGiHef3au6fuhCAuZVupy9t+aqFzI95mmP4y1qb4bXEd5rtcSVCeiBGIQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GMpefFh1; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GMpefFh1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777508973; x=1809044973;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=u+mAU+2ACD5HlTJIsOgQLMOWjvExUPaLvfx7XhWNVcQ=;
  b=GMpefFh1qmamLAiQvtLJ0Bzo2YNI3CuwWwDoZhufnqsjpzartzu91qYw
   WpT+1SIGwhhjR05LS3tpf7bplpolC1tEyb3oMWEn6IUI+Z4ApOXvLbm1T
   QYWdx4V4W/TdoNhcvPQAxdC/70aH3gA8GRV2FsLq0/fBJvGP3WonIxizN
   vtFHDnYSutkDtscYtWTEniAhz9nwj6dDsMh8LRMlmQm+6F9y+W6Cz+scO
   rafME4ZHza4Hm1laZO7aP5XbU27qhtJjsn/IuDxxWvP4wF44yjHB92b77
   tBKymZma78PAon6YJ8LyMg1s20q3k+/MTlk+WjHm1+B6yurWwDTPIbz2Q
   A==;
X-CSE-ConnectionGUID: qeAcWy2RTnmBOHisYgm6Xw==
X-CSE-MsgGUID: X4Os2gtgR86ebvCvW2vmiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89825874"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="89825874"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 17:29:33 -0700
X-CSE-ConnectionGUID: bjkpnPIORPqr710/UgULsQ==
X-CSE-MsgGUID: V3VIqX+NQPuoLZ0YSMyLEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="257752349"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 29 Apr 2026 17:29:29 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIFHS-000000004gn-2Zzy;
	Thu, 30 Apr 2026 00:29:26 +0000
Date: Thu, 30 Apr 2026 02:28:54 +0200
From: kernel test robot <lkp@intel.com>
To: Aaron Tomlin <atomlin@atomlin.com>, corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, tglx@kernel.org,
	akpm@linux-foundation.org, bp@alien8.de, rdunlap@infradead.org,
	dave.hansen@linux.intel.com, feng.tang@linux.alibaba.com,
	pawan.kumar.gupta@linux.intel.com, dapeng1.mi@linux.intel.com,
	kees@kernel.org, elver@google.com, paulmck@kernel.org,
	lirongqing@baidu.com, bhelgaas@google.com, bigeasy@linutronix.de,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: kernel-parameters: document scope of
 irqaffinity= parameter
Message-ID: <202604300215.1Alrqyxi-lkp@intel.com>
References: <20260421150911.42404-1-atomlin@atomlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260421150911.42404-1-atomlin@atomlin.com>

Hi Aaron,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lwn/docs-next]
[also build test WARNING on linus/master v7.1-rc1 next-20260429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aaron-Tomlin/docs-kernel-parameters-document-scope-of-irqaffinity-parameter/20260423-221944
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/20260421150911.42404-1-atomlin%40atomlin.com
patch subject: [PATCH v2] docs: kernel-parameters: document scope of irqaffinity= parameter
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260430/202604300215.1Alrqyxi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300215.1Alrqyxi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/devicetree/dt-object-internal.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,^Documentation/scheduler/sched-pelt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,(Documentation/translations/[
   Using alabaster theme
   Documentation/core-api/irq/managed_irq.rst:97: ERROR: Unexpected indentation. [docutils]
>> Documentation/core-api/irq/managed_irq.rst:104: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/core-api/irq/managed_irq.rst:109: ERROR: Unexpected indentation. [docutils]
   Documentation/core-api/irq/managed_irq.rst:111: ERROR: Unexpected indentation. [docutils]
   Documentation/core-api/irq/managed_irq.rst:118: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/core-api/irq/managed_irq.rst:122: ERROR: Unexpected indentation. [docutils]
   Documentation/core-api/irq/managed_irq.rst:123: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]


vim +104 Documentation/core-api/irq/managed_irq.rst

    65	
    66	- A QEMU instance is booted with "-device virtio-scsi-pci".
    67	  The MSI‑X device exposes 11 interrupts: 3 "management" interrupts and 8
    68	  "queue" interrupts. The driver requests the 8 queue interrupts, each of which
    69	  is affine to exactly one CPU. If that CPU goes offline, the interrupt is shut
    70	  down.
    71	
    72	  Assuming interrupt 48 is one of the queue interrupts, the following appears::
    73	
    74	    /proc/irq/48/effective_affinity_list:7
    75	    /proc/irq/48/smp_affinity_list:7
    76	
    77	  This indicates that the interrupt is served only by CPU7. Shutting down CPU7
    78	  does not migrate the interrupt to another CPU::
    79	
    80	    /proc/irq/48/effective_affinity_list:0
    81	    /proc/irq/48/smp_affinity_list:7
    82	
    83	  If the Linux kernel was built with Kconfig CONFIG_GENERIC_IRQ_DEBUGFS
    84	  enabled, this can be verified via the debugfs interface (e.g.,
    85	  /sys/kernel/debug/irq/irqs/48). The dstate field will include
    86	  IRQD_IRQ_DISABLED, IRQD_IRQ_MASKED and IRQD_MANAGED_SHUTDOWN.
    87	  A managed IRQ will also include IRQD_AFFINITY_MANAGED. For example:
    88	
    89	    # cat /sys/kernel/debug/irq/irqs/87
    90	    handler:  handle_edge_irq
    91	    device:   0000:41:00.0
    92	    status:   0x00000000
    93	    istate:   0x00004000
    94	    ddepth:   0
    95	    wdepth:   0
    96	    dstate:   0x19601200
    97			IRQD_ACTIVATED
    98			IRQD_IRQ_STARTED
    99			IRQD_SINGLE_TARGET
   100			IRQD_AFFINITY_SET
   101			IRQD_AFFINITY_MANAGED
   102			IRQD_AFFINITY_ON_ACTIVATE
   103			IRQD_HANDLE_ENFORCE_IRQCTX
 > 104	    node:     0
   105	    affinity: 9
   106	    effectiv: 9
   107	    pending:
   108	    domain:  IR-PCI-MSIX-0000:41:00.0-12
   109	     hwirq:   0x8
   110	     chip:    IR-PCI-MSIX-0000:41:00.0
   111	      flags:   0x430
   112			 IRQCHIP_SKIP_SET_WAKE
   113			 IRQCHIP_ONESHOT_SAFE
   114	
   115	      address_hi: 0x00000000
   116	      address_lo: 0xfee00000
   117	      msg_data:   0x00000008
   118	     parent:
   119		domain:  AMD-IR-3-14
   120		 hwirq:   0x41000000
   121		 chip:    AMD-IR
   122		  flags:   0x0
   123		 parent:
   124		    domain:  VECTOR
   125		     hwirq:   0x57
   126		     chip:    APIC
   127		      flags:   0x0
   128		     Vector:    33
   129		     Target:     9
   130		     move_in_progress: 0
   131		     is_managed:       1
   132		     can_reserve:      0
   133		     has_reserved:     0
   134		     cleanup_pending:  0
   135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
