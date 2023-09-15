Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0292BDDB7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Sep 2023 12:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694779457; x=1726315457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ACPt9l1DBxqgLU9l7jU/5O1Zwn+Wl6bUuBmmhHgb0h8=;
  b=g6+EaMtmDyjeOt3M8T0fWovRmX2oGnWBdL04C+f0n0KMZqytGT+hQ6fK
   nBxAsGAnYHj0psvDUHQokDoFLFHa8/RuhUrAdYh7D+KdLpRuLmPH/A+1A
   Cz10A5Jxwo9e/Zcp7XuOcdv7mRH/V3PkuGNJGghGFuxYwmXssASgfV/N9
   Qc/K0KrAKDKRD1KswvC76QSCdLN11AgIi4MudQDzxDY1vdMjeKmhhfoGu
   Yo+42LfqsawiVOloH0CP8L+e/oGghQ3wCZCqyd8H9AQ6K/tE2eFFmlgXg
   iYVyM0FCHPYc3r30yOzUD2TEvBIn5otY4bOxM3XGtKDZ+2cafIeydvXti
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="381959955"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="381959955"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 05:03:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="738302925"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="738302925"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 15 Sep 2023 05:03:54 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qh7Y8-0002wE-0N;
	Fri, 15 Sep 2023 12:03:52 +0000
Date: Fri, 15 Sep 2023 20:03:00 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:iov-kunit 5/9] lib/kunit_iov_iter.c:308:9: sparse:
 sparse: incorrect type in initializer (different address spaces)
Message-ID: <202309151945.S2JomKF6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git iov-kunit
head:   75675904b940d8090d74bde195d8ba4a2e3aee80
commit: 282ae3bc8ef2f1742153b9462ff31c20c09ebc6a [5/9] iov_iter: Create a function to prepare userspace VM for UBUF/IOVEC tests
config: i386-randconfig-061-20230915 (https://download.01.org/0day-ci/archive/20230915/202309151945.S2JomKF6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309151945.S2JomKF6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309151945.S2JomKF6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/kunit_iov_iter.c:308:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const *value @@     got unsigned char [noderef] [usertype] __user *const __ptr @@
   lib/kunit_iov_iter.c:308:9: sparse:     expected void const *value
   lib/kunit_iov_iter.c:308:9: sparse:     got unsigned char [noderef] [usertype] __user *const __ptr

vim +308 lib/kunit_iov_iter.c

   260	
   261	static u8 __user *__init iov_kunit_create_user_buf(struct kunit *test,
   262							   size_t npages,
   263							   struct page ***ppages)
   264	{
   265		struct rlimit rlim_stack = {
   266			.rlim_cur = LONG_MAX,
   267			.rlim_max = LONG_MAX,
   268		};
   269		struct vm_area_struct *vma;
   270		struct mm_struct *mm;
   271		struct file *file;
   272		u8 __user *buffer;
   273		int ret;
   274	
   275		KUNIT_ASSERT_NULL(test, current->mm);
   276	
   277		mm = mm_alloc();
   278		KUNIT_ASSERT_NOT_NULL(test, mm);
   279		kunit_add_action_or_reset(test, iov_kunit_mmdrop, mm);
   280		arch_pick_mmap_layout(mm, &rlim_stack);
   281	
   282		vma = vm_area_alloc(mm);
   283		KUNIT_ASSERT_NOT_NULL(test, vma);
   284		vma_set_anonymous(vma);
   285	
   286		/*
   287		 * Place the stack at the largest stack address the architecture
   288		 * supports. Later, we'll move this to an appropriate place. We don't
   289		 * use STACK_TOP because that can depend on attributes which aren't
   290		 * configured yet.
   291		 */
   292		vma->vm_end = STACK_TOP_MAX;
   293		vma->vm_start = vma->vm_end - PAGE_SIZE;
   294		vm_flags_init(vma, VM_SOFTDIRTY | VM_STACK_FLAGS | VM_STACK_INCOMPLETE_SETUP);
   295		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
   296	
   297		ret = insert_vm_struct(mm, vma);
   298		KUNIT_ASSERT_EQ(test, ret, 0);
   299	
   300		mm->stack_vm = mm->total_vm = 1;
   301	
   302		file = iov_kunit_create_file(test, npages, ppages);
   303	
   304		kthread_use_mm(mm);
   305		buffer = (u8 __user *)vm_mmap(file, 0, PAGE_SIZE * npages,
   306					      PROT_READ | PROT_WRITE,
   307					      MAP_SHARED, 0);
 > 308		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buffer);
   309		return buffer;
   310	}
   311	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
