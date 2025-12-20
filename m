Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB84F23EAB9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 18:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766256882; cv=none; b=cSsHAskzv8tova2aJsgT21zyFESan/E3sNFKz5xfUkmw3GDaqyvTiV158xQvZX9EbQSsvy7626zB/mkRiZigCBI22vCHCcDFCgM0/iwzpn2bRYematkSxOE6BZ8Xn/y0g6fo9MRIdDS/TdmBh2+tQ3tDwaOiBYt68auH+/vrsKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766256882; c=relaxed/simple;
	bh=KQoz4TXKNxFwR23uaMIT1Bz5W3Gn1mgB5lCEAhedtpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHRfJzW4Gm3VmRfqfxUH/Wiwk11I34/ukxcjA0vpGJWApBwUjrZQb91BSs8FlSc0w2G+LW7KbkHdICu0QJttDj8ZrMyXRYEP6Be00idSAm7ukC787KJ4EPf2vzr9Cj1QlNmWXeQmpZqCOZD+7gvN8K6u9nc0GRb3MjaWMrC6W0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dYyCjPJX; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dYyCjPJX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766256881; x=1797792881;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KQoz4TXKNxFwR23uaMIT1Bz5W3Gn1mgB5lCEAhedtpQ=;
  b=dYyCjPJXWLt4xpxCh2UvVeuJ4mC2FK2WGEiDLL2JIjRecTPNsVPTX8dp
   r1ietFEddJzbdd22jLWA8BKg70X/X3BXyyNe0k41rlliZrMY7GNyI0oRR
   Kf3jNMOa7NvnIKdWqmsVVLAnm3z5mlwTkxNvzzpQNHMFwQBStXJovkfN4
   MNm98wxcKoWNiy/BFGMLmNtwwRxww64ubz+3Ze7ekTAT3WnP8V1HalycZ
   Yf50cJ7c2PrfE6mgODVMOSh15nRMaAhZ4EjsvR6ghpHON3a3/zunid8bk
   FMHTLfLYMH1Vjc/5PN/umKULsVE0jYM2C6ThQW1XFJyCajW1+27sDmbOy
   A==;
X-CSE-ConnectionGUID: oXTro9WdTd+iECYJi3iTcA==
X-CSE-MsgGUID: eJI+pImGSMeihFKst/tIrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68119031"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68119031"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 10:54:41 -0800
X-CSE-ConnectionGUID: M5GSr+dgR7KkYpnUsuODAA==
X-CSE-MsgGUID: TUG677TIR7C/kEtpTose5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199186711"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Dec 2025 10:54:39 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX268-0000000051t-2stE;
	Sat, 20 Dec 2025 18:54:36 +0000
Date: Sun, 21 Dec 2025 02:54:00 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan =?iso-8859-1?Q?S=F8rensen?= <ssorensen@roku.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/3] Bluetooth: mgmt: Add idle_timeout to configurable
 system parameters
Message-ID: <202512210227.W5Lo4AvX-lkp@intel.com>
References: <20251216092011.111208-4-ssorensen@roku.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216092011.111208-4-ssorensen@roku.com>

