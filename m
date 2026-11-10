Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320387;
	b=vWNBxSZPztzW0QSHSp9t8qpIldDVtbx3R3a0FlRnAj1rcv/0Cvq27GrH0YZ7wHngP1bL
	 xUDL0xBaaLjcgcqswXmaRkSLFvEg9JHoLl8jYMMjTUv88cJ+P+a3ILFh8yO1S0T+Nb+tv
	 NiENHVsvL1WWA+LodoNbl08gHDxJ271O5Mvr2/kD4J+hRdJJs/6Wp9ROnttef2uZ1kJEB
	 KYlQ6GKnI+tkoFeLyfr4h5r0iycEnB2E+PDscCDi1ksSNm3XvFrAr56oNU56akniD0zbn
	 iJ5rXmaH6ISCAHqqjOgOzrKE2Tv/xeEkj+syad0T9Y8e/Jc1C/JXbWUOAypvztmdJvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320387;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=yDHxQhDF8qsh3EmWTmcG8BNmco+J6YksfdHT4DTtiFk=;
	b=ti5L7Dq/rzk2S/aefgWKTBdRHJqqyjqYF0LLTIEFcWZ1gprCqn5JYlGZNDXjjpoNmxya
	 ktWnUt+kOWchBP8qD0/Q/rkuJMuRfnea95IVDa0fcLY4crzjx+oZOwX0pSaTwSFKrfvxq
	 /p/TmAE1zSzpXlBLIGzh2UCEbSkpRd391CtZZsodWC3hl9+5gglW4H52yaNFys5Ogkqqt
	 glvMn7YS8Oc4AWGIiPSlv5M0w1YbHv6TL1reS2/7lNBtu4PFJJvxrzsalqXb7qwQNoIch
	 YaI9c4/yS6RzsNVy54c008aavpG8ImJ7H7yXbbolaFXoV1XejI+Q04f3eEVFkiXVtwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d6aeivOY;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2349B60A5BD4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Nov 2026 14:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2349B60A5BD4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d6aeivOY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794320387; x=1825856387;
  h=date:from:to:cc:subject:message-id;
  bh=bh5RfvRgu1q1/S02Y5fx/1WF/uz5S7x9hRu40rUdE/4=;
  b=d6aeivOYlBRO6/7oEKwN75RrtJCjqiYWSqM8wPa6GUe/ZTKNDlQJToGZ
   KgqzoutLBt2OTJoXhTxVY6s7QP/H0cK6RvFT3XMOkDO/alfB8t2+xZ68/
   1m+gaBhR7RqSy4YiLyyvXUTGyj/lSDAzNusZ/ct1ZILTc63V2fBXR+qOq
   01QZHiUgXq4hwUgnxz+pDDLNE4IrMJ+01pQNRqXYwaqfBKcoDz5EO/DjR
   yEXowDjTkznU0vr5opgq/fi1yv8MA4eoiJFbR6oud1zxJOQBCLRQgtZ+7
   D9zxTLErM0EqRl3I6JGNrUIAVfL2tY0lq1MEaw9qvOPqNHos8vIcHGtEa
   Q==;
X-CSE-ConnectionGUID: mYCmIcd4Rja0/SXP0VIkPQ==
X-CSE-MsgGUID: VieaNnBJQa+hwZubfYRruw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2943872"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2943872"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 06:19:46 -0800
X-CSE-ConnectionGUID: 2dmX3XP8TA2JigaIgq0cFw==
X-CSE-MsgGUID: kEmXqrlOR8mjzaFFauU/nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8759914"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Nov 2026 06:19:45 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQmhK-00000000wxD-2K2M;
	Tue, 10 Nov 2026 14:19:42 +0000
Date: Tue, 10 Nov 2026 22:19:28 +0800
From: kernel test robot <lkp@intel.com>
To: Joerg Roedel <joerg.roedel@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, David Woodhouse <dwmw@amazon.co.uk>
Subject: [dwmw2:vsm2/vsm-min 37/133] arch/s390/kvm/arm64/arm.c:745:5:
 error: conflicting types for 'kvm_set_routing_entry'
Message-ID: <202611102242.ywP1yvPR-lkp@intel.com>
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
head:   f2e6a1c3a8f001e70638379824e843dcadddaaec
commit: 4600eacdd7db45b3108f90f7f58243bb6aae325a [37/133] kvm: Pass plane_level to kvm_set_routing_entry()
config: s390-randconfig-1000-20261110 (https://download.01.org/0day-ci/archive/20261110/202611102242.ywP1yvPR-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261110/202611102242.ywP1yvPR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611102242.ywP1yvPR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/s390/kvm/arm64/arm.c:745:5: error: conflicting types for 'kvm_set_routing_entry'
     745 | int kvm_set_routing_entry(struct kvm *kvm,
         |     ^~~~~~~~~~~~~~~~~~~~~
   In file included from arch/s390/kvm/arm64/arm.c:8:
   include/linux/kvm_host.h:2393:5: note: previous declaration of 'kvm_set_routing_entry' was here
    2393 | int kvm_set_routing_entry(struct kvm *kvm,
         |     ^~~~~~~~~~~~~~~~~~~~~


vim +/kvm_set_routing_entry +745 arch/s390/kvm/arm64/arm.c

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
