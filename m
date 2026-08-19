Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527E438B124
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 03:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787109853; cv=none; b=VZRO/AebSY3tK4yi6QmpvZ+BjMbqTPQqC0aTA9rn90HyZ6SKPUzeIulOadUdifIv8k10ecjxdqFKDKYGVBXljGHXQyoi3NSzgxc67KJ9nLDM37uuXmOH2WSk4H1HaQCDXk5ZrDM760bAxqYQWHiRzFl5zt3odRM/rxUROiETOP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787109853; c=relaxed/simple;
	bh=l76vAPN3VguzM2NS7goSOBIWz9UY2IRIBt8QY7CrUtk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pSFWbkw7QdfaPmF1lu78LPoszM6CqsNA5UXW3moqE/Pe1SpyAQxP+p9rvKA4mVhma4Qlqy+NoXxL18HJs7tDVBziaLzn4bhn+352J8Is3j1kAJjP82pntuRv7hFsDaHqoLMI7+amVNBt7XVcaWRj5Wx6HZ4gTBLD/1TLFlpjqRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JblP0mdr; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JblP0mdr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787109852; x=1818645852;
  h=date:from:to:cc:subject:message-id;
  bh=l76vAPN3VguzM2NS7goSOBIWz9UY2IRIBt8QY7CrUtk=;
  b=JblP0mdrMjz+U345iNAZoNY/cleEBrk8Rmfx3+fWqV3Cu8mqBSPQif2A
   JAQ5Rwms0+6Cm0iBrtB5yKnqyvhCl4qswRlZ/valT+LC+767Po+1vyOLW
   if0WYpZ4qjq20Vav1/Eq01AaogV7liw3kjSKfwhpP49rTK++/1bmy2a2T
   dxsVse67c2BR4bvdwi+oIcGipMOha7FGdv/nN0Oco5Nyh5T5pLLp13chi
   fIDioSBKEYcNp0CwL7bJGRh/aTOxT4KGE48uMKOF/ZHFnjmb2sibaOVBR
   nRVs5rkJssT124NbQmZQHueupD1aoJ1Ko870nhb6IIBJItn7oxmL/nbv0
   g==;
X-CSE-ConnectionGUID: 2R/JjKumTX2gOhR7eumJiA==
X-CSE-MsgGUID: 8y29fAEMSamh933ofXLRTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="90130507"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="90130507"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 20:24:07 -0700
X-CSE-ConnectionGUID: Ynhs4khGSrOe1d3C81q21A==
X-CSE-MsgGUID: U6KLSbuGQVq4qzB5xmifng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="269254096"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Aug 2026 20:24:06 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwWuJ-00000000erC-1FiF;
	Wed, 19 Aug 2026 03:24:03 +0000
Date: Wed, 19 Aug 2026 11:23:10 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [avpatel:riscv_trace_support_v5 86/108]
 arch/riscv/include/asm/sbi.h:799:5: warning: no previous prototype for
 'sbi_mpxy_read_attrs'
Message-ID: <202608191132.4OQ2akyI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v5
head:   e58ea3f194d326370813c549a76ecdfa211a4768
commit: a81b95aa56abb5c8e32d24bcdd6d51cc998f1fcf [86/108] RISC-V: Move common MPXY helper routines to arch/riscv
config: riscv-randconfig-r073-20260819 (https://download.01.org/0day-ci/archive/20260819/202608191132.4OQ2akyI-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191132.4OQ2akyI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608191132.4OQ2akyI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h:12,
                    from arch/riscv/include/asm/kvm_host.h:25,
                    from arch/riscv/kernel/asm-offsets.c:13:
>> arch/riscv/include/asm/sbi.h:799:5: warning: no previous prototype for 'sbi_mpxy_read_attrs' [-Wmissing-prototypes]
     799 | int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
         |     ^~~~~~~~~~~~~~~~~~~
>> arch/riscv/include/asm/sbi.h:805:5: warning: no previous prototype for 'sbi_mpxy_write_attrs' [-Wmissing-prototypes]
     805 | int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
         |     ^~~~~~~~~~~~~~~~~~~~
>> arch/riscv/include/asm/sbi.h:811:5: warning: no previous prototype for 'sbi_mpxy_send_message_with_resp' [-Wmissing-prototypes]
     811 | int sbi_mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/include/asm/sbi.h:819:5: warning: no previous prototype for 'sbi_mpxy_send_message_without_resp' [-Wmissing-prototypes]
     819 | int sbi_mpxy_send_message_without_resp(u32 channel_id, u32 msg_id,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/sbi.h:826:39: warning: 'struct sbi_mpxy_notification_data' declared inside parameter list will not be visible outside of this definition or declaration
     826 |                                struct sbi_mpxy_notification_data *notif_data,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/include/asm/sbi.h:825:5: warning: no previous prototype for 'sbi_mpxy_get_notifications' [-Wmissing-prototypes]
     825 | int sbi_mpxy_get_notifications(u32 channel_id,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h:12,
                    from arch/riscv/include/asm/kvm_host.h:25,
                    from arch/riscv/kernel/asm-offsets.c:13:
>> arch/riscv/include/asm/sbi.h:799:5: warning: no previous prototype for 'sbi_mpxy_read_attrs' [-Wmissing-prototypes]
     799 | int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
         |     ^~~~~~~~~~~~~~~~~~~
>> arch/riscv/include/asm/sbi.h:805:5: warning: no previous prototype for 'sbi_mpxy_write_attrs' [-Wmissing-prototypes]
     805 | int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
         |     ^~~~~~~~~~~~~~~~~~~~
>> arch/riscv/include/asm/sbi.h:811:5: warning: no previous prototype for 'sbi_mpxy_send_message_with_resp' [-Wmissing-prototypes]
     811 | int sbi_mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/include/asm/sbi.h:819:5: warning: no previous prototype for 'sbi_mpxy_send_message_without_resp' [-Wmissing-prototypes]
     819 | int sbi_mpxy_send_message_without_resp(u32 channel_id, u32 msg_id,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/sbi.h:826:39: warning: 'struct sbi_mpxy_notification_data' declared inside parameter list will not be visible outside of this definition or declaration
     826 |                                struct sbi_mpxy_notification_data *notif_data,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/include/asm/sbi.h:825:5: warning: no previous prototype for 'sbi_mpxy_get_notifications' [-Wmissing-prototypes]
     825 | int sbi_mpxy_get_notifications(u32 channel_id,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/sbi_mpxy_read_attrs +799 arch/riscv/include/asm/sbi.h

   798	
 > 799	int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
   800				u32 *attrs_buf)
   801	{
   802		return -ENODEV;
   803	}
   804	
 > 805	int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
   806				 u32 *attrs_buf)
   807	{
   808		return -ENODEV;
   809	}
   810	
 > 811	int sbi_mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
   812					    void *tx, unsigned long tx_len,
   813					    void *rx, unsigned long max_rx_len,
   814					    unsigned long *rx_len)
   815	{
   816		return -ENODEV;
   817	}
   818	
 > 819	int sbi_mpxy_send_message_without_resp(u32 channel_id, u32 msg_id,
   820					       void *tx, unsigned long tx_len)
   821	{
   822		return -ENODEV;
   823	}
   824	
 > 825	int sbi_mpxy_get_notifications(u32 channel_id,
   826				       struct sbi_mpxy_notification_data *notif_data,
   827				       unsigned long *events_data_len)
   828	{
   829		return -ENODEV;
   830	}
   831	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
