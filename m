Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2C6174CB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jul 2023 21:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689716581; x=1721252581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A4upLtdmtuEmuYPKKCX4VQK5ZkmSjnzRB4gLj1Qz22w=;
  b=cZE+YVbZ873l0wtuE5Ks99BRcdWQACJxpqxCA6jRJ1LRgnUkAlY1EQgt
   Q5VjGrJ8fHIC5Niy8Fb/w5C5J3eU9sbfXexAaYlO7joCw1L+CnUVd0uVX
   n1CY7yIp9EiAvIm68fHqnSSUWSoK2wue4j7lrzuFFdOogrWjKrCShxOaz
   sPXs29NhZJTQn/msVfTFQW+PYNTVV0fgUKCQI0dOr0CIreV9dPM39qOYF
   6RNXrENRlCF9MTdAfpbKEx46ou/M1FmishGXbWbTaEJotKdFtmHDmtkXu
   RuRykooAUR2d1HDgGMJXPCFo/hx1sDeasNKC46uL+AmdpbMo1aBkygO1j
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="452696769"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="452696769"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 14:43:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="717762469"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="717762469"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 18 Jul 2023 14:42:56 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLsT9-0003uT-2z;
	Tue, 18 Jul 2023 21:42:55 +0000
Date: Wed, 19 Jul 2023 05:42:44 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/apic 49/57] arch/x86/kernel/kvm.c:346:9: error:
 implicit declaration of function 'apic_native_eoi'; did you mean
 'apic_set_eoi'?
Message-ID: <202307190523.mZzd2N3y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/apic
head:   11f85db0679f4f37798c648f3028126b6f7c6163
commit: ac45e123a03ec949c4042f20805c14d1c91fcb93 [49/57] x86/apic: Wrap apic->native_eoi() into a helper
config: i386-randconfig-i053-20230716 (https://download.01.org/0day-ci/archive/20230719/202307190523.mZzd2N3y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307190523.mZzd2N3y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307190523.mZzd2N3y-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/kvm.c: In function 'kvm_guest_apic_eoi_write':
>> arch/x86/kernel/kvm.c:346:9: error: implicit declaration of function 'apic_native_eoi'; did you mean 'apic_set_eoi'? [-Werror=implicit-function-declaration]
     346 |         apic_native_eoi();
         |         ^~~~~~~~~~~~~~~
         |         apic_set_eoi
   arch/x86/kernel/kvm.c: In function 'kvm_guest_init':
   arch/x86/kernel/kvm.c:828:17: error: implicit declaration of function 'apic_set_eoi_cb'; did you mean 'apic_set_eoi'? [-Werror=implicit-function-declaration]
     828 |                 apic_set_eoi_cb(kvm_guest_apic_eoi_write);
         |                 ^~~~~~~~~~~~~~~
         |                 apic_set_eoi
   cc1: some warnings being treated as errors


vim +346 arch/x86/kernel/kvm.c

   334	
   335	static notrace void kvm_guest_apic_eoi_write(void)
   336	{
   337		/**
   338		 * This relies on __test_and_clear_bit to modify the memory
   339		 * in a way that is atomic with respect to the local CPU.
   340		 * The hypervisor only accesses this memory from the local CPU so
   341		 * there's no need for lock or memory barriers.
   342		 * An optimization barrier is implied in apic write.
   343		 */
   344		if (__test_and_clear_bit(KVM_PV_EOI_BIT, this_cpu_ptr(&kvm_apic_eoi)))
   345			return;
 > 346		apic_native_eoi();
   347	}
   348	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
