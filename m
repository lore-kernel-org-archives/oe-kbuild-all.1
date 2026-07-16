Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E6A27FB05
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Jul 2026 00:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784162974; cv=none; b=L2iS50jeOF0Qsduu2L6Bp0TGkSMeIKAvELC+1m55DDbarX0Vb3MdPxn6LUs0L5GTVGAVBpYeszJ9n6SAzkRVpTuegQATJ7ou9oyTlzlwg3dzeQ6O8I/JUqMK5K75DGzV66EzhFYVcGZszjkYE3Y6qG/RSmCMyY8YuZyym6c8wuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784162974; c=relaxed/simple;
	bh=9CneP9yN0GdcjSmMkBre7V7Tq8tTTnIuGzIQ1vlnSE4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=d++NsbGLWyMkih2oxPEC1qwX4SrVERN42QK8WFM8DraN2vwCoVWMHGFDz2+VzzC8EbH/OUHNyRM11BxiLZAFtMZxEjFMxWMUrmxp1Tfz9PQtz6UelgKOAloUU9b26wd85u5orjQsu1DApI/y7CJPWZ4qbScf2Ao9Sl1VQlL/t+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dp7dn3Pr; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dp7dn3Pr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784162972; x=1815698972;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9CneP9yN0GdcjSmMkBre7V7Tq8tTTnIuGzIQ1vlnSE4=;
  b=dp7dn3PrZ6yjo9S5TDaXOdfna1FF+LX7D6UrKlD/0pj2E2reNQz0FFtR
   0JcqntttmbKV+coHA3IJBmXW7Lf6gDGebIc+ZlY8VpIBYsS88NL8Q8m0Z
   Muo/nksKdAzEa0XmxeS4Y7VWEmIFTzHdLjXQN8hFIS8yaWZxFrprWuwAz
   lpaFnJXhsgSHxMEigkSjfkgOjzpNlPbpfgqb/N5gmpMIuWbfPaSoxmIMp
   mBwcNyK+4p08HxJuvRnIv/Yp/6LjuoYvzS7g+w7y5fO2SR7stlaIlC3fV
   x3FIsyEIcQUAlyxbwIIls17KVEtU5sO6YTn42E41sOTiXBsAVIOlXLy9X
   Q==;
X-CSE-ConnectionGUID: yr/6yzkDTeuPu3HsMnH8Ig==
X-CSE-MsgGUID: CQtPXzI4Q/u9Lnv1xMIiCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="102365238"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="102365238"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 17:49:32 -0700
X-CSE-ConnectionGUID: FXlrWh4dQDut5SERZB+ThA==
X-CSE-MsgGUID: ei6SrO8qQAadTphDkOPW3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="254580507"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 15 Jul 2026 17:49:30 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkAI3-00000000OAU-0Dz8;
	Thu, 16 Jul 2026 00:49:27 +0000
Date: Thu, 16 Jul 2026 08:48:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-06 3/3]
 arch/arm64/kvm/hyp/include/nvhe/modules.h:47:16: error: 'return' with a
 value, in function returning void
Message-ID: <202607160818.kaG1bSbp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Quentin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-=
06
head:   dddb2f587987bc109f7f6f1295336c6dc8fc8aa1
commit: 489e4bb847d0800b869c810143d2be0f635d02f3 [3/3] ANDROID: KVM: arm64:=
 Allow memcache topup from guest SMC handler
config: arm64-randconfig-002-20260715 (https://download.01.org/0day-ci/arch=
ive/20260716/202607160818.kaG1bSbp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260716/202607160818.kaG1bSbp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607160818.kaG1bSbp-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:21:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:42: warning: 'struct pk=
vm_sglist_page' declared inside parameter list will not be visible outside =
of this definition or declaration
      48 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglis=
t, size_t nr_pages);
         |                                          ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:23:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:6: warning: no previous pro=
