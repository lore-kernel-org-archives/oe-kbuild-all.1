Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8BC137E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Sep 2024 14:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726930375; cv=none; b=qGwY99d6LT4ResaRRuPzoqay4J0x88dB3wCUNCBELzJdfrjPSSydUcD2VCbanSRcbolGW1//THJd8kpBA6/8xU+IZU+Euv5T4BrTRHewPKhoLCn7HcmYle2LVsxdRg3cQiUZFIGl+m2WzbXoBjf07GfGI3V6OPg0wHQEHh1Paoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726930375; c=relaxed/simple;
	bh=N1puN6SXp0ZI9BVv856kdxJZY6SYO3Wv4ils/+twTGA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b0eDVK2J4I4XunNv17PCZaBj5quy1oH4/njUXf1nc/Av7hWepT76E34WQqExft01uGIGsFwIeuOBZFQ146p0B/uVEfEd8Pfxq6qyMCreHzEA/Ut8+ZT4bAyGXvRopN9AzUVinmbs3plq5LDUA/dQU8Mx/3f5XElhLszXnzEltwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=etMi2bcB; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="etMi2bcB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726930373; x=1758466373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N1puN6SXp0ZI9BVv856kdxJZY6SYO3Wv4ils/+twTGA=;
  b=etMi2bcByDvc9rMjvACTNh33XZITfdawdbQe5gstr3dmzmASk9osIa7C
   UuYq6Lcu4ZyGbdV4sp+MBVc8xn+hyITtR7poG9ny/9jzpwqZ7PXhMIN4X
   3cl9y0+AJJcZC90dH/JwaVclSPqdZC3UVMVCSsYkguGm76uA8weFpBw3H
   npHOaD7Y35mSesH4JqIpmmB+2Un83eoUEUes1nQeb3qUA+aziMnSB7gzg
   Nk3QWTv9QdketDJa+a8n//OX9xut/9xeAWdhlVygzpS5iHyViBfcRlvqq
   7c7BQES7aZxM7IRr2VZuxH1YYjdV2Mgb0cz2oleGSfBbTwBPfXT2rtXji
   Q==;
X-CSE-ConnectionGUID: rNshhPV0RVK5UW2sup+Bkw==
X-CSE-MsgGUID: AaKb0eVHS/6GnpbGbPB1qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25444892"
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="25444892"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 07:52:53 -0700
X-CSE-ConnectionGUID: Q1xOzGZKRne8TRKJfn4QQw==
X-CSE-MsgGUID: u4FhNocaSTCZV4wL52YYfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="75379107"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Sep 2024 07:52:51 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ss1Td-000FVF-0R;
	Sat, 21 Sep 2024 14:52:49 +0000
Date: Sat, 21 Sep 2024 22:52:40 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:5.4-main 1518/28533]
 drivers/misc/mediatek/connectivity/wlan/gen2/include/precomp.h: que_mgt.h is
 included more than once.
Message-ID: <202409212242.jGLr2rBh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 5.4-main
head:   92b88e0e59c946d552fb3d375d60e775a4151ea2
commit: 06d376a01ea074dd064fc447282fe587ea9ddbdb [1518/28533] mt6625l: add driver-folder from 5.3
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409212242.jGLr2rBh-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/misc/mediatek/connectivity/wlan/gen2/include/precomp.h: que_mgt.h is included more than once.
--
>> drivers/misc/mediatek/include/mt-plat/mt8127/include/mach/mtk_thermal.h: linux/types.h is included more than once.
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/include/p2p_precomp.h: que_mgt.h is included more than once.
--
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/include/wmt_idc.h: wmt_stp_exp.h is included more than once.
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/include/gl_os.h: linux/wireless.h is included more than once.

