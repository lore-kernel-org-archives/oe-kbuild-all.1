Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785B51A2C0B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Aug 2025 16:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755881228; cv=none; b=Smp6bPHo8iBaCEGOg4zR3tmkM1E+d10PS6kqQumId8NZhiFNeCe4IlcgjelQJ4++++CEiXmTGUnY9IP0Tj4aBZxawqyw2gxwf99rqzdSAhdWATgqgpv158vEMfYufETDuu9WA6m6mQ/RKylldPogYei3OY5ujMOSuOnXZM9b98E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755881228; c=relaxed/simple;
	bh=RVHxKpqtgiJosyrw8/Fkb1Ht48S6HoYjSHw8ebUmh0E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B0bwOzlUreiv0hBQdgMh07m1yXachSUqYK8+0cymJMfvXwtTlbD4X1pwHhdzaNjOqRiXbX6exiEtmSbf6GFvwLwhtDOULaJNY/osgIuftuidS1rCEQYMRwiDHjSCav8CosTERIz1Yls8NiCDqe4hdJimo3qSCZpzLE05tvhYXf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NLEFY/9E; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NLEFY/9E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755881226; x=1787417226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RVHxKpqtgiJosyrw8/Fkb1Ht48S6HoYjSHw8ebUmh0E=;
  b=NLEFY/9EFyLdbdGDwjUCH6xoqnDn3LB1AC8vj36fH3jdRrWMKC/mpoce
   9WPmQJ3ir37mzh1yOkSD3n4FyU+yHdHMSn7a3B4P15cJSZhBTnUgIUoYa
   TinENCanhfFZwT6xVgemG6yb3DJ0X3fE6TPPaTCMS4mfpWgUfOZ3nRSpS
   Z3YXjWoYKQtTHArQSFyBvRLZREmzEg1+Y4vZRRMXKQKKRS52S9vtee5Pn
   J2qeQsDe+ETsEKugH4wa0YeB3QITuFVn7kHWRA2TJyUX86Ct0aJMfKdP4
   EyFXi00tYrp+Rx4poW9pHxzvmAoTgNd5+ZZEZ0KQkN2+24rfvnv0zfOcK
   w==;
X-CSE-ConnectionGUID: AIxSGNy/RgWH0d1j/8ze0w==
X-CSE-MsgGUID: CsEmtISlTaK+TVknXlB33g==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="62026827"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62026827"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 09:47:06 -0700
X-CSE-ConnectionGUID: uBGeNivHSlOc+gJBQDT6uA==
X-CSE-MsgGUID: KmxJpPpEQ6mQHUBZwY2UKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="168257834"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 22 Aug 2025 09:47:04 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upUum-000LYF-0g;
	Fri, 22 Aug 2025 16:46:58 +0000
Date: Sat, 23 Aug 2025 00:45:53 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-GNR-perf-uncore-ANBZ24141 2/2]
 drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:324:5: error: no
 previous prototype for 'sxevf_link_state_get'
