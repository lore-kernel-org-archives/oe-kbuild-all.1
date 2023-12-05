Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6896A341
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 18:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fgE0hgYH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701800292; x=1733336292;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hIiYjtnY9JkhMYRyrfNICmhPL6BvSAA3tt0gqSsiXso=;
  b=fgE0hgYH0fUzkxnFBqAviPMLUu8NWTLdBCrBK3LK8k/w7Fg7DlKnyxRt
   5sDZ++eWmBtYka26ESnD4iQsQynx4sNaSMZlqNP3GL90jrk9lMS7N57DD
   vBKngg4KDzvtF98R5TXUywnqkglLk6rr7Vkg7sA0hvjrEFqOh/5sGBDgE
   5ZgieLLazPWiJUJFiegnVEtHnRleVfyBNDqQQd7Ru07gv2I8M8NV2Kd3c
   OETCEWWkYdxg+TUAPiv9V8BBO+HzU5/PGSJ+TCggYZKWLHweNwPuOlJS0
   8pmsWfA/ytN/v0DTW3B3xJrDd+W/9YWjveZS70w27KCtIbAHUr7hwhG+x
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="373390342"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="373390342"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 10:18:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="841557787"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="841557787"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 05 Dec 2023 10:18:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAZzk-0009WE-0J;
	Tue, 05 Dec 2023 18:18:08 +0000
Date: Wed, 6 Dec 2023 02:18:00 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/kvm 3/11] arch/x86/kernel/relocate_kernel_32.S:96:
 Error: Parameter named `type' does not exist for macro `annotate'