totype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      41 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u6=
4 esr, u64 addr) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:6: warning: no previous pro=
totype for 'module_handle_host_smc' [-Wmissing-prototypes]
      42 | bool module_handle_host_smc(struct user_pt_regs *regs) { return =
false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: error: return type is an=
 incomplete type
      44 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct =
arm_smccc_1_2_regs *res,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: warning: no previous pro=
totype for 'module_handle_guest_smc' [-Wmissing-prototypes]
   arch/arm64/kvm/hyp/include/nvhe/modules.h: In function 'module_handle_gu=
est_smc':
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:47:16: error: 'return' with a =
value, in function returning void [-Wreturn-mismatch]
      47 |         return false;
         |                ^~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: note: declared here
      44 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct =
arm_smccc_1_2_regs *res,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c: At top level:
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1492:42: warning: 'struct pkvm_sgl=
ist_page' declared inside parameter list will not be visible outside of thi=
s definition or declaration
    1492 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglis=
t, size_t nr_pages)
         |                                          ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1492:5: error: conflicting types f=
or '__pkvm_host_donate_sglist_hyp'; have 'int(struct pkvm_sglist_page *, si=
ze_t)' {aka 'int(struct pkvm_sglist_page *, long unsigned int)'}
    1492 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglis=
t, size_t nr_pages)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:5: note: previous decla=
ration of '__pkvm_host_donate_sglist_hyp' with type 'int(struct pkvm_sglist=
_page *, size_t)' {aka 'int(struct pkvm_sglist_page *, long unsigned int)'}
      48 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglis=
t, size_t nr_pages);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from arch/arm64/include/asm/processor.h:35,
                    from include/linux/sched.h:13,
                    from include/linux/resume_user_mode.h:6,
                    from include/linux/entry-virt.h:6,
                    from include/linux/kvm_host.h:5,
                    from arch/arm64/kvm/hyp/nvhe/mem_protect.c:7:
   arch/arm64/kvm/hyp/nvhe/mem_protect.c: In function '__pkvm_host_donate_s=
glist_hyp':
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1500:76: error: invalid applicatio=
n of 'sizeof' to incomplete type 'struct pkvm_sglist_page'
    1500 |         WARN_ON(__hyp_check_page_state_range((u64)sglist, nr_pag=
es * sizeof(*sglist),
         |                                                                 =
           ^
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on =3D !!(condition);                    =
          \
         |                                ^~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1508:27: error: invalid use of und=
efined type 'struct pkvm_sglist_page'
    1508 |                 if (sglist[p].order > max_order) {
         |                           ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1508:30: error: invalid use of und=
efined type 'struct pkvm_sglist_page'
    1508 |                 if (sglist[p].order > max_order) {
         |                              ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1512:43: error: invalid use of und=
efined type 'struct pkvm_sglist_page'
    1512 |                 size =3D PAGE_SIZE << sglist[p].order;
         |                                           ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1512:46: error: invalid use of und=
efined type 'struct pkvm_sglist_page'
    1512 |                 size =3D PAGE_SIZE << sglist[p].order;
         |                                              ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1514:47: error: invalid use of und=
efined type 'struct pkvm_sglist_page'
    1514 |                 if (!pfn_range_is_valid(sglist[p].pfn, size >> P=
AGE_SHIFT)) {
         |                                               ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1514:50: error: invalid use of und=
efined type 'struct pkvm_sglist_page'
    1514 |                 if (!pfn_range_is_valid(sglist[p].pfn, size >> P=
AGE_SHIFT)) {
         |                                                  ^
   In file included from arch/arm64/kvm/hyp/include/nvhe/gfp.h:7,
                    from arch/arm64/kvm/hyp/nvhe/mem_protect.c:18:
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1518:46: error: invalid use of und=
efined type 'struct pkvm_sglist_page'
    1518 |                 phys =3D hyp_pfn_to_phys(sglist[p].pfn);
         |                                              ^
   arch/arm64/kvm/hyp/include/nvhe/memory.h:80:49: note: in definition of m=
acro 'hyp_pfn_to_phys'
      80 | #define hyp_pfn_to_phys(pfn)    ((phys_addr_t)((pfn) << PAGE_SHI=
FT))
         |                                                 ^~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1518:49: error: invalid use of und=
efined type 'struct pkvm_sglist_page'
    1518 |                 phys =3D hyp_pfn_to_phys(sglist[p].pfn);
         |                                                 ^
   arch/arm64/kvm/hyp/include/nvhe/memory.h:80:49: note: in definition of m=
acro 'hyp_pfn_to_phys'
      80 | #define hyp_pfn_to_phys(pfn)    ((phys_addr_t)((pfn) << PAGE_SHI=
FT))
         |                                                 ^~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1530:50: error: invalid use of und=
efined type 'struct pkvm_sglist_page'
    1530 |                 size_t size =3D PAGE_SIZE << sglist[p].order;
         |                                                  ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1530:53: error: invalid use of und=
efined type 'struct pkvm_sglist_page'
    1530 |                 size_t size =3D PAGE_SIZE << sglist[p].order;
         |                                                     ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1531:50: error: invalid use of und=
efined type 'struct pkvm_sglist_page'
    1531 |                 u64 phys =3D hyp_pfn_to_phys(sglist[p].pfn);
         |                                                  ^
   arch/arm64/kvm/hyp/include/nvhe/memory.h:80:49: note: in definition of m=
acro 'hyp_pfn_to_phys'
      80 | #define hyp_pfn_to_phys(pfn)    ((phys_addr_t)((pfn) << PAGE_SHI=
FT))
         |                                                 ^~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1531:53: error: invalid use of und=
