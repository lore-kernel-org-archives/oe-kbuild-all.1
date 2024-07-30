Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED12192B93
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jul 2024 09:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722333577; cv=none; b=QpBDsQrL0DeJ7qJWRZghRMIFUvwkrlv4BQnAHRBSFDfn/bDHnfGJ19K2wCJ5sfYOiGxzioYwh589yGOUej8jQ7atNvuIY+Z9Fk3xHM2SpprGASbv+jp+9VvfpowCIMisOILPP9NMTafcJ2o578WSSkSMvT9uwjRoRobmXU9IXNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722333577; c=relaxed/simple;
	bh=VbveiXOPT76awOOdkiPlnWE8VDHCxPHzJTV7QadOH3o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eT8eM41lCeFPFyxw4UuBE0ai8dT1Y0Fi1SntgSe/vrmFRfjvWDos94By+jGjO7hZL6rIBwiJZmDo3d/tbKGk2X8sbJZblhNQbuWDZ3+cm4OMRhIr1dxHqA9Ij9OpKuZW9OHQlwHrwXMlpnmY0Sgw+2g/+idK+Ag8S2EbLU/XGo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XUrqSJNp; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XUrqSJNp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722333575; x=1753869575;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VbveiXOPT76awOOdkiPlnWE8VDHCxPHzJTV7QadOH3o=;
  b=XUrqSJNpMFSs9E83ERJis/PhFLiw/IJHXAKiqJ+ZaJlhlkG7s/Rq2Zy1
   /vUd+9BSWOM0BxL6lAs3bGs4hCOruOeYxcxWI/qHeBCoWjSzO5X7HcFQn
   lGVqwMofaNfKo1hq4a3CGmdApbLCYwSwWkmN27pnNhZe5+vWmcwcLuoMX
   ygCDfJcZbQQO2G8eNlTroW4lyDXA5Q3R6n2nwVkJEXJiP0M8820jpd/l1
   GWcIJ6aZ8Vkq9aF6Zer+snn7WAynnWkdd7Zn56JPnwCnH/gAglCtPDnld
   3g0LPqBA5hZfpeEk2wCkJqu72LN8Dp90PVK1HmcBDn0exIRsZ42/6Y100
   A==;
X-CSE-ConnectionGUID: QPPAJ/N6QtOKcZDLyQlhCw==
X-CSE-MsgGUID: 27Fs7FhjRxGI45lyd+xg/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31533096"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="31533096"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 02:59:34 -0700
X-CSE-ConnectionGUID: lSN9YZMjQxaYHTwj4QhvrQ==
X-CSE-MsgGUID: COupCj/8TiGkLqjlmpJZAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="58915877"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Jul 2024 02:59:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYjdi-000sk6-2d;
	Tue, 30 Jul 2024 09:59:30 +0000
Date: Tue, 30 Jul 2024 17:59:24 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/fastpath_pi_nv 1/2]
 arch/x86/include/uapi/../../kvm/vmx/../kvm_emulate.h:238:1: error: attempted
 to randomize userland API struct x86_emulate_ops
Message-ID: <202407301741.MSVPihsL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/sean-jc/linux x86/fastpath_pi_nv
head:   b2746b169a9de85ccd1760906aadedd71e30497d
commit: 1f0146409b016f06ebcbdf922431ba84a9c2cc03 [1/2] KVM: x86: Add debug hooks for injected posted interrupts
config: i386-randconfig-001-20240730 (https://download.01.org/0day-ci/archive/20240730/202407301741.MSVPihsL-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407301741.MSVPihsL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407301741.MSVPihsL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/uapi/../../kvm/vmx/../x86.h:10,
                    from arch/x86/include/uapi/../../kvm/vmx/../hyperv.h:25,
                    from arch/x86/include/uapi/../../kvm/vmx/../lapic.h:9,
                    from arch/x86/include/uapi/../../kvm/vmx/capabilities.h:7,
                    from arch/x86/include/uapi/../../kvm/vmx/vmx.h:12,
                    from arch/x86/kernel/irq.c:31:
>> arch/x86/include/uapi/../../kvm/vmx/../kvm_emulate.h:238:1: error: attempted to randomize userland API struct x86_emulate_ops
    };
    ^
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from arch/x86/include/asm/trace/irq_vectors.h:383,
                    from arch/x86/kernel/irq.c:29:
   include/trace/stages/init.h:2:23: warning: 'str__irq_vectors__trace_system_name' defined but not used [-Wunused-const-variable=]
    #define __app__(x, y) str__##x##y
                          ^~~~~
   include/trace/stages/init.h:3:21: note: in expansion of macro '__app__'
    #define __app(x, y) __app__(x, y)
                        ^~~~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
    #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
                                ^~~~~
   include/trace/stages/init.h:8:20: note: in expansion of macro 'TRACE_SYSTEM_STRING'
     static const char TRACE_SYSTEM_STRING[] = \
                       ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
    TRACE_MAKE_SYSTEM_STR();
    ^~~~~~~~~~~~~~~~~~~~~


