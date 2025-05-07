Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD88B214238
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 10:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746612914; cv=none; b=aSOStSY/wh4MCWVe7MFtYTKh+swT3fGG8ywpB04Uz0lIz9zm51JdYMz81CL820j2IjwZyBKlwRpIDj4ZDyAUeX9KnVkWpFttCsi52T4wN0V2L8td3lic14KiPGKwB+IPn1yfl0mq58cX7wgzNML4lDsm3TnCjcvG2nLQE9SX/Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746612914; c=relaxed/simple;
	bh=D6P8j0PCnqxYfKkACtD11H7d+ITN5skC8QG4BFHthkw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XSneo22EPiLH8Ue+zaIm/C1pi0QRfTAO+7W1+0ZEhU4XM6rAaHni4DxzCZZXjmYuPPDmyfEvI0CZPOv7ePlsFUFWBpln7XERrs2HCh8E/oyIOYEccr2PKD1ZLGOe9dA2pnQuI8oAfu+DlexyXEmgYlNJZax/IoiXWINQxX1fD+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PHB+CNJf; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PHB+CNJf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746612913; x=1778148913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D6P8j0PCnqxYfKkACtD11H7d+ITN5skC8QG4BFHthkw=;
  b=PHB+CNJf2DD7MjXBbRm4y5R3GzCgY8C74JW8s8xv7o6TGUgV2zYlQ+St
   /xPgCO1zy5l14mcT7EA5pHddDC8IqS4whbFkrHBNmeGWeM4xW6SeqFrpJ
   EPc9QO+dreHA6rHWkZcUzLkWBkmaGDJBor3qpxFqIqt0i0cz/OoPMbHgK
   SnfCq6t0mSu7p6LxJfRg4l0jdazASfIQshADMLMPHmHlo0tt9VsZi/A3M
   8vwhG1V6K5qoNhFq31H2+zx6+QC+Pf6N2SlA9xcZ4e0VI4Xv29pnvPBnr
   0cjW4iBy8LkASHTcx+0IElOJegXCXbDMi5S2EGQiy17mUVIaT8fOCeeJd
   A==;
X-CSE-ConnectionGUID: iz0m2Y+9RsuWGVhUgDB9+Q==
X-CSE-MsgGUID: Q+ieFaMQRZONd4q12iGO7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="65743492"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="65743492"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 03:15:12 -0700
X-CSE-ConnectionGUID: bu/vC7qjQfGp9zXC03QF9w==
X-CSE-MsgGUID: E2WcRXmLSXCa7PDbZaNgmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="141104936"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 May 2025 03:15:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCbnv-0007a4-2X;
	Wed, 07 May 2025 10:15:07 +0000
Date: Wed, 7 May 2025 18:14:48 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Andi Shyti <andi.shyti@kernel.org>
Subject: [linux-next:master 2949/6092]
 drivers/i2c/busses/i2c-xgene-slimpro.c:153:38: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202505071823.iW8ueroY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   08710e696081d58163c8078e0e096be6d35c5fad
