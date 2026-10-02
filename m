Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4BE46982C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 10:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936704; cv=none; b=G5rwDc2CCWRkSv57MMx1sCxQeAjIYcnO/SiPZe5BPaQpbwqJLJ1RajuWSJehxeEDmZQ+y4jBlEPNniLbjye3M/GgHy7zEnuAopEQn7vvQxXfjXusAeWmK3omR7Dtcrv8CCizvTmP7uTgbCGzIBGQbpBUqL/kjXAK8i3BgKfe4GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936704; c=relaxed/simple;
	bh=XnpEhIDAQ1pEwT//b7hnveCyCr59uiMlVKWTfeySITk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U2ffT3RXi3HbSI7fhgYziLEsN5WCMmCkkGTddyhfxjIgrQd0ncPxBhJsDnYsiX4PxGSdWJCyZUsw6IXe/krNU2nmyflsRQq/b6s4oA+mPGsG7vVEchE628SX+0xuvKSM3tjqNhT8VzcY7ircg6sfjNQiuUa3BS1RBBwZr7xug7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UfDgdsJe; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UfDgdsJe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790936700; x=1822472700;
  h=date:from:to:cc:subject:message-id;
  bh=XnpEhIDAQ1pEwT//b7hnveCyCr59uiMlVKWTfeySITk=;
  b=UfDgdsJehijJ5xDjqPh7dNmFmU0brnLBowZ9wfJ7sbNet+61XzkYziy6
   Z2iNd5WxcHMC7QQLGCQ2P9s9SOcOzRFtllxcPksYDV18cdM7IWnM4iHeJ
   Qn2Oi/efIx1m6pfwESiyhX79PG3BzlTiX4xIH/MXXWZjswKwzlzUeK7pB
   LzY01hTdWbMALPVFbU9OZymPB3ZrDwqR8CluATC9rXaAYAgLn6kXznH0j
   KYR/1jKL08xw0K6x3yfvqXsLIX0s7NlRHdqr6bwGUk2bW4WUj24OK+wNj
   8weexiMxnnkOs18Qqhspgo53cHkJx1emmhczfRcQ5XCRyzBbpRtE5fGgb
   Q==;
X-CSE-ConnectionGUID: Qz1H0s72SNOOBqTZVH5Ngw==
X-CSE-MsgGUID: iCXTZgkjQTyrMbBNCQZ9qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="102376319"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="102376319"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 03:24:57 -0700
X-CSE-ConnectionGUID: Fdu6FS/AQ1y6L0FouC5T0A==
X-CSE-MsgGUID: RJZizC3TT1iuaDxIkZb/vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="275772672"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Oct 2026 03:24:56 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCaRh-00000000SvY-0g5s;
	Fri, 02 Oct 2026 10:24:53 +0000
Date: Fri, 02 Oct 2026 18:24:25 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v6 58/79]
 arch/riscv/kernel/hw_breakpoint.c:39:16: error: storage size of 'ret' isn't
 known