vim +143 drivers/misc/mediatek/connectivity/wlan/gen2/include/precomp.h

    11	
    12	/*
    13	** Log: precomp.h
    14	 *
    15	 * 07 17 2012 yuche.tsai
    16	 * NULL
    17	 * Compile no error before trial run.
    18	 *
    19	 * 01 05 2012 tsaiyuan.hsu
    20	 * [WCXRP00001157] [MT6620 Wi-Fi][FW][DRV] add timing measurement support for 802.11v
    21	 * add timing measurement support for 802.11v.
    22	 *
    23	 * 08 15 2011 cp.wu
    24	 * [WCXRP00000851] [MT6628 Wi-Fi][Driver] Add HIFSYS related definition to driver source tree
    25	 * add MT6628-specific definitions.
    26	 *
    27	 * 04 18 2011 terry.wu
    28	 * [WCXRP00000660] [MT6620 Wi-Fi][Driver] Remove flag CFG_WIFI_DIRECT_MOVED
    29	 * Remove flag CFG_WIFI_DIRECT_MOVED.
    30	 *
    31	 * 03 15 2011 eddie.chen
    32	 * [WCXRP00000554] [MT6620 Wi-Fi][DRV] Add sw control debug counter
    33	 * Add sw debug counter for QM.
    34	 *
    35	 * 01 27 2011 tsaiyuan.hsu
    36	 * [WCXRP00000392] [MT6620 Wi-Fi][Driver] Add Roaming Support
    37	 * add roaming fsm
    38	 * 1. not support 11r, only use strength of signal to determine roaming.
    39	 * 2. not enable CFG_SUPPORT_ROAMING until completion of full test.
    40	 * 3. in 6620, adopt work-around to avoid sign extension problem of cck of hw
    41	 * 4. assume that change of link quality in smooth way.
    42	 *
    43	 * 12 13 2010 cp.wu
    44	 * [WCXRP00000260] [MT6620 Wi-Fi][Driver][Firmware] Create V1.1 branch for both firmware and driver
    45	 * create branch for Wi-Fi driver v1.1
    46	 *
    47	 * 10 07 2010 cp.wu
    48	 * [WCXRP00000083] [MT5931][Driver][FW] Add necessary logic for MT5931 first connection
    49	 * add firmware download for MT5931.
    50	 *
    51	 * 10 05 2010 cp.wu
    52	 * [WCXRP00000056] [MT6620 Wi-Fi][Driver] NVRAM implementation with Version Check
    53	 * 1) add NVRAM access API
    54	 * 2) fake scanning result when NVRAM doesn't exist and/or version mismatch. (off by compiler option)
    55	 * 3) add OID implementation for NVRAM read/write service
    56	 *
    57	 * 09 21 2010 kevin.huang
    58	 * [WCXRP00000052] [MT6620 Wi-Fi][Driver] Eliminate Linux Compile Warning
    59	 * Isolate P2P related function for Hardware Software Bundle
    60	 *
    61	 * 09 14 2010 chinghwa.yu
    62	 * NULL
    63	 * Fix BOW_FSM_INFO_T dependence.
    64	 *
    65	 * 09 03 2010 kevin.huang
    66	 * NULL
    67	 * Refine #include sequence and solve recursive/nested #include issue
    68	 *
    69	 * 07 20 2010 wh.su
    70	 *
    71	 * adding the wapi code.
    72	 *
    73	 * 07 08 2010 cp.wu
    74	 *
    75	 * [WPD00003833] [MT6620 and MT5931] Driver migration - move to new repository.
    76	 *
    77	 * 07 08 2010 cm.chang
    78	 * [WPD00003841][LITE Driver] Migrate RLM/CNM to host driver
    79	 * Check draft RLM code for HT cap
    80	 *
    81	 * 07 01 2010 cm.chang
    82	 * [WPD00003841][LITE Driver] Migrate RLM/CNM to host driver
    83	 * Modify CNM message handler for new flow
    84	 *
    85	 * 06 28 2010 cm.chang
    86	 * [WPD00003841][LITE Driver] Migrate RLM/CNM to host driver
    87	 * 1st draft code for RLM module
    88	 *
    89	 * 06 19 2010 wh.su
    90	 * [WPD00003840][MT6620 5931] Security migration
    91	 * consdier the concurrent network setting.
    92	 *
    93	 * 06 18 2010 wh.su
    94	 * [WPD00003840][MT6620 5931] Security migration
    95	 * migration the security related function from firmware.
    96	 *
    97	 * 06 18 2010 wh.su
    98	 * [WPD00003840][MT6620 5931] Security migration
    99	 * migration from MT6620 firmware.
   100	 *
   101	 * 06 08 2010 cp.wu
   102	 * [WPD00003833][MT6620 and MT5931] Driver migration
   103	 * add hem_mbox.c and cnm_mem.h (but disabled some feature) for further migration
   104	 *
   105	 * 06 07 2010 cp.wu
   106	 * [WPD00003833][MT6620 and MT5931] Driver migration
   107	 * merge cnm_scan.h and hem_mbox.h
   108	 *
   109	 * 06 07 2010 cp.wu
   110	 * [WPD00003833][MT6620 and MT5931] Driver migration
   111	 * merge wifi_var.h, precomp.h, cnm_timer.h (data type only)
   112	 *
   113	 * 06 06 2010 kevin.huang
   114	 * [WPD00003832][MT6620 5931] Create driver base
   115	 * [MT6620 5931] Create driver base
   116	 *
   117	 * 05 17 2010 cp.wu
   118	 * [WPD00003831][MT6620 Wi-Fi] Add framework for Wi-Fi Direct support
   119	 * 1) add timeout handler mechanism for pending command packets
   120	 * 2) add p2p add/removal key
   121	 *
   122	 * 04 13 2010 cp.wu
   123	 * [WPD00003823][MT6620 Wi-Fi] Add Bluetooth-over-Wi-Fi support
   124	 * add framework for BT-over-Wi-Fi support.
   125	 *  *  *  *  *  *  *  *  *  *  * 1) prPendingCmdInfo is replaced by queue for multiple handler capability
   126	 *  *  *  *  *  *  *  *  *  *  * 2) command sequence number is now increased atomically
   127	 *  *  *  *  *  *  *  *  *  *  * 3) private data could be hold and taken use for other purpose
   128	 *
   129	 * 03 16 2010 cp.wu
   130	 * [WPD00003823][MT6620 Wi-Fi] Add Bluetooth-over-Wi-Fi support
   131	 * build up basic data structure and definitions to support BT-over-WiFi
   132	 *
   133	 * 02 08 2010 cp.wu
   134	 * [WPD00001943]Create WiFi test driver framework on WinXP
   135	 * prepare for implementing fw download logic
   136	 *
   137	 * 01 27 2010 wh.su
   138	 * [WPD00003816][MT6620 Wi-Fi] Adding the security support
   139	 * .
   140	**  \main\maintrunk.MT6620WiFiDriver_Prj\9 2009-12-08 11:30:58 GMT mtk02752
   141	**  add rftest.h for implementing RF test mode in driver land
   142	**  \main\maintrunk.MT6620WiFiDriver_Prj\8 2009-11-23 22:02:00 GMT mtk02468
 > 143	**  Added que_mgt.h
   144	**  \main\maintrunk.MT6620WiFiDriver_Prj\7 2009-10-13 21:58:36 GMT mtk01084
   145	**  update for new macro define
   146	**  \main\maintrunk.MT6620WiFiDriver_Prj\6 2009-04-21 09:40:11 GMT mtk01461
   147	**  Add nic_cmd_event.h
   148	**  \main\maintrunk.MT6620WiFiDriver_Prj\5 2009-04-17 20:00:26 GMT mtk01461
   149	**  Add cmd_buf.h
   150	**  \main\maintrunk.MT6620WiFiDriver_Prj\4 2009-03-19 18:32:44 GMT mtk01084
   151	**  update for basic power management functions
   152	**  \main\maintrunk.MT6620WiFiDriver_Prj\3 2009-03-16 09:08:25 GMT mtk01461
   153	**  Update TX PATH API
   154	**  \main\maintrunk.MT6620WiFiDriver_Prj\2 2009-03-10 20:11:38 GMT mtk01426
   155	**  Init for develop
   156	**
   157	*/
   158	
   159	#ifndef _PRECOMP_H
   160	#define _PRECOMP_H
   161	
   162	/*******************************************************************************
   163	*                         C O M P I L E R   F L A G S
   164	********************************************************************************
   165	*/
   166	
   167	/*******************************************************************************
   168	*                    E X T E R N A L   R E F E R E N C E S
   169	********************************************************************************
   170	*/
   171	#include "gl_os.h"		/* Include "config.h" */
   172	
   173	#if CFG_ENABLE_WIFI_DIRECT
   174	#include "gl_p2p_os.h"
   175	#endif
   176	
   177	#include "debug.h"
   178	
   179	#include "link.h"
   180	#include "queue.h"
   181	
   182	/*------------------------------------------------------------------------------
   183	 * .\include\mgmt
   184	 *------------------------------------------------------------------------------
   185	 */
   186	#include "wlan_typedef.h"
   187	
   188	#include "mac.h"
   189	
   190	/* Dependency:  mac.h (MAC_ADDR_LEN) */
   191	#include "wlan_def.h"
   192	
   193	#if CFG_SUPPORT_SWCR
   194	#include "swcr.h"
   195	#endif
   196	
   197	/*------------------------------------------------------------------------------
   198	 * .\include\nic
   199	 *------------------------------------------------------------------------------
   200	 */
   201	/* Dependency:  wlan_def.h (ENUM_NETWORK_TYPE_T) */
   202	#include "cmd_buf.h"
   203	
   204	/* Dependency:  mac.h (MAC_ADDR_LEN) */
   205	#include "nic_cmd_event.h"
   206	
   207	/* Dependency:  nic_cmd_event.h (P_EVENT_CONNECTION_STATUS) */
   208	#include "nic.h"
   209	
   210	#include "nic_init_cmd_event.h"
   211	
   212	#include "hif_rx.h"
   213	#include "hif_tx.h"
   214	
   215	#include "nic_tx.h"
   216	
   217	/* Dependency:  hif_rx.h (P_HIF_RX_HEADER_T) */
   218	#include "nic_rx.h"
   219	
 > 220	#include "que_mgt.h"
   221	
   222	#if CFG_ENABLE_WIFI_DIRECT
   223	#include "p2p_typedef.h"
   224	#include "p2p_cmd_buf.h"
   225	#include "p2p_nic_cmd_event.h"
   226	#include "p2p_mac.h"
   227	#include "p2p_nic.h"
   228	#endif
   229	
   230	/*------------------------------------------------------------------------------
   231	 * .\include\mgmt
   232	 *------------------------------------------------------------------------------
   233	 */
   234	
   235	#include "hem_mbox.h"
   236	
   237	#include "scan.h"
   238	#include "bss.h"
   239	
   240	#include "wlan_lib.h"
   241	#include "wlan_oid.h"
   242	#include "wlan_bow.h"
   243	
   244	#if CFG_ENABLE_WIFI_DIRECT
   245	#include "wlan_p2p.h"
   246	#endif
   247	
   248	#include "hal.h"
   249	
   250	#if defined(MT6620)
   251	#include "mt6620_reg.h"
   252	#elif defined(MT6628)
   253	/* #include "mt6628_reg.h" */
   254	#include "mtreg.h"
   255	#endif
   256	
   257	#include "rlm.h"
   258	#include "rlm_domain.h"
   259	#include "rlm_protection.h"
   260	#include "rlm_obss.h"
   261	#include "rate.h"
   262	#if CFG_SUPPORT_802_11V
   263	#include "wnm.h"
   264	#endif
   265	
   266	#include "aa_fsm.h"
   267	
   268	#include "cnm_timer.h"
   269	
   270	#if CFG_ENABLE_BT_OVER_WIFI
   271	#include "bow.h"
   272	#include "bow_fsm.h"
   273	#endif
   274	
   275	#include "pwr_mgt.h"
   276	
   277	#if (CFG_SUPPORT_STATISTICS == 1)
   278	#include "stats.h"
   279	#endif /* CFG_SUPPORT_STATISTICS */
   280	
   281	#include "cnm.h"
   282	/* Dependency:  aa_fsm.h (ENUM_AA_STATE_T), p2p_fsm.h (WPS_ATTRI_MAX_LEN_DEVICE_NAME) */
   283	#include "cnm_mem.h"
   284	#include "cnm_scan.h"
   285	
   286	#if CFG_ENABLE_WIFI_DIRECT
   287	#include "p2p_rlm_obss.h"
   288	#include "p2p_bss.h"
   289	#include "p2p.h"
   290	#include "p2p_fsm.h"
   291	#include "p2p_scan.h"
   292	#include "p2p_state.h"
   293	#include "p2p_func.h"
   294	#include "p2p_rlm.h"
   295	#include "p2p_assoc.h"
   296	#include "p2p_ie.h"
   297	#endif
   298	
   299	#include "privacy.h"
   300	
   301	#include "mib.h"
   302	
   303	#include "auth.h"
   304	#include "assoc.h"
   305	
   306	#if CFG_SUPPORT_ROAMING
   307	#include "roaming_fsm.h"
   308	#endif /* CFG_SUPPORT_ROAMING */
   309	
   310	#include "ais_fsm.h"
   311	
   312	#include "adapter.h"
   313	
 > 314	#include "que_mgt.h"
   315	#include "rftest.h"
   316	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
