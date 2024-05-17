Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FB33D546
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 May 2024 12:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715949548; cv=none; b=Idb0P2+C6dj6kahgwFtNjfZg3LCiGFpX2wcabtwomaqMZgcxZcfpxFQIAePdbfTxrrK0y9c2HxQZNp+Uyhava7j3nal0Vx1vKW51QcFcI0DrpcERy2Sfqywo5HjHIeFAisQD5IxpmNMWniik8MwlRHf7rbEI2i0VOHNF13mak4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715949548; c=relaxed/simple;
	bh=8oAIyzT5IW6EQpOnPPjkdRJbUW3/9dPBZ/yrgQmDBV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZPOF03sA+2Vahz7chevbjt0LsIcAGvmuzw+oXTK/mEtVK/FjT3jPYFEv7WHuJnvsKxifOV1HOMwLcaf5ynepRnFZd5jIXFSuPb8oM5by32OJmFgN0kA02D8L92tLEIMtLGJ4s2Dtsj/uEMEsxmVzgutkmS6OZelVUaDv+tWk3wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iwUKMBzh; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iwUKMBzh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715949547; x=1747485547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8oAIyzT5IW6EQpOnPPjkdRJbUW3/9dPBZ/yrgQmDBV4=;
  b=iwUKMBzhIuwZeOSqvadVDDMo+ae+XEN755kJT54S7rJdiV6dShc1V+ov
   FyWLMXzIMHEPgZy5GIw5CkhGMfob3B30pw6UPC4HfKXEv4vMB9br6pAZN
   I14JLsp7E1a0BOQo1UjUnuXqeHJncOyX8hWsTRzxcIrlahO1GBdwhOxE7
   o8B74rxjWr87ou3GLmzsREjg7UkU1184fNYF7sr/+alNv+ZeirNvf87Zw
   C+nchevxLXUl1SkpR2J1tzAC8QWy1tLX1vROloM2TefLnHsY2uEyE990g
   vnFGeupCg0f4KDmFuFrN/8K7yuAuz5mAVghM9rl8sXvh6OdSBZW9pfMeV
   w==;
X-CSE-ConnectionGUID: puTvcU8LQ++1sobJ/nhOiw==
X-CSE-MsgGUID: AIyprmPHRf+6GlX6KKOnZw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12311895"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="12311895"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 05:39:06 -0700
X-CSE-ConnectionGUID: lC12+CDQRV2Vpz9eCGGVSw==
X-CSE-MsgGUID: PXPXd/GRRo611Y+4Ra4uKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="62603991"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 17 May 2024 05:39:03 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7wrU-0000gm-0f;
	Fri, 17 May 2024 12:39:00 +0000
Date: Fri, 17 May 2024 20:38:25 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6625/6628]
 drivers/crypto/ccp/hygon/psp-dev.c:472:5: warning: no previous prototype for
 '__vpsp_do_cmd_locked'
Message-ID: <202405172006.ebTeyrfr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   95dac159be359bc7ba42421426462f1a96f50ee9
commit: de722d17081287993748f63e8f34d06596eec824 [6625/6628] support tkm key isolation
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240517/202405172006.ebTeyrfr-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240517/202405172006.ebTeyrfr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405172006.ebTeyrfr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/ccp/hygon/psp-dev.c:49:10: warning: no previous prototype for 'atomic64_exchange' [-Wmissing-prototypes]
      49 | uint64_t atomic64_exchange(volatile uint64_t *dst, uint64_t val)
         |          ^~~~~~~~~~~~~~~~~
   drivers/crypto/ccp/hygon/psp-dev.c:63:5: warning: no previous prototype for 'psp_mutex_init' [-Wmissing-prototypes]
      63 | int psp_mutex_init(struct psp_mutex *mutex)
         |     ^~~~~~~~~~~~~~
