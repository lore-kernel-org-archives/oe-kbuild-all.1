Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D69E42087C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jul 2026 23:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783466091; cv=none; b=Ae8sDvSTy6nAK8rynKi8YcMBi4LVLar13wS1j1dKR4/1ehiEX1GR+xeOWq9PZqKf5qsg6CVI6Z97hArhUK5thpqKjCwWY219VonADHn8+ebnbq1Pbs2EuyWJQHUfa7/aeao5Yc2IO7Z3VZD++TgDuHvYLB10ovEX7mpg2BKGlMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783466091; c=relaxed/simple;
	bh=Cfyi27CNEYczrb9LbWZWSmk9BPPkEVHckMP08M9X5/I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fE4vEUJ1xSY6/9cdl8VZukl413756h2JZOor2wOVms+1tHXmXiNcCF6looHMqssehoSXIlcE2Zzl/mGl4n0Ex+ksO9yDXeE8ucVQ9cNo1bdUkdq1LnDdMBzl7z0xUckaypy+lwaVNPF7nfMGKgd2wOO0A9gKmxxS4LV6vOArY0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c+LzVabG; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c+LzVabG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783466089; x=1815002089;
  h=date:from:to:cc:subject:message-id;
  bh=Cfyi27CNEYczrb9LbWZWSmk9BPPkEVHckMP08M9X5/I=;
  b=c+LzVabG3DhhYFWALN9r3qOu4oifWyTGlvmV+cVa4VVn66LDb3J0ETLJ
   ARr81tCF9W6TaMsGeZ/jitsqDlTxTsPGsDepd+2W4ZxSbPkek7d2ZmMjn
   tYh+G+2cUCH6KycZA7aKgDVq2PIYThpVTlGr57bzsNPHSTs3JJsvqj4Iv
   +qOurGlO/8vTyMfq7mhqbGPgH03y1PbOwpgfp7HFSowhPV1vFXDei2ktv
   Q2KA1l/b1GyL4+o7xudjdGfVMIH5nhhwNJpZvPQTiOpgOb/U06C60fFrp
   On0guv0vluw4+QFXQwTroFS3/FZMLoUQOgKYHWFIBxqXxqZq1/E7ojT4z
   Q==;
X-CSE-ConnectionGUID: cV8actxvQcqb1azu4cujTA==
X-CSE-MsgGUID: B1GgOqtCSFmNscmLmyMDjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84317165"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84317165"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 16:14:48 -0700
X-CSE-ConnectionGUID: gPExAE+jT8OnIiDx1Od3rA==
X-CSE-MsgGUID: Ox6r/K6aSW2oYPlGTTytBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="256046477"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 07 Jul 2026 16:14:47 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whEzy-00000000Fkp-3UhW;
	Tue, 07 Jul 2026 23:14:43 +0000
Date: Wed, 08 Jul 2026 07:14:17 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [avpatel:riscv_trace_support_v4 43/58]
 arch/riscv/include/asm/sbi.h:799:5: warning: no previous prototype for
 'sbi_mpxy_read_attrs'
Message-ID: <202607080702.F6uDqahb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v4
head:   077795f92007de48afcaeab45f9e9217537966d8
commit: d114c0cd70da2e1a20620050e0fa8e512b2d24c4 [43/58] RISC-V: Move common MPXY helper routines to arch/riscv
config: riscv-randconfig-001-20260707 (https://download.01.org/0day-ci/archive/20260708/202607080702.F6uDqahb-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607080702.F6uDqahb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607080702.F6uDqahb-lkp@intel.com/

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