Message-ID: <202312060253.7vHu3ktl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/kvm
head:   bd8e1c4c02ac085925674bddccb989e2d7d6cc2d
commit: b7a510b43b1833fc6b0543c0295970c1dd87fbde [3/11] objtool: Convert ANNOTATE_RETPOLINE_SAFE to ANNOTATE
config: i386-buildonly-randconfig-002-20231203 (https://download.01.org/0day-ci/archive/20231206/202312060253.7vHu3ktl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060253.7vHu3ktl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060253.7vHu3ktl-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/relocate_kernel_32.S: Assembler messages:
>> arch/x86/kernel/relocate_kernel_32.S:96: Error: Parameter named `type' does not exist for macro `annotate'
   arch/x86/kernel/relocate_kernel_32.S:166: Error: Parameter named `type' does not exist for macro `annotate'
   arch/x86/kernel/relocate_kernel_32.S:174: Error: Parameter named `type' does not exist for macro `annotate'
   arch/x86/kernel/relocate_kernel_32.S:200: Error: Parameter named `type' does not exist for macro `annotate'
   arch/x86/kernel/relocate_kernel_32.S:220: Error: Parameter named `type' does not exist for macro `annotate'
   arch/x86/kernel/relocate_kernel_32.S:285: Error: Parameter named `type' does not exist for macro `annotate'


vim +96 arch/x86/kernel/relocate_kernel_32.S

3ab83521378268 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2008-07-25   38  
3566561bfadffc arch/i386/kernel/relocate_kernel.S   Magnus Damm           2006-09-26   39  	.text
6ec2a968247e51 arch/x86/kernel/relocate_kernel_32.S Jiri Slaby            2019-10-11   40  SYM_CODE_START_NOALIGN(relocate_kernel)
3ab83521378268 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2008-07-25   41  	/* Save the CPU context, used for jumping back */
3ab83521378268 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2008-07-25   42  
3ab83521378268 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2008-07-25   43  	pushl	%ebx
3ab83521378268 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2008-07-25   44  	pushl	%esi
3ab83521378268 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2008-07-25   45  	pushl	%edi
3ab83521378268 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2008-07-25   46  	pushl	%ebp
3ab83521378268 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2008-07-25   47  	pushf
3ab83521378268 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2008-07-25   48  
3ab83521378268 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2008-07-25   49  	movl	20+8(%esp), %ebp /* list of pages */
3ab83521378268 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2008-07-25   50  	movl	PTR(VA_CONTROL_PAGE)(%ebp), %edi
3ab83521378268 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2008-07-25   51  	movl	%esp, ESP(%edi)
3ab83521378268 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2008-07-25   52  	movl	%cr0, %eax
3ab83521378268 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2008-07-25   53  	movl	%eax, CR0(%edi)
3ab83521378268 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2008-07-25   54  	movl	%cr3, %eax
3ab83521378268 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2008-07-25   55  	movl	%eax, CR3(%edi)
3ab83521378268 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2008-07-25   56  	movl	%cr4, %eax
3ab83521378268 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2008-07-25   57  	movl	%eax, CR4(%edi)
3566561bfadffc arch/i386/kernel/relocate_kernel.S   Magnus Damm           2006-09-26   58  
5033cba087f6ac arch/i386/kernel/relocate_kernel.S   Eric W. Biederman     2005-06-25   59  	/* read the arguments and say goodbye to the stack */
3ab83521378268 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2008-07-25   60  	movl  20+4(%esp), %ebx /* page_list */
3ab83521378268 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2008-07-25   61  	movl  20+8(%esp), %ebp /* list of pages */
3ab83521378268 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2008-07-25   62  	movl  20+12(%esp), %edx /* start address */
3ab83521378268 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2008-07-25   63  	movl  20+16(%esp), %ecx /* cpu_has_pae */
3ab83521378268 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2008-07-25   64  	movl  20+20(%esp), %esi /* preserve_context */
5033cba087f6ac arch/i386/kernel/relocate_kernel.S   Eric W. Biederman     2005-06-25   65  
5033cba087f6ac arch/i386/kernel/relocate_kernel.S   Eric W. Biederman     2005-06-25   66  	/* zero out flags, and disable interrupts */
5033cba087f6ac arch/i386/kernel/relocate_kernel.S   Eric W. Biederman     2005-06-25   67  	pushl $0
5033cba087f6ac arch/i386/kernel/relocate_kernel.S   Eric W. Biederman     2005-06-25   68  	popfl
5033cba087f6ac arch/i386/kernel/relocate_kernel.S   Eric W. Biederman     2005-06-25   69  
3ab83521378268 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2008-07-25   70  	/* save some information for jumping back */
3ab83521378268 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2008-07-25   71  	movl	PTR(VA_CONTROL_PAGE)(%ebp), %edi
3ab83521378268 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2008-07-25   72  	movl	%edi, CP_VA_CONTROL_PAGE(%edi)
3ab83521378268 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2008-07-25   73  	movl	PTR(PA_PGD)(%ebp), %eax
3ab83521378268 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2008-07-25   74  	movl	%eax, CP_PA_PGD(%edi)
3ab83521378268 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2008-07-25   75  	movl	PTR(PA_SWAP_PAGE)(%ebp), %eax
3ab83521378268 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2008-07-25   76  	movl	%eax, CP_PA_SWAP_PAGE(%edi)
3ab83521378268 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2008-07-25   77  	movl	%ebx, CP_PA_BACKUP_PAGES_MAP(%edi)
3ab83521378268 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2008-07-25   78  
fef3a7a1741881 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2009-03-10   79  	/*
fef3a7a1741881 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2009-03-10   80  	 * get physical address of control page now
fef3a7a1741881 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2009-03-10   81  	 * this is impossible after page table switch
fef3a7a1741881 arch/x86/kernel/relocate_kernel_32.S Huang Ying            2009-03-10   82  	 */
3566561bfadffc arch/i386/kernel/relocate_kernel.S   Magnus Damm           2006-09-26   83  	movl	PTR(PA_CONTROL_PAGE)(%ebp), %edi
3566561bfadffc arch/i386/kernel/relocate_kernel.S   Magnus Damm           2006-09-26   84  
3566561bfadffc arch/i386/kernel/relocate_kernel.S   Magnus Damm           2006-09-26   85  	/* switch to new set of page tables */
3566561bfadffc arch/i386/kernel/relocate_kernel.S   Magnus Damm           2006-09-26   86  	movl	PTR(PA_PGD)(%ebp), %eax
3566561bfadffc arch/i386/kernel/relocate_kernel.S   Magnus Damm           2006-09-26   87  	movl	%eax, %cr3
3566561bfadffc arch/i386/kernel/relocate_kernel.S   Magnus Damm           2006-09-26   88  
3566561bfadffc arch/i386/kernel/relocate_kernel.S   Magnus Damm           2006-09-26   89  	/* setup a new stack at the end of the physical control page */
a7bba17bf09e1c arch/x86/kernel/relocate_kernel_32.S gorcunov@gmail.com    2008-03-23   90  	lea	PAGE_SIZE(%edi), %esp
3566561bfadffc arch/i386/kernel/relocate_kernel.S   Magnus Damm           2006-09-26   91  
3566561bfadffc arch/i386/kernel/relocate_kernel.S   Magnus Damm           2006-09-26   92  	/* jump to identity mapped page */
3566561bfadffc arch/i386/kernel/relocate_kernel.S   Magnus Damm           2006-09-26   93  	movl    %edi, %eax
3566561bfadffc arch/i386/kernel/relocate_kernel.S   Magnus Damm           2006-09-26   94  	addl    $(identity_mapped - relocate_kernel), %eax
3566561bfadffc arch/i386/kernel/relocate_kernel.S   Magnus Damm           2006-09-26   95  	pushl   %eax
697977d8415d61 arch/x86/kernel/relocate_kernel_32.S Konrad Rzeszutek Wilk 2022-07-08  @96  	ANNOTATE_UNRET_SAFE
697977d8415d61 arch/x86/kernel/relocate_kernel_32.S Konrad Rzeszutek Wilk 2022-07-08   97  	ret
697977d8415d61 arch/x86/kernel/relocate_kernel_32.S Konrad Rzeszutek Wilk 2022-07-08   98  	int3
6ec2a968247e51 arch/x86/kernel/relocate_kernel_32.S Jiri Slaby            2019-10-11   99  SYM_CODE_END(relocate_kernel)
5033cba087f6ac arch/i386/kernel/relocate_kernel.S   Eric W. Biederman     2005-06-25  100  

:::::: The code at line 96 was first introduced by commit
:::::: 697977d8415d61f3acbc4ee6d564c9dcf0309507 x86/kexec: Disable RET on kexec

:::::: TO: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
:::::: CC: Borislav Petkov <bp@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