>> drivers/crypto/ccp/hygon/psp-dev.c:472:5: warning: no previous prototype for '__vpsp_do_cmd_locked' [-Wmissing-prototypes]
     472 | int __vpsp_do_cmd_locked(uint32_t vid, int cmd, void *data, int *psp_ret)
         |     ^~~~~~~~~~~~~~~~~~~~
--
>> drivers/crypto/ccp/hygon/psp-dev.c:188: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * When the virtual machine executes the 'tkm' command,
   drivers/crypto/ccp/hygon/psp-dev.c:213: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Upon qemu startup, this section checks whether
   drivers/crypto/ccp/hygon/psp-dev.c:241: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Upon the virtual machine is shut down,


vim +/__vpsp_do_cmd_locked +472 drivers/crypto/ccp/hygon/psp-dev.c

   471	
 > 472	int __vpsp_do_cmd_locked(uint32_t vid, int cmd, void *data, int *psp_ret)
   473	{
   474		struct psp_device *psp = psp_master;
   475		struct sev_device *sev;
   476		phys_addr_t phys_addr;
   477		unsigned int phys_lsb, phys_msb;
   478		unsigned int reg, ret = 0;
   479	
   480		if (!psp || !psp->sev_data)
   481			return -ENODEV;
   482	
   483		if (*hygon_psp_hooks.psp_dead)
   484			return -EBUSY;
   485	
   486		sev = psp->sev_data;
   487	
   488		if (data && WARN_ON_ONCE(!virt_addr_valid(data)))
   489			return -EINVAL;
   490	
   491		/* Get the physical address of the command buffer */
   492		phys_addr = PUT_PSP_VID(__psp_pa(data), vid);
   493		phys_lsb = data ? lower_32_bits(phys_addr) : 0;
   494		phys_msb = data ? upper_32_bits(phys_addr) : 0;
   495	
   496		dev_dbg(sev->dev, "sev command id %#x buffer 0x%08x%08x timeout %us\n",
   497			cmd, phys_msb, phys_lsb, *hygon_psp_hooks.psp_timeout);
   498	
   499		print_hex_dump_debug("(in):  ", DUMP_PREFIX_OFFSET, 16, 2, data,
   500				     hygon_psp_hooks.sev_cmd_buffer_len(cmd), false);
   501	
   502		iowrite32(phys_lsb, sev->io_regs + sev->vdata->cmdbuff_addr_lo_reg);
   503		iowrite32(phys_msb, sev->io_regs + sev->vdata->cmdbuff_addr_hi_reg);
   504	
   505		sev->int_rcvd = 0;
   506	
   507		reg = FIELD_PREP(SEV_CMDRESP_CMD, cmd) | SEV_CMDRESP_IOC;
   508		iowrite32(reg, sev->io_regs + sev->vdata->cmdresp_reg);
   509	
   510		/* wait for command completion */
   511		ret = hygon_psp_hooks.sev_wait_cmd_ioc(sev, &reg, *hygon_psp_hooks.psp_timeout);
   512		if (ret) {
   513			if (psp_ret)
   514				*psp_ret = 0;
   515	
   516			dev_err(sev->dev, "sev command %#x timed out, disabling PSP\n", cmd);
   517			*hygon_psp_hooks.psp_dead = true;
   518	
   519			return ret;
   520		}
   521	
   522		*hygon_psp_hooks.psp_timeout = *hygon_psp_hooks.psp_cmd_timeout;
   523	
   524		if (psp_ret)
   525			*psp_ret = FIELD_GET(PSP_CMDRESP_STS, reg);
   526	
   527		if (FIELD_GET(PSP_CMDRESP_STS, reg)) {
   528			dev_dbg(sev->dev, "sev command %#x failed (%#010lx)\n",
   529				cmd, FIELD_GET(PSP_CMDRESP_STS, reg));
   530			ret = -EIO;
   531		}
   532	
   533		print_hex_dump_debug("(out): ", DUMP_PREFIX_OFFSET, 16, 2, data,
   534				     hygon_psp_hooks.sev_cmd_buffer_len(cmd), false);
   535	
   536		return ret;
   537	}
   538	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
