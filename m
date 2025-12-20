Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6F8126F0A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 14:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766241311; cv=none; b=jtIjWxkIBVsscw5rv1Y3QuuWgL2CgxvqmiMJDInRza6aegFROxXM/G2B0MsofmHOCPuv5PR7LyWo1N0Yy4GBGQ4QLVd7f9ABjNb7EtosTRRC26DgSnQwOUaNioaKWUA1OU1Rhs7auGra9DzyZ1Wq5/Z1yyNETpcnFSi0kgY69DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766241311; c=relaxed/simple;
	bh=Q58HGHnQiVfrxDfRSccF5YekGh1hP0/uqtt4QQrubE8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CEbVJQmCFUYwKokQIStVPUYKTmIrPOd/2nCssSHN8pt6vWPji5gDC7mILa9GS4BDr1oWGotQt7GvCB4Mo1D/awUah4I6Zn7itPO9JYjfdkpcgd/uwS/y8v/AYZkaTJBEHDHtS8XW165LyZah2q4wrFBp8Me2FLryCQzw6P1sO6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QGXVSNXb; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QGXVSNXb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766241310; x=1797777310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q58HGHnQiVfrxDfRSccF5YekGh1hP0/uqtt4QQrubE8=;
  b=QGXVSNXb0IOy8qKPdhnw0SYCwHI10bWzZQ/Y44leF+Rk4SMtIfnX6oAv
   p42B6O8Zv7ED56sTP7gHBrLbJ1Uj7+BXo0xBZa5GZVRrnGQSi3i8Tm6cX
   7an2r1BGC0ILlzhSTp8mEaHC0pVylrrcaqmHNGUCRoSydkpalzR8NqZjb
   0YWq2dtEbEP1v8sZXGcQmYWl1ufKB/MTJtYD0GxuotqJzgFzT8sXmCNfz
   tHy7W3Drq2ECY+pwe2CjioCEmSrhvx0IGJPdic/jixDfzXMYduo4USQQ4
   AdiufnDxYT3lfMpcFUW93NF1JjttMPOF3j/prqzp6/dQ0l7BklEyal30E
   Q==;
X-CSE-ConnectionGUID: a8vsQpgiRrWTYG94EtD0dQ==
X-CSE-MsgGUID: Tlod6tvQS02lsSLMRfAKIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="85760153"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="85760153"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 06:35:09 -0800
X-CSE-ConnectionGUID: +SXsEvKUQTCaoooeh7vw2g==
X-CSE-MsgGUID: bqvq204lSaqVwwL+FYyI9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="236526234"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Dec 2025 06:35:07 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWy2z-000000004ec-1av3;
	Sat, 20 Dec 2025 14:35:05 +0000
Date: Sat, 20 Dec 2025 22:34:11 +0800
From: kernel test robot <lkp@intel.com>
To: hungkien05 <nguyenhunghnuekt@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:pr/24 1/1] arch/x86/kvm/emulate.c:1741:9: warning:
 "/*" within comment
