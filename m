Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DEA7E8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Apr 2024 21:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712613428; cv=none; b=rZ+lN1Q/QvtsspsXmqnjWfW53QU+p97b+Pe3Ayg7oVrGKa7F16K8ROJpQ+/CKVHNYo47hFO76TPV/y3SGIS++oaZ71ULheRndU48Y0Z8m3zHBgUzvXjymSzqWm6v0v/D/WAmrwcIw5vX92tHEYQL3+8+o8tY2k5UtKOqjKpRgKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712613428; c=relaxed/simple;
	bh=D4nq351oL6CNrVekRIuaiUze9aybAxAosWJEvWVr/6w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WiaErDU1eRChl7V96bexb8coE8lU7gyGG4/EXADw6bub8OWjrYTQQg+49T8ZGIX0dMXwj0GhMnRfL8It6tTzwzUZkY5RkMXC/hADYTY1cMKJHpWsI5foQClcbJ07/RUFY+Dt+gRdCAB7+d/8LqE4v24srAWuENzAbwSocBiPbBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cE31ZywS; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cE31ZywS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712613427; x=1744149427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D4nq351oL6CNrVekRIuaiUze9aybAxAosWJEvWVr/6w=;
  b=cE31ZywSZMDnatRVFrbVyhfIwEr/jm3gi8jFG+1E8WaptZyC2KB4T30e
   sqLm6gPNIbkiok6wZYtNXYiOibNo88/5oq7P2xRjPJTjin+wYiDxu2SDD
   +pPRAXgpEct68+kB26RrJ1TVb2+6Rg9119rGVBt521Zpr1lUNai5yFExM
   saN9EW4SWNOBh9C+NddizNqLmKWGGD2/WZf3h0tcvBe4B/ouaj2GFbBiX
   mq5LMLwqL+uyYTa7BKoD5uMtG0wWCHSfyF2WRvzzvuTwfgjVAS2balvRy
   7f2vDWN/YhYjYO3dZlpy3+fxg2dRGuif29+2cb9lZz5HSspJ45pI4CY/l
   Q==;
X-CSE-ConnectionGUID: 5OCD5GP6TGaIY0kCMAB1aQ==
X-CSE-MsgGUID: RERQ6nW3Tguq1VT+Av0HZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="11750029"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="11750029"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 14:57:07 -0700
X-CSE-ConnectionGUID: uXgMpYhPSuq/rmDjIt8mFw==
X-CSE-MsgGUID: 3VUoG6myRq+qNTqiaWfBHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="20138510"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Apr 2024 14:57:04 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtwz8-0005W6-1P;
	Mon, 08 Apr 2024 21:57:02 +0000
Date: Tue, 9 Apr 2024 05:56:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 78/144]
 drivers/misc/eeprom/idt_89hpesx.c:718:12: warning: 'idt_csr_write' defined
 but not used
