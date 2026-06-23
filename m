Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3815269D18
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 22:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782254453; cv=none; b=YRW1HLPAO1wHU7G8mMiR5u0Rgc1+zDS9/HwZK5tnBP/wVnPGrnGsLA0l9qPV4FcagO5DO8ZSdGolB9Bkay7XDZ/naFKuUj33lNp2hPQuniHwXzI69Vj1QOcPYGBT19vaqgSKVgMy95gRcMmEbvYriLDSemkzIuPeefuORhO2IOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782254453; c=relaxed/simple;
	bh=rXmDV7xBijAczdqSupx23uR9FZq3oPlZo3gCLPkqCa4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cLO+1CovJ6et/vmlvvFzYewKd5c3ZagVUJZeTfnl5GurAXPc6KZFDgMjxasY+MzXubUutBDRtOkunroAQWANIBOCSp/yBVDRBKoMT56V7H/7fFW3vsTBRI3bGg6j518xVzfFznfLjLhfGGoYWgsMVpDCVl1UIBRRV/FsrmwI4lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xkdod2J4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xkdod2J4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782254451; x=1813790451;
  h=date:from:to:cc:subject:message-id;
  bh=rXmDV7xBijAczdqSupx23uR9FZq3oPlZo3gCLPkqCa4=;
  b=Xkdod2J4MV+SMUrst4XivNbU4ou73rEf0MICVnlllCIG00TvEfwmh1DD
   desC8+C4wu9PS82t6B8qYj+gSC4YA3Py5xkx8z4/nSQCK+p6qIBi1XG9R
   zWMq/nMlnIaFzp1bpEwWgjE0BytmcWrvdzgQ0ItKjtPLwGP7nRNc/7uhu
   bohVhTpbzn1wJM7xXki5GWamgHSVJKAAUwCAG+HMiwC1ZfO1qxM0uV4EX
   jYsOV4/bqe6O16jSTUiqMhezXIwmMP/WKDtmLRb/rzjQDoTPuY5aG5hnI
   0525JBSs13c186ocI5Z/avJiqMrUZn5MIssJ3ZmJjsbLR78OUxl6Q3+Am
   w==;
X-CSE-ConnectionGUID: vVhKzWjvRVqShvhnCshevw==
X-CSE-MsgGUID: Za6bxo7aRXOLPIRHKdCBBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="100435001"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="100435001"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 15:40:50 -0700
X-CSE-ConnectionGUID: MGjgov4SSe+NcVBJj3wehg==
X-CSE-MsgGUID: 6mKNbFxTT/G3YJdUbTKakQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="243267826"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 23 Jun 2026 15:40:48 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wc9nS-000000002wD-0tVQ;
	Tue, 23 Jun 2026 22:40:46 +0000
Date: Wed, 24 Jun 2026 06:39:48 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lpieralisi:cca/temp-in-place-conversion 10/102]
 arch/arm64/kernel/rmi.c:371:8: warning: variable 'ret' is used uninitialized
 whenever switch case is taken
Message-ID: <202606240634.8t8o2Uni-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git cca/temp-in-place-conversion
head:   4095e546cca85e5558a35176ef689959971f7d70
commit: f2a98482ff717b6ed2203ecdd1ffeb8d62db875d [10/102] arm64: RMI: Add support for SRO
config: arm64-randconfig-004-20260624 (https://download.01.org/0day-ci/archive/20260624/202606240634.8t8o2Uni-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project a9b492db3d50683e446cd1a5c9ffaf4e92cb77a7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606240634.8t8o2Uni-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606240634.8t8o2Uni-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/rmi.c:371:8: warning: variable 'ret' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     371 |                 case RMI_OP_MEM_REQ_NONE:
         |                      ^~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/rmi_smc.h:159:30: note: expanded from macro 'RMI_OP_MEM_REQ_NONE'
     159 | #define RMI_OP_MEM_REQ_NONE             0
         |                                         ^
   arch/arm64/kernel/rmi.c:389:7: note: uninitialized use occurs here
     389 |                 if (ret) {
         |                     ^~~
   arch/arm64/kernel/rmi.c:368:10: note: initialize the variable 'ret' to silence this warning
     368 |                 int ret;
         |                        ^
         |                         = 0
   1 warning generated.


vim +/ret +371 arch/arm64/kernel/rmi.c

   355	
   356	unsigned long rmi_sro_execute(struct rmi_sro_state *sro, gfp_t gfp)
   357	{
   358		unsigned long sro_handle;
   359		struct arm_smccc_1_2_regs regs;
   360		struct arm_smccc_1_2_regs *regs_in = &sro->regs;
   361	
   362		rmi_smccc_invoke(regs_in, &regs);
   363	
   364		sro_handle = regs.a1;
   365	
   366		while (RMI_RETURN_STATUS(regs.a0) == RMI_INCOMPLETE) {
   367			bool can_cancel = RMI_RETURN_CAN_CANCEL(regs.a0);
   368			int ret;
   369	
   370			switch (RMI_RETURN_MEMREQ(regs.a0)) {
 > 371			case RMI_OP_MEM_REQ_NONE:
   372				regs = (struct arm_smccc_1_2_regs){
   373					SMC_RMI_OP_CONTINUE, sro_handle, 0
   374				};
   375				rmi_smccc_invoke(&regs, &regs);
   376				break;
   377			case RMI_OP_MEM_REQ_DONATE:
   378				ret = rmi_sro_donate(sro, sro_handle, regs.a2, &regs,
   379						     gfp);
   380				break;
   381			case RMI_OP_MEM_REQ_RECLAIM:
   382				ret = rmi_sro_reclaim(sro, sro_handle, &regs);
   383				break;
   384			default:
   385				ret = WARN_ON(1);
   386				break;
   387			}
   388	
   389			if (ret) {
   390				if (can_cancel) {
   391					/*
   392					 * FIXME: Handle cancelling properly!
   393					 *
   394					 * If the operation has failed due to memory
   395					 * allocation failure then the information on
   396					 * the memory allocation should be saved, so
   397					 * that the allocation can be repeated outside
   398					 * of any context which prevented the
   399					 * allocation.
   400					 */
   401				}
   402				if (WARN_ON(ret))
   403					return ret;
   404			}
   405		}
   406	
   407		return regs.a0;
   408	}
   409	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
