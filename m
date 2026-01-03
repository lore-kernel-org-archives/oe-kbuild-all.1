Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520313FF1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jan 2026 23:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767484138; cv=none; b=FTcY9BxHKJjgTBL43SxKGoTumFvO6f8AL9OqRRgleUeyPTadPWJDUFPJ8AWUfXGjj3QwLxg2G/TrqyIvInE1ZYjwEoMhB79Qem7u96IIlAvlpHoFxQHBvxbrD8g6ZXcXo1ajpwo0B4Y1nD1gnmYi7Me1tkPvQrqcr7qC/NkdKgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767484138; c=relaxed/simple;
	bh=bSXSWw5GLP+MsRj/wiRFxpH0L1ho0yI4kByTrMuX9rc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VJaVHHj1ZuHVugBU94m5bc94YZG16YmzDk4+xAeLV91gTmIJeIjCbTdFy7IWRMOS7YX3kM3zTFJdPodGY9ymhYjyn2EvpgpEsX5mPgB/xJ0IL2A7F8nteTXYGA6L09+sV9dW+lNbIFRB3MT4PUgQ1R2RM3SSTVvdlYgi4GGHfr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h9PfvQVl; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h9PfvQVl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767484136; x=1799020136;
  h=date:from:to:cc:subject:message-id;
  bh=bSXSWw5GLP+MsRj/wiRFxpH0L1ho0yI4kByTrMuX9rc=;
  b=h9PfvQVlGzaiQgykq6VKUjSOkM9wbb+mSwA9zXFBG4fhSRcQ/rT/ZoIt
   lnz4CsJErm049cqZkG6lqloAOhZ8vjosZ4HtWf/oBuKsiQrzkjz8DZrJQ
   wrgJdxc9WYx+g6fNaaufDOQyie49iHf7rRmSTIH9txXQ8LYBiiZuz/ePx
   ZKvYQWS9GEu77vBz7ePFYtCAOrt0cnybO+v9wUjIudvQRRL5uiTikgp1O
   6PRA5wPzajQhCi/kK+QLSn0nXPIYULkEu2twFETgR6/WGLPNIr+ApiUbt
   ER4tpl8zD2xJQck1aDa0Diw5iT+yVSdfG2tyISZ5St6B2FOAm+Fp+IbWu
   Q==;
X-CSE-ConnectionGUID: 9/M7ZH9cQcemLtp+Tj1upg==
X-CSE-MsgGUID: PK1aBjQ5R+Gtbp/JW/rKTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="80279016"
X-IronPort-AV: E=Sophos;i="6.21,200,1763452800"; 
   d="scan'208";a="80279016"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2026 15:48:56 -0800
X-CSE-ConnectionGUID: CcvyQsjXRI6THKW9VVhJAQ==
X-CSE-MsgGUID: iqxVUcSeS6O7cyQ419xcNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,200,1763452800"; 
   d="scan'208";a="225566748"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Jan 2026 15:48:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcBMa-000000000I1-0hbt;
	Sat, 03 Jan 2026 23:48:52 +0000
Date: Sun, 04 Jan 2026 07:48:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1]
 drivers/scsi/dpt_i2o.c:1863:31: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202601040742.8VzAt7O9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   a0f93b828ee5433c5b427d8122a6dda0b514d985
