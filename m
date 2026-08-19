Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700EE3CB8E3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 05:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787118346; cv=none; b=C4CWQvv0O/edwReyXd7/0611EknqFt1CJDjACOKjJg3VG8X9913DbH+uyZQOU5Gw/wbyVFDmCSpMpuSVqPvnwGEWDVWlhiu8PuOZ02xbFnoOGLzkgHRLaacDjUeN3jR+bnMIVQ5T9FKhzWONN5TXeGZGHT5M+mJ0WXpEB4npdHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787118346; c=relaxed/simple;
	bh=Y66T0EA6tWx3bCRrrZ23auWxlKOhremLyDR0ZAIPXcY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L7D9s1gh3Dju6I7nXP1KYD8hxxMX7NGtL4LgXBuc6vEfOkLFaIgdv41aJEKAon2fTrV2YhVGd3aTHGWXMi5qk8YbAUerk78wHWL/qIA3gE7jSEWMw//HX3t9WfLSpKHdHe+SetCfcvB+jpQlLpx8gNB6nXdLl2U9rGkcrr1E4OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xe+nxpNF; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xe+nxpNF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787118341; x=1818654341;
  h=date:from:to:cc:subject:message-id;
  bh=Y66T0EA6tWx3bCRrrZ23auWxlKOhremLyDR0ZAIPXcY=;
  b=Xe+nxpNFXvSatKVkcai0xzTgpULiibtEHWYp54QiQ8Vvn3KyMOgY7kim
   VbiQYj3TV86MT0oeBItZSJEXn3+onIAJzbwMHW3tDyJSjtZOb77T2hO3G
   RZdefDKSsQ0gXQU2z9P2sdNCci7NFTaK0Tx23ECwJo6+UNYrFTSLRt0pv
   5hXUnImK6z+eeACxglaOZ3/gpjUgNQlIxbsULDs/K51ZkpBgP98Ns5B0v
   f212YIuqtIm0vjKjKLqcwjewoOwV2uYIuk6je8UcgHdlC4MhsSGdHHdzU
   8AjH3k6daYJY3nFWrpTBjynYk32EJI6WKSQqSPf4lLW3WiKNq+jIg/JK+
   w==;
X-CSE-ConnectionGUID: SSNZNNGRTNW9FPB5Dck66g==
X-CSE-MsgGUID: iiZa8Ky+QwqljN1L6H+JXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87536647"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="87536647"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 22:45:36 -0700
X-CSE-ConnectionGUID: WtvGdaVhTzOyqvacMXB6zQ==
X-CSE-MsgGUID: XcsRY9T+TVijkiHAgrT/YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="288950364"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Aug 2026 22:45:33 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwZ7D-00000000euk-1Ofh;
	Wed, 19 Aug 2026 05:45:31 +0000
Date: Wed, 19 Aug 2026 13:44:52 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v5 90/108]
 arch/riscv/kernel/hw_breakpoint.c:39:23: error: storage size of 'ret' isn't
 known
