Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439699;
	b=YVDcIMjoElTqLF/2Q+iESbpfVVg3Wb942Vn6+X4nbMjfuDK7yPwqcw5u+7pCyltT/kvl
	 89vIIqqSzRI71i5jVLL8HRtCgG3mGQXydlMtG0luEk7bJeU2ubsamjhbc5reqAD3gef39
	 SZJCCmGgIWfiiDUpCWgd+bVIU8NSXJ5Aoluv05lOEVVKBq1yAqmWmWMp/wdPHBCJK4tOA
	 Elubcgqh4lk3fq4rGn8AieHeCWJLd0ywwcnj8dTsim0gdbTZdc49i2dO+n74SRs2AsNIL
	 HpsmuXCyLhcvKqz9dh/PuZ1TVfWD6KKSNjbqaFkTq9ww0zCC+xXvqkW++OpTZBqw4zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439699;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=d2hM8IAjjJSlNblf0ze1tSugzdl9CdWRL5+w/3v/YAg=;
	b=aY3QoIkXqZMJ6gAyWYCQHrDG39CHThK/76MFmSpTIG7iev5cNfuCbCLn1MU8x3N1Ga5V
	 f/1Y47Ha+aY0Nv9E0Uug1bnQhU1DvWfvL9Bnj3zPmaAOqIYuohjsBs8FAjADckwRQnvNK
	 jRPlsaG0LIIZnYC+75ENdZSvXE6D7U4T3KbAAFKNviHLBtQpThGUsYLKOVMVevZm1J1Vf
	 Zj0fi9k92ZvSLPeI6xzJI3xAiuUdX1QDKhfWLpJWBwuApLZGUteVErSPSlR4/ML437Ts8
	 Maw0MiyFCn6FdSiHxrw++7rkK9CEBIUvPVws8qWAqEXe4U7v0HSLCKpN/Rb0Y8k6eeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k2Qd4cjm;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA75606A32A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Nov 2026 23:28:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBA75606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k2Qd4cjm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794439699; x=1825975699;
  h=date:from:to:cc:subject:message-id;
  bh=q9/93zwem0/gVgDb0+ctRFGVrPzzceiOS+4vslwzZho=;
  b=k2Qd4cjmSNoX9XjX2Q8ENu8e7jqbG1W7N0mNdgabIWRb5pf7/zOad7np
   VhVoBlDEkFFv2w+DYmzfVzHFtGuCzBs4HjCYPdLQXiXfGkWrko8jy6Q9p
   9ZDPD25n1qa8rHBCn636aWz6jHZT9hOSfnQCHpYCKbTw/viuDQ8KCixzN
   evQ7gqsF5rp7TgRi8BPnsb4XjdQYu+IphlLfQX0pCb2ReY9Nc50ztVAeQ
   LqGjzFHZH+cTyi+Fpkw8+P6btRX8O3hhwAS5bNTw76lO7EPHM02eIESew
   H0g5E8rr+aodOWsVeIAP5owpVgRZvYNjBj20KqJgv4EI2DiOA5Lvnj2Q8
   w==;
X-CSE-ConnectionGUID: jusnBnVIRzKrhcvnlngvhg==
X-CSE-MsgGUID: u/go+NCoSKq+p5dTnzwV8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3086329"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3086329"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 15:28:18 -0800
X-CSE-ConnectionGUID: oI3uIq2LQwe6XIDfyB4P4w==
X-CSE-MsgGUID: atFOWTutQZ28zUlQo16XMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8833615"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Nov 2026 15:28:17 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRHji-0000000100R-1Mrv;
	Wed, 11 Nov 2026 23:28:14 +0000
Date: Thu, 12 Nov 2026 07:27:45 +0800
From: kernel test robot <lkp@intel.com>
To: Joerg Roedel <joerg.roedel@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, David Woodhouse <dwmw@amazon.co.uk>
Subject: [dwmw2:vsm2/vsm-min 37/123] arch/s390/kvm/arm64/arm.c:745:5:
 error: conflicting types for 'kvm_set_routing_entry'; have 'int(struct kvm *,
 struct kvm_kernel_irq_routing_entry *, const struct kvm_irq_routing_entry *)'
Message-ID: <202611120734.tr0WbTlm-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   git://git.infradead.org/users/dwmw2/linux vsm2/vsm-min
head:   b286e98ecfcaf862acb464a9921404b1ef3dfc2b
commit: 4600eacdd7db45b3108f90f7f58243bb6aae325a [37/123] kvm: Pass plane_level to kvm_set_routing_entry()
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20261112/202611120734.tr0WbTlm-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611120734.tr0WbTlm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611120734.tr0WbTlm-lkp@intel.com/

Note: the dwmw2/vsm2/vsm-min HEAD b286e98ecfcaf862acb464a9921404b1ef3dfc2b builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> arch/s390/kvm/arm64/arm.c:745:5: error: conflicting types for 'kvm_set_routing_entry'; have 'int(struct kvm *, struct kvm_kernel_irq_routing_entry *, const struct kvm_irq_routing_entry *)'
     745 | int kvm_set_routing_entry(struct kvm *kvm,
         |     ^~~~~~~~~~~~~~~~~~~~~
   In file included from arch/s390/kvm/arm64/arm.c:8:
   include/linux/kvm_host.h:2393:5: note: previous declaration of 'kvm_set_routing_entry' with type 'int(struct kvm *, struct kvm_kernel_irq_routing_entry *, const struct kvm_irq_routing_entry *, unsigned int)'
    2393 | int kvm_set_routing_entry(struct kvm *kvm,
         |     ^~~~~~~~~~~~~~~~~~~~~


vim +745 arch/s390/kvm/arm64/arm.c

761404d7acfe8c5 Steffen Eiden 2026-04-02  744  
761404d7acfe8c5 Steffen Eiden 2026-04-02 @745  int kvm_set_routing_entry(struct kvm *kvm,
761404d7acfe8c5 Steffen Eiden 2026-04-02  746  			  struct kvm_kernel_irq_routing_entry *e,
761404d7acfe8c5 Steffen Eiden 2026-04-02  747  			  const struct kvm_irq_routing_entry *ue)
761404d7acfe8c5 Steffen Eiden 2026-04-02  748  {
761404d7acfe8c5 Steffen Eiden 2026-04-02  749  	return -EINVAL;
761404d7acfe8c5 Steffen Eiden 2026-04-02  750  }
761404d7acfe8c5 Steffen Eiden 2026-04-02  751  

:::::: The code at line 745 was first introduced by commit
:::::: 761404d7acfe8c58f9bd938332c6cc9beed6bafd KVM: s390: Add basic arm64 kvm module

:::::: TO: Steffen Eiden <seiden@linux.ibm.com>
:::::: CC: Christian Borntraeger <borntraeger@linux.ibm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