commit: d21a20f4421db37310c624845a38605436b81fcb [1/1] scsi: dpt_i2o: Do not process completions with invalid addresses
config: arm64-randconfig-r122-20251224 (https://download.01.org/0day-ci/archive/20260104/202601040742.8VzAt7O9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260104/202601040742.8VzAt7O9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601040742.8VzAt7O9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/scsi/dpt_i2o.c:1863:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *reply @@     got unsigned char [usertype] * @@
   drivers/scsi/dpt_i2o.c:1863:31: sparse:     expected void [noderef] __iomem *reply
   drivers/scsi/dpt_i2o.c:1863:31: sparse:     got unsigned char [usertype] *
   drivers/scsi/dpt_i2o.c:616:9: sparse: sparse: context imbalance in 'adpt_abort' - different lock contexts for basic block
   drivers/scsi/dpt_i2o.c:661:9: sparse: sparse: context imbalance in 'adpt_device_reset' - different lock contexts for basic block
   drivers/scsi/dpt_i2o.c:695:9: sparse: sparse: context imbalance in 'adpt_bus_reset' - different lock contexts for basic block
   drivers/scsi/dpt_i2o.c:1138:40: sparse: sparse: context imbalance in 'adpt_i2o_post_wait' - unexpected unlock
   drivers/scsi/dpt_i2o.c:1780:9: sparse: sparse: context imbalance in 'adpt_ioctl' - different lock contexts for basic block
   drivers/scsi/dpt_i2o.c:1924:9: sparse: sparse: context imbalance in 'adpt_isr' - different lock contexts for basic block
   drivers/scsi/dpt_i2o.c:2216:9: sparse: sparse: context imbalance in 'adpt_rescan' - different lock contexts for basic block

vim +1863 drivers/scsi/dpt_i2o.c

^1da177e4c3f41 Linus Torvalds         2005-04-16  1829  
7d12e780e003f9 David Howells          2006-10-05  1830  static irqreturn_t adpt_isr(int irq, void *dev_id)
^1da177e4c3f41 Linus Torvalds         2005-04-16  1831  {
^1da177e4c3f41 Linus Torvalds         2005-04-16  1832  	struct scsi_cmnd* cmd;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1833  	adpt_hba* pHba = dev_id;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1834  	u32 m;
1c2fb3f38e250d Benoit Boissinot       2005-04-25  1835  	void __iomem *reply;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1836  	u32 status=0;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1837  	u32 context;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1838  	ulong flags = 0;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1839  	int handled = 0;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1840  
^1da177e4c3f41 Linus Torvalds         2005-04-16  1841  	if (pHba == NULL){
^1da177e4c3f41 Linus Torvalds         2005-04-16  1842  		printk(KERN_WARNING"adpt_isr: NULL dev_id\n");
^1da177e4c3f41 Linus Torvalds         2005-04-16  1843  		return IRQ_NONE;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1844  	}
^1da177e4c3f41 Linus Torvalds         2005-04-16  1845  	if(pHba->host)
^1da177e4c3f41 Linus Torvalds         2005-04-16  1846  		spin_lock_irqsave(pHba->host->host_lock, flags);
^1da177e4c3f41 Linus Torvalds         2005-04-16  1847  
^1da177e4c3f41 Linus Torvalds         2005-04-16  1848  	while( readl(pHba->irq_mask) & I2O_INTERRUPT_PENDING_B) {
^1da177e4c3f41 Linus Torvalds         2005-04-16  1849  		m = readl(pHba->reply_port);
^1da177e4c3f41 Linus Torvalds         2005-04-16  1850  		if(m == EMPTY_QUEUE){
^1da177e4c3f41 Linus Torvalds         2005-04-16  1851  			// Try twice then give up
^1da177e4c3f41 Linus Torvalds         2005-04-16  1852  			rmb();
^1da177e4c3f41 Linus Torvalds         2005-04-16  1853  			m = readl(pHba->reply_port);
^1da177e4c3f41 Linus Torvalds         2005-04-16  1854  			if(m == EMPTY_QUEUE){ 
^1da177e4c3f41 Linus Torvalds         2005-04-16  1855  				// This really should not happen
^1da177e4c3f41 Linus Torvalds         2005-04-16  1856  				printk(KERN_ERR"dpti: Could not get reply frame\n");
^1da177e4c3f41 Linus Torvalds         2005-04-16  1857  				goto out;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1858  			}
^1da177e4c3f41 Linus Torvalds         2005-04-16  1859  		}
67af2b060e027c Miquel van Smoorenburg 2008-05-02  1860  		if (pHba->reply_pool_pa <= m &&
67af2b060e027c Miquel van Smoorenburg 2008-05-02  1861  		    m < pHba->reply_pool_pa +
67af2b060e027c Miquel van Smoorenburg 2008-05-02  1862  			(pHba->reply_fifo_size * REPLY_FRAME_SIZE * 4)) {
67af2b060e027c Miquel van Smoorenburg 2008-05-02 @1863  			reply = (u8 *)pHba->reply_pool +
67af2b060e027c Miquel van Smoorenburg 2008-05-02  1864  						(m - pHba->reply_pool_pa);
67af2b060e027c Miquel van Smoorenburg 2008-05-02  1865  		} else {
67af2b060e027c Miquel van Smoorenburg 2008-05-02  1866  			/* Ick, we should *never* be here */
67af2b060e027c Miquel van Smoorenburg 2008-05-02  1867  			printk(KERN_ERR "dpti: reply frame not from pool\n");
d21a20f4421db3 Ben Hutchings          2023-05-27  1868  			continue;
67af2b060e027c Miquel van Smoorenburg 2008-05-02  1869  		}
^1da177e4c3f41 Linus Torvalds         2005-04-16  1870  
^1da177e4c3f41 Linus Torvalds         2005-04-16  1871  		if (readl(reply) & MSG_FAIL) {
^1da177e4c3f41 Linus Torvalds         2005-04-16  1872  			u32 old_m = readl(reply+28); 
1c2fb3f38e250d Benoit Boissinot       2005-04-25  1873  			void __iomem *msg;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1874  			u32 old_context;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1875  			PDEBUG("%s: Failed message\n",pHba->name);
^1da177e4c3f41 Linus Torvalds         2005-04-16  1876  			if(old_m >= 0x100000){
^1da177e4c3f41 Linus Torvalds         2005-04-16  1877  				printk(KERN_ERR"%s: Bad preserved MFA (%x)- dropping frame\n",pHba->name,old_m);
^1da177e4c3f41 Linus Torvalds         2005-04-16  1878  				writel(m,pHba->reply_port);
^1da177e4c3f41 Linus Torvalds         2005-04-16  1879  				continue;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1880  			}
^1da177e4c3f41 Linus Torvalds         2005-04-16  1881  			// Transaction context is 0 in failed reply frame
1c2fb3f38e250d Benoit Boissinot       2005-04-25  1882  			msg = pHba->msg_addr_virt + old_m;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1883  			old_context = readl(msg+12);
^1da177e4c3f41 Linus Torvalds         2005-04-16  1884  			writel(old_context, reply+12);
^1da177e4c3f41 Linus Torvalds         2005-04-16  1885  			adpt_send_nop(pHba, old_m);
^1da177e4c3f41 Linus Torvalds         2005-04-16  1886  		} 
^1da177e4c3f41 Linus Torvalds         2005-04-16  1887  		context = readl(reply+8);
^1da177e4c3f41 Linus Torvalds         2005-04-16  1888  		if(context & 0x80000000){ // Post wait message
^1da177e4c3f41 Linus Torvalds         2005-04-16  1889  			status = readl(reply+16);
^1da177e4c3f41 Linus Torvalds         2005-04-16  1890  			if(status  >> 24){
^1da177e4c3f41 Linus Torvalds         2005-04-16  1891  				status &=  0xffff; /* Get detail status */
^1da177e4c3f41 Linus Torvalds         2005-04-16  1892  			} else {
^1da177e4c3f41 Linus Torvalds         2005-04-16  1893  				status = I2O_POST_WAIT_OK;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1894  			}
470d19e202f02c Hannes Reinecke        2019-02-26  1895  			/*
470d19e202f02c Hannes Reinecke        2019-02-26  1896  			 * The request tag is one less than the command tag
470d19e202f02c Hannes Reinecke        2019-02-26  1897  			 * as the firmware might treat a 0 tag as invalid
470d19e202f02c Hannes Reinecke        2019-02-26  1898  			 */
470d19e202f02c Hannes Reinecke        2019-02-26  1899  			cmd = scsi_host_find_tag(pHba->host,
470d19e202f02c Hannes Reinecke        2019-02-26  1900  						 readl(reply + 12) - 1);
^1da177e4c3f41 Linus Torvalds         2005-04-16  1901  			if(cmd != NULL) {
^1da177e4c3f41 Linus Torvalds         2005-04-16  1902  				printk(KERN_WARNING"%s: Apparent SCSI cmd in Post Wait Context - cmd=%p context=%x\n", pHba->name, cmd, context);
^1da177e4c3f41 Linus Torvalds         2005-04-16  1903  			}
^1da177e4c3f41 Linus Torvalds         2005-04-16  1904  			adpt_i2o_post_wait_complete(context, status);
^1da177e4c3f41 Linus Torvalds         2005-04-16  1905  		} else { // SCSI message
470d19e202f02c Hannes Reinecke        2019-02-26  1906  			/*
470d19e202f02c Hannes Reinecke        2019-02-26  1907  			 * The request tag is one less than the command tag
470d19e202f02c Hannes Reinecke        2019-02-26  1908  			 * as the firmware might treat a 0 tag as invalid
470d19e202f02c Hannes Reinecke        2019-02-26  1909  			 */
470d19e202f02c Hannes Reinecke        2019-02-26  1910  			cmd = scsi_host_find_tag(pHba->host,
470d19e202f02c Hannes Reinecke        2019-02-26  1911  						 readl(reply + 12) - 1);
^1da177e4c3f41 Linus Torvalds         2005-04-16  1912  			if(cmd != NULL){
67af2b060e027c Miquel van Smoorenburg 2008-05-02  1913  				scsi_dma_unmap(cmd);
22f0ba4a2825f9 Hannes Reinecke        2020-02-28  1914  				adpt_i2o_scsi_complete(reply, cmd);
^1da177e4c3f41 Linus Torvalds         2005-04-16  1915  			}
^1da177e4c3f41 Linus Torvalds         2005-04-16  1916  		}
^1da177e4c3f41 Linus Torvalds         2005-04-16  1917  		writel(m, pHba->reply_port);
^1da177e4c3f41 Linus Torvalds         2005-04-16  1918  		wmb();
^1da177e4c3f41 Linus Torvalds         2005-04-16  1919  		rmb();
^1da177e4c3f41 Linus Torvalds         2005-04-16  1920  	}
^1da177e4c3f41 Linus Torvalds         2005-04-16  1921  	handled = 1;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1922  out:	if(pHba->host)
^1da177e4c3f41 Linus Torvalds         2005-04-16  1923  		spin_unlock_irqrestore(pHba->host->host_lock, flags);
^1da177e4c3f41 Linus Torvalds         2005-04-16  1924  	return IRQ_RETVAL(handled);
^1da177e4c3f41 Linus Torvalds         2005-04-16  1925  }
^1da177e4c3f41 Linus Torvalds         2005-04-16  1926  

:::::: The code at line 1863 was first introduced by commit
:::::: 67af2b060e027c84b8e48d77e00b2369d997c0d4 [SCSI] dpt_i2o: move from virt_to_bus/bus_to_virt to dma_alloc_coherent

:::::: TO: Miquel van Smoorenburg <miquels@cistron.nl>
:::::: CC: James Bottomley <James.Bottomley@HansenPartnership.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