Message-ID: <202610021857.g1LVDkN4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v6
head:   699de4c95a417e4c81644a91131ceb23bf0519a6
commit: 2036aec3aee69e374d22b8136e8cf887eee2d2fa [58/79] riscv: Introduce support for hardware break/watchpoints
config: riscv-randconfig-1000-20261002 (https://download.01.org/0day-ci/archive/20261002/202610021857.g1LVDkN4-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021857.g1LVDkN4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610021857.g1LVDkN4-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/riscv/kernel/hw_breakpoint.c:17:
   arch/riscv/include/asm/sbi.h:801:5: warning: no previous prototype for 'sbi_mpxy_read_attrs' [-Wmissing-prototypes]
     801 | int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
         |     ^~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/sbi.h:807:5: warning: no previous prototype for 'sbi_mpxy_write_attrs' [-Wmissing-prototypes]
     807 | int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
         |     ^~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/sbi.h:813:5: warning: no previous prototype for 'sbi_mpxy_send_message_with_resp' [-Wmissing-prototypes]
     813 | int sbi_mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/sbi.h:821:5: warning: no previous prototype for 'sbi_mpxy_send_message_without_resp' [-Wmissing-prototypes]
     821 | int sbi_mpxy_send_message_without_resp(u32 channel_id, u32 msg_id,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/sbi.h:828:18: warning: 'struct sbi_mpxy_notification_data' declared inside parameter list will not be visible outside of this definition or declaration
     828 |           struct sbi_mpxy_notification_data *notif_data,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/sbi.h:827:5: warning: no previous prototype for 'sbi_mpxy_get_notifications' [-Wmissing-prototypes]
     827 | int sbi_mpxy_get_notifications(u32 channel_id,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_smp_setup_sbi_shmem':
>> arch/riscv/kernel/hw_breakpoint.c:39:16: error: storage size of 'ret' isn't known
      39 |  struct sbiret ret;
         |                ^~~
   In file included from include/asm-generic/percpu.h:9,
                    from ./arch/riscv/include/generated/asm/percpu.h:1,
                    from include/linux/alloc_tag.h:12,
                    from include/linux/percpu.h:5,
                    from include/asm-generic/local64.h:5,
                    from ./arch/riscv/include/generated/asm/local64.h:1,
                    from include/linux/perf_event.h:26,
                    from include/linux/hw_breakpoint.h:5,
                    from arch/riscv/kernel/hw_breakpoint.c:8:
>> include/linux/percpu-defs.h:216:52: error: invalid use of undefined type 'union sbi_dbtr_shmem_entry'
     216 |  const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL; \
         |                                                    ^
   include/linux/percpu-defs.h:234:2: note: in expansion of macro '__verify_pcpu_ptr'
     234 |  __verify_pcpu_ptr(ptr);      \
         |  ^~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:41:15: note: in expansion of macro 'per_cpu_ptr'
      41 |  dbtr_shmem = per_cpu_ptr(sbi_dbtr_shmem, cpu);
         |               ^~~~~~~~~~~
   In file included from include/linux/compiler_types.h:173,
                    from <command-line>:
>> include/linux/percpu-defs.h:221:17: error: dereferencing pointer to incomplete type 'union sbi_dbtr_shmem_entry'
     221 |  (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
         |                 ^~~~~~
   include/linux/compiler-gcc.h:34:34: note: in definition of macro 'RELOC_HIDE'
      34 |  __asm__ ("" : "=r"(__ptr) : "0"(ptr));    \
         |                                  ^~~
   include/linux/percpu-defs.h:221:3: note: in expansion of macro 'TYPEOF_UNQUAL'
     221 |  (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
         |   ^~~~~~~~~~~~~
   include/linux/percpu-defs.h:230:13: note: in expansion of macro 'PERCPU_PTR'
     230 |  RELOC_HIDE(PERCPU_PTR(__p), (__offset))
         |             ^~~~~~~~~~
   include/linux/percpu-defs.h:235:2: note: in expansion of macro 'SHIFT_PERCPU_PTR'
     235 |  SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));   \
         |  ^~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:41:15: note: in expansion of macro 'per_cpu_ptr'
      41 |  dbtr_shmem = per_cpu_ptr(sbi_dbtr_shmem, cpu);
         |               ^~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:45:8: error: implicit declaration of function 'sbi_ecall' [-Werror=implicit-function-declaration]
      45 |  ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
         |        ^~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:45:18: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
      45 |  ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
         |                  ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:45:18: note: each undeclared identifier is reported only once for each function it appears in
>> arch/riscv/kernel/hw_breakpoint.c:45:32: error: 'SBI_EXT_DBTR_SETUP_SHMEM' undeclared (first use in this function)
      45 |  ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:51:10: error: implicit declaration of function 'sbi_err_map_linux_errno' [-Werror=implicit-function-declaration]
      51 |   return sbi_err_map_linux_errno(ret.error);
         |          ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:39:16: warning: unused variable 'ret' [-Wunused-variable]
      39 |  struct sbiret ret;
         |                ^~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_smp_teardown_sbi_shmem':
   arch/riscv/kernel/hw_breakpoint.c:61:16: error: storage size of 'ret' isn't known
      61 |  struct sbiret ret;
         |                ^~~
   arch/riscv/kernel/hw_breakpoint.c:64:18: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
      64 |  ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
         |                  ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:64:32: error: 'SBI_EXT_DBTR_SETUP_SHMEM' undeclared (first use in this function)
      64 |  ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:65:4: error: 'SBI_SHMEM_DISABLE' undeclared (first use in this function); did you mean 'PR_SPEC_DISABLE'?
      65 |    SBI_SHMEM_DISABLE, SBI_SHMEM_DISABLE, 0, 0, 0, 0);
         |    ^~~~~~~~~~~~~~~~~
         |    PR_SPEC_DISABLE
   arch/riscv/kernel/hw_breakpoint.c:61:16: warning: unused variable 'ret' [-Wunused-variable]
      61 |  struct sbiret ret;
         |                ^~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'init_sbi_dbtr':
   arch/riscv/kernel/hw_breakpoint.c:79:16: error: storage size of 'ret' isn't known
      79 |  struct sbiret ret;
         |                ^~~
>> arch/riscv/kernel/hw_breakpoint.c:81:6: error: implicit declaration of function 'sbi_probe_extension' [-Werror=implicit-function-declaration]
      81 |  if (sbi_probe_extension(SBI_EXT_DBTR) <= 0) {
         |      ^~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:81:26: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
      81 |  if (sbi_probe_extension(SBI_EXT_DBTR) <= 0) {
         |                          ^~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:87:32: error: 'SBI_EXT_DBTR_NUM_TRIGGERS' undeclared (first use in this function)
      87 |  ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:79:16: warning: unused variable 'ret' [-Wunused-variable]
      79 |  struct sbiret ret;
         |                ^~~
   In file included from include/asm-generic/percpu.h:9,
                    from ./arch/riscv/include/generated/asm/percpu.h:1,
                    from include/linux/alloc_tag.h:12,
                    from include/linux/percpu.h:5,
                    from include/asm-generic/local64.h:5,
                    from ./arch/riscv/include/generated/asm/local64.h:1,
                    from include/linux/perf_event.h:26,
                    from include/linux/hw_breakpoint.h:5,
                    from arch/riscv/kernel/hw_breakpoint.c:8:
   arch/riscv/kernel/hw_breakpoint.c: In function 'mc6_read_and_clear_hit':
>> include/linux/percpu-defs.h:216:52: error: invalid use of undefined type 'union sbi_dbtr_shmem_entry'
     216 |  const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL; \
         |                                                    ^
   include/linux/percpu-defs.h:240:2: note: in expansion of macro '__verify_pcpu_ptr'
     240 |  __verify_pcpu_ptr(ptr);      \
         |  ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:251:27: note: in expansion of macro 'raw_cpu_ptr'
     251 | #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
         |                           ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:358:38: note: in expansion of macro 'this_cpu_ptr'
     358 |  union sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(sbi_dbtr_shmem);
         |                                      ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:361:16: error: storage size of 'ret' isn't known
     361 |  struct sbiret ret;
         |                ^~~
   arch/riscv/kernel/hw_breakpoint.c:367:18: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     367 |  ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_READ, idx, 1, 0, 0, 0, 0);
         |                  ^~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:367:32: error: 'SBI_EXT_DBTR_TRIG_READ' undeclared (first use in this function)
     367 |  ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_READ, idx, 1, 0, 0, 0, 0);
         |                                ^~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:384:6: error: dereferencing pointer to incomplete type 'struct sbi_dbtr_data_msg'
     384 |  xmit->tdata1 = cpu_to_le(tdata1);
         |      ^~
>> arch/riscv/kernel/hw_breakpoint.c:388:32: error: 'SBI_EXT_DBTR_TRIG_UPDATE' undeclared (first use in this function)
     388 |  ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UPDATE, idx, 1, 0, 0, 0, 0);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:361:16: warning: unused variable 'ret' [-Wunused-variable]
     361 |  struct sbiret ret;
         |                ^~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'hw_breakpoint_handler':
>> arch/riscv/kernel/hw_breakpoint.c:455:19: error: storage size of 'sret' isn't known
     455 |     struct sbiret sret;
         |                   ^~~~
   In file included from include/asm-generic/percpu.h:9,
                    from ./arch/riscv/include/generated/asm/percpu.h:1,
                    from include/linux/alloc_tag.h:12,
                    from include/linux/percpu.h:5,
                    from include/asm-generic/local64.h:5,
                    from ./arch/riscv/include/generated/asm/local64.h:1,
                    from include/linux/perf_event.h:26,
                    from include/linux/hw_breakpoint.h:5,
                    from arch/riscv/kernel/hw_breakpoint.c:8:
>> include/linux/percpu-defs.h:216:52: error: invalid use of undefined type 'union sbi_dbtr_shmem_entry'
     216 |  const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL; \
         |                                                    ^
   include/linux/percpu-defs.h:240:2: note: in expansion of macro '__verify_pcpu_ptr'
     240 |  __verify_pcpu_ptr(ptr);      \
         |  ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:251:27: note: in expansion of macro 'raw_cpu_ptr'
     251 | #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
         |                           ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:460:13: note: in expansion of macro 'this_cpu_ptr'
     460 |     shmem = this_cpu_ptr(sbi_dbtr_shmem);
         |             ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:461:22: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     461 |     sret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_READ,
         |                      ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:461:36: error: 'SBI_EXT_DBTR_TRIG_READ' undeclared (first use in this function)
     461 |     sret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_READ,
         |                                    ^~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:455:19: warning: unused variable 'sret' [-Wunused-variable]
     455 |     struct sbiret sret;
         |                   ^~~~
   In file included from include/asm-generic/percpu.h:9,
                    from ./arch/riscv/include/generated/asm/percpu.h:1,
                    from include/linux/alloc_tag.h:12,
                    from include/linux/percpu.h:5,
                    from include/asm-generic/local64.h:5,
                    from ./arch/riscv/include/generated/asm/local64.h:1,
                    from include/linux/perf_event.h:26,
                    from include/linux/hw_breakpoint.h:5,
                    from arch/riscv/kernel/hw_breakpoint.c:8:
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_install_hw_breakpoint':
>> include/linux/percpu-defs.h:216:52: error: invalid use of undefined type 'union sbi_dbtr_shmem_entry'
     216 |  const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL; \
         |                                                    ^
   include/linux/percpu-defs.h:240:2: note: in expansion of macro '__verify_pcpu_ptr'
     240 |  __verify_pcpu_ptr(ptr);      \
         |  ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:251:27: note: in expansion of macro 'raw_cpu_ptr'
     251 | #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
         |                           ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:509:38: note: in expansion of macro 'this_cpu_ptr'
     509 |  union sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(sbi_dbtr_shmem);
         |                                      ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:514:16: error: storage size of 'ret' isn't known
     514 |  struct sbiret ret;
         |                ^~~
   arch/riscv/kernel/hw_breakpoint.c:522:6: error: dereferencing pointer to incomplete type 'struct sbi_dbtr_data_msg'
     522 |  xmit->tdata1 = cpu_to_le(bp->tdata1);
         |      ^~
   arch/riscv/kernel/hw_breakpoint.c:526:18: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     526 |  ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_INSTALL,
         |                  ^~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:526:32: error: 'SBI_EXT_DBTR_TRIG_INSTALL' undeclared (first use in this function)
     526 |  ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_INSTALL,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/byteorder/little_endian.h:5,
                    from arch/riscv/include/uapi/asm/byteorder.h:10,
                    from include/uapi/linux/perf_event.h:20,
                    from include/linux/perf_event.h:17,
                    from include/linux/hw_breakpoint.h:5,
                    from arch/riscv/kernel/hw_breakpoint.c:8:
   arch/riscv/kernel/hw_breakpoint.c:535:22: error: dereferencing pointer to incomplete type 'struct sbi_dbtr_id_msg'
     535 |  idx = le_to_cpu(recv->idx);
         |                      ^~
   include/uapi/linux/byteorder/little_endian.h:35:51: note: in definition of macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   arch/riscv/include/asm/hw_breakpoint.h:23:19: note: in expansion of macro 'le32_to_cpu'
      23 | #define le_to_cpu le32_to_cpu
         |                   ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:535:8: note: in expansion of macro 'le_to_cpu'
     535 |  idx = le_to_cpu(recv->idx);
         |        ^~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:514:16: warning: unused variable 'ret' [-Wunused-variable]
     514 |  struct sbiret ret;
         |                ^~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_uninstall_hw_breakpoint':
   arch/riscv/kernel/hw_breakpoint.c:561:16: error: storage size of 'ret' isn't known
     561 |  struct sbiret ret;
         |                ^~~
   arch/riscv/kernel/hw_breakpoint.c:581:18: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     581 |  ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UNINSTALL,
         |                  ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:581:32: error: 'SBI_EXT_DBTR_TRIG_UNINSTALL' undeclared (first use in this function)
     581 |  ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UNINSTALL,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:561:16: warning: unused variable 'ret' [-Wunused-variable]
     561 |  struct sbiret ret;
         |                ^~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_enable_hw_breakpoint':
   arch/riscv/kernel/hw_breakpoint.c:596:16: error: storage size of 'ret' isn't known
     596 |  struct sbiret ret;
         |                ^~~
   arch/riscv/kernel/hw_breakpoint.c:615:18: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     615 |  ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_ENABLE,
         |                  ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:615:32: error: 'SBI_EXT_DBTR_TRIG_ENABLE' undeclared (first use in this function)
     615 |  ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_ENABLE,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:596:16: warning: unused variable 'ret' [-Wunused-variable]
     596 |  struct sbiret ret;
         |                ^~~
   In file included from include/asm-generic/percpu.h:9,
                    from ./arch/riscv/include/generated/asm/percpu.h:1,
                    from include/linux/alloc_tag.h:12,
                    from include/linux/percpu.h:5,
                    from include/asm-generic/local64.h:5,
                    from ./arch/riscv/include/generated/asm/local64.h:1,
                    from include/linux/perf_event.h:26,
                    from include/linux/hw_breakpoint.h:5,
                    from arch/riscv/kernel/hw_breakpoint.c:8:
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_update_hw_breakpoint':
   include/linux/percpu-defs.h:216:52: error: invalid use of undefined type 'union sbi_dbtr_shmem_entry'
     216 |  const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL; \
         |                                                    ^
   include/linux/percpu-defs.h:240:2: note: in expansion of macro '__verify_pcpu_ptr'
     240 |  __verify_pcpu_ptr(ptr);      \
         |  ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:251:27: note: in expansion of macro 'raw_cpu_ptr'
     251 | #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
         |                           ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:632:38: note: in expansion of macro 'this_cpu_ptr'
     632 |  union sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(sbi_dbtr_shmem);
         |                                      ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:636:16: error: storage size of 'ret' isn't known
     636 |  struct sbiret ret;
         |                ^~~
   arch/riscv/kernel/hw_breakpoint.c:656:4: error: dereferencing pointer to incomplete type 'struct sbi_dbtr_id_msg'
     656 |  id->idx = cpu_to_le(i);
         |    ^~
   arch/riscv/kernel/hw_breakpoint.c:657:6: error: dereferencing pointer to incomplete type 'struct sbi_dbtr_data_msg'
     657 |  xmit->tdata1 = cpu_to_le(bp->tdata1);
         |      ^~
   arch/riscv/kernel/hw_breakpoint.c:661:18: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     661 |  ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UPDATE,
         |                  ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:661:32: error: 'SBI_EXT_DBTR_TRIG_UPDATE' undeclared (first use in this function)
     661 |  ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UPDATE,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:636:16: warning: unused variable 'ret' [-Wunused-variable]
     636 |  struct sbiret ret;
         |                ^~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_disable_hw_breakpoint':
   arch/riscv/kernel/hw_breakpoint.c:674:16: error: storage size of 'ret' isn't known
     674 |  struct sbiret ret;
         |                ^~~
   arch/riscv/kernel/hw_breakpoint.c:689:18: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     689 |  ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_DISABLE,
         |                  ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:689:32: error: 'SBI_EXT_DBTR_TRIG_DISABLE' undeclared (first use in this function)
     689 |  ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_DISABLE,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:674:16: warning: unused variable 'ret' [-Wunused-variable]


vim +39 arch/riscv/kernel/hw_breakpoint.c

    34	
    35	static int arch_smp_setup_sbi_shmem(unsigned int cpu)
    36	{
    37		union sbi_dbtr_shmem_entry *dbtr_shmem;
    38		phys_addr_t shmem_pa;
  > 39		struct sbiret ret;
    40	
    41		dbtr_shmem = per_cpu_ptr(sbi_dbtr_shmem, cpu);
    42	
    43		shmem_pa = per_cpu_ptr_to_phys(dbtr_shmem);
    44	
  > 45		ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
    46				MEM_LO(shmem_pa), MEM_HI(shmem_pa), 0, 0, 0, 0);
    47	
    48		if (ret.error) {
    49			pr_warn("%s: failed to setup shared memory. error: %ld\n",
    50				__func__, ret.error);
  > 51			return sbi_err_map_linux_errno(ret.error);
    52		}
    53	
    54		pr_info("CPU %d: HW Breakpoint shared memory registered.\n", cpu);
    55	
    56		return 0;
    57	}
    58	
    59	static int arch_smp_teardown_sbi_shmem(unsigned int cpu)
    60	{
    61		struct sbiret ret;
    62	
    63		/* Disable shared memory */
    64		ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
  > 65				SBI_SHMEM_DISABLE, SBI_SHMEM_DISABLE, 0, 0, 0, 0);
    66	
    67		if (ret.error)
    68			pr_warn("%s: failed to disable shared memory. error: %ld\n",
    69				__func__, ret.error);
    70		else
    71			pr_info("CPU %d: HW Breakpoint shared memory disabled.\n", cpu);
    72	
    73		return 0;
    74	}
    75	
    76	static void init_sbi_dbtr(void)
    77	{
    78		unsigned long tdata1;
    79		struct sbiret ret;
    80	
  > 81		if (sbi_probe_extension(SBI_EXT_DBTR) <= 0) {
    82			pr_warn("SBI_EXT_DBTR is not supported\n");
    83			dbtr_total_num = 0;
    84			goto done;
    85		}
    86	
  > 87		ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
    88				0, 0, 0, 0, 0, 0);
    89		if (ret.error) {
    90			pr_warn("Failed to detect triggers\n");
    91			dbtr_total_num = 0;
    92			goto done;
    93		}
    94	
    95		tdata1 = 0;
    96		tdata1 = RISCV_DBTR_SET_TDATA1_TYPE(tdata1, RISCV_DBTR_TRIG_MCONTROL6);
    97	
    98		ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
    99				tdata1, 0, 0, 0, 0, 0);
   100		if (ret.error) {
   101			pr_warn("Failed to detect mcontrol6 triggers\n");
   102		} else if (!ret.value) {
   103			pr_warn("Type 6 triggers not available\n");
   104		} else {
   105			dbtr_total_num = min_t(unsigned long, ret.value,
   106					       RISCV_HW_BP_NUM_MAX);
   107			dbtr_type = RISCV_DBTR_TRIG_MCONTROL6;
   108			pr_warn("Mcontrol6 trigger available.\n");
   109			goto done;
   110		}
   111	
   112		/* fallback to type 2 triggers if type 6 is not available */
   113	
   114		tdata1 = 0;
   115		tdata1 = RISCV_DBTR_SET_TDATA1_TYPE(tdata1, RISCV_DBTR_TRIG_MCONTROL);
   116	
   117		ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
   118				tdata1, 0, 0, 0, 0, 0);
   119		if (ret.error) {
   120			pr_warn("Failed to detect mcontrol triggers\n");
   121		} else if (!ret.value) {
   122			pr_warn("Type 2 triggers not available\n");
   123		} else {
   124			dbtr_total_num = min_t(unsigned long, ret.value,
   125					       RISCV_HW_BP_NUM_MAX);
   126			dbtr_type = RISCV_DBTR_TRIG_MCONTROL;
   127			goto done;
   128		}
   129	
   130	done:
   131		dbtr_init = 1;
   132	}
   133	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
