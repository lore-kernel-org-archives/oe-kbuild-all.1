Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152BD3314D7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 21:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770757683; cv=none; b=YS/F3iK8wDN9S7II4HxR4vVpMW63Yg5MCDCC5mniQZbP82mJ+EM8iRF7q4Vi7LuUABEqUd+hMyDypaLNPi+QQ8dLU7vZa2JpjNdgqwj1TAhS/jak9knwj9J2uZALPmih3TO4/XZLKqa4dYg+hI+0jxykShnOv/kExLGqvsgv5Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770757683; c=relaxed/simple;
	bh=+QwX2JWuNj9Kx32PIhaH3S8QOZKxxnMTH99gNIFYe9k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UaUPTlGiwIFi98lp4krpAYizvPaIpwvj4BIdutF4ycdh/wyrqu3GWadXSJwmGAq55/ST4JwpvoTjtcIXh+/7BgLqRe+ehQMNeRXqIf0nEphHYIB8mOD0kJdAVlV3h/1vI/cUMVagPsWzVOUzmIeYZTCnqj47WDTYIke4UlG80Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XrjcyHj1; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XrjcyHj1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770757681; x=1802293681;
  h=date:from:to:cc:subject:message-id;
  bh=+QwX2JWuNj9Kx32PIhaH3S8QOZKxxnMTH99gNIFYe9k=;
  b=XrjcyHj1a55YI2dL/ZAzKW8Z98qwLiWS1Ad6j4G9mZ73Y8I95oglJWL6
   ZZ7THwQgfWKk8q7qa35zzGcnvAIwJPZiJS2cjgHSI7G3qQnSMd4PV0915
   iBzIVHXB19kj0F+Y0e8vIQ0MdVR2IyhzfGJh+/c0+va7+FfsFrPPWoq60
   qdsXBxz9pmS/P/yXMP3e/MBUhxVAhK4/c+FI6WFajW39sTkjOlf3hNjGp
   RUedZVUsMG6VSbh83svWeiN0qmSYnCExQGkA+YZfj3PZdr8FskJ3R0Xp4
   WYbR3AClSnI8NU4EFEJoTXJPUTSqE4xsUGq/4YnPNPpc4ivN8kL4+fgvH
   Q==;
X-CSE-ConnectionGUID: LSSD3FJ+ROmwleFrnQDktA==
X-CSE-MsgGUID: /jNDyQJHRcai1kaMlxeeog==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="83267511"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="83267511"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 13:08:00 -0800
X-CSE-ConnectionGUID: hq2zoYzwSlOrr/d0Puc4Cg==
X-CSE-MsgGUID: 4PnMeJMsQeKPRLb67dK09Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216986467"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Feb 2026 13:07:59 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpuxg-00000000pQ0-2077;
	Tue, 10 Feb 2026 21:07:56 +0000
Date: Wed, 11 Feb 2026 05:07:13 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/enter_mmio_stack_uaf_simple 12/12]
 arch/x86/kvm/x86.c:11877:1: warning: the frame size of 4344 bytes is larger
 than 2048 bytes
Message-ID: <202602110547.eXZePu3Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/enter_mmio_stack_uaf_simple
head:   0192648eff680b148621853a27d2321130afb085
commit: 0192648eff680b148621853a27d2321130afb085 [12/12] KVM: x86: Fill the stack for testing purposes
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260211/202602110547.eXZePu3Z-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110547.eXZePu3Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602110547.eXZePu3Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kvm/x86.c: In function 'complete_emulated_mmio':
>> arch/x86/kvm/x86.c:11877:1: warning: the frame size of 4344 bytes is larger than 2048 bytes [-Wframe-larger-than=]
   11877 | }
         | ^


vim +11877 arch/x86/kvm/x86.c

