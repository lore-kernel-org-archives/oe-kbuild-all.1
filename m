Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E310828BAB9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jun 2026 00:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781052839; cv=none; b=jc8W5SUx7kynSZI9CfSDN2HvY3/zhSLBJd23aWULRlwlTg7pjqrSehEdTUlyGjbyYRKvy7L9Knf+2DKjrWIPf5JCgD6zpx6A5KOxa+/srnVdGYO1gxHBikVqRc7ZijTxkTCWjIPk7tjBi+v2y1K9saUN/QhryzjeXIC1de9X92E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781052839; c=relaxed/simple;
	bh=Vsw7ymtEOE8cBO+yECOFCOePxulHne17Qetbw0mPSC0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mMg0DAFghicqh6CZqtuKwnJEv6HhCF/3CulqcEViCjD9cjt8WFkjYvi++KrBEhZjVWoTqPOfRtjW9kY0goLCE0uKRKV70+vTAzerwFcGyDh0JG+Boi7dpWUlX5ag9typhbhHaHOdBiFPnYpLYDS8uM/Nfat8FcSAmHU+x7C1tUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZtHxqq1o; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZtHxqq1o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781052835; x=1812588835;
  h=date:from:to:cc:subject:message-id;
  bh=Vsw7ymtEOE8cBO+yECOFCOePxulHne17Qetbw0mPSC0=;
  b=ZtHxqq1oYW0t7ITYgOz0uzaKXVW19jqY8Zlkj9Qa6QRgIFqbbviIR3Jw
   nQbgDMVN/Uoyqnpr9e0NTjLvi2XAiHNwK2wStRXe8/3d4nRM55W3u0KVj
   eHmsEtmGEzJeCy2zCCbtxrcDrRv+zCebxI/UNvMV+2NwxmVx3506PtP0h
   bWSTag5MgK5cJkUcYVik6y7rmGWMNidsGUnZ2cnNN2Ye+3ApQ+KXtPhwW
   XvPCvqYAM9Ldy6DCBeXZ1VQm5+OhPeomzOhnQ1ft6MNH2xXqCzivnj8F8
   up9p/ckbxq2eyb51GquqgmQeKHNfeuQmOX4PJhES+NjWHVEMHP+X7yXpd
   A==;
X-CSE-ConnectionGUID: fSCi5WFdTTel0vg0a6OYog==
X-CSE-MsgGUID: OM9P7BryRzydpJhWlqFniA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81883529"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81883529"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 17:53:54 -0700
X-CSE-ConnectionGUID: qqCOxIaMRtmuF20pJ3Tqlg==
X-CSE-MsgGUID: /OHqUpQoTm+PFltaIpSDOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="246104354"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Jun 2026 17:53:53 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wX7CX-00000000Kkc-2scT;
	Wed, 10 Jun 2026 00:53:49 +0000
Date: Wed, 10 Jun 2026 08:52:51 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [avpatel:riscv_trace_support_v4 66/81] cpu.c:(.text+0x7b4):
 multiple definition of `sbi_mpxy_read_attrs';
 arch/riscv/kernel/alternative.o:alternative.c:(.text+0x11a): first defined
 here
Message-ID: <202606100809.6PvRLpEV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v4
head:   79783024b7bd12897e21fecfaf6ac7dad02a8f0e
commit: 853576b22385941e4e89cde2cf72e4d5384c2554 [66/81] RISC-V: Move common MPXY helper routines to arch/riscv
config: riscv-randconfig-001-20260610 (https://download.01.org/0day-ci/archive/20260610/202606100809.6PvRLpEV-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606100809.6PvRLpEV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606100809.6PvRLpEV-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h:12,
                    from arch/riscv/include/asm/kvm_host.h:25,
                    from arch/riscv/kernel/asm-offsets.c:13:
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
>> arch/riscv/include/asm/sbi.h:826:39: warning: 'struct sbi_mpxy_notification_data' declared inside parameter list will not be visible outside of this definition or declaration
     826 |                                struct sbi_mpxy_notification_data *notif_data,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/sbi.h:825:5: warning: no previous prototype for 'sbi_mpxy_get_notifications' [-Wmissing-prototypes]
     825 | int sbi_mpxy_get_notifications(u32 channel_id,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   riscv64-linux-ld: arch/riscv/kernel/cpu.o: in function `sbi_mpxy_read_attrs':
