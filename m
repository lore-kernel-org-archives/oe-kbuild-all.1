Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134096FA5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 05:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZwxZJODW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699681387; x=1731217387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tYfeg1MHrdG86oOPOv7HgwebULfV04e2s4WQM+AqvMM=;
  b=ZwxZJODW3FTDKyrwMNCgewaBoIoGJZXchEj0bpyI0sw7wNitb1NgcDki
   b3LsX5BLRQz0Ef16IWbr15U9VbmWqxiYCmYfBHW/zpJ3TUHQ2Vx2PLNeo
   e3xPLOKvBOOlpdZrFOd1Ywatenhu4d1Klq+pmI+n82qxqsXSs4rgIkSpn
   ShYhoyPBEWca+Yl/O8O4WTjScgtI3JEFSOBuVJg+kdfEvrvh3+9j5/wl2
   Tz/CT1OAXVRxddu8B8hC7X0qFafpXA4CCkVP+NyPikWlWuDD48sdluQxZ
   jVuIhFqR581R7ha3euSP/BqqRnIYKDywZ45nKa6DqR0vBTnoIoF7YiFoF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="387423120"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="387423120"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 21:43:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="12014590"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Nov 2023 21:43:05 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1glq-000AF8-2a;
	Sat, 11 Nov 2023 05:43:02 +0000
Date: Sat, 11 Nov 2023 13:42:58 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:more-default-warnings 28/47]
 drivers/media/pci/sta2x11/sta2x11_vip.c:771: warning: Function parameter or
 member 'data' not described in 'vip_irq'
