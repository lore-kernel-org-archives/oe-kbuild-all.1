Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96FB192B75
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 18:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765737105; cv=none; b=XUqDDfHujYky10cm9Ewu7c8u+Kj1SjGRcDdLTyYM83UFzCOmmYDp9znFpvVlLwY0cc+V5fq4JzlTMm9cg0P4ktVcIpU2vDy5h//i965RczOSzT2ciu2gfvWNv9E6uRtaegrqFzG8I8TlzceHnvgEdNIeqc//9y1jLcDr6yq2kPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765737105; c=relaxed/simple;
	bh=xeya4mbWZSwu2XCt6aJhbDpNpbBt5XDMaki9cZvklgg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dLJkbKdHMyuwOv5GXNImWlN0SG+hcGlYBExZ1n2u+afEkGDrmj+VjCdWJ6Dg2GrCujv79mmydolA1Db4IwghBR46LKDwLWIAxApl8FcdW26Lg9kvvfPjcFxppTmqiDAnhonPSntC0pzCpSVB97ksA+8rabIIjKMaLmYqT+ryFfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R2UbLncd; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R2UbLncd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765737104; x=1797273104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xeya4mbWZSwu2XCt6aJhbDpNpbBt5XDMaki9cZvklgg=;
  b=R2UbLncdG3X16sXahMlsBD5ZLs6pLhKuvA10ZLPoIabbIJZ4dksjJFMe
   c4FVoh49lKy8QZAueBGcF3nldtbn2uVLkMqAMMPNYGR7Q9mP1DQ4RSMMo
   Zxp7Xb5Wz98uCMEFGF6OtNhYB/VpOtz6KiM5leiin3oLucQVGORo2XDfX
   CL0JROWzNXGGtSr/LKc/vuFwwlAD+k7X+1cPtscJ5ic+3ueBFOnwh0Tht
   L6x5eHh3nbdn957Wy5Gg0qFevrc0PVtE3fW6N7S8DSN3mQDEjTUtheUYx
   QNmlAhilU/pCZ4q8rkVYf4I2i7qU8b0Eeg2tyUA6yQ/ur6rvxGpP+r2lI
   A==;
X-CSE-ConnectionGUID: ODfEyXuBSYKFUBPi/dQr/Q==
X-CSE-MsgGUID: hpUo122ARB23A/iRXNxJKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67592569"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67592569"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 10:31:44 -0800
X-CSE-ConnectionGUID: WfzN18wcQUG/c4sHoHpZXA==
X-CSE-MsgGUID: qYYFxTV5TjmHBp1IDIGBbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="228614306"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Dec 2025 10:31:37 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUqsY-000000009Gp-3HX2;
	Sun, 14 Dec 2025 18:31:34 +0000
Date: Mon, 15 Dec 2025 02:31:27 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 50/50]
 drivers/video/fbdev/ls2k500sfb.c:254:13: warning: no previous prototype for
 'ls2k500sfb_interrupt'
Message-ID: <202512150238.EPgIOOqM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   7c285f40a964b427534f3dab33b104ee9cab6245
commit: 508fb41902eb1c851c69e4a28d247107c28145a2 [50/50] anolis: fbdev: add ls2k500sfb driver for ls2k500 bmc.
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251215/202512150238.EPgIOOqM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512150238.EPgIOOqM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150238.EPgIOOqM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/video/fbdev/ls2k500sfb.c:254:13: warning: no previous prototype for 'ls2k500sfb_interrupt' [-Wmissing-prototypes]
     254 | irqreturn_t ls2k500sfb_interrupt(int irq, void *arg)
         |             ^~~~~~~~~~~~~~~~~~~~


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
