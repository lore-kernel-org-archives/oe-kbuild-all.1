Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D30710FC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 01:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e16RcwKe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704935896; x=1736471896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WtzTSocPh/YCwQZPBLi7spfEs2kNYrenT2SP79LGFA8=;
  b=e16RcwKenG2iJPz+tLdwNACZpVoxYbpDho8swz30N9plWDy92IyJhqTR
   uoNcimpT8u68y+2LKLs8k6+vENFBEWvXwXMKhCm1cFKfjn73az0l94clD
   y8rcF298BesCmwRmY3ANljt4N4H6YWteIXSWKt3RShu8mKpaFDXSxACjB
   gtwAP/6IzttWK5oE7cECYymYDlD/8okBBngO5bJF1YPeBWO7mdfr+keJl
   m3yHdYtO0DPgmjjGGsMWVMaiOj6MCLck9tXwKTKE56AoB6IhjxPyBXKqg
   z54S0DIebdgAMMMsQg7ccaOTFbaiWfbwNbCRYwIu0kBh6IbOs+3/3Qu6K
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="6064296"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="6064296"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 17:18:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="872849044"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="872849044"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Jan 2024 17:18:14 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNji0-0007ek-0E;
	Thu, 11 Jan 2024 01:18:12 +0000
Date: Thu, 11 Jan 2024 09:17:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1625/2334]
 drivers/video/fbdev/ls2k500sfb.c:254:13: warning: no previous prototype for
 function 'ls2k500sfb_interrupt'
Message-ID: <202401110926.PYdKiup4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c780cd23389087490b4199975c7e16cb696da852
commit: 8248d42b7c5f4338a54f26d8efebec8614b43466 [1625/2334] fbdev: add ls2k500sfb driver for ls2k500 bmc.
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240111/202401110926.PYdKiup4-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401110926.PYdKiup4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401110926.PYdKiup4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/video/fbdev/ls2k500sfb.c:254:13: warning: no previous prototype for function 'ls2k500sfb_interrupt' [-Wmissing-prototypes]
     254 | irqreturn_t ls2k500sfb_interrupt(int irq, void *arg)
         |             ^
   drivers/video/fbdev/ls2k500sfb.c:254:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     254 | irqreturn_t ls2k500sfb_interrupt(int irq, void *arg)
         | ^
         | static 
   1 warning generated.


vim +/ls2k500sfb_interrupt +254 drivers/video/fbdev/ls2k500sfb.c

   253	
 > 254	irqreturn_t ls2k500sfb_interrupt(int irq, void *arg)
   255	{
   256		struct ls2k500sfb_struct *priv = arg;
   257		struct pci_dev *pdev = priv->dev;
   258	
   259		if (irq == pdev->irq)
   260			pr_info("ls2k500sfb pcie interrupt\n");
   261		else
   262			pr_info("ls2k500sfb gpio interrupt\n");
   263		if (system_state != SYSTEM_RUNNING)
   264			return IRQ_HANDLED;
   265	
   266		if (!priv->running) {
   267			if (!resetdelay || time_after(jiffies, priv->reset_time + resetdelay * HZ)) {
   268				priv->running = 1;
   269				queue_work(priv->wq, &priv->work);
   270			}
   271			priv->reset_time = jiffies;
   272		}
   273		return IRQ_HANDLED;
   274	}
   275	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
