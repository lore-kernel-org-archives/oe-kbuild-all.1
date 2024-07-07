Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063116FA8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jul 2024 04:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720327239; cv=none; b=KnPcMplCoVY6oBNZScV4JNrPLg6DFKduDp5ljb8vdLOfSbye+W+lX5oMsNuvhdLSvaQYQVdtw02+CNSsFpqrp3iMDaSHL8kRNwacreOKJC4T3V2hXUaUl25/4Eb3TSqwREZSbAigAUVC2v3RBIIy15G83OJM09Ct5x2BsuHeTCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720327239; c=relaxed/simple;
	bh=cmesYyapln3emIZ5mxbveGdnWRQpCFOFNzE9Lnk+Wno=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BQWqMMu5m76JEN/2/+JbewgzmEq8u9afwaArZpMWK59E6QAjFu/fEht+lW/hlYQMXJc8s4/JHygpmXwCJ679Pl74XKOOb2y9pgi5Ib6Q+eiB/v0NiU+kMDXoxcpDf5pftUucG6rXIXzQECuUiPu5HuvUGdwPdG1VyTuWoFclj50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M4FI2PTh; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M4FI2PTh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720327237; x=1751863237;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cmesYyapln3emIZ5mxbveGdnWRQpCFOFNzE9Lnk+Wno=;
  b=M4FI2PThW9ockX4vXH1gU1emUnOyPp9B2BkxBj82OW8p/YxletJma7yi
   aGVsOW606DzlhfRbRAnj5sxMRQIDnT3LPpvfQlXgnQ80Yx3cpc6fp/qIj
   zykSr2FEz1YED1qqqn/eLxLFDO18vMfoiBKCIbj5DwHXIQUMRplEh9VYp
   M0UNpkddFJyQ1AOD9HXF7tHCYpNtvl9HgC2aAP4nKAYXXC4oyNMPjfb2W
   uY+ajnRp9Ow/m7McLd9fF01ho0DM3bKSt2nuEDbjrxp+dBxEtxa9HFPn0
   McFwi7Q1Fpd8FmnoNq3PjkSE1AVKTbpUDXJd5sPtJgMMZqDjT46B7Uxw5
   A==;
X-CSE-ConnectionGUID: 1bEjCi52ROWNw5jrDav9Vg==
X-CSE-MsgGUID: InTt/GLkTbC+Y7kYtmQMsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="17762673"
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="17762673"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 21:40:36 -0700
X-CSE-ConnectionGUID: +ioqDuRfTmyG3St0179zEQ==
X-CSE-MsgGUID: SVz+C4RDRLOrxbe5IUNAjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="77934848"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Jul 2024 21:40:34 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQJhP-000Ucg-2P;
	Sun, 07 Jul 2024 04:40:31 +0000
Date: Sun, 7 Jul 2024 12:39:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kamlesh Gurudasani <kamlesh@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 107/137] drivers/crypto/ti/mcrc64.c:166:17:
 error: implicit declaration of function 'writeq_relaxed'; did you mean
 'writew_relaxed'?
Message-ID: <202407071242.p79bLLBY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   e298dab666632b6f62ed61eac35813331341c3aa
commit: 2af1725d4bd6b8b24a1a2b47e1de27949d1cee9b [107/137] crypto: ti - add driver for MCRC64 engine
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240707/202407071242.p79bLLBY-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407071242.p79bLLBY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407071242.p79bLLBY-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/crypto/ti/mcrc64.c: In function 'mcrc64_calculate_crc':
>> drivers/crypto/ti/mcrc64.c:166:17: error: implicit declaration of function 'writeq_relaxed'; did you mean 'writew_relaxed'? [-Werror=implicit-function-declaration]
     166 |                 writeq_relaxed(cpu_to_be64p((u64 *)d8), psa_reg);
         |                 ^~~~~~~~~~~~~~
         |                 writew_relaxed
>> drivers/crypto/ti/mcrc64.c:168:21: error: implicit declaration of function 'readq_relaxed'; did you mean 'readw_relaxed'? [-Werror=implicit-function-declaration]
     168 |         signature = readq_relaxed(psa_reg);
         |                     ^~~~~~~~~~~~~
         |                     readw_relaxed
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
   Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
   Selected by [y]:
   - TI_K3_M4_REMOTEPROC [=y] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])


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
 > 168		signature = readq_relaxed(psa_reg);
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
