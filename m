Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B28770E2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Aug 2024 19:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722714809; cv=none; b=MHN/igNx5ZdUPeOpx1wFV0DpiKKNIaCIaVY0AeHE09zrXX1ahUM1Trs+aEcdtCiQhjGsX8UUdkDSJc7/TUG9wadriBeIEoXFag/K1fGyPCg5Xrs06OBZIDJwgqabJKVM0NfnD8vttSlF3W8TyaYahNep2pkoa0RhpiATpK2lfq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722714809; c=relaxed/simple;
	bh=XIQQfr/j5RbIe6aGycbvkK7n6pcN1kM4XK/bGjt4SM4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ghUxGWM1mfYGUk1oLX3zBVNIP6611R4kTiu4W8hVxp/kcEtQ4GMs4zFxn+6pC5PN1OpiMhUrIwSmTmWJABFNzA+bGeLCjKsHr39KiCdnykx0warmNDEoArpv+x60Bm1jaXppBTfVvP/uPTUSdh9ixweiX8yti0ahtkw/rHQOEew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NSiYul1g; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NSiYul1g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722714807; x=1754250807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XIQQfr/j5RbIe6aGycbvkK7n6pcN1kM4XK/bGjt4SM4=;
  b=NSiYul1gUpkFXaFLOcvWB0Vsd6//+fOb6ezEbIagbOBpkt+0sLeiUXlP
   kbXNGZ8u+UOTBEEmVaLniS/SD0g3jpUYVeNSAoVDVvXz3kgOLJW9FJSFb
   UD3mOWZ5Ux5n6aQ6R158dR+LPuYybbOCkt2BqCOZJJzJ73TMNHFWf3MKa
   FL2/3ppM6VCySkLQLKYb5G1ZkinKdI0fGXvthigaOc1LShUbHYuD2SQbz
   HlYpn1KJ4i1E/GITxPgsqoOYspUirY1xKNvWp34QBev4n+DAmiYILnBI0
   7CmUZrYKjBXjEFrHqG/CdlXz1m9upedDMRFXMX037aoQbWdQdw9mUDl5D
   Q==;
X-CSE-ConnectionGUID: 5mB5XDnWQsmLwUUjH8kVLQ==
X-CSE-MsgGUID: Y1IjlM8nS7eBe5HJUbpYqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="23628752"
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="23628752"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 12:53:26 -0700
X-CSE-ConnectionGUID: TsiE3a/cQweMFA+N7zcYJA==
X-CSE-MsgGUID: LSLFFZqGSQu7MIAm7TOVCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="55443562"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 03 Aug 2024 12:53:25 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saKod-0000ss-1H;
	Sat, 03 Aug 2024 19:53:23 +0000
Date: Sun, 4 Aug 2024 03:52:50 +0800
From: kernel test robot <lkp@intel.com>
To: Nava kishore Manne <nava.manne@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS 595/1093]
 drivers/fpga/fpga-mgr.c:933:undefined reference to `dma_buf_get'
Message-ID: <202408040354.qoBUCPSg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS
head:   868286d51b5753a66ab89c1c899510c6047b998d
commit: dc67651172095c04c4e6e1a64983036f4e654fd2 [595/1093] fpga: support loading from a pre-allocated buffer
config: riscv-randconfig-001-20240803 (https://download.01.org/0day-ci/archive/20240804/202408040354.qoBUCPSg-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240804/202408040354.qoBUCPSg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408040354.qoBUCPSg-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: drivers/fpga/fpga-mgr.o: in function `fpga_device_ioctl':
>> drivers/fpga/fpga-mgr.c:933:(.text+0x8fa): undefined reference to `dma_buf_get'
   riscv64-linux-ld: drivers/fpga/fpga-mgr.o: in function `firmware_store':
>> drivers/fpga/fpga-mgr.c:715:(.text+0x1090): undefined reference to `dma_buf_attach'
>> riscv64-linux-ld: drivers/fpga/fpga-mgr.c:723:(.text+0x10b8): undefined reference to `dma_buf_map_attachment'
   riscv64-linux-ld: drivers/fpga/fpga-mgr.o: in function `fpga_mgr_load':
>> drivers/fpga/fpga-mgr.c:616:(.text+0x10e0): undefined reference to `dma_buf_unmap_attachment'
>> riscv64-linux-ld: drivers/fpga/fpga-mgr.c:617:(.text+0x10ee): undefined reference to `dma_buf_detach'
   riscv64-linux-ld: drivers/fpga/fpga-mgr.o: in function `fpga_dmabuf_load':
>> drivers/fpga/fpga-mgr.c:536:(.text+0x10fc): undefined reference to `dma_buf_put'


vim +933 drivers/fpga/fpga-mgr.c

   926	
   927	static long fpga_device_ioctl(struct file *file, unsigned int cmd,
   928				      unsigned long arg)
   929	{
   930		char __user *argp = (char __user *)arg;
   931		int err;
   932	
 > 933		switch (cmd) {
   934		case FPGA_IOCTL_LOAD_DMA_BUFF:
   935			err = fpga_dmabuf_fd_get(file, argp);
   936			break;
   937		default:
   938			err = -ENOTTY;
   939		}
   940	
   941		return err;
   942	}
   943	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