Message-ID: <202311111357.hfr6vZ4S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git more-default-warnings
head:   b86302da264f77971112b4be0b16eeb591026cbc
commit: 29e3980ba2d67abd896b61de27ab04d8b99d4c2b [28/47] media: sta2x11: fix irq handler cast
config: csky-allyesconfig (https://download.01.org/0day-ci/archive/20231111/202311111357.hfr6vZ4S-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311111357.hfr6vZ4S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311111357.hfr6vZ4S-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/pci/sta2x11/sta2x11_vip.c:771: warning: Function parameter or member 'data' not described in 'vip_irq'
>> drivers/media/pci/sta2x11/sta2x11_vip.c:771: warning: Excess function parameter 'vip' description in 'vip_irq'


vim +771 drivers/media/pci/sta2x11/sta2x11_vip.c

efeb98b4e2b2ce drivers/media/video/sta2x11_vip.c       Federico Vaga 2012-04-12  756  
efeb98b4e2b2ce drivers/media/video/sta2x11_vip.c       Federico Vaga 2012-04-12  757  /**
efeb98b4e2b2ce drivers/media/video/sta2x11_vip.c       Federico Vaga 2012-04-12  758   * vip_irq - interrupt routine
efeb98b4e2b2ce drivers/media/video/sta2x11_vip.c       Federico Vaga 2012-04-12  759   * @irq: Number of interrupt ( not used, correct number is assumed )
efeb98b4e2b2ce drivers/media/video/sta2x11_vip.c       Federico Vaga 2012-04-12  760   * @vip: local data structure containing all information
efeb98b4e2b2ce drivers/media/video/sta2x11_vip.c       Federico Vaga 2012-04-12  761   *
efeb98b4e2b2ce drivers/media/video/sta2x11_vip.c       Federico Vaga 2012-04-12  762   * check for both frame interrupts set ( top and bottom ).
efeb98b4e2b2ce drivers/media/video/sta2x11_vip.c       Federico Vaga 2012-04-12  763   * check FIFO overflow, but limit number of log messages after open.
8dc97ea20c2bdf drivers/media/pci/sta2x11/sta2x11_vip.c Federico Vaga 2013-02-05  764   * signal a complete buffer if done
efeb98b4e2b2ce drivers/media/video/sta2x11_vip.c       Federico Vaga 2012-04-12  765   *
efeb98b4e2b2ce drivers/media/video/sta2x11_vip.c       Federico Vaga 2012-04-12  766   * return value: IRQ_NONE, interrupt was not generated by VIP
efeb98b4e2b2ce drivers/media/video/sta2x11_vip.c       Federico Vaga 2012-04-12  767   *
efeb98b4e2b2ce drivers/media/video/sta2x11_vip.c       Federico Vaga 2012-04-12  768   * IRQ_HANDLED, interrupt done.
efeb98b4e2b2ce drivers/media/video/sta2x11_vip.c       Federico Vaga 2012-04-12  769   */
29e3980ba2d67a drivers/media/pci/sta2x11/sta2x11_vip.c Arnd Bergmann 2023-11-09  770  static irqreturn_t vip_irq(int irq, void *data)
efeb98b4e2b2ce drivers/media/video/sta2x11_vip.c       Federico Vaga 2012-04-12 @771  {
29e3980ba2d67a drivers/media/pci/sta2x11/sta2x11_vip.c Arnd Bergmann 2023-11-09  772  	struct sta2x11_vip *vip = data;
8dc97ea20c2bdf drivers/media/pci/sta2x11/sta2x11_vip.c Federico Vaga 2013-02-05  773  	unsigned int status;
efeb98b4e2b2ce drivers/media/video/sta2x11_vip.c       Federico Vaga 2012-04-12  774  
8dc97ea20c2bdf drivers/media/pci/sta2x11/sta2x11_vip.c Federico Vaga 2013-02-05  775  	status = reg_read(vip, DVP_ITS);
efeb98b4e2b2ce drivers/media/video/sta2x11_vip.c       Federico Vaga 2012-04-12  776  
8dc97ea20c2bdf drivers/media/pci/sta2x11/sta2x11_vip.c Federico Vaga 2013-02-05  777  	if (!status)		/* No interrupt to handle */
efeb98b4e2b2ce drivers/media/video/sta2x11_vip.c       Federico Vaga 2012-04-12  778  		return IRQ_NONE;
efeb98b4e2b2ce drivers/media/video/sta2x11_vip.c       Federico Vaga 2012-04-12  779  
8dc97ea20c2bdf drivers/media/pci/sta2x11/sta2x11_vip.c Federico Vaga 2013-02-05  780  	if (status & DVP_IT_FIFO)
8dc97ea20c2bdf drivers/media/pci/sta2x11/sta2x11_vip.c Federico Vaga 2013-02-05  781  		if (vip->overflow++ > 5)
8dc97ea20c2bdf drivers/media/pci/sta2x11/sta2x11_vip.c Federico Vaga 2013-02-05  782  			pr_info("VIP: fifo overflow\n");
efeb98b4e2b2ce drivers/media/video/sta2x11_vip.c       Federico Vaga 2012-04-12  783  
8dc97ea20c2bdf drivers/media/pci/sta2x11/sta2x11_vip.c Federico Vaga 2013-02-05  784  	if ((status & DVP_IT_VST) && (status & DVP_IT_VSB)) {
efeb98b4e2b2ce drivers/media/video/sta2x11_vip.c       Federico Vaga 2012-04-12  785  		/* this is bad, we are too slow, hope the condition is gone
efeb98b4e2b2ce drivers/media/video/sta2x11_vip.c       Federico Vaga 2012-04-12  786  		 * on the next frame */
efeb98b4e2b2ce drivers/media/video/sta2x11_vip.c       Federico Vaga 2012-04-12  787  		return IRQ_HANDLED;
efeb98b4e2b2ce drivers/media/video/sta2x11_vip.c       Federico Vaga 2012-04-12  788  	}
efeb98b4e2b2ce drivers/media/video/sta2x11_vip.c       Federico Vaga 2012-04-12  789  
8dc97ea20c2bdf drivers/media/pci/sta2x11/sta2x11_vip.c Federico Vaga 2013-02-05  790  	if (status & DVP_IT_VST)
8dc97ea20c2bdf drivers/media/pci/sta2x11/sta2x11_vip.c Federico Vaga 2013-02-05  791  		if ((++vip->tcount) < 2)
8dc97ea20c2bdf drivers/media/pci/sta2x11/sta2x11_vip.c Federico Vaga 2013-02-05  792  			return IRQ_HANDLED;
8dc97ea20c2bdf drivers/media/pci/sta2x11/sta2x11_vip.c Federico Vaga 2013-02-05  793  	if (status & DVP_IT_VSB) {
8dc97ea20c2bdf drivers/media/pci/sta2x11/sta2x11_vip.c Federico Vaga 2013-02-05  794  		vip->bcount++;
8dc97ea20c2bdf drivers/media/pci/sta2x11/sta2x11_vip.c Federico Vaga 2013-02-05  795  		return IRQ_HANDLED;
efeb98b4e2b2ce drivers/media/video/sta2x11_vip.c       Federico Vaga 2012-04-12  796  	}
efeb98b4e2b2ce drivers/media/video/sta2x11_vip.c       Federico Vaga 2012-04-12  797  
8dc97ea20c2bdf drivers/media/pci/sta2x11/sta2x11_vip.c Federico Vaga 2013-02-05  798  	if (vip->active) { /* Acquisition is over on this buffer */
8dc97ea20c2bdf drivers/media/pci/sta2x11/sta2x11_vip.c Federico Vaga 2013-02-05  799  		/* Disable acquisition */
8dc97ea20c2bdf drivers/media/pci/sta2x11/sta2x11_vip.c Federico Vaga 2013-02-05  800  		reg_write(vip, DVP_CTL, reg_read(vip, DVP_CTL) & ~DVP_CTL_ENA);
8dc97ea20c2bdf drivers/media/pci/sta2x11/sta2x11_vip.c Federico Vaga 2013-02-05  801  		/* Remove the active buffer from the list */
d6dd645eae76ee drivers/media/pci/sta2x11/sta2x11_vip.c Junghak Sung  2015-11-03  802  		vip->active->vb.vb2_buf.timestamp = ktime_get_ns();
2d7007153f0c9b drivers/media/pci/sta2x11/sta2x11_vip.c Junghak Sung  2015-09-22  803  		vip->active->vb.sequence = vip->sequence++;
2d7007153f0c9b drivers/media/pci/sta2x11/sta2x11_vip.c Junghak Sung  2015-09-22  804  		vb2_buffer_done(&vip->active->vb.vb2_buf, VB2_BUF_STATE_DONE);
8dc97ea20c2bdf drivers/media/pci/sta2x11/sta2x11_vip.c Federico Vaga 2013-02-05  805  	}
efeb98b4e2b2ce drivers/media/video/sta2x11_vip.c       Federico Vaga 2012-04-12  806  
efeb98b4e2b2ce drivers/media/video/sta2x11_vip.c       Federico Vaga 2012-04-12  807  	return IRQ_HANDLED;
8dc97ea20c2bdf drivers/media/pci/sta2x11/sta2x11_vip.c Federico Vaga 2013-02-05  808  }
efeb98b4e2b2ce drivers/media/video/sta2x11_vip.c       Federico Vaga 2012-04-12  809  

:::::: The code at line 771 was first introduced by commit
:::::: efeb98b4e2b2ce50e008affce4c493e58167144a [media] STA2X11 VIP: new V4L2 driver

:::::: TO: Federico Vaga <federico.vaga@gmail.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
