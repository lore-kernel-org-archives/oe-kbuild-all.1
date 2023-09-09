Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBD31FD7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Sep 2023 12:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694263823; x=1725799823;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QqkyDdb7KFTGx786teAZtfSKdS8sprJ45mGO8pjXtCI=;
  b=SECQJBlSKwytHbPQp2tywXMH08CsVVuFhw3ND+PxDTuxDBeb4iytbrKM
   iFQaTduLwrJkubhWJ60WxcTROajdTWTbTGgS5ZFcD0EBp+r5Em/DelbUi
   jlnFj761DOHqAz4US0axMKnQz2IsK2DjJobZygZelKy4bgxnuv9vyzhnu
   QdjxmGoQZuv+D2xWOKQGBPXdcHwm6kcvvqKHvsBlEGPTNL/BRiixtwalz
   Uyi/s6cXcc0p2uLRD215NiPvPJY24A797PXUxBErD7zbYc7qSAidf8NW0
   T0Oy1c5pni7lInIYTHLUfT0RNdCiXbWXxUnsafRRZkOJKbIcDGKCY3JL4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="357284240"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="357284240"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 05:50:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="719448626"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="719448626"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 09 Sep 2023 05:50:20 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qexPm-0003Vr-27;
	Sat, 09 Sep 2023 12:50:18 +0000
Date: Sat, 9 Sep 2023 20:49:55 +0800
From: kernel test robot <lkp@intel.com>
To: Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next 1/6] net: ethernet: implement OPEN Alliance
 control transaction interface
Message-ID: <202309092045.ALqlvkvR-lkp@intel.com>
References: <20230908142919.14849-2-Parthiban.Veerasooran@microchip.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230908142919.14849-2-Parthiban.Veerasooran@microchip.com>

Hi Parthiban,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Parthiban-Veerasooran/net-ethernet-implement-OPEN-Alliance-control-transaction-interface/20230908-224352
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230908142919.14849-2-Parthiban.Veerasooran%40microchip.com
patch subject: [RFC PATCH net-next 1/6] net: ethernet: implement OPEN Alliance control transaction interface
reproduce: (https://download.01.org/0day-ci/archive/20230909/202309092045.ALqlvkvR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309092045.ALqlvkvR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/networking/oa-tc6-framework.rst:87: WARNING: Error in "code-block" directive:
>> Documentation/networking/oa-tc6-framework.rst:7: WARNING: Undefined substitution referenced: "copy".
>> Documentation/networking/oa-tc6-framework.rst: WARNING: document isn't included in any toctree

vim +87 Documentation/networking/oa-tc6-framework.rst

     6	
   > 7	:Copyright: |copy| 2023 MICROCHIP
     8	
     9	Introduction
    10	------------
    11	
    12	The IEEE 802.3cg project defines two 10 Mbit/s PHYs operating over a
    13	single pair of conductors. The 10BASE-T1L (Clause 146) is a long reach
    14	PHY supporting full duplex point-to-point operation over 1 km of single
    15	balanced pair of conductors. The 10BASE-T1S (Clause 147) is a short reach
    16	PHY supporting full / half duplex point-to-point operation over 15 m of
    17	single balanced pair of conductors, or half duplex multidrop bus
    18	operation over 25 m of single balanced pair of conductors.
    19	
    20	Furthermore, the IEEE 802.3cg project defines the new Physical Layer
    21	Collision Avoidance (PLCA) Reconciliation Sublayer (Clause 148) meant to
    22	provide improved determinism to the CSMA/CD media access method. PLCA
    23	works in conjunction with the 10BASE-T1S PHY operating in multidrop mode.
    24	
    25	The aforementioned PHYs are intended to cover the low-speed / low-cost
    26	applications in industrial and automotive environment. The large number
    27	of pins (16) required by the MII interface, which is specified by the
    28	IEEE 802.3 in Clause 22, is one of the major cost factors that need to be
    29	addressed to fulfil this objective.
    30	
    31	The MAC-PHY solution integrates an IEEE Clause 4 MAC and a 10BASE-T1x PHY
    32	exposing a low pin count Serial Peripheral Interface (SPI) to the host
    33	microcontroller. This also enables the addition of Ethernet functionality
    34	to existing low-end microcontrollers which do not integrate a MAC
    35	controller.
    36	
    37	Overview
    38	--------
    39	
    40	The MAC-PHY is specified to carry both data (Ethernet frames) and control
    41	(register access) transactions over a single full-duplex serial
    42	peripheral interface.
    43	
    44	Protocol Overview
    45	-----------------
    46	
    47	Two types of transactions are defined in the protocol: data transactions
    48	for Ethernet frame transfers and control transactions for register
    49	read/write transfers. A chunk is the basic element of data transactions
    50	and is composed of 4 bytes of overhead plus the configured payload size
    51	for each chunk. Ethernet frames are transferred over one or more data
    52	chunks. Control transactions consist of one or more register read/write
    53	control commands.
    54	
    55	SPI transactions are initiated by the SPI host with the assertion of CSn
    56	low to the MAC-PHY and ends with the deassertion of CSn high. In between
    57	each SPI transaction, the SPI host may need time for additional
    58	processing and to setup the next SPI data or control transaction.
    59	
    60	SPI data transactions consist of an equal number of transmit (TX) and
    61	receive (RX) chunks. Chunks in both transmit and receive directions may
    62	or may not contain valid frame data independent from each other, allowing
    63	for the simultaneous transmission and reception of different length
    64	frames.
    65	
    66	Each transmit data chunk begins with a 32-bit data header followed by a
    67	data chunk payload on MOSI. The data header indicates whether transmit
    68	frame data is present and provides the information to determine which
    69	bytes of the payload contain valid frame data.
    70	
    71	In parallel, receive data chunks are received on MISO. Each receive data
    72	chunk consists of a data chunk payload ending with a 32-bit data footer.
    73	The data footer indicates if there is receive frame data present within
    74	the payload or not and provides the information to determine which bytes
    75	of the payload contain valid frame data.
    76	
    77	Reference
    78	---------
    79	
    80	10BASE-T1x MAC-PHY Serial Interface Specification,
    81	
    82	Link: https://www.opensig.org/about/specifications/
    83	
    84	Hardware Architecture
    85	---------------------
    86	
  > 87	.. code-block:: none
    88	                    +-------------------------------------+
    89	                    |                MAC-PHY              |
    90	  +----------+      | +-----------+  +-------+  +-------+ |
    91	  | SPI Host |<---->| | SPI Slave |  |  MAC  |  |  PHY  | |
    92	  +----------+      | +-----------+  +-------+  +-------+ |
    93	                    +-------------------------------------+
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