efined type 'struct pkvm_sglist_page'
    1531 |                 u64 phys =3D hyp_pfn_to_phys(sglist[p].pfn);
         |                                                     ^
   arch/arm64/kvm/hyp/include/nvhe/memory.h:80:49: note: in definition of m=
acro 'hyp_pfn_to_phys'
      80 | #define hyp_pfn_to_phys(pfn)    ((phys_addr_t)((pfn) << PAGE_SHI=
FT))
         |                                                 ^~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1543:62: error: invalid use of und=
efined type 'struct pkvm_sglist_page'
    1543 |                                 phys =3D hyp_pfn_to_phys(sglist[=
p].pfn);
         |                                                              ^
   arch/arm64/kvm/hyp/include/nvhe/memory.h:80:49: note: in definition of m=
acro 'hyp_pfn_to_phys'
      80 | #define hyp_pfn_to_phys(pfn)    ((phys_addr_t)((pfn) << PAGE_SHI=
FT))
         |                                                 ^~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1543:65: error: invalid use of und=
efined type 'struct pkvm_sglist_page'
    1543 |                                 phys =3D hyp_pfn_to_phys(sglist[=
p].pfn);
         |                                                                 ^
   arch/arm64/kvm/hyp/include/nvhe/memory.h:80:49: note: in definition of m=
acro 'hyp_pfn_to_phys'
      80 | #define hyp_pfn_to_phys(pfn)    ((phys_addr_t)((pfn) << PAGE_SHI=
FT))
         |                                                 ^~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1544:59: error: invalid use of und=
efined type 'struct pkvm_sglist_page'
    1544 |                                 size =3D PAGE_SIZE << sglist[p].=
order;
         |                                                           ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1544:62: error: invalid use of und=
efined type 'struct pkvm_sglist_page'
    1544 |                                 size =3D PAGE_SIZE << sglist[p].=
order;
         |                                                              ^
--
   In file included from arch/arm64/kvm/hyp/nvhe/pkvm.c:21:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:42: warning: 'struct pk=
vm_sglist_page' declared inside parameter list will not be visible outside =
of this definition or declaration
      48 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglis=
t, size_t nr_pages);
         |                                          ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/pkvm.c:23:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:6: warning: no previous pro=