Message-ID: <202608191320.mIv4ytKv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v5
head:   e58ea3f194d326370813c549a76ecdfa211a4768
commit: 0025d27a4993089614a6fbb077d85987380e4c0c [90/108] riscv: Introduce support for hardware break/watchpoints
config: riscv-randconfig-r073-20260819 (https://download.01.org/0day-ci/archive/20260819/202608191320.mIv4ytKv-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191320.mIv4ytKv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608191320.mIv4ytKv-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/riscv/kernel/hw_breakpoint.c:17:
   arch/riscv/include/asm/sbi.h:799:5: warning: no previous prototype for 'sbi_mpxy_read_attrs' [-Wmissing-prototypes]
     799 | int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
         |     ^~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/sbi.h:805:5: warning: no previous prototype for 'sbi_mpxy_write_attrs' [-Wmissing-prototypes]
     805 | int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
         |     ^~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/sbi.h:811:5: warning: no previous prototype for 'sbi_mpxy_send_message_with_resp' [-Wmissing-prototypes]
     811 | int sbi_mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/sbi.h:819:5: warning: no previous prototype for 'sbi_mpxy_send_message_without_resp' [-Wmissing-prototypes]
     819 | int sbi_mpxy_send_message_without_resp(u32 channel_id, u32 msg_id,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/sbi.h:826:39: warning: 'struct sbi_mpxy_notification_data' declared inside parameter list will not be visible outside of this definition or declaration
     826 |                                struct sbi_mpxy_notification_data *notif_data,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/sbi.h:825:5: warning: no previous prototype for 'sbi_mpxy_get_notifications' [-Wmissing-prototypes]
     825 | int sbi_mpxy_get_notifications(u32 channel_id,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_smp_setup_sbi_shmem':
>> arch/riscv/kernel/hw_breakpoint.c:39:23: error: storage size of 'ret' isn't known
      39 |         struct sbiret ret;
         |                       ^~~
   In file included from include/asm-generic/percpu.h:9,
                    from ./arch/riscv/include/generated/asm/percpu.h:1,
                    from include/linux/alloc_tag.h:12,
                    from include/linux/percpu.h:5,
                    from include/asm-generic/local64.h:5,
                    from ./arch/riscv/include/generated/asm/local64.h:1,
                    from include/linux/perf_event.h:26,
                    from include/linux/hw_breakpoint.h:5,
                    from arch/riscv/kernel/hw_breakpoint.c:8:
>> include/linux/percpu-defs.h:221:59: error: invalid use of undefined type 'union sbi_dbtr_shmem_entry'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                           ^
   include/linux/percpu-defs.h:264:9: note: in expansion of macro '__verify_pcpu_ptr'
     264 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:41:22: note: in expansion of macro 'per_cpu_ptr'
      41 |         dbtr_shmem = per_cpu_ptr(sbi_dbtr_shmem, cpu);
         |                      ^~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:49:15: error: implicit declaration of function 'sbi_ecall' [-Wimplicit-function-declaration]
      49 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
         |               ^~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:49:25: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
      49 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
         |                         ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:49:25: note: each undeclared identifier is reported only once for each function it appears in
>> arch/riscv/kernel/hw_breakpoint.c:49:39: error: 'SBI_EXT_DBTR_SETUP_SHMEM' undeclared (first use in this function)
      49 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:55:24: error: implicit declaration of function 'sbi_err_map_linux_errno' [-Wimplicit-function-declaration]
      55 |                 return sbi_err_map_linux_errno(ret.error);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:39:23: warning: unused variable 'ret' [-Wunused-variable]
      39 |         struct sbiret ret;
         |                       ^~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_smp_teardown_sbi_shmem':
   arch/riscv/kernel/hw_breakpoint.c:65:23: error: storage size of 'ret' isn't known
      65 |         struct sbiret ret;
         |                       ^~~
   arch/riscv/kernel/hw_breakpoint.c:68:25: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
      68 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
         |                         ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:68:39: error: 'SBI_EXT_DBTR_SETUP_SHMEM' undeclared (first use in this function)
      68 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:69:25: error: 'SBI_SHMEM_DISABLE' undeclared (first use in this function); did you mean 'PR_SPEC_DISABLE'?
      69 |                         SBI_SHMEM_DISABLE, SBI_SHMEM_DISABLE, 0, 0, 0, 0);
         |                         ^~~~~~~~~~~~~~~~~
         |                         PR_SPEC_DISABLE
   arch/riscv/kernel/hw_breakpoint.c:65:23: warning: unused variable 'ret' [-Wunused-variable]
      65 |         struct sbiret ret;
         |                       ^~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'init_sbi_dbtr':
   arch/riscv/kernel/hw_breakpoint.c:83:23: error: storage size of 'ret' isn't known
      83 |         struct sbiret ret;
         |                       ^~~
>> arch/riscv/kernel/hw_breakpoint.c:85:13: error: implicit declaration of function 'sbi_probe_extension' [-Wimplicit-function-declaration]
      85 |         if (sbi_probe_extension(SBI_EXT_DBTR) <= 0) {
         |             ^~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:85:33: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
      85 |         if (sbi_probe_extension(SBI_EXT_DBTR) <= 0) {
         |                                 ^~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:91:39: error: 'SBI_EXT_DBTR_NUM_TRIGGERS' undeclared (first use in this function)
      91 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:83:23: warning: unused variable 'ret' [-Wunused-variable]
      83 |         struct sbiret ret;
         |                       ^~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'hw_breakpoint_handler':
>> arch/riscv/kernel/hw_breakpoint.c:379:39: error: storage size of 'sret' isn't known
     379 |                         struct sbiret sret;
         |                                       ^~~~
>> include/linux/percpu-defs.h:221:59: error: invalid use of undefined type 'union sbi_dbtr_shmem_entry'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                           ^
   include/linux/percpu-defs.h:264:9: note: in expansion of macro '__verify_pcpu_ptr'
     264 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:268:33: note: in expansion of macro 'per_cpu_ptr'
     268 | #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
         |                                 ^~~~~~~~~~~
   include/linux/percpu-defs.h:269:33: note: in expansion of macro 'raw_cpu_ptr'
     269 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
         |                                 ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:394:33: note: in expansion of macro 'this_cpu_ptr'
     394 |                         shmem = this_cpu_ptr(sbi_dbtr_shmem);
         |                                 ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:395:42: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     395 |                         sret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_READ,
         |                                          ^~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:395:56: error: 'SBI_EXT_DBTR_TRIG_READ' undeclared (first use in this function)
     395 |                         sret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_READ,
         |                                                        ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/byteorder/little_endian.h:5,
                    from arch/riscv/include/uapi/asm/byteorder.h:10,
                    from include/uapi/linux/perf_event.h:20,
                    from include/linux/perf_event.h:17:
>> arch/riscv/kernel/hw_breakpoint.c:398:57: error: invalid use of undefined type 'union sbi_dbtr_shmem_entry'
     398 |                                 tdata1 = le_to_cpu(shmem->data.tdata1);
         |                                                         ^~
   include/uapi/linux/byteorder/little_endian.h:35:51: note: in definition of macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   arch/riscv/include/asm/hw_breakpoint.h:23:19: note: in expansion of macro 'le32_to_cpu'
      23 | #define le_to_cpu le32_to_cpu
         |                   ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:398:42: note: in expansion of macro 'le_to_cpu'
     398 |                                 tdata1 = le_to_cpu(shmem->data.tdata1);
         |                                          ^~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:379:39: warning: unused variable 'sret' [-Wunused-variable]
     379 |                         struct sbiret sret;
         |                                       ^~~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_install_hw_breakpoint':
>> include/linux/percpu-defs.h:221:59: error: invalid use of undefined type 'union sbi_dbtr_shmem_entry'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                           ^
   include/linux/percpu-defs.h:264:9: note: in expansion of macro '__verify_pcpu_ptr'
     264 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:268:33: note: in expansion of macro 'per_cpu_ptr'
     268 | #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
         |                                 ^~~~~~~~~~~
   include/linux/percpu-defs.h:269:33: note: in expansion of macro 'raw_cpu_ptr'
     269 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
         |                                 ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:444:45: note: in expansion of macro 'this_cpu_ptr'
     444 |         union sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(sbi_dbtr_shmem);
         |                                             ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:449:23: error: storage size of 'ret' isn't known
     449 |         struct sbiret ret;
         |                       ^~~
   arch/riscv/kernel/hw_breakpoint.c:455:22: error: invalid use of undefined type 'union sbi_dbtr_shmem_entry'
     455 |         xmit = &shmem->data;
         |                      ^~
   arch/riscv/kernel/hw_breakpoint.c:456:22: error: invalid use of undefined type 'union sbi_dbtr_shmem_entry'
     456 |         recv = &shmem->id;
         |                      ^~
>> arch/riscv/kernel/hw_breakpoint.c:457:13: error: invalid use of undefined type 'struct sbi_dbtr_data_msg'
     457 |         xmit->tdata1 = cpu_to_le(bp->tdata1);
         |             ^~
   arch/riscv/kernel/hw_breakpoint.c:458:13: error: invalid use of undefined type 'struct sbi_dbtr_data_msg'
     458 |         xmit->tdata2 = cpu_to_le(bp->tdata2);
         |             ^~
   arch/riscv/kernel/hw_breakpoint.c:459:13: error: invalid use of undefined type 'struct sbi_dbtr_data_msg'
     459 |         xmit->tdata3 = cpu_to_le(bp->tdata3);
         |             ^~
   arch/riscv/kernel/hw_breakpoint.c:461:25: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     461 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_INSTALL,
         |                         ^~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:461:39: error: 'SBI_EXT_DBTR_TRIG_INSTALL' undeclared (first use in this function)
     461 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_INSTALL,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:470:29: error: invalid use of undefined type 'struct sbi_dbtr_id_msg'
     470 |         idx = le_to_cpu(recv->idx);
         |                             ^~
   include/uapi/linux/byteorder/little_endian.h:35:51: note: in definition of macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   arch/riscv/include/asm/hw_breakpoint.h:23:19: note: in expansion of macro 'le32_to_cpu'
      23 | #define le_to_cpu le32_to_cpu
         |                   ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:470:15: note: in expansion of macro 'le_to_cpu'
     470 |         idx = le_to_cpu(recv->idx);
         |               ^~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:449:23: warning: unused variable 'ret' [-Wunused-variable]
     449 |         struct sbiret ret;
         |                       ^~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_uninstall_hw_breakpoint':
   arch/riscv/kernel/hw_breakpoint.c:496:23: error: storage size of 'ret' isn't known
     496 |         struct sbiret ret;
         |                       ^~~
   arch/riscv/kernel/hw_breakpoint.c:516:25: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     516 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UNINSTALL,
         |                         ^~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:516:39: error: 'SBI_EXT_DBTR_TRIG_UNINSTALL' undeclared (first use in this function)
     516 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UNINSTALL,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:496:23: warning: unused variable 'ret' [-Wunused-variable]
     496 |         struct sbiret ret;
         |                       ^~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_enable_hw_breakpoint':
   arch/riscv/kernel/hw_breakpoint.c:531:23: error: storage size of 'ret' isn't known
     531 |         struct sbiret ret;
         |                       ^~~
   arch/riscv/kernel/hw_breakpoint.c:550:25: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     550 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_ENABLE,
         |                         ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:550:39: error: 'SBI_EXT_DBTR_TRIG_ENABLE' undeclared (first use in this function)
     550 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_ENABLE,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:531:23: warning: unused variable 'ret' [-Wunused-variable]
     531 |         struct sbiret ret;
         |                       ^~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_update_hw_breakpoint':
   include/linux/percpu-defs.h:221:59: error: invalid use of undefined type 'union sbi_dbtr_shmem_entry'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                           ^
   include/linux/percpu-defs.h:264:9: note: in expansion of macro '__verify_pcpu_ptr'
     264 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:268:33: note: in expansion of macro 'per_cpu_ptr'
     268 | #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
         |                                 ^~~~~~~~~~~
   include/linux/percpu-defs.h:269:33: note: in expansion of macro 'raw_cpu_ptr'
     269 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
         |                                 ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:567:45: note: in expansion of macro 'this_cpu_ptr'
     567 |         union sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(sbi_dbtr_shmem);
         |                                             ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:570:23: error: storage size of 'ret' isn't known
     570 |         struct sbiret ret;
         |                       ^~~
   arch/riscv/kernel/hw_breakpoint.c:588:22: error: invalid use of undefined type 'union sbi_dbtr_shmem_entry'
     588 |         xmit = &shmem->data;
         |                      ^~
   arch/riscv/kernel/hw_breakpoint.c:589:13: error: invalid use of undefined type 'struct sbi_dbtr_data_msg'
     589 |         xmit->tdata1 = cpu_to_le(bp->tdata1);
         |             ^~
   arch/riscv/kernel/hw_breakpoint.c:590:13: error: invalid use of undefined type 'struct sbi_dbtr_data_msg'
     590 |         xmit->tdata2 = cpu_to_le(bp->tdata2);
         |             ^~
   arch/riscv/kernel/hw_breakpoint.c:591:13: error: invalid use of undefined type 'struct sbi_dbtr_data_msg'
     591 |         xmit->tdata3 = cpu_to_le(bp->tdata3);
         |             ^~
   arch/riscv/kernel/hw_breakpoint.c:593:25: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     593 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UPDATE,
         |                         ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:593:39: error: 'SBI_EXT_DBTR_TRIG_UPDATE' undeclared (first use in this function)
     593 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UPDATE,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:570:23: warning: unused variable 'ret' [-Wunused-variable]
     570 |         struct sbiret ret;
         |                       ^~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_disable_hw_breakpoint':
   arch/riscv/kernel/hw_breakpoint.c:606:23: error: storage size of 'ret' isn't known
     606 |         struct sbiret ret;
         |                       ^~~
   arch/riscv/kernel/hw_breakpoint.c:621:25: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     621 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_DISABLE,
         |                         ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:621:39: error: 'SBI_EXT_DBTR_TRIG_DISABLE' undeclared (first use in this function)
     621 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_DISABLE,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:606:23: warning: unused variable 'ret' [-Wunused-variable]
     606 |         struct sbiret ret;
         |                       ^~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_hw_breakpoint_init':
   arch/riscv/kernel/hw_breakpoint.c:655:47: error: invalid application of 'sizeof' to incomplete type 'union sbi_dbtr_shmem_entry'
     655 |         sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
         |                                               ^
   include/linux/alloc_tag.h:256:16: note: in definition of macro 'alloc_hooks_tag'
     256 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   include/linux/percpu.h:143:9: note: in expansion of macro 'alloc_hooks'
     143 |         alloc_hooks(pcpu_alloc_noprof(_size, _align, false, GFP_KERNEL))
         |         ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:655:26: note: in expansion of macro '__alloc_percpu'
     655 |         sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
         |                          ^~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:655:47: error: invalid application of 'sizeof' to incomplete type 'union sbi_dbtr_shmem_entry'
     655 |         sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
         |                                               ^
   include/linux/alloc_tag.h:260:24: note: in definition of macro 'alloc_hooks_tag'
     260 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/percpu.h:143:9: note: in expansion of macro 'alloc_hooks'
     143 |         alloc_hooks(pcpu_alloc_noprof(_size, _align, false, GFP_KERNEL))
         |         ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:655:26: note: in expansion of macro '__alloc_percpu'
     655 |         sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
         |                          ^~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:655:47: error: invalid application of 'sizeof' to incomplete type 'union sbi_dbtr_shmem_entry'
     655 |         sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
         |                                               ^
   include/linux/alloc_tag.h:263:24: note: in definition of macro 'alloc_hooks_tag'


vim +39 arch/riscv/kernel/hw_breakpoint.c

    34	
    35	static int arch_smp_setup_sbi_shmem(unsigned int cpu)
    36	{
    37		union sbi_dbtr_shmem_entry *dbtr_shmem;
    38		phys_addr_t shmem_pa;
  > 39		struct sbiret ret;
    40	
    41		dbtr_shmem = per_cpu_ptr(sbi_dbtr_shmem, cpu);
    42		if (!dbtr_shmem) {
    43			pr_err("Invalid per-cpu shared memory for debug triggers\n");
    44			return -ENODEV;
    45		}
    46	
    47		shmem_pa = per_cpu_ptr_to_phys(dbtr_shmem);
    48	
  > 49		ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
    50				MEM_LO(shmem_pa), MEM_HI(shmem_pa), 0, 0, 0, 0);
    51	
    52		if (ret.error) {
    53			pr_warn("%s: failed to setup shared memory. error: %ld\n",
    54				__func__, ret.error);
  > 55			return sbi_err_map_linux_errno(ret.error);
    56		}
    57	
    58		pr_info("CPU %d: HW Breakpoint shared memory registered.\n", cpu);
    59	
    60		return 0;
    61	}
    62	
    63	static int arch_smp_teardown_sbi_shmem(unsigned int cpu)
    64	{
    65		struct sbiret ret;
    66	
    67		/* Disable shared memory */
    68		ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
  > 69				SBI_SHMEM_DISABLE, SBI_SHMEM_DISABLE, 0, 0, 0, 0);
    70	
    71		if (ret.error)
    72			pr_warn("%s: failed to disable shared memory. error: %ld\n",
    73				__func__, ret.error);
    74		else
    75			pr_info("CPU %d: HW Breakpoint shared memory disabled.\n", cpu);
    76	
    77		return 0;
    78	}
    79	
    80	static void init_sbi_dbtr(void)
    81	{
    82		unsigned long tdata1;
    83		struct sbiret ret;
    84	
  > 85		if (sbi_probe_extension(SBI_EXT_DBTR) <= 0) {
    86			pr_warn("SBI_EXT_DBTR is not supported\n");
    87			dbtr_total_num = 0;
    88			goto done;
    89		}
    90	
  > 91		ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
    92				0, 0, 0, 0, 0, 0);
    93		if (ret.error) {
    94			pr_warn("Failed to detect triggers\n");
    95			dbtr_total_num = 0;
    96			goto done;
    97		}
    98	
    99		tdata1 = 0;
   100		tdata1 = RISCV_DBTR_SET_TDATA1_TYPE(tdata1, RISCV_DBTR_TRIG_MCONTROL6);
   101	
   102		ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
   103				tdata1, 0, 0, 0, 0, 0);
   104		if (ret.error) {
   105			pr_warn("Failed to detect mcontrol6 triggers\n");
   106		} else if (!ret.value) {
   107			pr_warn("Type 6 triggers not available\n");
   108		} else {
   109			dbtr_total_num = ret.value;
   110			dbtr_type = RISCV_DBTR_TRIG_MCONTROL6;
   111			pr_warn("Mcontrol6 trigger available.\n");
   112			goto done;
   113		}
   114	
   115		/* fallback to type 2 triggers if type 6 is not available */
   116	
   117		tdata1 = 0;
   118		tdata1 = RISCV_DBTR_SET_TDATA1_TYPE(tdata1, RISCV_DBTR_TRIG_MCONTROL);
   119	
   120		ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
   121				tdata1, 0, 0, 0, 0, 0);
   122		if (ret.error) {
   123			pr_warn("Failed to detect mcontrol triggers\n");
   124		} else if (!ret.value) {
   125			pr_warn("Type 2 triggers not available\n");
   126		} else {
   127			dbtr_total_num = ret.value;
   128			dbtr_type = RISCV_DBTR_TRIG_MCONTROL;
   129			goto done;
   130		}
   131	
   132	done:
   133		dbtr_init = 1;
   134	}
   135	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
