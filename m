Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A81818DB26
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Aug 2026 04:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787718649; cv=none; b=AiVyWBWm+O0+Ch63s0+MbEJXFROhuySZLX3zycNq6v2Vy6XDza1jgm2ndPiLqnd9O7ThVrwc+zcGDwPZSvav54vOgaf+REOYzdgIqN2O0KemBTjrzjYQi61HibvaZk68jUwo7K5dBrjpEyxNrX+AZUnG5HUWy+rDq0X49b48j98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787718649; c=relaxed/simple;
	bh=wLpYUlQvCOzPOs/Lk20t/hxAU7hswC03AUtJSjMesNI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bgaF9FDl7h2qKxB3mXI2AKHjXJq0cz5e7iOJgPB/hGolZP6mgyVmu6hGEcqO3yK4v5CWOk26wD0fZR7rjMG3fxONwCPCbCMG/6j/x+HWYiUD2fz3LuV+i0ujkvZ57XZbjDcz201dAKKDX3EZz0WOT1TtNu8ZrCXY+Y4XJLcUO+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N12zPzOy; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N12zPzOy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787718646; x=1819254646;
  h=date:from:to:cc:subject:message-id;
  bh=wLpYUlQvCOzPOs/Lk20t/hxAU7hswC03AUtJSjMesNI=;
  b=N12zPzOy4yUoucssopgdNxXGN5JbN/5BU8ikykA/hp0wiY/Sn8OKL4og
   P+O6Ge3J37IUc4zfz2Cwp10vX4wJLemSHgXFNxU74Jo2dglQ+d0e+Zaf+
   MAvpSXhQl+3YgdZUCxzeXYKj2IxmFiZ1yFYJmh1No9rXbHgLGO41FV8Nn
   wm/0Ak8PgN0+Dhwiy0KIiMfZNrN4BJpJ/cH1ZIum96dp0YxkwMBOrzmvl
   rIVILpIc8builixN6VkrerWW7L8flVD2aJNPqqmug9o03mlOfOwrGfsUx
   ynHlzRM86jx27/+PqP1L/Gw6GF+C35PsXXXvXi+w/UTRyUk2J7d4xmvkd
   w==;
X-CSE-ConnectionGUID: A9rqa6cHTDeqmdnCiNkj7w==
X-CSE-MsgGUID: YTT1R+voSgKu9aWQFuDoJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88322025"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="88322025"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 21:30:45 -0700
X-CSE-ConnectionGUID: logfJgyHS6m0ATKhMbUX1A==
X-CSE-MsgGUID: coLCPyrXTwe9WwNyxayUbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="271675432"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Aug 2026 21:30:44 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wz5He-00000000711-0WD7;
	Wed, 26 Aug 2026 04:30:42 +0000
Date: Wed, 26 Aug 2026 12:30:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-kminext 1/1]
 drivers/remoteproc/da8xx_remoteproc.c:77: warning: Function parameter or
 struct member 'dsp_reset' not described in 'da8xx_rproc'