totype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      41 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u6=
4 esr, u64 addr) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:6: warning: no previous pro=
totype for 'module_handle_host_smc' [-Wmissing-prototypes]
      42 | bool module_handle_host_smc(struct user_pt_regs *regs) { return =
false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: error: return type is an=
 incomplete type
      44 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct =
arm_smccc_1_2_regs *res,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: warning: no previous pro=
totype for 'module_handle_guest_smc' [-Wmissing-prototypes]
   arch/arm64/kvm/hyp/include/nvhe/modules.h: In function 'module_handle_gu=
est_smc':
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:47:16: error: 'return' with a =
value, in function returning void [-Wreturn-mismatch]
      47 |         return false;
         |                ^~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: note: declared here
      44 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct =
arm_smccc_1_2_regs *res,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/pkvm.c: In function 'module_handle_guest_trng_rn=
g':
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1869:15: error: implicit declaration of f=
unction 'module_get_guest_trng_rng'; did you mean 'module_handle_guest_trng=
_rng'? [-Wimplicit-function-declaration]
    1869 |         ret =3D module_get_guest_trng_rng(entropy, nbits);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
         |               module_handle_guest_trng_rng
   arch/arm64/kvm/hyp/nvhe/pkvm.c: In function 'module_handle_guest_trng':
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1888:16: error: implicit declaration of f=
unction 'module_get_guest_trng_uuid'; did you mean 'module_handle_guest_trn=
g_rng'? [-Wimplicit-function-declaration]
    1888 |         uuid =3D module_get_guest_trng_uuid();
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                module_handle_guest_trng_rng
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1888:14: error: assignment to 'const uuid=
_t *' from 'int' makes pointer from integer without a cast [-Wint-conversio=
n]
    1888 |         uuid =3D module_get_guest_trng_uuid();
         |              ^
   arch/arm64/kvm/hyp/nvhe/pkvm.c: In function 'kvm_handle_pvm_smc64':
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1931:35: error: storage size of 'handler_=
ret' isn't known
    1931 |         enum pkvm_smc_handler_ret handler_ret;
         |                                   ^~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:1949:21: error: invalid use of void expre=
ssion
    1949 |         handler_ret =3D module_handle_guest_smc(&regs, &res, vm-=
>kvm.arch.pkvm.handle);
         |                     ^
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1951:14: error: 'GUEST_SMC_HANDLED' undec=
lared (first use in this function)
    1951 |         case GUEST_SMC_HANDLED:
         |              ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1951:14: note: each undeclared identifier=
 is reported only once for each function it appears in
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1954:14: error: 'GUEST_SMC_NOT_HANDLED' u=
ndeclared (first use in this function)
    1954 |         case GUEST_SMC_NOT_HANDLED:
         |              ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1957:14: error: 'GUEST_SMC_NEED_TOPUP' un=
declared (first use in this function)
    1957 |         case GUEST_SMC_NEED_TOPUP:
         |              ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1931:35: warning: unused variable 'handle=
r_ret' [-Wunused-variable]
    1931 |         enum pkvm_smc_handler_ret handler_ret;
         |                                   ^~~~~~~~~~~
--
   In file included from arch/arm64/kvm/hyp/nvhe/mm.c:18:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:42: warning: 'struct pk=
vm_sglist_page' declared inside parameter list will not be visible outside =
of this definition or declaration
      48 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglis=
t, size_t nr_pages);
         |                                          ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/mm.c:20:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:6: warning: no previous pro=
totype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      41 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u6=
4 esr, u64 addr) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:6: warning: no previous pro=
totype for 'module_handle_host_smc' [-Wmissing-prototypes]
      42 | bool module_handle_host_smc(struct user_pt_regs *regs) { return =
false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: error: return type is an=
 incomplete type
      44 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct =
arm_smccc_1_2_regs *res,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: warning: no previous pro=
totype for 'module_handle_guest_smc' [-Wmissing-prototypes]
   arch/arm64/kvm/hyp/include/nvhe/modules.h: In function 'module_handle_gu=
est_smc':
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:47:16: error: 'return' with a =
value, in function returning void [-Wreturn-mismatch]
      47 |         return false;
         |                ^~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: note: declared here
      44 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct =
arm_smccc_1_2_regs *res,
         | ^~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/arm64/kvm/hyp/nvhe/psci-relay.c:15:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:42: warning: 'struct pk=
vm_sglist_page' declared inside parameter list will not be visible outside =
of this definition or declaration
      48 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglis=
t, size_t nr_pages);
         |                                          ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/psci-relay.c:17:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:6: warning: no previous pro=