Message-ID: <202404090522.AgD8qLWl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   b32f790cdb298ce85171870c8bf5557dc35a51a5
commit: 79301b69940a7eb819122a94ae86009cde5fdfda [78/144] misc: eeprom/idt_89hpesx: convert to read/write iterators
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240409/202404090522.AgD8qLWl-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240409/202404090522.AgD8qLWl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404090522.AgD8qLWl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/eeprom/idt_89hpesx.c:903:55: error: expected ';', ',' or ')' before '*' token
     903 | static ssize_t idt_dbgfs_csr_write(struct file *kiocb *iocb,
         |                                                       ^
   drivers/misc/eeprom/idt_89hpesx.c:1028:23: error: 'idt_dbgfs_csr_write' undeclared here (not in a function); did you mean 'idt_dbgfs_csr_read'?
    1028 |         .write_iter = idt_dbgfs_csr_write,
         |                       ^~~~~~~~~~~~~~~~~~~
         |                       idt_dbgfs_csr_read
>> drivers/misc/eeprom/idt_89hpesx.c:718:12: warning: 'idt_csr_write' defined but not used [-Wunused-function]
     718 | static int idt_csr_write(struct idt_89hpesx_dev *pdev, u16 csraddr,
         |            ^~~~~~~~~~~~~


vim +/idt_csr_write +718 drivers/misc/eeprom/idt_89hpesx.c

cfad6425382ec8 Serge Semin    2017-01-13  706  
cfad6425382ec8 Serge Semin    2017-01-13  707  /*===========================================================================
cfad6425382ec8 Serge Semin    2017-01-13  708   *                          CSR IO-operations
cfad6425382ec8 Serge Semin    2017-01-13  709   *===========================================================================
cfad6425382ec8 Serge Semin    2017-01-13  710   */
cfad6425382ec8 Serge Semin    2017-01-13  711  
cfad6425382ec8 Serge Semin    2017-01-13  712  /*
cfad6425382ec8 Serge Semin    2017-01-13  713   * idt_csr_write() - CSR write operation
cfad6425382ec8 Serge Semin    2017-01-13  714   * @pdev:	Pointer to the driver data
cfad6425382ec8 Serge Semin    2017-01-13  715   * @csraddr:	CSR address (with no two LS bits)
cfad6425382ec8 Serge Semin    2017-01-13  716   * @data:	Data to be written to CSR
cfad6425382ec8 Serge Semin    2017-01-13  717   */
cfad6425382ec8 Serge Semin    2017-01-13 @718  static int idt_csr_write(struct idt_89hpesx_dev *pdev, u16 csraddr,
cfad6425382ec8 Serge Semin    2017-01-13  719  			 const u32 data)
cfad6425382ec8 Serge Semin    2017-01-13  720  {
cfad6425382ec8 Serge Semin    2017-01-13  721  	struct device *dev = &pdev->client->dev;
cfad6425382ec8 Serge Semin    2017-01-13  722  	struct idt_csr_seq csrseq;
cfad6425382ec8 Serge Semin    2017-01-13  723  	struct idt_smb_seq smbseq;
cfad6425382ec8 Serge Semin    2017-01-13  724  	int ret;
cfad6425382ec8 Serge Semin    2017-01-13  725  
cfad6425382ec8 Serge Semin    2017-01-13  726  	/* Initialize SMBus sequence fields */
cfad6425382ec8 Serge Semin    2017-01-13  727  	smbseq.ccode = pdev->iniccode | CCODE_CSR;
cfad6425382ec8 Serge Semin    2017-01-13  728  	smbseq.data = (u8 *)&csrseq;
cfad6425382ec8 Serge Semin    2017-01-13  729  
cfad6425382ec8 Serge Semin    2017-01-13  730  	/* Lock IDT SMBus device */
cfad6425382ec8 Serge Semin    2017-01-13  731  	mutex_lock(&pdev->smb_mtx);
cfad6425382ec8 Serge Semin    2017-01-13  732  
cfad6425382ec8 Serge Semin    2017-01-13  733  	/* Perform write operation */
cfad6425382ec8 Serge Semin    2017-01-13  734  	smbseq.bytecnt = CSR_WR_CNT;
cfad6425382ec8 Serge Semin    2017-01-13  735  	csrseq.cmd = pdev->inicsrcmd | CSR_OP_WRITE;
cfad6425382ec8 Serge Semin    2017-01-13  736  	csrseq.csraddr = cpu_to_le16(csraddr);
cfad6425382ec8 Serge Semin    2017-01-13  737  	csrseq.data = cpu_to_le32(data);
cfad6425382ec8 Serge Semin    2017-01-13  738  	ret = pdev->smb_write(pdev, &smbseq);
cfad6425382ec8 Serge Semin    2017-01-13  739  	if (ret != 0) {
cfad6425382ec8 Serge Semin    2017-01-13  740  		dev_err(dev, "Failed to write 0x%04x: 0x%04x to csr",
cfad6425382ec8 Serge Semin    2017-01-13  741  			CSR_REAL_ADDR(csraddr), data);
cfad6425382ec8 Serge Semin    2017-01-13  742  		goto err_mutex_unlock;
cfad6425382ec8 Serge Semin    2017-01-13  743  	}
cfad6425382ec8 Serge Semin    2017-01-13  744  
cfad6425382ec8 Serge Semin    2017-01-13  745  	/* Send CSR address to read data from */
cfad6425382ec8 Serge Semin    2017-01-13  746  	smbseq.bytecnt = CSR_WRRD_CNT;
cfad6425382ec8 Serge Semin    2017-01-13  747  	csrseq.cmd = pdev->inicsrcmd | CSR_OP_READ;
cfad6425382ec8 Serge Semin    2017-01-13  748  	ret = pdev->smb_write(pdev, &smbseq);
cfad6425382ec8 Serge Semin    2017-01-13  749  	if (ret != 0) {
cfad6425382ec8 Serge Semin    2017-01-13  750  		dev_err(dev, "Failed to init csr address 0x%04x",
cfad6425382ec8 Serge Semin    2017-01-13  751  			CSR_REAL_ADDR(csraddr));
cfad6425382ec8 Serge Semin    2017-01-13  752  		goto err_mutex_unlock;
cfad6425382ec8 Serge Semin    2017-01-13  753  	}
cfad6425382ec8 Serge Semin    2017-01-13  754  
cfad6425382ec8 Serge Semin    2017-01-13  755  	/* Perform read operation */
cfad6425382ec8 Serge Semin    2017-01-13  756  	smbseq.bytecnt = CSR_RD_CNT;
cfad6425382ec8 Serge Semin    2017-01-13  757  	ret = pdev->smb_read(pdev, &smbseq);
cfad6425382ec8 Serge Semin    2017-01-13  758  	if (ret != 0) {
cfad6425382ec8 Serge Semin    2017-01-13  759  		dev_err(dev, "Failed to read csr 0x%04x",
cfad6425382ec8 Serge Semin    2017-01-13  760  			CSR_REAL_ADDR(csraddr));
cfad6425382ec8 Serge Semin    2017-01-13  761  		goto err_mutex_unlock;
cfad6425382ec8 Serge Semin    2017-01-13  762  	}
cfad6425382ec8 Serge Semin    2017-01-13  763  
cfad6425382ec8 Serge Semin    2017-01-13  764  	/* Check whether IDT successfully retrieved CSR data */
cfad6425382ec8 Serge Semin    2017-01-13  765  	if (csrseq.cmd & (CSR_RERR | CSR_WERR)) {
cfad6425382ec8 Serge Semin    2017-01-13  766  		dev_err(dev, "IDT failed to perform CSR r/w");
cfad6425382ec8 Serge Semin    2017-01-13  767  		ret = -EREMOTEIO;
cfad6425382ec8 Serge Semin    2017-01-13  768  		goto err_mutex_unlock;
cfad6425382ec8 Serge Semin    2017-01-13  769  	}
cfad6425382ec8 Serge Semin    2017-01-13  770  
cfad6425382ec8 Serge Semin    2017-01-13  771  	/* Unlock IDT SMBus device */
cfad6425382ec8 Serge Semin    2017-01-13  772  err_mutex_unlock:
cfad6425382ec8 Serge Semin    2017-01-13  773  	mutex_unlock(&pdev->smb_mtx);
cfad6425382ec8 Serge Semin    2017-01-13  774  
cfad6425382ec8 Serge Semin    2017-01-13  775  	return ret;
cfad6425382ec8 Serge Semin    2017-01-13  776  }
cfad6425382ec8 Serge Semin    2017-01-13  777  
cfad6425382ec8 Serge Semin    2017-01-13  778  /*
cfad6425382ec8 Serge Semin    2017-01-13  779   * idt_csr_read() - CSR read operation
cfad6425382ec8 Serge Semin    2017-01-13  780   * @pdev:	Pointer to the driver data
cfad6425382ec8 Serge Semin    2017-01-13  781   * @csraddr:	CSR address (with no two LS bits)
cfad6425382ec8 Serge Semin    2017-01-13  782   * @data:	Data to be written to CSR
cfad6425382ec8 Serge Semin    2017-01-13  783   */
cfad6425382ec8 Serge Semin    2017-01-13  784  static int idt_csr_read(struct idt_89hpesx_dev *pdev, u16 csraddr, u32 *data)
cfad6425382ec8 Serge Semin    2017-01-13  785  {
cfad6425382ec8 Serge Semin    2017-01-13  786  	struct device *dev = &pdev->client->dev;
cfad6425382ec8 Serge Semin    2017-01-13  787  	struct idt_csr_seq csrseq;
cfad6425382ec8 Serge Semin    2017-01-13  788  	struct idt_smb_seq smbseq;
cfad6425382ec8 Serge Semin    2017-01-13  789  	int ret;
cfad6425382ec8 Serge Semin    2017-01-13  790  
cfad6425382ec8 Serge Semin    2017-01-13  791  	/* Initialize SMBus sequence fields */
cfad6425382ec8 Serge Semin    2017-01-13  792  	smbseq.ccode = pdev->iniccode | CCODE_CSR;
cfad6425382ec8 Serge Semin    2017-01-13  793  	smbseq.data = (u8 *)&csrseq;
cfad6425382ec8 Serge Semin    2017-01-13  794  
cfad6425382ec8 Serge Semin    2017-01-13  795  	/* Lock IDT SMBus device */
cfad6425382ec8 Serge Semin    2017-01-13  796  	mutex_lock(&pdev->smb_mtx);
cfad6425382ec8 Serge Semin    2017-01-13  797  
cfad6425382ec8 Serge Semin    2017-01-13  798  	/* Send CSR register address before reading it */
cfad6425382ec8 Serge Semin    2017-01-13  799  	smbseq.bytecnt = CSR_WRRD_CNT;
cfad6425382ec8 Serge Semin    2017-01-13  800  	csrseq.cmd = pdev->inicsrcmd | CSR_OP_READ;
cfad6425382ec8 Serge Semin    2017-01-13  801  	csrseq.csraddr = cpu_to_le16(csraddr);
cfad6425382ec8 Serge Semin    2017-01-13  802  	ret = pdev->smb_write(pdev, &smbseq);
cfad6425382ec8 Serge Semin    2017-01-13  803  	if (ret != 0) {
cfad6425382ec8 Serge Semin    2017-01-13  804  		dev_err(dev, "Failed to init csr address 0x%04x",
cfad6425382ec8 Serge Semin    2017-01-13  805  			CSR_REAL_ADDR(csraddr));
cfad6425382ec8 Serge Semin    2017-01-13  806  		goto err_mutex_unlock;
cfad6425382ec8 Serge Semin    2017-01-13  807  	}
cfad6425382ec8 Serge Semin    2017-01-13  808  
cfad6425382ec8 Serge Semin    2017-01-13  809  	/* Perform read operation */
cfad6425382ec8 Serge Semin    2017-01-13  810  	smbseq.bytecnt = CSR_RD_CNT;
cfad6425382ec8 Serge Semin    2017-01-13  811  	ret = pdev->smb_read(pdev, &smbseq);
cfad6425382ec8 Serge Semin    2017-01-13  812  	if (ret != 0) {
ffff4913c7e22c Justin Stitt   2022-07-01  813  		dev_err(dev, "Failed to read csr 0x%04x",
cfad6425382ec8 Serge Semin    2017-01-13  814  			CSR_REAL_ADDR(csraddr));
cfad6425382ec8 Serge Semin    2017-01-13  815  		goto err_mutex_unlock;
cfad6425382ec8 Serge Semin    2017-01-13  816  	}
cfad6425382ec8 Serge Semin    2017-01-13  817  
cfad6425382ec8 Serge Semin    2017-01-13  818  	/* Check whether IDT successfully retrieved CSR data */
cfad6425382ec8 Serge Semin    2017-01-13  819  	if (csrseq.cmd & (CSR_RERR | CSR_WERR)) {
cfad6425382ec8 Serge Semin    2017-01-13  820  		dev_err(dev, "IDT failed to perform CSR r/w");
cfad6425382ec8 Serge Semin    2017-01-13  821  		ret = -EREMOTEIO;
cfad6425382ec8 Serge Semin    2017-01-13  822  		goto err_mutex_unlock;
cfad6425382ec8 Serge Semin    2017-01-13  823  	}
cfad6425382ec8 Serge Semin    2017-01-13  824  
cfad6425382ec8 Serge Semin    2017-01-13  825  	/* Save data retrieved from IDT */
cfad6425382ec8 Serge Semin    2017-01-13  826  	*data = le32_to_cpu(csrseq.data);
cfad6425382ec8 Serge Semin    2017-01-13  827  
cfad6425382ec8 Serge Semin    2017-01-13  828  	/* Unlock IDT SMBus device */
cfad6425382ec8 Serge Semin    2017-01-13  829  err_mutex_unlock:
cfad6425382ec8 Serge Semin    2017-01-13  830  	mutex_unlock(&pdev->smb_mtx);
cfad6425382ec8 Serge Semin    2017-01-13  831  
cfad6425382ec8 Serge Semin    2017-01-13  832  	return ret;
cfad6425382ec8 Serge Semin    2017-01-13  833  }
cfad6425382ec8 Serge Semin    2017-01-13  834  
cfad6425382ec8 Serge Semin    2017-01-13  835  /*===========================================================================
cfad6425382ec8 Serge Semin    2017-01-13  836   *                          Sysfs/debugfs-nodes IO-operations
cfad6425382ec8 Serge Semin    2017-01-13  837   *===========================================================================
cfad6425382ec8 Serge Semin    2017-01-13  838   */
cfad6425382ec8 Serge Semin    2017-01-13  839  
cfad6425382ec8 Serge Semin    2017-01-13  840  /*
cfad6425382ec8 Serge Semin    2017-01-13  841   * eeprom_write() - EEPROM sysfs-node write callback
cfad6425382ec8 Serge Semin    2017-01-13  842   * @filep:	Pointer to the file system node
cfad6425382ec8 Serge Semin    2017-01-13  843   * @kobj:	Pointer to the kernel object related to the sysfs-node
cfad6425382ec8 Serge Semin    2017-01-13  844   * @attr:	Attributes of the file
cfad6425382ec8 Serge Semin    2017-01-13  845   * @buf:	Buffer to write data to
cfad6425382ec8 Serge Semin    2017-01-13  846   * @off:	Offset at which data should be written to
cfad6425382ec8 Serge Semin    2017-01-13  847   * @count:	Number of bytes to write
cfad6425382ec8 Serge Semin    2017-01-13  848   */
cfad6425382ec8 Serge Semin    2017-01-13  849  static ssize_t eeprom_write(struct file *filp, struct kobject *kobj,
cfad6425382ec8 Serge Semin    2017-01-13  850  			    struct bin_attribute *attr,
cfad6425382ec8 Serge Semin    2017-01-13  851  			    char *buf, loff_t off, size_t count)
cfad6425382ec8 Serge Semin    2017-01-13  852  {
cfad6425382ec8 Serge Semin    2017-01-13  853  	struct idt_89hpesx_dev *pdev;
cfad6425382ec8 Serge Semin    2017-01-13  854  	int ret;
cfad6425382ec8 Serge Semin    2017-01-13  855  
cfad6425382ec8 Serge Semin    2017-01-13  856  	/* Retrieve driver data */
cfad6425382ec8 Serge Semin    2017-01-13  857  	pdev = dev_get_drvdata(kobj_to_dev(kobj));
cfad6425382ec8 Serge Semin    2017-01-13  858  
cfad6425382ec8 Serge Semin    2017-01-13  859  	/* Perform EEPROM write operation */
cfad6425382ec8 Serge Semin    2017-01-13  860  	ret = idt_eeprom_write(pdev, (u16)off, (u16)count, (u8 *)buf);
cfad6425382ec8 Serge Semin    2017-01-13  861  	return (ret != 0 ? ret : count);
cfad6425382ec8 Serge Semin    2017-01-13  862  }
cfad6425382ec8 Serge Semin    2017-01-13  863  
cfad6425382ec8 Serge Semin    2017-01-13  864  /*
cfad6425382ec8 Serge Semin    2017-01-13  865   * eeprom_read() - EEPROM sysfs-node read callback
cfad6425382ec8 Serge Semin    2017-01-13  866   * @filep:	Pointer to the file system node
cfad6425382ec8 Serge Semin    2017-01-13  867   * @kobj:	Pointer to the kernel object related to the sysfs-node
cfad6425382ec8 Serge Semin    2017-01-13  868   * @attr:	Attributes of the file
cfad6425382ec8 Serge Semin    2017-01-13  869   * @buf:	Buffer to write data to
cfad6425382ec8 Serge Semin    2017-01-13  870   * @off:	Offset at which data should be written to
cfad6425382ec8 Serge Semin    2017-01-13  871   * @count:	Number of bytes to write
cfad6425382ec8 Serge Semin    2017-01-13  872   */
cfad6425382ec8 Serge Semin    2017-01-13  873  static ssize_t eeprom_read(struct file *filp, struct kobject *kobj,
cfad6425382ec8 Serge Semin    2017-01-13  874  			   struct bin_attribute *attr,
cfad6425382ec8 Serge Semin    2017-01-13  875  			   char *buf, loff_t off, size_t count)
cfad6425382ec8 Serge Semin    2017-01-13  876  {
cfad6425382ec8 Serge Semin    2017-01-13  877  	struct idt_89hpesx_dev *pdev;
cfad6425382ec8 Serge Semin    2017-01-13  878  	int ret;
cfad6425382ec8 Serge Semin    2017-01-13  879  
cfad6425382ec8 Serge Semin    2017-01-13  880  	/* Retrieve driver data */
cfad6425382ec8 Serge Semin    2017-01-13  881  	pdev = dev_get_drvdata(kobj_to_dev(kobj));
cfad6425382ec8 Serge Semin    2017-01-13  882  
cfad6425382ec8 Serge Semin    2017-01-13  883  	/* Perform EEPROM read operation */
cfad6425382ec8 Serge Semin    2017-01-13  884  	ret = idt_eeprom_read(pdev, (u16)off, (u16)count, (u8 *)buf);
cfad6425382ec8 Serge Semin    2017-01-13  885  	return (ret != 0 ? ret : count);
cfad6425382ec8 Serge Semin    2017-01-13  886  }
cfad6425382ec8 Serge Semin    2017-01-13  887  
cfad6425382ec8 Serge Semin    2017-01-13  888  /*
cfad6425382ec8 Serge Semin    2017-01-13  889   * idt_dbgfs_csr_write() - CSR debugfs-node write callback
cfad6425382ec8 Serge Semin    2017-01-13  890   * @filep:	Pointer to the file system file descriptor
cfad6425382ec8 Serge Semin    2017-01-13  891   * @buf:	Buffer to read data from
cfad6425382ec8 Serge Semin    2017-01-13  892   * @count:	Size of the buffer
cfad6425382ec8 Serge Semin    2017-01-13  893   * @offp:	Offset within the file
cfad6425382ec8 Serge Semin    2017-01-13  894   *
cfad6425382ec8 Serge Semin    2017-01-13  895   * It accepts either "0x<reg addr>:0x<value>" for saving register address
cfad6425382ec8 Serge Semin    2017-01-13  896   * and writing value to specified DWORD register or "0x<reg addr>" for
cfad6425382ec8 Serge Semin    2017-01-13  897   * just saving register address in order to perform next read operation.
cfad6425382ec8 Serge Semin    2017-01-13  898   *
cfad6425382ec8 Serge Semin    2017-01-13  899   * WARNING No spaces are allowed. Incoming string must be strictly formated as:
cfad6425382ec8 Serge Semin    2017-01-13  900   * "<reg addr>:<value>". Register address must be aligned within 4 bytes
cfad6425382ec8 Serge Semin    2017-01-13  901   * (one DWORD).
cfad6425382ec8 Serge Semin    2017-01-13  902   */
79301b69940a7e Jens Axboe     2024-04-05 @903  static ssize_t idt_dbgfs_csr_write(struct file *kiocb *iocb,
79301b69940a7e Jens Axboe     2024-04-05  904  				   struct iov_iter *from)
cfad6425382ec8 Serge Semin    2017-01-13  905  {
cfad6425382ec8 Serge Semin    2017-01-13  906  	struct idt_89hpesx_dev *pdev = filep->private_data;
cfad6425382ec8 Serge Semin    2017-01-13  907  	char *colon_ch, *csraddr_str, *csrval_str;
79301b69940a7e Jens Axboe     2024-04-05  908  	size_t count = iov_iter_count(from);
bcdf91c9f9077d Justin Stitt   2023-09-27  909  	int ret;
cfad6425382ec8 Serge Semin    2017-01-13  910  	u32 csraddr, csrval;
cfad6425382ec8 Serge Semin    2017-01-13  911  	char *buf;
cfad6425382ec8 Serge Semin    2017-01-13  912  
79301b69940a7e Jens Axboe     2024-04-05  913  	if (iocb->ki_pos)
71d46f1ff2212c Dan Carpenter  2022-07-08  914  		return 0;
71d46f1ff2212c Dan Carpenter  2022-07-08  915  
cfad6425382ec8 Serge Semin    2017-01-13  916  	/* Copy data from User-space */
79301b69940a7e Jens Axboe     2024-04-05  917  	buf = iterdup_user(from, count);
183238ffb8863e Ruan Jinjie    2023-08-10  918  	if (IS_ERR(buf))
183238ffb8863e Ruan Jinjie    2023-08-10  919  		return PTR_ERR(buf);
cfad6425382ec8 Serge Semin    2017-01-13  920  
cfad6425382ec8 Serge Semin    2017-01-13  921  	/* Find position of colon in the buffer */
cfad6425382ec8 Serge Semin    2017-01-13  922  	colon_ch = strnchr(buf, count, ':');
cfad6425382ec8 Serge Semin    2017-01-13  923  
cfad6425382ec8 Serge Semin    2017-01-13  924  	/*
cfad6425382ec8 Serge Semin    2017-01-13  925  	 * If there is colon passed then new CSR value should be parsed as
cfad6425382ec8 Serge Semin    2017-01-13  926  	 * well, so allocate buffer for CSR address substring.
cfad6425382ec8 Serge Semin    2017-01-13  927  	 * If no colon is found, then string must have just one number with
cfad6425382ec8 Serge Semin    2017-01-13  928  	 * no new CSR value
cfad6425382ec8 Serge Semin    2017-01-13  929  	 */
cfad6425382ec8 Serge Semin    2017-01-13  930  	if (colon_ch != NULL) {
bcdf91c9f9077d Justin Stitt   2023-09-27  931  		/* Copy the register address to the substring buffer */
bcdf91c9f9077d Justin Stitt   2023-09-27  932  		csraddr_str = kmemdup_nul(buf, colon_ch - buf, GFP_KERNEL);
acf50ec773703f Colin Ian King 2017-01-24  933  		if (csraddr_str == NULL) {
acf50ec773703f Colin Ian King 2017-01-24  934  			ret = -ENOMEM;
acf50ec773703f Colin Ian King 2017-01-24  935  			goto free_buf;
acf50ec773703f Colin Ian King 2017-01-24  936  		}
cfad6425382ec8 Serge Semin    2017-01-13  937  		/* Register value must follow the colon */
cfad6425382ec8 Serge Semin    2017-01-13  938  		csrval_str = colon_ch + 1;
cfad6425382ec8 Serge Semin    2017-01-13  939  	} else /* if (str_colon == NULL) */ {
cfad6425382ec8 Serge Semin    2017-01-13  940  		csraddr_str = (char *)buf; /* Just to shut warning up */
cfad6425382ec8 Serge Semin    2017-01-13  941  		csrval_str = NULL;
cfad6425382ec8 Serge Semin    2017-01-13  942  	}
cfad6425382ec8 Serge Semin    2017-01-13  943  
cfad6425382ec8 Serge Semin    2017-01-13  944  	/* Convert CSR address to u32 value */
cfad6425382ec8 Serge Semin    2017-01-13  945  	ret = kstrtou32(csraddr_str, 0, &csraddr);
cfad6425382ec8 Serge Semin    2017-01-13  946  	if (ret != 0)
cfad6425382ec8 Serge Semin    2017-01-13  947  		goto free_csraddr_str;
cfad6425382ec8 Serge Semin    2017-01-13  948  
cfad6425382ec8 Serge Semin    2017-01-13  949  	/* Check whether passed register address is valid */
cfad6425382ec8 Serge Semin    2017-01-13  950  	if (csraddr > CSR_MAX || !IS_ALIGNED(csraddr, SZ_4)) {
cfad6425382ec8 Serge Semin    2017-01-13  951  		ret = -EINVAL;
cfad6425382ec8 Serge Semin    2017-01-13  952  		goto free_csraddr_str;
cfad6425382ec8 Serge Semin    2017-01-13  953  	}
cfad6425382ec8 Serge Semin    2017-01-13  954  
cfad6425382ec8 Serge Semin    2017-01-13  955  	/* Shift register address to the right so to have u16 address */
cfad6425382ec8 Serge Semin    2017-01-13  956  	pdev->csr = (csraddr >> 2);
cfad6425382ec8 Serge Semin    2017-01-13  957  
cfad6425382ec8 Serge Semin    2017-01-13  958  	/* Parse new CSR value and send it to IDT, if colon has been found */
cfad6425382ec8 Serge Semin    2017-01-13  959  	if (colon_ch != NULL) {
cfad6425382ec8 Serge Semin    2017-01-13  960  		ret = kstrtou32(csrval_str, 0, &csrval);
cfad6425382ec8 Serge Semin    2017-01-13  961  		if (ret != 0)
cfad6425382ec8 Serge Semin    2017-01-13  962  			goto free_csraddr_str;
cfad6425382ec8 Serge Semin    2017-01-13  963  
cfad6425382ec8 Serge Semin    2017-01-13  964  		ret = idt_csr_write(pdev, pdev->csr, csrval);
cfad6425382ec8 Serge Semin    2017-01-13  965  		if (ret != 0)
cfad6425382ec8 Serge Semin    2017-01-13  966  			goto free_csraddr_str;
cfad6425382ec8 Serge Semin    2017-01-13  967  	}
cfad6425382ec8 Serge Semin    2017-01-13  968  
cfad6425382ec8 Serge Semin    2017-01-13  969  	/* Free memory only if colon has been found */
cfad6425382ec8 Serge Semin    2017-01-13  970  free_csraddr_str:
cfad6425382ec8 Serge Semin    2017-01-13  971  	if (colon_ch != NULL)
cfad6425382ec8 Serge Semin    2017-01-13  972  		kfree(csraddr_str);
cfad6425382ec8 Serge Semin    2017-01-13  973  
cfad6425382ec8 Serge Semin    2017-01-13  974  	/* Free buffer allocated for data retrieved from User-space */
cfad6425382ec8 Serge Semin    2017-01-13  975  free_buf:
cfad6425382ec8 Serge Semin    2017-01-13  976  	kfree(buf);
cfad6425382ec8 Serge Semin    2017-01-13  977  
cfad6425382ec8 Serge Semin    2017-01-13  978  	return (ret != 0 ? ret : count);
cfad6425382ec8 Serge Semin    2017-01-13  979  }
cfad6425382ec8 Serge Semin    2017-01-13  980  

:::::: The code at line 718 was first introduced by commit
:::::: cfad6425382ec81acd073fdf24361e1c30b4cb36 eeprom: Add IDT 89HPESx EEPROM/CSR driver

:::::: TO: Serge Semin <fancer.lancer@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
