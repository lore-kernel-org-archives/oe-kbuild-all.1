Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19B333263F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 01:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785375148; cv=none; b=ttS5mm+NX8ybYLcydl9ntI5lgHvUMEz+8MHIC6KBxO9x1tQGnh9hsOVy1Kx7jj8bMhSWr52DlJnoTQgNY6VEulerwCZCejgynIs2qyedVJvrFmLLPwn3sXH+Rhr71NIKHv5b+elE/udH8Wafta9WnIIL+v8hmhUs/KzjPxHNtrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785375148; c=relaxed/simple;
	bh=j8MyWLsg+y160jm8ywThIRTzGqwpUrkWoAdEvS6w6tA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=twTDkw+wRUAPLE7hJtbnn3fKaHOh7aRLSNarNVjFfkSN1dsBMhOSJ8o1JwlTSiv3aRg7UIIKtEdyUUIgkbN018XKwi7JTtIrGYP2DkIuE/N/pfVK6f5N8yaqd9P7JiifKcIvyXTf4UaedDB7Au75sVgIiUfGdOJLnuwQy1S5NnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YtU/oWVR; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YtU/oWVR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785375146; x=1816911146;
  h=date:from:to:cc:subject:message-id;
  bh=j8MyWLsg+y160jm8ywThIRTzGqwpUrkWoAdEvS6w6tA=;
  b=YtU/oWVRfU3h3BsbE80bGNTyyLwBg4rzvbuaRLObt9xBl7SI5GOy2p6+
   Miz8GPS6ii1k+pkcb70TYUsFFqYGW5nObIeI/txyDuTyfgiQEbpdkztlP
   CQvw0zOIKrwYDwFX55W5Osr2F1feTBk2c2KS2MF/XBRe57EN0mhJRMiFv
   FHMo1W2SQRUSadUnlsL7TAH/YNVB5QMzQcWm2vHaSvu1taeXriK4nOMPb
   JoiQ1+3jl1iSeVcU5SwlRvjFBA7lD0vK/ItRHxJyvCaJM1d57M1/UV/l3
   tEieRXihyQzZxBxE8vEg/U018U42tP4G5SExZCKEwsp6gbfZDfS6mOUIz
   g==;
X-CSE-ConnectionGUID: RWi/S7mSQxaA++/ogwNutw==
X-CSE-MsgGUID: +5lR7i65QQOTTi+/E9gftQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85753239"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="85753239"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 18:32:25 -0700
X-CSE-ConnectionGUID: 7AMZnn5bR6yZoW/aFIEdUw==
X-CSE-MsgGUID: iboWcSK/S4Cy3osILbgeYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="265217789"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 29 Jul 2026 18:32:23 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpFcs-00000000frW-29g9;
	Thu, 30 Jul 2026 01:32:11 +0000
Date: Thu, 30 Jul 2026 09:30:59 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [avpatel:riscv_trace_support_v4 51/66]
 arch/riscv/include/asm/sbi.h:826:18: warning: 'struct
 sbi_mpxy_notification_data' declared inside parameter list will not be
 visible outside of this definition or declaration
Message-ID: <202607300850.tWSoZ7IR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v4
head:   19d7863d5c8c0f96c1ff517918afda2aa9e34a58
commit: 4ed294505c85440de3e3bb514980b2996f061dea [51/66] RISC-V: Move common MPXY helper routines to arch/riscv
config: riscv-randconfig-002-20260730 (https://download.01.org/0day-ci/archive/20260730/202607300850.tWSoZ7IR-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607300850.tWSoZ7IR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607300850.tWSoZ7IR-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
>> arch/riscv/include/asm/sbi.h:826:18: warning: 'struct sbi_mpxy_notification_data' declared inside parameter list will not be visible outside of this definition or declaration
     826 |           struct sbi_mpxy_notification_data *notif_data,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/sbi.h:825:5: warning: no previous prototype for 'sbi_mpxy_get_notifications' [-Wmissing-prototypes]
     825 | int sbi_mpxy_get_notifications(u32 channel_id,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
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
>> arch/riscv/include/asm/sbi.h:826:18: warning: 'struct sbi_mpxy_notification_data' declared inside parameter list will not be visible outside of this definition or declaration
     826 |           struct sbi_mpxy_notification_data *notif_data,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/sbi.h:825:5: warning: no previous prototype for 'sbi_mpxy_get_notifications' [-Wmissing-prototypes]
     825 | int sbi_mpxy_get_notifications(u32 channel_id,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +826 arch/riscv/include/asm/sbi.h

   824	
   825	int sbi_mpxy_get_notifications(u32 channel_id,
 > 826				       struct sbi_mpxy_notification_data *notif_data,
   827				       unsigned long *events_data_len)
   828	{
   829		return -ENODEV;
   830	}
   831	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