totype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      41 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u6=
4 esr, u64 addr) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:6: warning: no previous pro=
totype for 'module_handle_host_smc' [-Wmissing-prototypes]
      42 | bool module_handle_host_smc(struct user_pt_regs *regs) { return =
false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: error: return type is an=
 incomplete type
      44 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct =
arm_smccc_1_2_regs *res,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: warning: no previous pro=
totype for 'module_handle_guest_smc' [-Wmissing-prototypes]
   arch/arm64/kvm/hyp/include/nvhe/modules.h: In function 'module_handle_gu=
est_smc':
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:47:16: error: 'return' with a =
value, in function returning void [-Wreturn-mismatch]
      47 |         return false;
         |                ^~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: note: declared here
      44 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct =
arm_smccc_1_2_regs *res,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: At top level:
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:30:58: error: parameter 1 ('notif')=
 has incomplete type
      30 | static void pkvm_psci_notify(enum pkvm_psci_notification notif, =
struct kvm_cpu_context *host_ctxt)
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:30:13: error: function declaration =
isn't a prototype [-Werror=3Dstrict-prototypes]
      30 | static void pkvm_psci_notify(enum pkvm_psci_notification notif, =
struct kvm_cpu_context *host_ctxt)
         |             ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: In function 'pkvm_psci_notify':
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:33:36: error: type of formal parame=
ter 1 is incomplete
      33 |                 pkvm_psci_notifier(notif, &host_ctxt->regs);
         |                                    ^~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: In function 'psci_cpu_suspend':
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:192:26: error: 'PKVM_PSCI_CPU_SUSPE=
ND' undeclared (first use in this function); did you mean 'KVM_PSCI_FN_CPU_=
SUSPEND'?
     192 |         pkvm_psci_notify(PKVM_PSCI_CPU_SUSPEND, host_ctxt);
         |                          ^~~~~~~~~~~~~~~~~~~~~
         |                          KVM_PSCI_FN_CPU_SUSPEND
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:192:26: note: each undeclared ident=
ifier is reported only once for each function it appears in
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: In function 'psci_system_suspend':
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:223:26: error: 'PKVM_PSCI_SYSTEM_SU=
SPEND' undeclared (first use in this function); did you mean 'KVM_PSCI_FN_C=
PU_SUSPEND'?
     223 |         pkvm_psci_notify(PKVM_PSCI_SYSTEM_SUSPEND, host_ctxt);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
         |                          KVM_PSCI_FN_CPU_SUSPEND
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: In function '__kvm_host_psci_cpu_e=
ntry':
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:254:26: error: 'PKVM_PSCI_CPU_ENTRY=
' undeclared (first use in this function)
     254 |         pkvm_psci_notify(PKVM_PSCI_CPU_ENTRY, host_ctxt);
         |                          ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:24:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:42: warning: 'struct pk=
vm_sglist_page' declared inside parameter list will not be visible outside =
of this definition or declaration
      48 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglis=
t, size_t nr_pages);
         |                                          ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:25:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:6: warning: no previous pro=
