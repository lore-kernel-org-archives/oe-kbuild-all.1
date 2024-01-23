Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D986F4E0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jan 2024 05:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705987286; cv=none; b=rz5pH7tXsf56ryJCrTl9KkhMqPJRvFnQQoKXpoDB20c5zaDeM/WjIp7DD3ljFSufUZfLc01i0mbt7rq58k2mI/G3PPnCjvsjU1csl1ELJ9vqCZ+Io0zN1ms+cpL2hd0Zjy6EioarVML6oltdE+CuckpwKUrZ1skGntuFSknRmd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705987286; c=relaxed/simple;
	bh=cjGZKHT3tyy94hRwoRGMapZFNihfqtLAnAHTRI9Ifqw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dCQfNgjaRxuCBZ+rQgFZnl6dF+AB7QThEfB+DMWlXPPqDNOngd7DSCDqOfPy1ksIpVx6QE3aZ+tR6l5+m3FBru0yjn9pimNM3cY+8YzVs6aS6/FVxe9hI4EiZed0r8bvx7wAazHJrXQHmQdZSt2jYxdWiVqJ8i7qwtwORdQkDqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H7JPPX0k; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H7JPPX0k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705987284; x=1737523284;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cjGZKHT3tyy94hRwoRGMapZFNihfqtLAnAHTRI9Ifqw=;
  b=H7JPPX0kEFwC49VQQUJ4VdSQTUfmMl3d9cfULb/UbvCCPej+6kL59wR7
   STSFqMG4P0c4ThwEtMEhHi6c2gTpPu0NZogY5WQfUNAyhtZlsb+6fA/u4
   fCDZsPym1N9qkylzx8xqqOCj2qYGSlsfBlErRYjYaAFgY0zd4SOwceJip
   ErCj6PoyydsLhJwP/IPkHpZ56KQgBdf3g4pVrizQD9ax0a9YHwApkzUgc
   7KH8iCmK5BTxwftN9zabBFZw90n0LOXggIBPooG3FI5dVy3V2ZyiKQUiJ
   tuId5jgNjWzvzYAO6XY4CsjNMSkDGDW3BC1U8z/fiRMI2325wVbV3nyFB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="391841699"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; 
   d="scan'208";a="391841699"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 21:21:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="905110434"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; 
   d="scan'208";a="905110434"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 22 Jan 2024 21:21:22 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rS9Dr-0007Bk-2a;
	Tue, 23 Jan 2024 05:21:19 +0000
Date: Tue, 23 Jan 2024 13:21:08 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/arm32-lpae-pan 1/6] fs/binfmt_elf.c:225:17:
 sparse: sparse: cast removes address space '__user' of expression
Message-ID: <202401231322.aeNZmqiU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/arm32-lpae-pan
head:   dc4964ca9391d59368b8f1e27bea030fec5504b2
commit: 8615ebf1370a798c403b4495f39de48270ad48f9 [1/6] trigger PAN crash
config: x86_64-randconfig-122-20240123 (https://download.01.org/0day-ci/archive/20240123/202401231322.aeNZmqiU-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240123/202401231322.aeNZmqiU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401231322.aeNZmqiU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/compat_binfmt_elf.c: note: in included file:
>> fs/binfmt_elf.c:225:17: sparse: sparse: cast removes address space '__user' of expression
   fs/compat_binfmt_elf.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
--
>> fs/binfmt_elf.c:225:17: sparse: sparse: cast removes address space '__user' of expression
   fs/binfmt_elf.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression

vim +/__user +225 fs/binfmt_elf.c

   154	
   155	static int
   156	create_elf_tables(struct linux_binprm *bprm, const struct elfhdr *exec,
   157			unsigned long interp_load_addr,
   158			unsigned long e_entry, unsigned long phdr_addr)
   159	{
   160		struct mm_struct *mm = current->mm;
   161		unsigned long p = bprm->p;
   162		int argc = bprm->argc;
   163		int envc = bprm->envc;
   164		elf_addr_t __user *sp;
   165		elf_addr_t __user *u_platform;
   166		elf_addr_t __user *u_base_platform;
   167		elf_addr_t __user *u_rand_bytes;
   168		const char *k_platform = ELF_PLATFORM;
   169		const char *k_base_platform = ELF_BASE_PLATFORM;
   170		unsigned char k_rand_bytes[16];
   171		int items;
   172		elf_addr_t *elf_info;
   173		elf_addr_t flags = 0;
   174		int ei_index;
   175		const struct cred *cred = current_cred();
   176		struct vm_area_struct *vma;
   177		unsigned char *test;
   178	
   179		/*
   180		 * In some cases (e.g. Hyper-Threading), we want to avoid L1
   181		 * evictions by the processes running on the same package. One
   182		 * thing we can do is to shuffle the initial stack for them.
   183		 */
   184	
   185		p = arch_align_stack(p);
   186	
   187		/*
   188		 * If this architecture has a platform capability string, copy it
   189		 * to userspace.  In some cases (Sparc), this info is impossible
   190		 * for userspace to get any other way, in others (i386) it is
   191		 * merely difficult.
   192		 */
   193		u_platform = NULL;
   194		if (k_platform) {
   195			size_t len = strlen(k_platform) + 1;
   196	
   197			u_platform = (elf_addr_t __user *)STACK_ALLOC(p, len);
   198			if (copy_to_user(u_platform, k_platform, len))
   199				return -EFAULT;
   200		}
   201	
   202		/*
   203		 * If this architecture has a "base" platform capability
   204		 * string, copy it to userspace.
   205		 */
   206		u_base_platform = NULL;
   207		if (k_base_platform) {
   208			size_t len = strlen(k_base_platform) + 1;
   209	
   210			u_base_platform = (elf_addr_t __user *)STACK_ALLOC(p, len);
   211			if (copy_to_user(u_base_platform, k_base_platform, len))
   212				return -EFAULT;
   213		}
   214	
   215		/*
   216		 * Generate 16 random bytes for userspace PRNG seeding.
   217		 */
   218		get_random_bytes(k_rand_bytes, sizeof(k_rand_bytes));
   219		u_rand_bytes = (elf_addr_t __user *)
   220			       STACK_ALLOC(p, sizeof(k_rand_bytes));
   221		if (copy_to_user(u_rand_bytes, k_rand_bytes, sizeof(k_rand_bytes)))
   222			return -EFAULT;
   223	
   224		/* Cause a kernelspace access to userspace memory */
 > 225		test = (char *)u_rand_bytes;
   226		pr_info("Some byte: %02x\n", *test);
   227	
   228		/* Create the ELF interpreter info */
   229		elf_info = (elf_addr_t *)mm->saved_auxv;
   230		/* update AT_VECTOR_SIZE_BASE if the number of NEW_AUX_ENT() changes */
   231	#define NEW_AUX_ENT(id, val) \
   232		do { \
   233			*elf_info++ = id; \
   234			*elf_info++ = val; \
   235		} while (0)
   236	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
