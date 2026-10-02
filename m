Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C706635FF58
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 04:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790916094; cv=none; b=BlpNs0pj83j3NXYsjBx5eWQsV6M89SCvE+KCMROVRjijYx3DdVtiG02XGtjfVrBrG0c5WlLTYg6cRDbDefBR7VB+9QBwBFqycAfj6pcUcsupwLJhLAfMWBhOvgSlcoMy1mZ0pv44rUkc3mTP6uJpFtJnifNwwHF3GiL/O0+0YJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790916094; c=relaxed/simple;
	bh=spHzg9VMFqqg4f0FUkm26xrFHKUrJkrDLZ6/pmcEPAY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nkhAxsjGi7Bpdqoblr1WBb5H7wVr0kCtPgoUJ9GBjToK/iIg1ABVXCrtVsqIUEnHM61rLXjWGthAHeUhfeQLDAQtQKfI9BCTGtfrNdrQHn3HWMGKYmtm2WvAOHgK5INo3y39Wg0g1fUidOa5kjKc1EGIHmEPKN4t52GI4iBtxZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jl9hvYd4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jl9hvYd4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790916090; x=1822452090;
  h=date:from:to:cc:subject:message-id;
  bh=spHzg9VMFqqg4f0FUkm26xrFHKUrJkrDLZ6/pmcEPAY=;
  b=jl9hvYd4/C4ibpafBIUnEJm3HKSwovmzQR4AT8ZeupBjC3tZ4Sv/TonY
   OwXCZz29uD6Xtw7vtOTO+9/D65KTOC4ETHVdxMhgHp9mvzbaZEwhdJZxa
   reCu0ZGWwtBF5nlHDnlRI2bm7gnbrnEF7IPDol7/GVib+G2u4SFPiOzv2
   i5p/Tluq/iHpqlhGifoKx89YYcmqpqildKK9ct5v9KEKmCxzaVlQ/ShOS
   cuLkUbgUfXr+5vxc8h+m3NtuyUeoyJ+F98WYLxYe6fPncLWO35D12d9qv
   peHF6Dg/s3ZGCiKhvrZ+FBXDYV1vdVPhIQelGcDLz+KEH1dqded8Pcv4F
   g==;
X-CSE-ConnectionGUID: Xxp4V8D9Q1Cp7lR/FRDvgw==
X-CSE-MsgGUID: j6UI7jG0RFOMxqxupUgSeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="91546337"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="91546337"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 21:41:28 -0700
X-CSE-ConnectionGUID: yYST4DqnRlyuA2U2ZLGwsQ==
X-CSE-MsgGUID: FWOUkIJNQMe8IRZq7L8tew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="302425603"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Oct 2026 21:41:26 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCV5I-00000000Se7-1km5;
	Fri, 02 Oct 2026 04:41:24 +0000
Date: Fri, 02 Oct 2026 12:41:22 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [avpatel:riscv_trace_support_v6 2/79]
 arch/riscv/include/asm/sbi.h:738:5: warning: no previous prototype for
 'sbi_mpxy_read_attrs'
Message-ID: <202610021241.HQYT7cD3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v6
head:   699de4c95a417e4c81644a91131ceb23bf0519a6
commit: 6439174960c8ce56a3b4ce6eb5fabde7bdaae27a [2/79] RISC-V: Move common MPXY helper routines to arch/riscv
config: riscv-randconfig-1000-20261002 (https://download.01.org/0day-ci/archive/20261002/202610021241.HQYT7cD3-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021241.HQYT7cD3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610021241.HQYT7cD3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h:12,
                    from arch/riscv/include/asm/kvm_host.h:25,
                    from arch/riscv/kernel/asm-offsets.c:13:
>> arch/riscv/include/asm/sbi.h:738:5: warning: no previous prototype for 'sbi_mpxy_read_attrs' [-Wmissing-prototypes]
     738 | int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
         |     ^~~~~~~~~~~~~~~~~~~
>> arch/riscv/include/asm/sbi.h:744:5: warning: no previous prototype for 'sbi_mpxy_write_attrs' [-Wmissing-prototypes]
     744 | int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
         |     ^~~~~~~~~~~~~~~~~~~~
>> arch/riscv/include/asm/sbi.h:750:5: warning: no previous prototype for 'sbi_mpxy_send_message_with_resp' [-Wmissing-prototypes]
     750 | int sbi_mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/include/asm/sbi.h:758:5: warning: no previous prototype for 'sbi_mpxy_send_message_without_resp' [-Wmissing-prototypes]
     758 | int sbi_mpxy_send_message_without_resp(u32 channel_id, u32 msg_id,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/include/asm/sbi.h:765:18: warning: 'struct sbi_mpxy_notification_data' declared inside parameter list will not be visible outside of this definition or declaration
     765 |           struct sbi_mpxy_notification_data *notif_data,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/include/asm/sbi.h:764:5: warning: no previous prototype for 'sbi_mpxy_get_notifications' [-Wmissing-prototypes]
     764 | int sbi_mpxy_get_notifications(u32 channel_id,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h:12,
                    from arch/riscv/include/asm/kvm_host.h:25,
                    from arch/riscv/kernel/asm-offsets.c:13:
>> arch/riscv/include/asm/sbi.h:738:5: warning: no previous prototype for 'sbi_mpxy_read_attrs' [-Wmissing-prototypes]
     738 | int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
         |     ^~~~~~~~~~~~~~~~~~~
>> arch/riscv/include/asm/sbi.h:744:5: warning: no previous prototype for 'sbi_mpxy_write_attrs' [-Wmissing-prototypes]
     744 | int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
         |     ^~~~~~~~~~~~~~~~~~~~
>> arch/riscv/include/asm/sbi.h:750:5: warning: no previous prototype for 'sbi_mpxy_send_message_with_resp' [-Wmissing-prototypes]
     750 | int sbi_mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/include/asm/sbi.h:758:5: warning: no previous prototype for 'sbi_mpxy_send_message_without_resp' [-Wmissing-prototypes]
     758 | int sbi_mpxy_send_message_without_resp(u32 channel_id, u32 msg_id,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/include/asm/sbi.h:765:18: warning: 'struct sbi_mpxy_notification_data' declared inside parameter list will not be visible outside of this definition or declaration
     765 |           struct sbi_mpxy_notification_data *notif_data,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/include/asm/sbi.h:764:5: warning: no previous prototype for 'sbi_mpxy_get_notifications' [-Wmissing-prototypes]
     764 | int sbi_mpxy_get_notifications(u32 channel_id,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/sbi_mpxy_read_attrs +738 arch/riscv/include/asm/sbi.h

   737	
 > 738	int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
   739				u32 *attrs_buf)
   740	{
   741		return -ENODEV;
   742	}
   743	
 > 744	int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
   745				 u32 *attrs_buf)
   746	{
   747		return -ENODEV;
   748	}
   749	
 > 750	int sbi_mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
   751					    void *tx, unsigned long tx_len,
   752					    void *rx, unsigned long max_rx_len,
   753					    unsigned long *rx_len)
   754	{
   755		return -ENODEV;
   756	}
   757	
 > 758	int sbi_mpxy_send_message_without_resp(u32 channel_id, u32 msg_id,
   759					       void *tx, unsigned long tx_len)
   760	{
   761		return -ENODEV;
   762	}
   763	
 > 764	int sbi_mpxy_get_notifications(u32 channel_id,
 > 765				       struct sbi_mpxy_notification_data *notif_data,
   766				       unsigned long *events_data_len)
   767	{
   768		return -ENODEV;
   769	}
   770	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
