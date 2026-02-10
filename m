Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F31265629
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 19:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770752420; cv=none; b=KTH6mfA8nETXSapNj595j0N8NvllSTEavKSttScArMGEK5fHncgI2jncP5jSh9WKv0JrXD5kI0RdMErKhvd6L5UguOdg48gKr2XpFI+/cbXla5m2aVODR44RtQea7i5JsV+ysV9EZWjSEg58K5qWnPVfdnV3RwVGE/p0rPpmOHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770752420; c=relaxed/simple;
	bh=7Ri8ltLgL2wqBssNDWO5qU9HMpNR4P9Q47O1+xmFoXg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uo2MAruZ8xdTeiXUclPfnUNj8WK2tY9su6d2S2gtnPp18CnC+cQkyiDNLdtDaH0c2Fu99fCReZMsacI0eGb8MIehJbUl1w4u5z3/WxU3fNqT0LhVhi4/2LEKhpH41TUCSxzvxGZ+bUG9l35RSsa8FbCyWCLHdzTc0K1vtJ5Rutk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dIMyXdWP; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dIMyXdWP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770752419; x=1802288419;
  h=date:from:to:cc:subject:message-id;
  bh=7Ri8ltLgL2wqBssNDWO5qU9HMpNR4P9Q47O1+xmFoXg=;
  b=dIMyXdWPQHIMnitpb5qS21/m9C1Ge4oYzjhTEtaOugE5nQeJRrrOfglN
   8J4Vbnoyh70LHovtur8E0oUY0+a8Wo2vXaj+bd2KffkIwP7gEB4N0yRwz
   KS1/qR+GjxlrP9srwPglz7v8hUpeR7vyw4QpRuTn7jXQpbQijcDCAerEp
   uFk/UBDSZehjhNCLqI9/wsq1/utLHyNdxLZupJGdut5Cqc14JOqkAWMwe
   eRLY80eq+vVnbyjueEIGWd3xgbanVG7BRheA9sEGsjYIAhpHOd6+TaDyv
   5FpMqzcD5nmWiO9G9+bLuqBWYohgaYCMEQEC1fVR6dFT2XRiSKVj6+WI7
   Q==;
X-CSE-ConnectionGUID: bU/cSb8QTnWOmpHSjdyHLg==
X-CSE-MsgGUID: 40eIpHsrSbut43KoicrM3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="70908842"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="70908842"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 11:40:19 -0800
X-CSE-ConnectionGUID: Ivit58OeRl6sKtIJNZOpMA==
X-CSE-MsgGUID: CmB2rqsoT/GYWP0MQOx0wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216347184"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 10 Feb 2026 11:40:18 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vptap-000000000tF-1zXj;
	Tue, 10 Feb 2026 19:40:15 +0000
Date: Tue, 10 Feb 2026 20:39:58 +0100
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/enter_mmio_stack_uaf_simple 12/12]
 arch/x86/kvm/x86.c:11877:1: warning: the frame size of 4344 bytes is larger
 than 2048 bytes
Message-ID: <202602102022.eCknEORu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/enter_mmio_stack_uaf_simple
head:   0192648eff680b148621853a27d2321130afb085
commit: 0192648eff680b148621853a27d2321130afb085 [12/12] KVM: x86: Fill the stack for testing purposes
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260210/202602102022.eCknEORu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602102022.eCknEORu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602102022.eCknEORu-lkp@intel.com/

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