vim +238 arch/x86/include/uapi/../../kvm/vmx/../kvm_emulate.h

7b0dd9430cf0c1 arch/x86/kvm/kvm_emulate.h         Binbin Wu           2023-09-13   97  
6aa8b732ca01c3 drivers/kvm/x86_emulate.h          Avi Kivity          2006-12-10   98  struct x86_emulate_ops {
1cca2f8c501fa0 arch/x86/kvm/kvm_emulate.h         Sean Christopherson 2022-05-26   99  	void (*vm_bugged)(struct x86_emulate_ctxt *ctxt);
dd856efafe6097 arch/x86/include/asm/kvm_emulate.h Avi Kivity          2012-08-27  100  	/*
dd856efafe6097 arch/x86/include/asm/kvm_emulate.h Avi Kivity          2012-08-27  101  	 * read_gpr: read a general purpose register (rax - r15)
dd856efafe6097 arch/x86/include/asm/kvm_emulate.h Avi Kivity          2012-08-27  102  	 *
dd856efafe6097 arch/x86/include/asm/kvm_emulate.h Avi Kivity          2012-08-27  103  	 * @reg: gpr number.
dd856efafe6097 arch/x86/include/asm/kvm_emulate.h Avi Kivity          2012-08-27  104  	 */
dd856efafe6097 arch/x86/include/asm/kvm_emulate.h Avi Kivity          2012-08-27  105  	ulong (*read_gpr)(struct x86_emulate_ctxt *ctxt, unsigned reg);
dd856efafe6097 arch/x86/include/asm/kvm_emulate.h Avi Kivity          2012-08-27  106  	/*
dd856efafe6097 arch/x86/include/asm/kvm_emulate.h Avi Kivity          2012-08-27  107  	 * write_gpr: write a general purpose register (rax - r15)
dd856efafe6097 arch/x86/include/asm/kvm_emulate.h Avi Kivity          2012-08-27  108  	 *
dd856efafe6097 arch/x86/include/asm/kvm_emulate.h Avi Kivity          2012-08-27  109  	 * @reg: gpr number.
dd856efafe6097 arch/x86/include/asm/kvm_emulate.h Avi Kivity          2012-08-27  110  	 * @val: value to write.
dd856efafe6097 arch/x86/include/asm/kvm_emulate.h Avi Kivity          2012-08-27  111  	 */
dd856efafe6097 arch/x86/include/asm/kvm_emulate.h Avi Kivity          2012-08-27  112  	void (*write_gpr)(struct x86_emulate_ctxt *ctxt, unsigned reg, ulong val);
6aa8b732ca01c3 drivers/kvm/x86_emulate.h          Avi Kivity          2006-12-10  113  	/*
6aa8b732ca01c3 drivers/kvm/x86_emulate.h          Avi Kivity          2006-12-10  114  	 * read_std: Read bytes of standard (non-emulated/special) memory.
1871c6020d7308 arch/x86/include/asm/kvm_emulate.h Gleb Natapov        2010-02-10  115  	 *           Used for descriptor reading.
6aa8b732ca01c3 drivers/kvm/x86_emulate.h          Avi Kivity          2006-12-10  116  	 *  @addr:  [IN ] Linear address from which to read.
6aa8b732ca01c3 drivers/kvm/x86_emulate.h          Avi Kivity          2006-12-10  117  	 *  @val:   [OUT] Value read from memory, zero-extended to 'u_long'.
6aa8b732ca01c3 drivers/kvm/x86_emulate.h          Avi Kivity          2006-12-10  118  	 *  @bytes: [IN ] Number of bytes to read from memory.
3c9fa24ca7c9c4 arch/x86/include/asm/kvm_emulate.h Paolo Bonzini       2018-06-06  119  	 *  @system:[IN ] Whether the access is forced to be at CPL0.
6aa8b732ca01c3 drivers/kvm/x86_emulate.h          Avi Kivity          2006-12-10  120  	 */
0f65dd70a442ff arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  121  	int (*read_std)(struct x86_emulate_ctxt *ctxt,
0f65dd70a442ff arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  122  			unsigned long addr, void *val,
0f65dd70a442ff arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  123  			unsigned int bytes,
3c9fa24ca7c9c4 arch/x86/include/asm/kvm_emulate.h Paolo Bonzini       2018-06-06  124  			struct x86_exception *fault, bool system);
1871c6020d7308 arch/x86/include/asm/kvm_emulate.h Gleb Natapov        2010-02-10  125  
2dafc6c234b606 arch/x86/include/asm/kvm_emulate.h Gleb Natapov        2010-03-18  126  	/*
2dafc6c234b606 arch/x86/include/asm/kvm_emulate.h Gleb Natapov        2010-03-18  127  	 * write_std: Write bytes of standard (non-emulated/special) memory.
2dafc6c234b606 arch/x86/include/asm/kvm_emulate.h Gleb Natapov        2010-03-18  128  	 *            Used for descriptor writing.
2dafc6c234b606 arch/x86/include/asm/kvm_emulate.h Gleb Natapov        2010-03-18  129  	 *  @addr:  [IN ] Linear address to which to write.
2dafc6c234b606 arch/x86/include/asm/kvm_emulate.h Gleb Natapov        2010-03-18  130  	 *  @val:   [OUT] Value write to memory, zero-extended to 'u_long'.
2dafc6c234b606 arch/x86/include/asm/kvm_emulate.h Gleb Natapov        2010-03-18  131  	 *  @bytes: [IN ] Number of bytes to write to memory.
3c9fa24ca7c9c4 arch/x86/include/asm/kvm_emulate.h Paolo Bonzini       2018-06-06  132  	 *  @system:[IN ] Whether the access is forced to be at CPL0.
2dafc6c234b606 arch/x86/include/asm/kvm_emulate.h Gleb Natapov        2010-03-18  133  	 */
0f65dd70a442ff arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  134  	int (*write_std)(struct x86_emulate_ctxt *ctxt,
0f65dd70a442ff arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  135  			 unsigned long addr, void *val, unsigned int bytes,
3c9fa24ca7c9c4 arch/x86/include/asm/kvm_emulate.h Paolo Bonzini       2018-06-06  136  			 struct x86_exception *fault, bool system);
1871c6020d7308 arch/x86/include/asm/kvm_emulate.h Gleb Natapov        2010-02-10  137  	/*
1871c6020d7308 arch/x86/include/asm/kvm_emulate.h Gleb Natapov        2010-02-10  138  	 * fetch: Read bytes of standard (non-emulated/special) memory.
1871c6020d7308 arch/x86/include/asm/kvm_emulate.h Gleb Natapov        2010-02-10  139  	 *        Used for instruction fetch.
1871c6020d7308 arch/x86/include/asm/kvm_emulate.h Gleb Natapov        2010-02-10  140  	 *  @addr:  [IN ] Linear address from which to read.
1871c6020d7308 arch/x86/include/asm/kvm_emulate.h Gleb Natapov        2010-02-10  141  	 *  @val:   [OUT] Value read from memory, zero-extended to 'u_long'.
1871c6020d7308 arch/x86/include/asm/kvm_emulate.h Gleb Natapov        2010-02-10  142  	 *  @bytes: [IN ] Number of bytes to read from memory.
1871c6020d7308 arch/x86/include/asm/kvm_emulate.h Gleb Natapov        2010-02-10  143  	 */
0f65dd70a442ff arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  144  	int (*fetch)(struct x86_emulate_ctxt *ctxt,
0f65dd70a442ff arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  145  		     unsigned long addr, void *val, unsigned int bytes,
bcc55cba9f1fcd arch/x86/include/asm/kvm_emulate.h Avi Kivity          2010-11-22  146  		     struct x86_exception *fault);
6aa8b732ca01c3 drivers/kvm/x86_emulate.h          Avi Kivity          2006-12-10  147  
6aa8b732ca01c3 drivers/kvm/x86_emulate.h          Avi Kivity          2006-12-10  148  	/*
6aa8b732ca01c3 drivers/kvm/x86_emulate.h          Avi Kivity          2006-12-10  149  	 * read_emulated: Read bytes from emulated/special memory area.
6aa8b732ca01c3 drivers/kvm/x86_emulate.h          Avi Kivity          2006-12-10  150  	 *  @addr:  [IN ] Linear address from which to read.
6aa8b732ca01c3 drivers/kvm/x86_emulate.h          Avi Kivity          2006-12-10  151  	 *  @val:   [OUT] Value read from memory, zero-extended to 'u_long'.
6aa8b732ca01c3 drivers/kvm/x86_emulate.h          Avi Kivity          2006-12-10  152  	 *  @bytes: [IN ] Number of bytes to read from memory.
6aa8b732ca01c3 drivers/kvm/x86_emulate.h          Avi Kivity          2006-12-10  153  	 */
0f65dd70a442ff arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  154  	int (*read_emulated)(struct x86_emulate_ctxt *ctxt,
0f65dd70a442ff arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  155  			     unsigned long addr, void *val, unsigned int bytes,
0f65dd70a442ff arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  156  			     struct x86_exception *fault);
6aa8b732ca01c3 drivers/kvm/x86_emulate.h          Avi Kivity          2006-12-10  157  
6aa8b732ca01c3 drivers/kvm/x86_emulate.h          Avi Kivity          2006-12-10  158  	/*
0d178975d0a5af arch/x86/include/asm/kvm_emulate.h Takuya Yoshikawa    2010-01-06  159  	 * write_emulated: Write bytes to emulated/special memory area.
6aa8b732ca01c3 drivers/kvm/x86_emulate.h          Avi Kivity          2006-12-10  160  	 *  @addr:  [IN ] Linear address to which to write.
6aa8b732ca01c3 drivers/kvm/x86_emulate.h          Avi Kivity          2006-12-10  161  	 *  @val:   [IN ] Value to write to memory (low-order bytes used as
6aa8b732ca01c3 drivers/kvm/x86_emulate.h          Avi Kivity          2006-12-10  162  	 *                required).
6aa8b732ca01c3 drivers/kvm/x86_emulate.h          Avi Kivity          2006-12-10  163  	 *  @bytes: [IN ] Number of bytes to write to memory.
6aa8b732ca01c3 drivers/kvm/x86_emulate.h          Avi Kivity          2006-12-10  164  	 */
0f65dd70a442ff arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  165  	int (*write_emulated)(struct x86_emulate_ctxt *ctxt,
0f65dd70a442ff arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  166  			      unsigned long addr, const void *val,
6aa8b732ca01c3 drivers/kvm/x86_emulate.h          Avi Kivity          2006-12-10  167  			      unsigned int bytes,
0f65dd70a442ff arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  168  			      struct x86_exception *fault);
6aa8b732ca01c3 drivers/kvm/x86_emulate.h          Avi Kivity          2006-12-10  169  
6aa8b732ca01c3 drivers/kvm/x86_emulate.h          Avi Kivity          2006-12-10  170  	/*
6aa8b732ca01c3 drivers/kvm/x86_emulate.h          Avi Kivity          2006-12-10  171  	 * cmpxchg_emulated: Emulate an atomic (LOCKed) CMPXCHG operation on an
6aa8b732ca01c3 drivers/kvm/x86_emulate.h          Avi Kivity          2006-12-10  172  	 *                   emulated/special memory area.
6aa8b732ca01c3 drivers/kvm/x86_emulate.h          Avi Kivity          2006-12-10  173  	 *  @addr:  [IN ] Linear address to access.
6aa8b732ca01c3 drivers/kvm/x86_emulate.h          Avi Kivity          2006-12-10  174  	 *  @old:   [IN ] Value expected to be current at @addr.
6aa8b732ca01c3 drivers/kvm/x86_emulate.h          Avi Kivity          2006-12-10  175  	 *  @new:   [IN ] Value to write to @addr.
6aa8b732ca01c3 drivers/kvm/x86_emulate.h          Avi Kivity          2006-12-10  176  	 *  @bytes: [IN ] Number of bytes to access using CMPXCHG.
6aa8b732ca01c3 drivers/kvm/x86_emulate.h          Avi Kivity          2006-12-10  177  	 */
0f65dd70a442ff arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  178  	int (*cmpxchg_emulated)(struct x86_emulate_ctxt *ctxt,
0f65dd70a442ff arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  179  				unsigned long addr,
4c690a1e8667a8 drivers/kvm/x86_emulate.h          Avi Kivity          2007-04-22  180  				const void *old,
4c690a1e8667a8 drivers/kvm/x86_emulate.h          Avi Kivity          2007-04-22  181  				const void *new,
6aa8b732ca01c3 drivers/kvm/x86_emulate.h          Avi Kivity          2006-12-10  182  				unsigned int bytes,
0f65dd70a442ff arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  183  				struct x86_exception *fault);
3cb16fe78ce919 arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  184  	void (*invlpg)(struct x86_emulate_ctxt *ctxt, ulong addr);
cf8f70bfe38b32 arch/x86/include/asm/kvm_emulate.h Gleb Natapov        2010-03-18  185  
ca1d4a9e772bde arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  186  	int (*pio_in_emulated)(struct x86_emulate_ctxt *ctxt,
ca1d4a9e772bde arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  187  			       int size, unsigned short port, void *val,
ca1d4a9e772bde arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  188  			       unsigned int count);
cf8f70bfe38b32 arch/x86/include/asm/kvm_emulate.h Gleb Natapov        2010-03-18  189  
ca1d4a9e772bde arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  190  	int (*pio_out_emulated)(struct x86_emulate_ctxt *ctxt,
ca1d4a9e772bde arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  191  				int size, unsigned short port, const void *val,
ca1d4a9e772bde arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  192  				unsigned int count);
cf8f70bfe38b32 arch/x86/include/asm/kvm_emulate.h Gleb Natapov        2010-03-18  193  
1aa366163b8b69 arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-27  194  	bool (*get_segment)(struct x86_emulate_ctxt *ctxt, u16 *selector,
1aa366163b8b69 arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-27  195  			    struct desc_struct *desc, u32 *base3, int seg);
1aa366163b8b69 arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-27  196  	void (*set_segment)(struct x86_emulate_ctxt *ctxt, u16 selector,
1aa366163b8b69 arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-27  197  			    struct desc_struct *desc, u32 base3, int seg);
4bff1e86ad286d arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  198  	unsigned long (*get_cached_segment_base)(struct x86_emulate_ctxt *ctxt,
4bff1e86ad286d arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  199  						 int seg);
4bff1e86ad286d arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  200  	void (*get_gdt)(struct x86_emulate_ctxt *ctxt, struct desc_ptr *dt);
4bff1e86ad286d arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  201  	void (*get_idt)(struct x86_emulate_ctxt *ctxt, struct desc_ptr *dt);
1ac9d0cfb07e8a arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  202  	void (*set_gdt)(struct x86_emulate_ctxt *ctxt, struct desc_ptr *dt);
1ac9d0cfb07e8a arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  203  	void (*set_idt)(struct x86_emulate_ctxt *ctxt, struct desc_ptr *dt);
717746e382e58f arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  204  	ulong (*get_cr)(struct x86_emulate_ctxt *ctxt, int cr);
717746e382e58f arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  205  	int (*set_cr)(struct x86_emulate_ctxt *ctxt, int cr, ulong val);
717746e382e58f arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  206  	int (*cpl)(struct x86_emulate_ctxt *ctxt);
fc5375dd8c062d arch/x86/kvm/kvm_emulate.h         Sean Christopherson 2024-02-09  207  	ulong (*get_dr)(struct x86_emulate_ctxt *ctxt, int dr);
717746e382e58f arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  208  	int (*set_dr)(struct x86_emulate_ctxt *ctxt, int dr, ulong value);
ac8d6cad3c7b39 arch/x86/kvm/kvm_emulate.h         Hou Wenlong         2022-03-07  209  	int (*set_msr_with_filter)(struct x86_emulate_ctxt *ctxt, u32 msr_index, u64 data);
ac8d6cad3c7b39 arch/x86/kvm/kvm_emulate.h         Hou Wenlong         2022-03-07  210  	int (*get_msr_with_filter)(struct x86_emulate_ctxt *ctxt, u32 msr_index, u64 *pdata);
717746e382e58f arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  211  	int (*get_msr)(struct x86_emulate_ctxt *ctxt, u32 msr_index, u64 *pdata);
7bb7fce13601d2 arch/x86/kvm/kvm_emulate.h         Sean Christopherson 2024-01-09  212  	int (*check_rdpmc_early)(struct x86_emulate_ctxt *ctxt, u32 pmc);
222d21aa070a48 arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-11-10  213  	int (*read_pmc)(struct x86_emulate_ctxt *ctxt, u32 pmc, u64 *pdata);
6c3287f7c50500 arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  214  	void (*halt)(struct x86_emulate_ctxt *ctxt);
bcaf5cc543bdb8 arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  215  	void (*wbinvd)(struct x86_emulate_ctxt *ctxt);
d6aa10003b0cde arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  216  	int (*fix_hypercall)(struct x86_emulate_ctxt *ctxt);
2953538ebbd95b arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-20  217  	int (*intercept)(struct x86_emulate_ctxt *ctxt,
8a76d7f25f8f24 arch/x86/include/asm/kvm_emulate.h Joerg Roedel        2011-04-04  218  			 struct x86_instruction_info *info,
c4f035c60dad45 arch/x86/include/asm/kvm_emulate.h Avi Kivity          2011-04-04  219  			 enum x86_intercept_stage stage);
bdb42f5afebe20 arch/x86/include/asm/kvm_emulate.h Stephan Bärwolf     2012-01-12  220  
e911eb3b3414e6 arch/x86/include/asm/kvm_emulate.h Yu Zhang            2017-08-24  221  	bool (*get_cpuid)(struct x86_emulate_ctxt *ctxt, u32 *eax, u32 *ebx,
f91af5176cce77 arch/x86/kvm/kvm_emulate.h         Sean Christopherson 2020-03-04  222  			  u32 *ecx, u32 *edx, bool exact_only);
5ae78e95ed0c77 arch/x86/include/asm/kvm_emulate.h Sean Christopherson 2019-12-17  223  	bool (*guest_has_movbe)(struct x86_emulate_ctxt *ctxt);
5ae78e95ed0c77 arch/x86/include/asm/kvm_emulate.h Sean Christopherson 2019-12-17  224  	bool (*guest_has_fxsr)(struct x86_emulate_ctxt *ctxt);
a836839cbfe60d arch/x86/kvm/kvm_emulate.h         Hou Wenlong         2022-03-02  225  	bool (*guest_has_rdpid)(struct x86_emulate_ctxt *ctxt);
d99e4cb2ae2e02 arch/x86/kvm/kvm_emulate.h         Sean Christopherson 2024-04-05  226  	bool (*guest_cpuid_is_intel_compatible)(struct x86_emulate_ctxt *ctxt);
5ae78e95ed0c77 arch/x86/include/asm/kvm_emulate.h Sean Christopherson 2019-12-17  227  
801806d956c2c1 arch/x86/include/asm/kvm_emulate.h Nadav Amit          2015-01-26  228  	void (*set_nmi_mask)(struct x86_emulate_ctxt *ctxt, bool masked);
6ed071f051e12c arch/x86/include/asm/kvm_emulate.h Ladi Prosek         2017-04-25  229  
32e69f232db4ca arch/x86/kvm/kvm_emulate.h         Maxim Levitsky      2022-11-29  230  	bool (*is_smm)(struct x86_emulate_ctxt *ctxt);
32e69f232db4ca arch/x86/kvm/kvm_emulate.h         Maxim Levitsky      2022-11-29  231  	bool (*is_guest_mode)(struct x86_emulate_ctxt *ctxt);
f1554150d3c694 arch/x86/kvm/kvm_emulate.h         Paolo Bonzini       2022-10-28  232  	int (*leave_smm)(struct x86_emulate_ctxt *ctxt);
25b17226cd9a77 arch/x86/kvm/kvm_emulate.h         Sean Christopherson 2021-06-09  233  	void (*triple_fault)(struct x86_emulate_ctxt *ctxt);
02d4160fbd7651 arch/x86/include/asm/kvm_emulate.h Vitaly Kuznetsov    2019-08-13  234  	int (*set_xcr)(struct x86_emulate_ctxt *ctxt, u32 index, u64 xcr);
37a41847b770c7 arch/x86/kvm/kvm_emulate.h         Binbin Wu           2023-09-13  235  
37a41847b770c7 arch/x86/kvm/kvm_emulate.h         Binbin Wu           2023-09-13  236  	gva_t (*get_untagged_addr)(struct x86_emulate_ctxt *ctxt, gva_t addr,
37a41847b770c7 arch/x86/kvm/kvm_emulate.h         Binbin Wu           2023-09-13  237  				   unsigned int flags);
6aa8b732ca01c3 drivers/kvm/x86_emulate.h          Avi Kivity          2006-12-10 @238  };
6aa8b732ca01c3 drivers/kvm/x86_emulate.h          Avi Kivity          2006-12-10  239  

:::::: The code at line 238 was first introduced by commit
:::::: 6aa8b732ca01c3d7a54e93f4d701b8aabbe60fb7 [PATCH] kvm: userspace interface

:::::: TO: Avi Kivity <avi@qumranet.com>
:::::: CC: Linus Torvalds <torvalds@woody.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