Message-ID: <202508230045.ufJErTGL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-GNR-perf-uncore-ANBZ24141
head:   549f4465e530ad244aef11446ea0265824e1bca0
commit: b0eae3386d6f264dc2e617e11e93de47a4099475 [2/2] anolis: net: supports linkdata ethernet controllers
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250823/202508230045.ufJErTGL-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508230045.ufJErTGL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508230045.ufJErTGL-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:160:6: error: no previous prototype for 'sxevf_hw_stop' [-Werror=missing-prototypes]
     160 | void sxevf_hw_stop(struct sxevf_hw *hw)
         |      ^~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:187:6: error: no previous prototype for 'sxevf_msg_write' [-Werror=missing-prototypes]
     187 | void sxevf_msg_write(struct sxevf_hw *hw, u8 index, u32 msg)
         |      ^~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:196:5: error: no previous prototype for 'sxevf_msg_read' [-Werror=missing-prototypes]
     196 | u32 sxevf_msg_read(struct sxevf_hw *hw, u8 index)
         |     ^~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:206:5: error: no previous prototype for 'sxevf_mailbox_read' [-Werror=missing-prototypes]
     206 | u32 sxevf_mailbox_read(struct sxevf_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:211:6: error: no previous prototype for 'sxevf_mailbox_write' [-Werror=missing-prototypes]
     211 | void sxevf_mailbox_write(struct sxevf_hw *hw, u32 value)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:216:6: error: no previous prototype for 'sxevf_pf_req_irq_trigger' [-Werror=missing-prototypes]
     216 | void sxevf_pf_req_irq_trigger(struct sxevf_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:221:6: error: no previous prototype for 'sxevf_pf_ack_irq_trigger' [-Werror=missing-prototypes]
     221 | void sxevf_pf_ack_irq_trigger(struct sxevf_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:226:6: error: no previous prototype for 'sxevf_event_irq_map' [-Werror=missing-prototypes]
     226 | void sxevf_event_irq_map(struct sxevf_hw *hw, u16 vector)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:240:6: error: no previous prototype for 'sxevf_specific_irq_enable' [-Werror=missing-prototypes]
     240 | void sxevf_specific_irq_enable(struct sxevf_hw *hw, u32 value)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:245:6: error: no previous prototype for 'sxevf_irq_enable' [-Werror=missing-prototypes]
     245 | void sxevf_irq_enable(struct sxevf_hw *hw, u32 mask)
         |      ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:251:6: error: no previous prototype for 'sxevf_irq_disable' [-Werror=missing-prototypes]
     251 | void sxevf_irq_disable(struct sxevf_hw *hw)
         |      ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:259:6: error: no previous prototype for 'sxevf_hw_ring_irq_map' [-Werror=missing-prototypes]
     259 | void sxevf_hw_ring_irq_map(struct sxevf_hw *hw, bool is_tx, u16 hw_ring_idx,
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:276:6: error: no previous prototype for 'sxevf_ring_irq_interval_set' [-Werror=missing-prototypes]
     276 | void sxevf_ring_irq_interval_set(struct sxevf_hw *hw, u16 irq_idx, u32 interval)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:313:6: error: no previous prototype for 'sxevf_hw_reset' [-Werror=missing-prototypes]
     313 | void sxevf_hw_reset(struct sxevf_hw *hw)
         |      ^~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:324:5: error: no previous prototype for 'sxevf_link_state_get' [-Werror=missing-prototypes]
     324 | u32 sxevf_link_state_get(struct sxevf_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:539:6: error: no previous prototype for 'sxevf_tx_ring_switch' [-Werror=missing-prototypes]
     539 | void sxevf_tx_ring_switch(struct sxevf_hw *hw, u8 reg_idx, bool is_on)
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:594:6: error: no previous prototype for 'sxevf_rx_ring_switch' [-Werror=missing-prototypes]
     594 | void sxevf_rx_ring_switch(struct sxevf_hw *hw, u8 reg_idx, bool is_on)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:626:6: error: no previous prototype for 'sxevf_rx_ring_desc_configure' [-Werror=missing-prototypes]
     626 | void sxevf_rx_ring_desc_configure(struct sxevf_hw *hw, u32 desc_mem_len,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:640:6: error: no previous prototype for 'sxevf_rx_rcv_ctl_configure' [-Werror=missing-prototypes]
     640 | void sxevf_rx_rcv_ctl_configure(struct sxevf_hw *hw, u8 reg_idx,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:697:6: error: no previous prototype for 'sxevf_32bit_counter_update' [-Werror=missing-prototypes]
     697 | void sxevf_32bit_counter_update(struct sxevf_hw *hw,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:710:6: error: no previous prototype for 'sxevf_36bit_counter_update' [-Werror=missing-prototypes]
     710 | void sxevf_36bit_counter_update(struct sxevf_hw *hw,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:726:6: error: no previous prototype for 'sxevf_packet_stats_get' [-Werror=missing-prototypes]
     726 | void sxevf_packet_stats_get(struct sxevf_hw *hw, struct sxevf_hw_stats *stats)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:740:6: error: no previous prototype for 'sxevf_stats_init_value_get' [-Werror=missing-prototypes]
     740 | void sxevf_stats_init_value_get(struct sxevf_hw *hw,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_tx_proc.c:88:6: error: no previous prototype for 'sxevf_tx_ring_free' [-Werror=missing-prototypes]
      88 | void sxevf_tx_ring_free(struct sxevf_ring *ring)
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_tx_proc.c:127:5: error: no previous prototype for 'sxevf_tx_ring_alloc' [-Werror=missing-prototypes]
     127 | s32 sxevf_tx_ring_alloc(struct sxevf_ring *ring)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_tx_proc.c: In function 'sxevf_xmit_pkt':
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_tx_proc.c:703:66: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
     703 |                                  ring->idx, SXEVF_TX_DESC_NEEDED);
         |                                                                  ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_tx_proc.c: In function 'sxevf_ring_xmit':
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_tx_proc.c:803:74: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
     803 |                 LOG_ERROR("tx dma mapping err, ring idx=%u\n", ring->idx);
         |                                                                          ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_tx_proc.c: In function 'sxevf_xmit':
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_tx_proc.c:838:71: error: suggest braces around empty body in an 'else' statement [-Werror=empty-body]
     838 |                 LOG_DEBUG("sxe xmit end, ring idx=%u\n", tx_ring->idx);
         |                                                                       ^
   cc1: all warnings being treated as errors


vim +/sxevf_link_state_get +324 drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c

   323	
 > 324	u32 sxevf_link_state_get(struct sxevf_hw *hw)
   325	{
   326		return SXEVF_REG_READ(hw, SXE_VFLINKS);
   327	}
   328	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
