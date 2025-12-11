Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A340883F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 23:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765497478; cv=none; b=BOmF4vm2Vw/Hv8akHoas7z5ZYEUKBzWLoLj2XPEcAiQDwymSyy2LqYcEGAVurvj49oVmStWqK3qpOGF5ekWLns5QbN32BTO9CDMc596n6j6oe2ViRNyCiyZJPpyhhmKeQkr7NXydHqRDidJu42QKoo39zXrwoVoIJyDAt2zXSDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765497478; c=relaxed/simple;
	bh=sVi8hgrlbYptg3rgXbYyxF0bMcF/fl8ZDszDDahGPf8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ALFkk+Qjs9/xnXrxrQogRZ76Z4yVJEvRnxdEfpl9wnkTxwteQZbIngbjF23CBRJzWfmT75DW8+XTWR0uqabMbGqDXtvGFCn77V+5pGq07MwCOxv+td1SoFtMO4qDjYvvy458/nhWecE+h3hwo0ECqYFYby+DlWzso5mzuIJJj/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jVVDoeef; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jVVDoeef"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765497477; x=1797033477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sVi8hgrlbYptg3rgXbYyxF0bMcF/fl8ZDszDDahGPf8=;
  b=jVVDoeef1GBnrIWSHKEYEKRMPdAcBZlTniqeO9f9XVeTKiTp9+wip7zu
   W+3PTR+A0vusWg128kQpOX6gbtOz8w7O992sw7dVGee/eYpP+bAEkC+nP
   8WCe42TYBVSLfV0MjW91u1ysHlvZjPhYeT3iSCxTo293r3KDsvSZ+VoU0
   1aGBxed0eNX15OWI2VLlxpYewwjaolJh1WKn/rldzGuslwvKqzMCkE34V
   2+h9fMZCS+31z6e9gRbH6gYXjo2tBAnkRZXqYdrrFbnTaXLW4rijhICCp
   OAvUDTLRrXfQ8LBLvPaLus5NLlQ7YRkrZoALP7WzUajmqN7JYzicy3SPW
   g==;
X-CSE-ConnectionGUID: U0CUkzpgQN681i913PoUxA==
X-CSE-MsgGUID: l1XhVjqcTd2ZE15ZYYCu/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="77803837"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="77803837"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 15:57:57 -0800
X-CSE-ConnectionGUID: jY3w8FrbRAWE1EkmJUU4eg==
X-CSE-MsgGUID: KPtd8Nh+TG+zV8laZuhARQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="201348081"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 11 Dec 2025 15:57:54 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTqXg-000000001FI-20oI;
	Thu, 11 Dec 2025 23:57:52 +0000
Date: Fri, 12 Dec 2025 00:57:05 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhou Shuai <zhoushuai28@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3534/3534] htmldocs:
 Documentation/networking/hinic3.rst:3: WARNING: Title overline too short.
