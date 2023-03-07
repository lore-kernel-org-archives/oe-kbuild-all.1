Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366A520EE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 08:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678176178; x=1709712178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1XrWn0Qxr2tw2dOeqfNqrZ8GDM1yl1eZer5oIe6B2AM=;
  b=eRaaorjEs4bifjBC9xeWGkRtVq0zSCH4ewv+Ircyp6G427QnxU2rEX7M
   kZbDAEXhiad7J+KgZUU9uVG0kyXKU2PKeftJCoUuRtAAMpF9y5eMTDYVt
   gFNV5N3O6SvCqtqBHPEfg5SUzAYXHtCaATryFgESu/96KEYHsTWr1kVln
   AICFImyYH4c9S8ahV7NY5U947gp0upBsEvN1ObNpHcaQkfu0KlTnrcif+
   YjPu5pPDghD/b3g/k60hWI1Fkkg88My0HxkSV/2i5+YF70VZln3pikW1K
   KXxOiKKxiA+TDH0LGTtnomatedv2WtKsU1SCPbBPJ3d2QUEglsdGgYXCa
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="316192052"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
   d="scan'208";a="316192052"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 00:02:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="676481235"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
   d="scan'208";a="676481235"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 07 Mar 2023 00:02:56 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZSHg-00016p-06;
	Tue, 07 Mar 2023 08:02:56 +0000
Date: Tue, 7 Mar 2023 16:02:24 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 345/362]
 arch/s390/kvm/kvm-s390.c:4998:22: error: 'new' undeclared; did you mean
 'net'?
Message-ID: <202303071513.TRJKu7tI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.10
head:   0611c6d676d5a83fe19b4a45aa27c12b0e443f96
commit: 08fa1f6dcb512d1f339211b277fce434073ae77d [345/362] KVM: s390: Use "new" memslot instead of userspace memory region
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230307/202303071513.TRJKu7tI-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=08fa1f6dcb512d1f339211b277fce434073ae77d
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.10
        git checkout 08fa1f6dcb512d1f339211b277fce434073ae77d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash arch/s390/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303071513.TRJKu7tI-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/s390/kvm/kvm-s390.c: In function 'kvm_arch_prepare_memory_region':
>> arch/s390/kvm/kvm-s390.c:4998:22: error: 'new' undeclared (first use in this function); did you mean 'net'?
    4998 |         gpa_t size = new->npages * PAGE_SIZE;
         |                      ^~~
         |                      net
   arch/s390/kvm/kvm-s390.c:4998:22: note: each undeclared identifier is reported only once for each function it appears in


vim +4998 arch/s390/kvm/kvm-s390.c

  4991	
  4992	/* Section: memory related */
  4993	int kvm_arch_prepare_memory_region(struct kvm *kvm,
  4994					   struct kvm_memory_slot *memslot,
  4995					   const struct kvm_userspace_memory_region *mem,
  4996					   enum kvm_mr_change change)
  4997	{
> 4998		gpa_t size = new->npages * PAGE_SIZE;
  4999	
  5000		/* A few sanity checks. We can have memory slots which have to be
  5001		   located/ended at a segment boundary (1MB). The memory in userland is
  5002		   ok to be fragmented into various different vmas. It is okay to mmap()
  5003		   and munmap() stuff in this slot after doing this call at any time */
  5004	
  5005		if (new->userspace_addr & 0xffffful)
  5006			return -EINVAL;
  5007	
  5008		if (size & 0xffffful)
  5009			return -EINVAL;
  5010	
  5011		if ((new->base_gfn * PAGE_SIZE) + size > kvm->arch.mem_limit)
  5012			return -EINVAL;
  5013	
  5014		/* When we are protected, we should not change the memory slots */
  5015		if (kvm_s390_pv_get_handle(kvm))
  5016			return -EINVAL;
  5017		return 0;
  5018	}
  5019	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
