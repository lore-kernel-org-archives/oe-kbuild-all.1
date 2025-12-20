Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822FE2C21DF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 17:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766252915; cv=none; b=fK8z8gg6QL9/j3R8TlN9QAQA2qq+hNjijeeKRfwrxuvnsjZWBZK6DQwBeuE4N4U+i81cUdSqd8vPBeGOCqd4r4aOomEkC9dE+C12Ld8Bs+Io8bVwAXPvZgePe76GAqtGGz1h64MwkWmXtYwXCib6BX4DqjyjUIIvxiyyqNxGlms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766252915; c=relaxed/simple;
	bh=0Ve4JqFWsT1WHlVI0ZcXYqj1Y69Rho7Ps2tcreKdS8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BzTII/GN6MUKHypCM//9iPoPZJbtYp1r4G1Kysfv+8jss2OH118mVTHtRKwyLIDoUgS28U+pPtrBjE53MUK6KZKT0IiPevwBlSc6X6lHHpeHv+stiIpY4aUb471np2jGEA9MkLCLe+zHPO7huAM2Idkdwa40032C4qIPx/zx90w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QDu5smiz; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QDu5smiz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766252913; x=1797788913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Ve4JqFWsT1WHlVI0ZcXYqj1Y69Rho7Ps2tcreKdS8Y=;
  b=QDu5smizhE3WAIcw4pKW+Mmo7eEKa2tyIbylHREbIvk9HOBMS1JituJ8
   8bwYI09Y8BaXuLx60jSJkGNIS2tjuPZrW21YOBpYyu1Jnw2OZA0ck117R
   ZoBJZE92c5MCMCbz3kgaH4XATKkYYmOsOqtdbJNiMblxzxGY62/7fvFwX
   sUsGMZddi4WkJkRdMAUvcO6rAWVhehhiyvQCRaZb7yfKK3zwCrTIwnmxR
   nmL6lFPrGLE+ouyXoc3ZxjdDbId7g/dpDGiuUHQh+vXoBlFFc63pnWuMF
   al3vvFlvmFTsc4CtnnRf4zYa5s98YBnQ3BEYTfErKxCfBPK6KdcLnlHqL
   g==;
X-CSE-ConnectionGUID: bPwjpKC+S2eEHWOMhXWqEg==
X-CSE-MsgGUID: kMnFw9rQQQCvaYoQQxX5fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="55754533"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="55754533"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 09:48:33 -0800
X-CSE-ConnectionGUID: Qa4ZDOfHR3OQY+kTKdSCGQ==
X-CSE-MsgGUID: 7tIPg+nsTzq/QpU9JABBZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199050243"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Dec 2025 09:48:32 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX14A-000000004y6-0jIo;
	Sat, 20 Dec 2025 17:48:30 +0000
Date: Sun, 21 Dec 2025 01:47:54 +0800
From: kernel test robot <lkp@intel.com>
To: hungkien05 <nguyenhunghnuekt@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:pr/24 1/1] arch/x86/kvm/emulate.c:1759:11: error:
 expected expression before '/' token
Message-ID: <202512210107.B6opuXuq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa pr/24
head:   dcd699a99ce2f40e50263e0ec438e3b57b133598
commit: dcd699a99ce2f40e50263e0ec438e3b57b133598 [1/1] Fix potential vulnerability in cloned code (arch/x86/kvm/emulate.c)
config: x86_64-randconfig-r071-20251217 (https://download.01.org/0day-ci/archive/20251221/202512210107.B6opuXuq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210107.B6opuXuq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210107.B6opuXuq-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/emulate.c: In function 'load_segment_descriptor':
   arch/x86/kvm/emulate.c:1741:9: warning: "/*" within comment [-Wcomment]
    1741 |         /*
>> arch/x86/kvm/emulate.c:1759:11: error: expected expression before '/' token
    1759 |          */
         |           ^


vim +1759 arch/x86/kvm/emulate.c

  1733	
  1734	static int load_segment_descriptor(struct x86_emulate_ctxt *ctxt,
  1735					   u16 selector, int seg)
  1736	{
  1737		u8 cpl = ctxt->ops->cpl(ctxt);
  1738	
  1739	
  1740		/*
> 1741		/*
  1742		 * None of MOV, POP and LSS can load a NULL selector in CPL=3, but
  1743		 * None of MOV, POP and LSS can load a NULL selector in CPL=3, but
  1744		 * they can load it at CPL<3 (Intel's manual says only LSS can,
  1745		 * they can load it at CPL<3 (Intel's manual says only LSS can,
  1746		 * but it's wrong).
  1747		 * but it's wrong).
  1748		 *
  1749		 *
  1750		 * However, the Intel manual says that putting IST=1/DPL=3 in
  1751		 * However, the Intel manual says that putting IST=1/DPL=3 in
  1752		 * an interrupt gate will result in SS=3 (the AMD manual instead
  1753		 * an interrupt gate will result in SS=3 (the AMD manual instead
  1754		 * says it doesn't), so allow SS=3 in __load_segment_descriptor
  1755		 * says it doesn't), so allow SS=3 in __load_segment_descriptor
  1756		 * and only forbid it here.
  1757		 * and only forbid it here.
  1758		 */
> 1759		 */
  1760		if (seg == VCPU_SREG_SS && selector == 3 &&
  1761		if (seg == VCPU_SREG_SS && selector == 3 &&
  1762		    ctxt->mode == X86EMUL_MODE_PROT64)
  1763		    ctxt->mode == X86EMUL_MODE_PROT64)
  1764			return emulate_exception(ctxt, GP_VECTOR, 0, true);
  1765			return emulate_exception(ctxt, GP_VECTOR, 0, true);
  1766	
  1767	
  1768		return __load_segment_descriptor(ctxt, selector, seg, cpl,
  1769						 X86_TRANSFER_NONE, NULL);
  1770	}
  1771	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