Message-ID: <202512120048.AHnbZM2r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5930fa3740c518a9f6ba688fd0c1873d6f3adbce
commit: dcb286ce50a35a77e51b61db72c7cc001647b598 [3534/3534] net/hinic3: add huawei/hinic3 driver
reproduce: (https://download.01.org/0day-ci/archive/20251212/202512120048.AHnbZM2r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120048.AHnbZM2r-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function ethtool_pause_stats ./include/linux/ethtool.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function ethtool_fec_stats ./include/linux/ethtool.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function ethtool_mm_state ./include/linux/ethtool.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function ethtool_mm_stats ./include/linux/ethtool.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function ethtool_mm_cfg ./include/linux/ethtool.h' failed with return code 1
>> Documentation/networking/hinic3.rst:3: WARNING: Title overline too short.
--
   ============================================================
   Linux Kernel Driver for Huawei Intelligent NIC(HiNIC3) family
   ============================================================ [docutils]
>> Documentation/networking/hinic3.rst:117: WARNING: Title underline too short.
--
   Miscellaneous:
   ============= [docutils]
>> Documentation/networking/hinic3.rst:117: WARNING: Title underline too short.


vim +3 Documentation/networking/hinic3.rst

     2	
   > 3	============================================================
     4	Linux Kernel Driver for Huawei Intelligent NIC(HiNIC3) family
     5	============================================================
     6	
     7	Overview:
     8	=========
     9	HiNIC3 is a network interface card for the Data Center Area.
    10	
    11	The driver supports a range of link-speed devices (10GbE, 25GbE, 40GbE, etc.).
    12	The driver supports also a negotiated and extendable feature set.
    13	
    14	Some HiNIC3 devices support SR-IOV. This driver is used for Physical Function
    15	(PF).
    16	
    17	HiNIC3 devices support MSI-X interrupt vector for each Tx/Rx queue and
    18	adaptive interrupt moderation.
    19	
    20	HiNIC3 devices support also various offload features such as checksum offload,
    21	TCP Transmit Segmentation Offload(TSO), Receive-Side Scaling(RSS) and
    22	LRO(Large Receive Offload).
    23	
    24	
    25	Supported PCI vendor ID/device IDs:
    26	===================================
    27	
    28	19e5:1822 - HiNIC3 PF
    29	
    30	
    31	Driver Architecture and Source Code:
    32	====================================
    33	
    34	hinic3_dev - Implement a Logical Network device that is independent from
    35	specific HW details about HW data structure formats.
    36	
    37	hinic3_hwdev - Implement the HW details of the device and include the components
    38	for accessing the PCI NIC.
    39	
    40	hinic3_hwdev contains the following components:
    41	===============================================
    42	
    43	HW Interface:
    44	=============
    45	
    46	The interface for accessing the pci device (DMA memory and PCI BARs).
    47	(hinic3_hw_if.c, hinic3_hw_if.h)
    48	
    49	Configuration Status Registers Area that describes the HW Registers on the
    50	configuration and status BAR0. (hinic3_hw_csr.h)
    51	
    52	MGMT components:
    53	================
    54	
    55	Asynchronous Event Queues(AEQs) - The event queues for receiving messages from
    56	the MGMT modules on the cards. (hinic3_hw_eqs.c, hinic3_hw_eqs.h)
    57	
    58	Application Programmable Interface commands(API CMD) - Interface for sending
    59	MGMT commands to the card. (hinic3_hw_api_cmd.c, hinic3_hw_api_cmd.h)
    60	
    61	Management (MGMT) - the PF to MGMT channel that uses API CMD for sending MGMT
    62	commands to the card and receives notifications from the MGMT modules on the
    63	card by AEQs. Also set the addresses of the IO CMDQs in HW.
    64	(hinic3_hw_mgmt.c, hinic3_hw_mgmt.h)
    65	
    66	IO components:
    67	==============
    68	
    69	Completion Event Queues(CEQs) - The completion Event Queues that describe IO
    70	tasks that are finished. (hinic3_hw_eqs.c, hinic3_hw_eqs.h)
    71	
    72	Work Queues(WQ) - Contain the memory and operations for use by CMD queues and
    73	the Queue Pairs. The WQ is a Memory Block in a Page. The Block contains
    74	pointers to Memory Areas that are the Memory for the Work Queue Elements(WQEs).
    75	(hinic3_hw_wq.c, hinic3_hw_wq.h)
    76	
    77	Command Queues(CMDQ) - The queues for sending commands for IO management and is
    78	used to set the QPs addresses in HW. The commands completion events are
    79	accumulated on the CEQ that is configured to receive the CMDQ completion events.
    80	(hinic3_hw_cmdq.c, hinic3_hw_cmdq.h)
    81	
    82	Queue Pairs(QPs) - The HW Receive and Send queues for Receiving and Transmitting
    83	Data. (hinic3_hw_qp.c, hinic3_hw_qp.h, hinic3_hw_qp_ctxt.h)
    84	
    85	IO - de/constructs all the IO components. (hinic3_hw_io.c, hinic3_hw_io.h)
    86	
    87	HW device:
    88	==========
    89	
    90	HW device - de/constructs the HW Interface, the MGMT components on the
    91	initialization of the driver and the IO components on the case of Interface
    92	UP/DOWN Events. (hinic3_hw_dev.c, hinic3_hw_dev.h)
    93	
    94	
    95	hinic3_dev contains the following components:
    96	===============================================
    97	
    98	PCI ID table - Contains the supported PCI Vendor/Device IDs.
    99	(hinic3_pci_tbl.h)
   100	
   101	Port Commands - Send commands to the HW device for port management
   102	(MAC, Vlan, MTU, ...). (hinic3_port.c, hinic3_port.h)
   103	
   104	Tx Queues - Logical Tx Queues that use the HW Send Queues for transmit.
   105	The Logical Tx queue is not dependent on the format of the HW Send Queue.
   106	(hinic3_tx.c, hinic3_tx.h)
   107	
   108	Rx Queues - Logical Rx Queues that use the HW Receive Queues for receive.
   109	The Logical Rx queue is not dependent on the format of the HW Receive Queue.
   110	(hinic3_rx.c, hinic3_rx.h)
   111	
   112	hinic_dev - de/constructs the Logical Tx and Rx Queues.
   113	(hinic3_main.c, hinic3_dev.h)
   114	
   115	
   116	Miscellaneous:
 > 117	=============
   118	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