Message-ID: <202608261253.y7nKJsV9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   7273d1bead29045f912c5442899d11b6075869bf
commit: dfc80ed249b618f2cf48481adc8aff0d8ef444b4 [1/1] ARM: davinci: da850: fix selecting ARCH_DAVINCI_DA8XX
config: arm-randconfig-001-20260826 (https://download.01.org/0day-ci/archive/20260826/202608261253.y7nKJsV9-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260826/202608261253.y7nKJsV9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608261253.y7nKJsV9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/remoteproc/da8xx_remoteproc.c:77: warning: Function parameter or struct member 'dsp_reset' not described in 'da8xx_rproc'
>> drivers/remoteproc/da8xx_remoteproc.c:86: warning: Function parameter or struct member 'irq' not described in 'handle_event'
>> drivers/remoteproc/da8xx_remoteproc.c:86: warning: Function parameter or struct member 'p' not described in 'handle_event'
>> drivers/remoteproc/da8xx_remoteproc.c:106: warning: Function parameter or struct member 'irq' not described in 'da8xx_rproc_callback'
>> drivers/remoteproc/da8xx_remoteproc.c:106: warning: Function parameter or struct member 'p' not described in 'da8xx_rproc_callback'


vim +77 drivers/remoteproc/da8xx_remoteproc.c

59b2355fc90e4a4 Suman Anna          2017-08-01   53  
13be5432d8721d8 Robert Tivy         2013-04-09   54  /**
13be5432d8721d8 Robert Tivy         2013-04-09   55   * struct da8xx_rproc - da8xx remote processor instance state
13be5432d8721d8 Robert Tivy         2013-04-09   56   * @rproc: rproc handle
59b2355fc90e4a4 Suman Anna          2017-08-01   57   * @mem: internal memory regions data
59b2355fc90e4a4 Suman Anna          2017-08-01   58   * @num_mems: number of internal memory regions
13be5432d8721d8 Robert Tivy         2013-04-09   59   * @dsp_clk: placeholder for platform's DSP clk
13be5432d8721d8 Robert Tivy         2013-04-09   60   * @ack_fxn: chip-specific ack function for ack'ing irq
13be5432d8721d8 Robert Tivy         2013-04-09   61   * @irq_data: ack_fxn function parameter
13be5432d8721d8 Robert Tivy         2013-04-09   62   * @chipsig: virt ptr to DSP interrupt registers (CHIPSIG & CHIPSIG_CLR)
13be5432d8721d8 Robert Tivy         2013-04-09   63   * @bootreg: virt ptr to DSP boot address register (HOST1CFG)
13be5432d8721d8 Robert Tivy         2013-04-09   64   * @irq: irq # used by this instance
13be5432d8721d8 Robert Tivy         2013-04-09   65   */
13be5432d8721d8 Robert Tivy         2013-04-09   66  struct da8xx_rproc {
13be5432d8721d8 Robert Tivy         2013-04-09   67  	struct rproc *rproc;
59b2355fc90e4a4 Suman Anna          2017-08-01   68  	struct da8xx_rproc_mem *mem;
59b2355fc90e4a4 Suman Anna          2017-08-01   69  	int num_mems;
13be5432d8721d8 Robert Tivy         2013-04-09   70  	struct clk *dsp_clk;
b2201ee554a5811 Bartosz Golaszewski 2018-06-21   71  	struct reset_control *dsp_reset;
13be5432d8721d8 Robert Tivy         2013-04-09   72  	void (*ack_fxn)(struct irq_data *data);
13be5432d8721d8 Robert Tivy         2013-04-09   73  	struct irq_data *irq_data;
13be5432d8721d8 Robert Tivy         2013-04-09   74  	void __iomem *chipsig;
13be5432d8721d8 Robert Tivy         2013-04-09   75  	void __iomem *bootreg;
13be5432d8721d8 Robert Tivy         2013-04-09   76  	int irq;
13be5432d8721d8 Robert Tivy         2013-04-09  @77  };
13be5432d8721d8 Robert Tivy         2013-04-09   78  
13be5432d8721d8 Robert Tivy         2013-04-09   79  /**
13be5432d8721d8 Robert Tivy         2013-04-09   80   * handle_event() - inbound virtqueue message workqueue function
13be5432d8721d8 Robert Tivy         2013-04-09   81   *
13be5432d8721d8 Robert Tivy         2013-04-09   82   * This function is registered as a kernel thread and is scheduled by the
13be5432d8721d8 Robert Tivy         2013-04-09   83   * kernel handler.
13be5432d8721d8 Robert Tivy         2013-04-09   84   */
13be5432d8721d8 Robert Tivy         2013-04-09   85  static irqreturn_t handle_event(int irq, void *p)
13be5432d8721d8 Robert Tivy         2013-04-09  @86  {
8666071391f473b Yu Zhe              2023-03-28   87  	struct rproc *rproc = p;
13be5432d8721d8 Robert Tivy         2013-04-09   88  
13be5432d8721d8 Robert Tivy         2013-04-09   89  	/* Process incoming buffers on all our vrings */
13be5432d8721d8 Robert Tivy         2013-04-09   90  	rproc_vq_interrupt(rproc, 0);
13be5432d8721d8 Robert Tivy         2013-04-09   91  	rproc_vq_interrupt(rproc, 1);
13be5432d8721d8 Robert Tivy         2013-04-09   92  
13be5432d8721d8 Robert Tivy         2013-04-09   93  	return IRQ_HANDLED;
13be5432d8721d8 Robert Tivy         2013-04-09   94  }
13be5432d8721d8 Robert Tivy         2013-04-09   95  
13be5432d8721d8 Robert Tivy         2013-04-09   96  /**
13be5432d8721d8 Robert Tivy         2013-04-09   97   * da8xx_rproc_callback() - inbound virtqueue message handler
13be5432d8721d8 Robert Tivy         2013-04-09   98   *
13be5432d8721d8 Robert Tivy         2013-04-09   99   * This handler is invoked directly by the kernel whenever the remote
13be5432d8721d8 Robert Tivy         2013-04-09  100   * core (DSP) has modified the state of a virtqueue.  There is no
13be5432d8721d8 Robert Tivy         2013-04-09  101   * "payload" message indicating the virtqueue index as is the case with
13be5432d8721d8 Robert Tivy         2013-04-09  102   * mailbox-based implementations on OMAP4.  As such, this handler "polls"
13be5432d8721d8 Robert Tivy         2013-04-09  103   * each known virtqueue index for every invocation.
13be5432d8721d8 Robert Tivy         2013-04-09  104   */
13be5432d8721d8 Robert Tivy         2013-04-09  105  static irqreturn_t da8xx_rproc_callback(int irq, void *p)
13be5432d8721d8 Robert Tivy         2013-04-09 @106  {
8666071391f473b Yu Zhe              2023-03-28  107  	struct rproc *rproc = p;
8666071391f473b Yu Zhe              2023-03-28  108  	struct da8xx_rproc *drproc = rproc->priv;
13be5432d8721d8 Robert Tivy         2013-04-09  109  	u32 chipsig;
13be5432d8721d8 Robert Tivy         2013-04-09  110  
13be5432d8721d8 Robert Tivy         2013-04-09  111  	chipsig = readl(drproc->chipsig);
13be5432d8721d8 Robert Tivy         2013-04-09  112  	if (chipsig & SYSCFG_CHIPSIG0) {
13be5432d8721d8 Robert Tivy         2013-04-09  113  		/* Clear interrupt level source */
13be5432d8721d8 Robert Tivy         2013-04-09  114  		writel(SYSCFG_CHIPSIG0, drproc->chipsig + 4);
13be5432d8721d8 Robert Tivy         2013-04-09  115  
13be5432d8721d8 Robert Tivy         2013-04-09  116  		/*
13be5432d8721d8 Robert Tivy         2013-04-09  117  		 * ACK intr to AINTC.
13be5432d8721d8 Robert Tivy         2013-04-09  118  		 *
13be5432d8721d8 Robert Tivy         2013-04-09  119  		 * It has already been ack'ed by the kernel before calling
13be5432d8721d8 Robert Tivy         2013-04-09  120  		 * this function, but since the ARM<->DSP interrupts in the
13be5432d8721d8 Robert Tivy         2013-04-09  121  		 * CHIPSIG register are "level" instead of "pulse" variety,
13be5432d8721d8 Robert Tivy         2013-04-09  122  		 * we need to ack it after taking down the level else we'll
13be5432d8721d8 Robert Tivy         2013-04-09  123  		 * be called again immediately after returning.
13be5432d8721d8 Robert Tivy         2013-04-09  124  		 */
13be5432d8721d8 Robert Tivy         2013-04-09  125  		drproc->ack_fxn(drproc->irq_data);
13be5432d8721d8 Robert Tivy         2013-04-09  126  
13be5432d8721d8 Robert Tivy         2013-04-09  127  		return IRQ_WAKE_THREAD;
13be5432d8721d8 Robert Tivy         2013-04-09  128  	}
13be5432d8721d8 Robert Tivy         2013-04-09  129  
13be5432d8721d8 Robert Tivy         2013-04-09  130  	return IRQ_HANDLED;
13be5432d8721d8 Robert Tivy         2013-04-09  131  }
13be5432d8721d8 Robert Tivy         2013-04-09  132  

:::::: The code at line 77 was first introduced by commit
:::::: 13be5432d8721d89cadae105663761f45f427842 remoteproc/davinci: add a remoteproc driver for OMAP-L13x DSP

:::::: TO: Robert Tivy <rtivy@ti.com>
:::::: CC: Ohad Ben-Cohen <ohad@wizery.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