716d51abff06f4 Gleb Natapov        2012-09-03  11812  
f78146b0f92307 Avi Kivity          2012-04-18  11813  /*
f78146b0f92307 Avi Kivity          2012-04-18  11814   * Implements the following, as a state machine:
f78146b0f92307 Avi Kivity          2012-04-18  11815   *
f78146b0f92307 Avi Kivity          2012-04-18  11816   * read:
f78146b0f92307 Avi Kivity          2012-04-18  11817   *   for each fragment
87da7e66a40532 Xiao Guangrong      2012-10-24  11818   *     for each mmio piece in the fragment
f78146b0f92307 Avi Kivity          2012-04-18  11819   *       write gpa, len
f78146b0f92307 Avi Kivity          2012-04-18  11820   *       exit
f78146b0f92307 Avi Kivity          2012-04-18  11821   *       copy data
f78146b0f92307 Avi Kivity          2012-04-18  11822   *   execute insn
f78146b0f92307 Avi Kivity          2012-04-18  11823   *
f78146b0f92307 Avi Kivity          2012-04-18  11824   * write:
f78146b0f92307 Avi Kivity          2012-04-18  11825   *   for each fragment
87da7e66a40532 Xiao Guangrong      2012-10-24  11826   *     for each mmio piece in the fragment
f78146b0f92307 Avi Kivity          2012-04-18  11827   *       write gpa, len
f78146b0f92307 Avi Kivity          2012-04-18  11828   *       copy data
f78146b0f92307 Avi Kivity          2012-04-18  11829   *       exit
f78146b0f92307 Avi Kivity          2012-04-18  11830   */
716d51abff06f4 Gleb Natapov        2012-09-03  11831  static int complete_emulated_mmio(struct kvm_vcpu *vcpu)
5287f194bf0d70 Avi Kivity          2010-01-19  11832  {
5287f194bf0d70 Avi Kivity          2010-01-19  11833  	struct kvm_run *run = vcpu->run;
f78146b0f92307 Avi Kivity          2012-04-18  11834  	struct kvm_mmio_fragment *frag;
0192648eff680b Sean Christopherson 2026-02-10  11835  	u8 clobber[4096];
87da7e66a40532 Xiao Guangrong      2012-10-24  11836  	unsigned len;
5287f194bf0d70 Avi Kivity          2010-01-19  11837  
0192648eff680b Sean Christopherson 2026-02-10  11838  	memset(clobber, 0xaa, sizeof(clobber));
0192648eff680b Sean Christopherson 2026-02-10  11839  
716d51abff06f4 Gleb Natapov        2012-09-03  11840  	BUG_ON(!vcpu->mmio_needed);
5287f194bf0d70 Avi Kivity          2010-01-19  11841  
f78146b0f92307 Avi Kivity          2012-04-18  11842  	/* Complete previous fragment */
87da7e66a40532 Xiao Guangrong      2012-10-24  11843  	frag = &vcpu->mmio_fragments[vcpu->mmio_cur_fragment];
87da7e66a40532 Xiao Guangrong      2012-10-24  11844  	len = min(8u, frag->len);
cef4dea07f6720 Avi Kivity          2010-01-20  11845  	if (!vcpu->mmio_is_write)
87da7e66a40532 Xiao Guangrong      2012-10-24  11846  		memcpy(frag->data, run->mmio.data, len);
87da7e66a40532 Xiao Guangrong      2012-10-24  11847  
87da7e66a40532 Xiao Guangrong      2012-10-24  11848  	if (frag->len <= 8) {
87da7e66a40532 Xiao Guangrong      2012-10-24  11849  		/* Switch to the next fragment. */
87da7e66a40532 Xiao Guangrong      2012-10-24  11850  		frag++;
87da7e66a40532 Xiao Guangrong      2012-10-24  11851  		vcpu->mmio_cur_fragment++;
87da7e66a40532 Xiao Guangrong      2012-10-24  11852  	} else {
87da7e66a40532 Xiao Guangrong      2012-10-24  11853  		/* Go forward to the next mmio piece. */
87da7e66a40532 Xiao Guangrong      2012-10-24  11854  		frag->data += len;
87da7e66a40532 Xiao Guangrong      2012-10-24  11855  		frag->gpa += len;
87da7e66a40532 Xiao Guangrong      2012-10-24  11856  		frag->len -= len;
87da7e66a40532 Xiao Guangrong      2012-10-24  11857  	}
87da7e66a40532 Xiao Guangrong      2012-10-24  11858  
a08d3b3b99efd5 Andrew Honig        2014-02-27  11859  	if (vcpu->mmio_cur_fragment >= vcpu->mmio_nr_fragments) {
f78146b0f92307 Avi Kivity          2012-04-18  11860  		vcpu->mmio_needed = 0;
0912c9771e9902 Paolo Bonzini       2013-08-27  11861  
0912c9771e9902 Paolo Bonzini       2013-08-27  11862  		/* FIXME: return into emulator if single-stepping.  */
cef4dea07f6720 Avi Kivity          2010-01-20  11863  		if (vcpu->mmio_is_write)
cef4dea07f6720 Avi Kivity          2010-01-20  11864  			return 1;
5287f194bf0d70 Avi Kivity          2010-01-19  11865  		vcpu->mmio_read_completed = 1;
716d51abff06f4 Gleb Natapov        2012-09-03  11866  		return complete_emulated_io(vcpu);
f78146b0f92307 Avi Kivity          2012-04-18  11867  	}
87da7e66a40532 Xiao Guangrong      2012-10-24  11868  
f78146b0f92307 Avi Kivity          2012-04-18  11869  	run->exit_reason = KVM_EXIT_MMIO;
f78146b0f92307 Avi Kivity          2012-04-18  11870  	run->mmio.phys_addr = frag->gpa;
f78146b0f92307 Avi Kivity          2012-04-18  11871  	if (vcpu->mmio_is_write)
87da7e66a40532 Xiao Guangrong      2012-10-24  11872  		memcpy(run->mmio.data, frag->data, min(8u, frag->len));
87da7e66a40532 Xiao Guangrong      2012-10-24  11873  	run->mmio.len = min(8u, frag->len);
f78146b0f92307 Avi Kivity          2012-04-18  11874  	run->mmio.is_write = vcpu->mmio_is_write;
716d51abff06f4 Gleb Natapov        2012-09-03  11875  	vcpu->arch.complete_userspace_io = complete_emulated_mmio;
f78146b0f92307 Avi Kivity          2012-04-18  11876  	return 0;
5287f194bf0d70 Avi Kivity          2010-01-19 @11877  }
5287f194bf0d70 Avi Kivity          2010-01-19  11878  

:::::: The code at line 11877 was first introduced by commit
:::::: 5287f194bf0d7062d6d99b725366202556f03e28 KVM: Split mmio completion into a function

:::::: TO: Avi Kivity <avi@redhat.com>
:::::: CC: Avi Kivity <avi@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