totype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      41 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u6=
4 esr, u64 addr) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:6: warning: no previous pro=
totype for 'module_handle_host_smc' [-Wmissing-prototypes]
      42 | bool module_handle_host_smc(struct user_pt_regs *regs) { return =
false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: error: return type is an=
 incomplete type
      44 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct =
arm_smccc_1_2_regs *res,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: warning: no previous pro=
totype for 'module_handle_guest_smc' [-Wmissing-prototypes]
   arch/arm64/kvm/hyp/include/nvhe/modules.h: In function 'module_handle_gu=
est_smc':
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:47:16: error: 'return' with a =
value, in function returning void [-Wreturn-mismatch]
      47 |         return false;
         |                ^~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: note: declared here
      44 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct =
arm_smccc_1_2_regs *res,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c: At top level:
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:43: warning: initialized field ov=
erwritten [-Woverride-init]
     463 |         [ESR_ELx_EC_WFx]                =3D handle_pvm_entry_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:43: note: (near initialization fo=
r 'entry_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:464:43: warning: initialized field ov=
erwritten [-Woverride-init]
     464 |         [ESR_ELx_EC_HVC64]              =3D handle_pvm_entry_hvc=
64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:464:43: note: (near initialization fo=
r 'entry_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:465:43: warning: initialized field ov=
erwritten [-Woverride-init]
     465 |         [ESR_ELx_EC_SYS64]              =3D handle_pvm_entry_sys=
64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:465:43: note: (near initialization fo=
r 'entry_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:466:43: warning: initialized field ov=
erwritten [-Woverride-init]
     466 |         [ESR_ELx_EC_IABT_LOW]           =3D handle_pvm_entry_iab=
t,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:466:43: note: (near initialization fo=
r 'entry_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:467:43: warning: initialized field ov=
erwritten [-Woverride-init]
     467 |         [ESR_ELx_EC_DABT_LOW]           =3D handle_pvm_entry_dab=
t,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:467:43: note: (near initialization fo=
r 'entry_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:472:43: warning: initialized field ov=
erwritten [-Woverride-init]
     472 |         [ESR_ELx_EC_WFx]                =3D handle_pvm_exit_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:472:43: note: (near initialization fo=
r 'exit_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:473:43: warning: initialized field ov=
erwritten [-Woverride-init]
     473 |         [ESR_ELx_EC_HVC64]              =3D handle_pvm_exit_hvc6=
4,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:473:43: note: (near initialization fo=
r 'exit_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:474:43: warning: initialized field ov=
erwritten [-Woverride-init]
     474 |         [ESR_ELx_EC_SYS64]              =3D handle_pvm_exit_sys6=
4,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:474:43: note: (near initialization fo=
r 'exit_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:475:43: warning: initialized field ov=
erwritten [-Woverride-init]
     475 |         [ESR_ELx_EC_IABT_LOW]           =3D handle_pvm_exit_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:475:43: note: (near initialization fo=
r 'exit_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:476:43: warning: initialized field ov=
erwritten [-Woverride-init]
     476 |         [ESR_ELx_EC_DABT_LOW]           =3D handle_pvm_exit_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:476:43: note: (near initialization fo=
r 'exit_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:485:43: warning: initialized field ov=
erwritten [-Woverride-init]
     485 |         [ESR_ELx_EC_IABT_LOW]           =3D handle_vm_exit_abt,
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:485:43: note: (near initialization fo=
r 'exit_hyp_vm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:486:43: warning: initialized field ov=
erwritten [-Woverride-init]
     486 |         [ESR_ELx_EC_DABT_LOW]           =3D handle_vm_exit_abt,
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:486:43: note: (near initialization fo=
r 'exit_hyp_vm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c: In function 'handle_host_hcall':
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:2023:39: error: passing argument 1 of=
 'handle_host_dynamic_hcall' from incompatible pointer type [-Wincompatible=
-pointer-types]
    2023 |         if (handle_host_dynamic_hcall(&host_ctxt->regs, id) =3D=
=3D HCALL_HANDLED)
         |                                       ^~~~~~~~~~~~~~~~
         |                                       |
         |                                       struct user_pt_regs *
   arch/arm64/kvm/hyp/include/nvhe/modules.h:36:51: note: expected 'struct =
kvm_cpu_context *' but argument is of type 'struct user_pt_regs *'
      36 | handle_host_dynamic_hcall(struct kvm_cpu_context *host_ctxt, int=
 id)
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~


vim +/return +47 arch/arm64/kvm/hyp/include/nvhe/modules.h

905de63a80084ee Vincent Donnefort  2023-11-09  18 =20
94d30106c7722f4 Quentin Perret     2022-10-06  19  #ifdef CONFIG_MODULES
07e87abe4be64a1 Vincent Donnefort  2024-09-24  20  int __pkvm_init_module(v=
oid *host_mod);
15d5bab7e86b00a Vincent Donnefort  2022-09-27  21  int __pkvm_register_hcal=
l(unsigned long hfn_hyp_va);
35b4aef425c3e60 Vincent Donnefort  2024-03-08  22  int handle_host_dynamic_=
hcall(struct user_pt_regs *regs, int id);
2968360a9bc2c1f Vincent Donnefort  2022-11-18  23  void __pkvm_close_module=
_registration(void);
c141eb26c339351 Vincent Donnefort  2024-12-06  24  bool module_handle_host_=
perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr);
30eefcc7af64a3a Vincent Donnefort  2025-01-14  25  bool module_handle_host_=
smc(struct user_pt_regs *regs);
489e4bb847d0800 Quentin Perret     2025-10-23  26  enum pkvm_smc_handler_ret
489e4bb847d0800 Quentin Perret     2025-10-23  27  module_handle_guest_smc(=
struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
2864d7152511a57 Nikita Ioffe       2025-05-12  28  			pkvm_handle_t handle);
eff36ac2fe9748d Bart=C5=82omiej Grzesik 2025-06-24  29  const uuid_t *modul=
e_get_guest_trng_uuid(void);
eff36ac2fe9748d Bart=C5=82omiej Grzesik 2025-06-24  30  u64 module_get_gues=
t_trng_rng(u64 *entropy, int nbits);
94d30106c7722f4 Quentin Perret     2022-10-06  31  #else
94d30106c7722f4 Quentin Perret     2022-10-06  32  static inline int __pkvm=
_init_module(void *module_init) { return -EOPNOTSUPP; }
15d5bab7e86b00a Vincent Donnefort  2022-09-27  33  static inline int
15d5bab7e86b00a Vincent Donnefort  2022-09-27  34  __pkvm_register_hcall(un=
signed long hfn_hyp_va) { return -EOPNOTSUPP; }
35b4aef425c3e60 Vincent Donnefort  2024-03-08  35  static inline int
35b4aef425c3e60 Vincent Donnefort  2024-03-08  36  handle_host_dynamic_hcal=
l(struct kvm_cpu_context *host_ctxt, int id)
15d5bab7e86b00a Vincent Donnefort  2022-09-27  37  {
15d5bab7e86b00a Vincent Donnefort  2022-09-27  38  	return HCALL_UNHANDLED;
15d5bab7e86b00a Vincent Donnefort  2022-09-27  39  }
2968360a9bc2c1f Vincent Donnefort  2022-11-18  40  static inline void __pkv=
m_close_module_registration(void) { }
c141eb26c339351 Vincent Donnefort  2024-12-06  41  bool module_handle_host_=
perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
30eefcc7af64a3a Vincent Donnefort  2025-01-14 @42  bool module_handle_host_=
smc(struct user_pt_regs *regs) { return false; }
489e4bb847d0800 Quentin Perret     2025-10-23  43  enum pkvm_smc_handler_ret
489e4bb847d0800 Quentin Perret     2025-10-23  44  module_handle_guest_smc(=
struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
2864d7152511a57 Nikita Ioffe       2025-05-12  45  			pkvm_handle_t handle)
2864d7152511a57 Nikita Ioffe       2025-05-12  46  {
2864d7152511a57 Nikita Ioffe       2025-05-12 @47  	return false;

:::::: The code at line 47 was first introduced by commit
:::::: 2864d7152511a57f4ffcf2636d4cc7c42d544c45 ANDROID: KVM: arm64: Add sm=
c64 trap handling for protected guests

:::::: TO: Nikita Ioffe <ioffe@google.com>
:::::: CC: Fuad Tabba <tabba@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