Message-ID: <202512202209.nmsd4CtH-lkp@intel.com>
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
config: x86_64-randconfig-r071-20251217 (https://download.01.org/0day-ci/archive/20251220/202512202209.nmsd4CtH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202209.nmsd4CtH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202209.nmsd4CtH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kvm/emulate.c: In function 'load_segment_descriptor':
>> arch/x86/kvm/emulate.c:1741:9: warning: "/*" within comment [-Wcomment]
    1741 |         /*
   arch/x86/kvm/emulate.c:1759:11: error: expected expression before '/' token
    1759 |          */
         |           ^


vim +1741 arch/x86/kvm/emulate.c

dde7e6d12a9ef9f Avi Kivity    2010-07-29  1733  
2356aaeb2f58f49 Paolo Bonzini 2014-05-15  1734  static int load_segment_descriptor(struct x86_emulate_ctxt *ctxt,
2356aaeb2f58f49 Paolo Bonzini 2014-05-15  1735  				   u16 selector, int seg)
2356aaeb2f58f49 Paolo Bonzini 2014-05-15  1736  {
2356aaeb2f58f49 Paolo Bonzini 2014-05-15  1737  	u8 cpl = ctxt->ops->cpl(ctxt);
33ab91103b3415e Paolo Bonzini 2017-01-12  1738  
dcd699a99ce2f40 hungkien05    2025-12-17  1739  
dcd699a99ce2f40 hungkien05    2025-12-17  1740  	/*
33ab91103b3415e Paolo Bonzini 2017-01-12 @1741  	/*
33ab91103b3415e Paolo Bonzini 2017-01-12  1742  	 * None of MOV, POP and LSS can load a NULL selector in CPL=3, but
dcd699a99ce2f40 hungkien05    2025-12-17  1743  	 * None of MOV, POP and LSS can load a NULL selector in CPL=3, but
dcd699a99ce2f40 hungkien05    2025-12-17  1744  	 * they can load it at CPL<3 (Intel's manual says only LSS can,
33ab91103b3415e Paolo Bonzini 2017-01-12  1745  	 * they can load it at CPL<3 (Intel's manual says only LSS can,
33ab91103b3415e Paolo Bonzini 2017-01-12  1746  	 * but it's wrong).
dcd699a99ce2f40 hungkien05    2025-12-17  1747  	 * but it's wrong).
dcd699a99ce2f40 hungkien05    2025-12-17  1748  	 *
33ab91103b3415e Paolo Bonzini 2017-01-12  1749  	 *
33ab91103b3415e Paolo Bonzini 2017-01-12  1750  	 * However, the Intel manual says that putting IST=1/DPL=3 in
dcd699a99ce2f40 hungkien05    2025-12-17  1751  	 * However, the Intel manual says that putting IST=1/DPL=3 in
dcd699a99ce2f40 hungkien05    2025-12-17  1752  	 * an interrupt gate will result in SS=3 (the AMD manual instead
33ab91103b3415e Paolo Bonzini 2017-01-12  1753  	 * an interrupt gate will result in SS=3 (the AMD manual instead
33ab91103b3415e Paolo Bonzini 2017-01-12  1754  	 * says it doesn't), so allow SS=3 in __load_segment_descriptor
dcd699a99ce2f40 hungkien05    2025-12-17  1755  	 * says it doesn't), so allow SS=3 in __load_segment_descriptor
dcd699a99ce2f40 hungkien05    2025-12-17  1756  	 * and only forbid it here.
33ab91103b3415e Paolo Bonzini 2017-01-12  1757  	 * and only forbid it here.
33ab91103b3415e Paolo Bonzini 2017-01-12  1758  	 */
dcd699a99ce2f40 hungkien05    2025-12-17  1759  	 */
dcd699a99ce2f40 hungkien05    2025-12-17  1760  	if (seg == VCPU_SREG_SS && selector == 3 &&
33ab91103b3415e Paolo Bonzini 2017-01-12  1761  	if (seg == VCPU_SREG_SS && selector == 3 &&
33ab91103b3415e Paolo Bonzini 2017-01-12  1762  	    ctxt->mode == X86EMUL_MODE_PROT64)
dcd699a99ce2f40 hungkien05    2025-12-17  1763  	    ctxt->mode == X86EMUL_MODE_PROT64)
dcd699a99ce2f40 hungkien05    2025-12-17  1764  		return emulate_exception(ctxt, GP_VECTOR, 0, true);
33ab91103b3415e Paolo Bonzini 2017-01-12  1765  		return emulate_exception(ctxt, GP_VECTOR, 0, true);
33ab91103b3415e Paolo Bonzini 2017-01-12  1766  
dcd699a99ce2f40 hungkien05    2025-12-17  1767  
3dc4bc4f6b9265b Nadav Amit    2014-12-25  1768  	return __load_segment_descriptor(ctxt, selector, seg, cpl,
3dc4bc4f6b9265b Nadav Amit    2014-12-25  1769  					 X86_TRANSFER_NONE, NULL);
2356aaeb2f58f49 Paolo Bonzini 2014-05-15  1770  }
2356aaeb2f58f49 Paolo Bonzini 2014-05-15  1771  

:::::: The code at line 1741 was first introduced by commit
:::::: 33ab91103b3415e12457e3104f0e4517ce12d0f3 KVM: x86: fix emulation of "MOV SS, null selector"

:::::: TO: Paolo Bonzini <pbonzini@redhat.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