Hi Stefan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bluetooth/master]
[also build test WARNING on linus/master v6.19-rc1]
[cannot apply to bluetooth-next/master next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-S-rensen/Bluetooth-hci_conn-use-mod_delayed_work-for-active-mode-timeout/20251216-172823
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
patch link:    https://lore.kernel.org/r/20251216092011.111208-4-ssorensen%40roku.com
patch subject: [PATCH 3/3] Bluetooth: mgmt: Add idle_timeout to configurable system parameters
config: sparc-randconfig-r131-20251217 (https://download.01.org/0day-ci/archive/20251221/202512210227.W5Lo4AvX-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210227.W5Lo4AvX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210227.W5Lo4AvX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/bluetooth/mgmt_config.c:127:17: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] type @@     got restricted __le32 [usertype] @@
   net/bluetooth/mgmt_config.c:127:17: sparse:     expected restricted __le16 [usertype] type
   net/bluetooth/mgmt_config.c:127:17: sparse:     got restricted __le32 [usertype]
>> net/bluetooth/mgmt_config.c:127:17: sparse: sparse: cast truncates bits from constant value (20000000 becomes 0)

vim +127 net/bluetooth/mgmt_config.c

    13	
    14	#define HDEV_PARAM_U32(_param_name_) \
    15		struct {\
    16			struct mgmt_tlv_hdr entry; \
    17			__le32 value; \
    18		} __packed _param_name_
    19	
    20	#define HDEV_PARAM_U16(_param_name_) \
    21		struct {\
    22			struct mgmt_tlv_hdr entry; \
    23			__le16 value; \
    24		} __packed _param_name_
    25	
    26	#define HDEV_PARAM_U8(_param_name_) \
    27		struct {\
    28			struct mgmt_tlv_hdr entry; \
    29			__u8 value; \
    30		} __packed _param_name_
    31	
    32	#define TLV_SET_U16(_param_code_, _param_name_) \
    33		{ \
    34			{ cpu_to_le16(_param_code_), sizeof(__u16) }, \
    35			cpu_to_le16(hdev->_param_name_) \
    36		}
    37	
    38	#define TLV_SET_U32(_param_code_, _param_name_) \
    39		{ \
    40			{ cpu_to_le32(_param_code_), sizeof(__u32) }, \
    41			cpu_to_le32(hdev->_param_name_) \
    42		}
    43	
    44	#define TLV_SET_U8(_param_code_, _param_name_) \
    45		{ \
    46			{ cpu_to_le16(_param_code_), sizeof(__u8) }, \
    47			hdev->_param_name_ \
    48		}
    49	
    50	#define TLV_SET_U16_JIFFIES_TO_MSECS(_param_code_, _param_name_) \
    51		{ \
    52			{ cpu_to_le16(_param_code_), sizeof(__u16) }, \
    53			cpu_to_le16(jiffies_to_msecs(hdev->_param_name_)) \
    54		}
    55	
    56	int read_def_system_config(struct sock *sk, struct hci_dev *hdev, void *data,
    57				   u16 data_len)
    58	{
    59		int ret;
    60		struct mgmt_rp_read_def_system_config {
    61			/* Please see mgmt-api.txt for documentation of these values */
    62			HDEV_PARAM_U16(def_page_scan_type);
    63			HDEV_PARAM_U16(def_page_scan_int);
    64			HDEV_PARAM_U16(def_page_scan_window);
    65			HDEV_PARAM_U16(def_inq_scan_type);
    66			HDEV_PARAM_U16(def_inq_scan_int);
    67			HDEV_PARAM_U16(def_inq_scan_window);
    68			HDEV_PARAM_U16(def_br_lsto);
    69			HDEV_PARAM_U16(def_page_timeout);
    70			HDEV_PARAM_U16(sniff_min_interval);
    71			HDEV_PARAM_U16(sniff_max_interval);
    72			HDEV_PARAM_U16(le_adv_min_interval);
    73			HDEV_PARAM_U16(le_adv_max_interval);
    74			HDEV_PARAM_U16(def_multi_adv_rotation_duration);
    75			HDEV_PARAM_U16(le_scan_interval);
    76			HDEV_PARAM_U16(le_scan_window);
    77			HDEV_PARAM_U16(le_scan_int_suspend);
    78			HDEV_PARAM_U16(le_scan_window_suspend);
    79			HDEV_PARAM_U16(le_scan_int_discovery);
    80			HDEV_PARAM_U16(le_scan_window_discovery);
    81			HDEV_PARAM_U16(le_scan_int_adv_monitor);
    82			HDEV_PARAM_U16(le_scan_window_adv_monitor);
    83			HDEV_PARAM_U16(le_scan_int_connect);
    84			HDEV_PARAM_U16(le_scan_window_connect);
    85			HDEV_PARAM_U16(le_conn_min_interval);
    86			HDEV_PARAM_U16(le_conn_max_interval);
    87			HDEV_PARAM_U16(le_conn_latency);
    88			HDEV_PARAM_U16(le_supv_timeout);
    89			HDEV_PARAM_U16(def_le_autoconnect_timeout);
    90			HDEV_PARAM_U16(advmon_allowlist_duration);
    91			HDEV_PARAM_U16(advmon_no_filter_duration);
    92			HDEV_PARAM_U8(enable_advmon_interleave_scan);
    93			HDEV_PARAM_U32(idle_timeout);
    94		} __packed rp = {
    95			TLV_SET_U16(0x0000, def_page_scan_type),
    96			TLV_SET_U16(0x0001, def_page_scan_int),
    97			TLV_SET_U16(0x0002, def_page_scan_window),
    98			TLV_SET_U16(0x0003, def_inq_scan_type),
    99			TLV_SET_U16(0x0004, def_inq_scan_int),
   100			TLV_SET_U16(0x0005, def_inq_scan_window),
   101			TLV_SET_U16(0x0006, def_br_lsto),
   102			TLV_SET_U16(0x0007, def_page_timeout),
   103			TLV_SET_U16(0x0008, sniff_min_interval),
   104			TLV_SET_U16(0x0009, sniff_max_interval),
   105			TLV_SET_U16(0x000a, le_adv_min_interval),
   106			TLV_SET_U16(0x000b, le_adv_max_interval),
   107			TLV_SET_U16(0x000c, def_multi_adv_rotation_duration),
   108			TLV_SET_U16(0x000d, le_scan_interval),
   109			TLV_SET_U16(0x000e, le_scan_window),
   110			TLV_SET_U16(0x000f, le_scan_int_suspend),
   111			TLV_SET_U16(0x0010, le_scan_window_suspend),
   112			TLV_SET_U16(0x0011, le_scan_int_discovery),
   113			TLV_SET_U16(0x0012, le_scan_window_discovery),
   114			TLV_SET_U16(0x0013, le_scan_int_adv_monitor),
   115			TLV_SET_U16(0x0014, le_scan_window_adv_monitor),
   116			TLV_SET_U16(0x0015, le_scan_int_connect),
   117			TLV_SET_U16(0x0016, le_scan_window_connect),
   118			TLV_SET_U16(0x0017, le_conn_min_interval),
   119			TLV_SET_U16(0x0018, le_conn_max_interval),
   120			TLV_SET_U16(0x0019, le_conn_latency),
   121			TLV_SET_U16(0x001a, le_supv_timeout),
   122			TLV_SET_U16_JIFFIES_TO_MSECS(0x001b,
   123						     def_le_autoconnect_timeout),
   124			TLV_SET_U16(0x001d, advmon_allowlist_duration),
   125			TLV_SET_U16(0x001e, advmon_no_filter_duration),
   126			TLV_SET_U8(0x001f, enable_advmon_interleave_scan),
 > 127			TLV_SET_U32(0x0020, idle_timeout),
   128		};
   129	
   130		bt_dev_dbg(hdev, "sock %p", sk);
   131	
   132		ret = mgmt_cmd_complete(sk, hdev->id,
   133					MGMT_OP_READ_DEF_SYSTEM_CONFIG,
   134					0, &rp, sizeof(rp));
   135		return ret;
   136	}
   137	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