>> cpu.c:(.text+0x7b4): multiple definition of `sbi_mpxy_read_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x11a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpu.o: in function `sbi_mpxy_write_attrs':
>> cpu.c:(.text+0x804): multiple definition of `sbi_mpxy_write_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x16a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpu.o: in function `sbi_mpxy_send_message_with_resp':
>> cpu.c:(.text+0x854): multiple definition of `sbi_mpxy_send_message_with_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x1ba): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpu.o: in function `sbi_mpxy_send_message_without_resp':
>> cpu.c:(.text+0x8a4): multiple definition of `sbi_mpxy_send_message_without_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x20a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpu.o: in function `sbi_mpxy_get_notifications':
>> cpu.c:(.text+0x8f4): multiple definition of `sbi_mpxy_get_notifications'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x25a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpufeature.o: in function `sbi_mpxy_read_attrs':
   cpufeature.c:(.text+0x97a): multiple definition of `sbi_mpxy_read_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x11a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpufeature.o: in function `sbi_mpxy_write_attrs':
   cpufeature.c:(.text+0x9ca): multiple definition of `sbi_mpxy_write_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x16a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpufeature.o: in function `sbi_mpxy_send_message_with_resp':
   cpufeature.c:(.text+0xa1a): multiple definition of `sbi_mpxy_send_message_with_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x1ba): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpufeature.o: in function `sbi_mpxy_send_message_without_resp':
   cpufeature.c:(.text+0xa6a): multiple definition of `sbi_mpxy_send_message_without_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x20a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpufeature.o: in function `sbi_mpxy_get_notifications':
   cpufeature.c:(.text+0xaba): multiple definition of `sbi_mpxy_get_notifications'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x25a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/irq.o: in function `sbi_mpxy_read_attrs':
   irq.c:(.text+0xf6): multiple definition of `sbi_mpxy_read_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x11a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/irq.o: in function `sbi_mpxy_write_attrs':
   irq.c:(.text+0x146): multiple definition of `sbi_mpxy_write_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x16a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/irq.o: in function `sbi_mpxy_send_message_with_resp':
   irq.c:(.text+0x196): multiple definition of `sbi_mpxy_send_message_with_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x1ba): first defined here
   riscv64-linux-ld: arch/riscv/kernel/irq.o: in function `sbi_mpxy_send_message_without_resp':
   irq.c:(.text+0x1e6): multiple definition of `sbi_mpxy_send_message_without_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x20a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/irq.o: in function `sbi_mpxy_get_notifications':
   irq.c:(.text+0x236): multiple definition of `sbi_mpxy_get_notifications'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x25a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/setup.o: in function `sbi_mpxy_read_attrs':
   setup.c:(.text+0x3e): multiple definition of `sbi_mpxy_read_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x11a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/setup.o: in function `sbi_mpxy_write_attrs':
   setup.c:(.text+0x8e): multiple definition of `sbi_mpxy_write_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x16a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/setup.o: in function `sbi_mpxy_send_message_with_resp':
   setup.c:(.text+0xde): multiple definition of `sbi_mpxy_send_message_with_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x1ba): first defined here
   riscv64-linux-ld: arch/riscv/kernel/setup.o: in function `sbi_mpxy_send_message_without_resp':
   setup.c:(.text+0x12e): multiple definition of `sbi_mpxy_send_message_without_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x20a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/setup.o: in function `sbi_mpxy_get_notifications':
   setup.c:(.text+0x17e): multiple definition of `sbi_mpxy_get_notifications'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x25a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/sys_hwprobe.o: in function `sbi_mpxy_read_attrs':
   sys_hwprobe.c:(.text+0x130e): multiple definition of `sbi_mpxy_read_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x11a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/sys_hwprobe.o: in function `sbi_mpxy_write_attrs':
   sys_hwprobe.c:(.text+0x135e): multiple definition of `sbi_mpxy_write_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x16a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/sys_hwprobe.o: in function `sbi_mpxy_send_message_with_resp':
   sys_hwprobe.c:(.text+0x13ae): multiple definition of `sbi_mpxy_send_message_with_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x1ba): first defined here
   riscv64-linux-ld: arch/riscv/kernel/sys_hwprobe.o: in function `sbi_mpxy_send_message_without_resp':
   sys_hwprobe.c:(.text+0x13fe): multiple definition of `sbi_mpxy_send_message_without_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x20a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/sys_hwprobe.o: in function `sbi_mpxy_get_notifications':
   sys_hwprobe.c:(.text+0x144e): multiple definition of `sbi_mpxy_get_notifications'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x25a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/time.o: in function `sbi_mpxy_read_attrs':
   time.c:(.text+0x3e): multiple definition of `sbi_mpxy_read_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x11a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/time.o: in function `sbi_mpxy_write_attrs':
   time.c:(.text+0x8e): multiple definition of `sbi_mpxy_write_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x16a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/time.o: in function `sbi_mpxy_send_message_with_resp':
   time.c:(.text+0xde): multiple definition of `sbi_mpxy_send_message_with_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x1ba): first defined here
   riscv64-linux-ld: arch/riscv/kernel/time.o: in function `sbi_mpxy_send_message_without_resp':
   time.c:(.text+0x12e): multiple definition of `sbi_mpxy_send_message_without_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x20a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/time.o: in function `sbi_mpxy_get_notifications':
   time.c:(.text+0x17e): multiple definition of `sbi_mpxy_get_notifications'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x25a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/traps_misaligned.o: in function `sbi_mpxy_read_attrs':
   traps_misaligned.c:(.text+0xa44): multiple definition of `sbi_mpxy_read_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x11a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/traps_misaligned.o: in function `sbi_mpxy_write_attrs':
   traps_misaligned.c:(.text+0xa94): multiple definition of `sbi_mpxy_write_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x16a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/traps_misaligned.o: in function `sbi_mpxy_send_message_with_resp':
   traps_misaligned.c:(.text+0xae4): multiple definition of `sbi_mpxy_send_message_with_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x1ba): first defined here
   riscv64-linux-ld: arch/riscv/kernel/traps_misaligned.o: in function `sbi_mpxy_send_message_without_resp':
   traps_misaligned.c:(.text+0xb34): multiple definition of `sbi_mpxy_send_message_without_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x20a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/traps_misaligned.o: in function `sbi_mpxy_get_notifications':
   traps_misaligned.c:(.text+0xb84): multiple definition of `sbi_mpxy_get_notifications'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x25a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpu_ops.o: in function `sbi_mpxy_read_attrs':
   cpu_ops.c:(.text+0x3e): multiple definition of `sbi_mpxy_read_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x11a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpu_ops.o: in function `sbi_mpxy_write_attrs':
   cpu_ops.c:(.text+0x8e): multiple definition of `sbi_mpxy_write_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x16a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpu_ops.o: in function `sbi_mpxy_send_message_with_resp':
   cpu_ops.c:(.text+0xde): multiple definition of `sbi_mpxy_send_message_with_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x1ba): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpu_ops.o: in function `sbi_mpxy_send_message_without_resp':
   cpu_ops.c:(.text+0x12e): multiple definition of `sbi_mpxy_send_message_without_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x20a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpu_ops.o: in function `sbi_mpxy_get_notifications':
   cpu_ops.c:(.text+0x17e): multiple definition of `sbi_mpxy_get_notifications'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x25a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpu_ops_spinwait.o: in function `sbi_mpxy_read_attrs':
   cpu_ops_spinwait.c:(.text+0xd6): multiple definition of `sbi_mpxy_read_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x11a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpu_ops_spinwait.o: in function `sbi_mpxy_write_attrs':
   cpu_ops_spinwait.c:(.text+0x126): multiple definition of `sbi_mpxy_write_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x16a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpu_ops_spinwait.o: in function `sbi_mpxy_send_message_with_resp':
   cpu_ops_spinwait.c:(.text+0x176): multiple definition of `sbi_mpxy_send_message_with_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x1ba): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpu_ops_spinwait.o: in function `sbi_mpxy_send_message_without_resp':
   cpu_ops_spinwait.c:(.text+0x1c6): multiple definition of `sbi_mpxy_send_message_without_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x20a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpu_ops_spinwait.o: in function `sbi_mpxy_get_notifications':
   cpu_ops_spinwait.c:(.text+0x216): multiple definition of `sbi_mpxy_get_notifications'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x25a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/suspend.o: in function `sbi_mpxy_read_attrs':
   suspend.c:(.text+0x3e): multiple definition of `sbi_mpxy_read_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x11a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/suspend.o: in function `sbi_mpxy_write_attrs':
   suspend.c:(.text+0x8e): multiple definition of `sbi_mpxy_write_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x16a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/suspend.o: in function `sbi_mpxy_send_message_with_resp':
   suspend.c:(.text+0xde): multiple definition of `sbi_mpxy_send_message_with_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x1ba): first defined here
   riscv64-linux-ld: arch/riscv/kernel/suspend.o: in function `sbi_mpxy_send_message_without_resp':
   suspend.c:(.text+0x12e): multiple definition of `sbi_mpxy_send_message_without_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x20a): first defined here
   riscv64-linux-ld: arch/riscv/kernel/suspend.o: in function `sbi_mpxy_get_notifications':
   suspend.c:(.text+0x17e): multiple definition of `sbi_mpxy_get_notifications'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x25a): first defined here
   riscv64-linux-ld: arch/riscv/mm/cacheflush.o: in function `sbi_mpxy_read_attrs':
   cacheflush.c:(.text+0x20e): multiple definition of `sbi_mpxy_read_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x11a): first defined here
   riscv64-linux-ld: arch/riscv/mm/cacheflush.o: in function `sbi_mpxy_write_attrs':
   cacheflush.c:(.text+0x25e): multiple definition of `sbi_mpxy_write_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x16a): first defined here
   riscv64-linux-ld: arch/riscv/mm/cacheflush.o: in function `sbi_mpxy_send_message_with_resp':
   cacheflush.c:(.text+0x2ae): multiple definition of `sbi_mpxy_send_message_with_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x1ba): first defined here
   riscv64-linux-ld: arch/riscv/mm/cacheflush.o: in function `sbi_mpxy_send_message_without_resp':
   cacheflush.c:(.text+0x2fe): multiple definition of `sbi_mpxy_send_message_without_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x20a): first defined here
   riscv64-linux-ld: arch/riscv/mm/cacheflush.o: in function `sbi_mpxy_get_notifications':
   cacheflush.c:(.text+0x34e): multiple definition of `sbi_mpxy_get_notifications'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x25a): first defined here
--
   In file included from arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h:12,
                    from arch/riscv/include/asm/kvm_host.h:25,
                    from arch/riscv/kernel/asm-offsets.c:13:
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
>> arch/riscv/include/asm/sbi.h:826:39: warning: 'struct sbi_mpxy_notification_data' declared inside parameter list will not be visible outside of this definition or declaration
     826 |                                struct sbi_mpxy_notification_data *notif_data,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/sbi.h:825:5: warning: no previous prototype for 'sbi_mpxy_get_notifications' [-Wmissing-prototypes]
     825 | int sbi_mpxy_get_notifications(u32 channel_id,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
