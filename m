Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A016202F61
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Oct 2024 07:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728546905; cv=none; b=pJnWtUV6maViPI+MDpJtG9qOLHQSisfqh8hATPZyyMUw4nlsTJg7qBvQB17+JIS7SqCFg0awYOIPTyTpnkfMxX5Tjp+3AkmJkPGMaLLEm9+n6uKLpWR5GZXXrMHhxjiJ7kLxZojpe4PO0FQOzu9KhHEKnMQjrz1TcEbENoYhIgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728546905; c=relaxed/simple;
	bh=qpKB7rPqp+wo67hWp744rDgHW4BAwYSYhJYl0cyP41U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k4hZkexeZZKYupRlbKHrU3ONQc2udwHVAfpOu+OsUiFDU+CzSHzUQYqZmEr05KjA+RcIvuM1RjBoOkiApoG8O3NnGx2EA+KKkJogovR4B6mdGvzNlzCAQutVZiRlCFCM24gjL8ZxcvYkSy61WBQnV2BXGqku2CNhUgZozc4WxOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jSA0tO4B; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jSA0tO4B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728546903; x=1760082903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qpKB7rPqp+wo67hWp744rDgHW4BAwYSYhJYl0cyP41U=;
  b=jSA0tO4BpV8lu4rJrQ6hgRWPl2t4Z+oUG7Xv7+cnKkvji3de/4p6h5Cw
   MfE1q+29UjKqQUEt5zT3aQ8I24Btcz1EqVS/oW8KdGsu2FFmCJzrsanAy
   V6gLIVhNU01TeCrdv4HPqAjzNJB6ikLV3sLsBNYjMItG/stmK5kfn4VLy
   o94TsUVfpIv4ynd5+cg/jvNuj+x7B7AU8z/Hy1THQVA+DPvIAs+P+FCuC
   KDc3Yas4RtfDvfdRdpGED2iFxZeHHWr5cl2o5xCcP2ZWYHwP49Lr781bP
   H6wvjZn0A5VU8MZd4Y8vhpUHPT7YXZ2GfMlUI5N1U1ciKuLJuj8EqoY2m
   Q==;
X-CSE-ConnectionGUID: Y1Lyi/QpRnWEJHs8UKMCAw==
X-CSE-MsgGUID: USChtvzbRIKT/3a9cVwv/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="30760897"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="30760897"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 00:55:00 -0700
X-CSE-ConnectionGUID: ZSAxkIwCSHyaMp7KSgt1iA==
X-CSE-MsgGUID: s9fUpJJ2QS6+a8yyrCFAyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="99837452"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Oct 2024 00:54:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syo0b-000AMs-10;
	Thu, 10 Oct 2024 07:54:53 +0000
Date: Thu, 10 Oct 2024 15:54:35 +0800
From: kernel test robot <lkp@intel.com>
To: Kamlesh Gurudasani <kamlesh@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 107/137] drivers/crypto/ti/mcrc64.c:166:44:
 sparse: sparse: incorrect type in argument 1 (different base types)
Message-ID: <202410101554.ENGNOKfR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   7866eaeb3c1ddb52b976c3e4140cdfbba28a74f3
commit: 2af1725d4bd6b8b24a1a2b47e1de27949d1cee9b [107/137] crypto: ti - add driver for MCRC64 engine
config: um-randconfig-r123-20241010 (https://download.01.org/0day-ci/archive/20241010/202410101554.ENGNOKfR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241010/202410101554.ENGNOKfR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410101554.ENGNOKfR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/crypto/ti/mcrc64.c:166:44: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] value @@     got restricted __be64 @@
   drivers/crypto/ti/mcrc64.c:166:44: sparse:     expected unsigned long long [usertype] value
   drivers/crypto/ti/mcrc64.c:166:44: sparse:     got restricted __be64
   drivers/crypto/ti/mcrc64.c: note: in included file (through include/linux/fwnode.h, include/linux/logic_pio.h, include/asm-generic/io.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +166 drivers/crypto/ti/mcrc64.c

   153	
   154	static int mcrc64_calculate_crc(void __iomem *regs, u32 channel,
   155					const u8 *d8, size_t length, u64 *crc64)
   156	{
   157		void __iomem *psa_reg;
   158		u64 signature = 0;
   159	
   160		if (channel <= 0 || channel >= MCRC64_CHANNEL_INVALID)
   161			return -EINVAL;
   162	
   163		psa_reg = regs + PSA_SIGREGL(channel);
   164	
   165		for (; length >= sizeof(u64); d8 += sizeof(u64), length -= sizeof(u64))
 > 166			writeq_relaxed(cpu_to_be64p((u64 *)d8), psa_reg);
   167	
   168		signature = readq_relaxed(psa_reg);
   169	
   170		if (length) {
   171			while (length--)
   172				signature = mcrc64_calculate_sw_crc(signature, *d8++);
   173	
   174			/* set capture mode */
   175			int ret = mcrc64_set_mode(regs, MCRC64_CHANNEL_1,
   176						MCRC64_MODE_DATA_CAPTURE);
   177			if (ret)
   178				return ret;
   179	
   180			ret = mcrc64_reset_signature(regs, MCRC64_CHANNEL_1);
   181			if (ret)
   182				return ret;
   183	
   184			writeq_relaxed(signature, psa_reg);
   185	
   186			ret = mcrc64_set_mode(regs, MCRC64_CHANNEL_1,
   187					      MCRC64_MODE_FULL_CPU);
   188			if (ret)
   189				return ret;
   190		}
   191	
   192		*crc64 = signature;
   193	
   194		return 0;
   195	}
   196	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