commit: 1dde04276b4d711acdf80515dde7a166efefb1cb [2949/6092] i2c: xgene-slimpro: Simplify PCC shared memory region handling
config: arm64-randconfig-r133-20250426 (https://download.01.org/0day-ci/archive/20250507/202505071823.iW8ueroY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250507/202505071823.iW8ueroY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071823.iW8ueroY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/i2c/busses/i2c-xgene-slimpro.c:121:15: sparse: sparse: cast to restricted __le16
   drivers/i2c/busses/i2c-xgene-slimpro.c:121:15: sparse: sparse: cast to restricted __le16
   drivers/i2c/busses/i2c-xgene-slimpro.c:121:15: sparse: sparse: cast to restricted __le16
   drivers/i2c/busses/i2c-xgene-slimpro.c:121:15: sparse: sparse: cast to restricted __le16
   drivers/i2c/busses/i2c-xgene-slimpro.c:124:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short volatile @@     got restricted __le16 [usertype] @@
   drivers/i2c/busses/i2c-xgene-slimpro.c:124:9: sparse:     expected unsigned short volatile
   drivers/i2c/busses/i2c-xgene-slimpro.c:124:9: sparse:     got restricted __le16 [usertype]
>> drivers/i2c/busses/i2c-xgene-slimpro.c:153:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned short [usertype] *addr @@     got unsigned short [noderef] __iomem * @@
   drivers/i2c/busses/i2c-xgene-slimpro.c:153:38: sparse:     expected unsigned short [usertype] *addr
   drivers/i2c/busses/i2c-xgene-slimpro.c:153:38: sparse:     got unsigned short [noderef] __iomem *
   drivers/i2c/busses/i2c-xgene-slimpro.c:157:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned short [usertype] *addr @@     got unsigned short [noderef] __iomem * @@
   drivers/i2c/busses/i2c-xgene-slimpro.c:157:37: sparse:     expected unsigned short [usertype] *addr
   drivers/i2c/busses/i2c-xgene-slimpro.c:157:37: sparse:     got unsigned short [noderef] __iomem *
>> drivers/i2c/busses/i2c-xgene-slimpro.c:159:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *msg @@     got struct acpi_pcct_shared_memory [noderef] __iomem * @@
   drivers/i2c/busses/i2c-xgene-slimpro.c:159:21: sparse:     expected void *msg
   drivers/i2c/busses/i2c-xgene-slimpro.c:159:21: sparse:     got struct acpi_pcct_shared_memory [noderef] __iomem *
>> drivers/i2c/busses/i2c-xgene-slimpro.c:173:21: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/i2c/busses/i2c-xgene-slimpro.c:177:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/i2c/busses/i2c-xgene-slimpro.c:177:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile @@     got restricted __le32 [usertype] @@
   drivers/i2c/busses/i2c-xgene-slimpro.c:177:9: sparse:     expected unsigned int volatile
   drivers/i2c/busses/i2c-xgene-slimpro.c:177:9: sparse:     got restricted __le32 [usertype]
   drivers/i2c/busses/i2c-xgene-slimpro.c:180:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/i2c/busses/i2c-xgene-slimpro.c:180:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short volatile @@     got restricted __le16 [usertype] @@
   drivers/i2c/busses/i2c-xgene-slimpro.c:180:9: sparse:     expected unsigned short volatile
   drivers/i2c/busses/i2c-xgene-slimpro.c:180:9: sparse:     got restricted __le16 [usertype]
   drivers/i2c/busses/i2c-xgene-slimpro.c:183:18: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/i2c/busses/i2c-xgene-slimpro.c:183:18: sparse: sparse: cast to restricted __le16
   drivers/i2c/busses/i2c-xgene-slimpro.c:183:18: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/i2c/busses/i2c-xgene-slimpro.c:183:18: sparse: sparse: cast to restricted __le16
   drivers/i2c/busses/i2c-xgene-slimpro.c:183:18: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/i2c/busses/i2c-xgene-slimpro.c:183:18: sparse: sparse: cast to restricted __le16
   drivers/i2c/busses/i2c-xgene-slimpro.c:183:18: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/i2c/busses/i2c-xgene-slimpro.c:183:18: sparse: sparse: cast to restricted __le16
   drivers/i2c/busses/i2c-xgene-slimpro.c:185:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/i2c/busses/i2c-xgene-slimpro.c:185:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short volatile @@     got restricted __le16 [usertype] @@
   drivers/i2c/busses/i2c-xgene-slimpro.c:185:9: sparse:     expected unsigned short volatile
   drivers/i2c/busses/i2c-xgene-slimpro.c:185:9: sparse:     got restricted __le16 [usertype]
   drivers/i2c/busses/i2c-xgene-slimpro.c:189:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile @@     got restricted __le32 [usertype] @@
   drivers/i2c/busses/i2c-xgene-slimpro.c:189:17: sparse:     expected unsigned int volatile
   drivers/i2c/busses/i2c-xgene-slimpro.c:189:17: sparse:     got restricted __le32 [usertype]

vim +153 drivers/i2c/busses/i2c-xgene-slimpro.c

f6505fbabc426b Feng Kan     2015-04-24  145  
df5da47fe722e3 Hoan Tran    2017-04-24  146  static void slimpro_i2c_pcc_rx_cb(struct mbox_client *cl, void *msg)
df5da47fe722e3 Hoan Tran    2017-04-24  147  {
df5da47fe722e3 Hoan Tran    2017-04-24  148  	struct slimpro_i2c_dev *ctx = to_slimpro_i2c_dev(cl);
1dde04276b4d71 Sudeep Holla 2025-04-11  149  	struct acpi_pcct_shared_memory __iomem *generic_comm_base =
1dde04276b4d71 Sudeep Holla 2025-04-11  150  							ctx->pcc_chan->shmem;
df5da47fe722e3 Hoan Tran    2017-04-24  151  
df5da47fe722e3 Hoan Tran    2017-04-24  152  	/* Check if platform sends interrupt */
df5da47fe722e3 Hoan Tran    2017-04-24 @153  	if (!xgene_word_tst_and_clr(&generic_comm_base->status,
89a4ad1f437c04 Sudeep Holla 2023-09-27  154  				    PCC_STATUS_SCI_DOORBELL))
df5da47fe722e3 Hoan Tran    2017-04-24  155  		return;
df5da47fe722e3 Hoan Tran    2017-04-24  156  
df5da47fe722e3 Hoan Tran    2017-04-24  157  	if (xgene_word_tst_and_clr(&generic_comm_base->status,
89a4ad1f437c04 Sudeep Holla 2023-09-27  158  				   PCC_STATUS_CMD_COMPLETE)) {
df5da47fe722e3 Hoan Tran    2017-04-24 @159  		msg = generic_comm_base + 1;
df5da47fe722e3 Hoan Tran    2017-04-24  160  
df5da47fe722e3 Hoan Tran    2017-04-24  161  		/* Response message msg[1] contains the return value. */
df5da47fe722e3 Hoan Tran    2017-04-24  162  		if (ctx->resp_msg)
df5da47fe722e3 Hoan Tran    2017-04-24  163  			*ctx->resp_msg = ((u32 *)msg)[1];
df5da47fe722e3 Hoan Tran    2017-04-24  164  
df5da47fe722e3 Hoan Tran    2017-04-24  165  		complete(&ctx->rd_complete);
df5da47fe722e3 Hoan Tran    2017-04-24  166  	}
df5da47fe722e3 Hoan Tran    2017-04-24  167  }
df5da47fe722e3 Hoan Tran    2017-04-24  168  
df5da47fe722e3 Hoan Tran    2017-04-24  169  static void slimpro_i2c_pcc_tx_prepare(struct slimpro_i2c_dev *ctx, u32 *msg)
df5da47fe722e3 Hoan Tran    2017-04-24  170  {
1dde04276b4d71 Sudeep Holla 2025-04-11  171  	struct acpi_pcct_shared_memory __iomem *generic_comm_base =
1dde04276b4d71 Sudeep Holla 2025-04-11  172  							ctx->pcc_chan->shmem;
df5da47fe722e3 Hoan Tran    2017-04-24 @173  	u32 *ptr = (void *)(generic_comm_base + 1);
df5da47fe722e3 Hoan Tran    2017-04-24  174  	u16 status;
df5da47fe722e3 Hoan Tran    2017-04-24  175  	int i;
df5da47fe722e3 Hoan Tran    2017-04-24  176  
df5da47fe722e3 Hoan Tran    2017-04-24  177  	WRITE_ONCE(generic_comm_base->signature,
df5da47fe722e3 Hoan Tran    2017-04-24  178  		   cpu_to_le32(PCC_SIGNATURE | ctx->mbox_idx));
df5da47fe722e3 Hoan Tran    2017-04-24  179  
df5da47fe722e3 Hoan Tran    2017-04-24  180  	WRITE_ONCE(generic_comm_base->command,
89a4ad1f437c04 Sudeep Holla 2023-09-27  181  		   cpu_to_le16(SLIMPRO_MSG_TYPE(msg[0]) | PCC_CMD_GENERATE_DB_INTR));
df5da47fe722e3 Hoan Tran    2017-04-24  182  
df5da47fe722e3 Hoan Tran    2017-04-24  183  	status = le16_to_cpu(READ_ONCE(generic_comm_base->status));
89a4ad1f437c04 Sudeep Holla 2023-09-27  184  	status &= ~PCC_STATUS_CMD_COMPLETE;
df5da47fe722e3 Hoan Tran    2017-04-24  185  	WRITE_ONCE(generic_comm_base->status, cpu_to_le16(status));
df5da47fe722e3 Hoan Tran    2017-04-24  186  
df5da47fe722e3 Hoan Tran    2017-04-24  187  	/* Copy the message to the PCC comm space */
df5da47fe722e3 Hoan Tran    2017-04-24  188  	for (i = 0; i < SLIMPRO_IIC_MSG_DWORD_COUNT; i++)
df5da47fe722e3 Hoan Tran    2017-04-24  189  		WRITE_ONCE(ptr[i], cpu_to_le32(msg[i]));
df5da47fe722e3 Hoan Tran    2017-04-24  190  }
df5da47fe722e3 Hoan Tran    2017-04-24  191  

:::::: The code at line 153 was first introduced by commit
:::::: df5da47fe722e36055b97134e6bb9df58c12495c i2c: xgene-slimpro: Add ACPI support by using PCC mailbox

:::::: TO: Hoan Tran <hotran@apm.com>
:::::: CC: Wolfram Sang <wsa@the-dreams.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
