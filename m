Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC5AEBB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Dec 2023 02:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lsXUpGJ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703385705; x=1734921705;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zpnaxh2S5V4wy8Oh1j9CjCMp+UqW/8+0sHQVy5TrO+M=;
  b=lsXUpGJ0p3bb5YbzFwD2QEN+N8Pu4VPmoI/RwM/V8311bf5w3OLqHKU7
   vEg1mY2rDgKFEOpIB6coI3wJNFAQeAn+Ra/xhUsio3JDqI+blbeejugRO
   r9nrBpW+Skat0QefjytQ14SWmpTLCrlYbL7wecp7Aeu/Oe3lvhai7xUPG
   M4SbN29BDM7InhqD18BIT4Xi6pSZoZbc/gqY5Jn+hXLbMgCYfQkKEU5G7
   26ABjNsJLhEwcka6cYt5iAk3ATHzVUIfUxdoy/caIQFKTqFWD0DVIMESS
   oKxHu54eZ9TU5ei3Yv/k7d269yn8niSW9aOFn45FbPU6cVupvdV66cb2F
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10933"; a="395110319"
X-IronPort-AV: E=Sophos;i="6.04,300,1695711600"; 
   d="scan'208";a="395110319"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2023 18:41:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10933"; a="780960891"
X-IronPort-AV: E=Sophos;i="6.04,300,1695711600"; 
   d="scan'208";a="780960891"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 23 Dec 2023 18:41:42 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHEQr-000Blp-2F;
	Sun, 24 Dec 2023 02:41:38 +0000
Date: Sun, 24 Dec 2023 10:41:03 +0800
From: kernel test robot <lkp@intel.com>
To: Karol Kolacinski <karol.kolacinski@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 iwl-next 2/6] ice: pass reset type to PTP reset
 functions
Message-ID: <202312241030.d91jNt1Y-lkp@intel.com>
References: <20231220104323.974456-3-karol.kolacinski@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231220104323.974456-3-karol.kolacinski@intel.com>

Hi Karol,

kernel test robot noticed the following build errors:

[auto build test ERROR on 087c173e92424354672c296f7164232aa3380bbd]

url:    https://github.com/intel-lab-lkp/linux/commits/Karol-Kolacinski/ice-introduce-PTP-state-machine/20231222-180412
base:   087c173e92424354672c296f7164232aa3380bbd
patch link:    https://lore.kernel.org/r/20231220104323.974456-3-karol.kolacinski%40intel.com
patch subject: [PATCH v3 iwl-next 2/6] ice: pass reset type to PTP reset functions
config: riscv-randconfig-002-20231224 (https://download.01.org/0day-ci/archive/20231224/202312241030.d91jNt1Y-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231224/202312241030.d91jNt1Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312241030.d91jNt1Y-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/ice/ice.h:69,
                    from drivers/net/ethernet/intel/ice/ice_common.h:9,
                    from drivers/net/ethernet/intel/ice/ice_common.c:4:
>> drivers/net/ethernet/intel/ice/ice_ptp.h:350:1: error: version control conflict marker in file
     350 | <<<<<<< HEAD
         | ^~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp.h:361:1: error: version control conflict marker in file
     361 | =======
         | ^~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp.h:365:20: error: conflicting types for 'ice_ptp_reset'; have 'void(struct ice_pf *, enum ice_reset_req)'
     365 | static inline void ice_ptp_reset(struct ice_pf *pf,
         |                    ^~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp.h:359:20: note: previous definition of 'ice_ptp_reset' with type 'void(struct ice_pf *)'
     359 | static inline void ice_ptp_reset(struct ice_pf *pf) { }
         |                    ^~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp.h:370:20: error: conflicting types for 'ice_ptp_prepare_for_reset'; have 'void(struct ice_pf *, enum ice_reset_req)'
     370 | static inline void ice_ptp_prepare_for_reset(struct ice_pf *pf,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp.h:360:20: note: previous definition of 'ice_ptp_prepare_for_reset' with type 'void(struct ice_pf *)'
     360 | static inline void ice_ptp_prepare_for_reset(struct ice_pf *pf) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp.h:374:1: error: version control conflict marker in file
     374 | >>>>>>> 86982aff2a40 (ice: pass reset type to PTP reset functions)
         | ^~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp.h:374:9: error: invalid suffix "aff2a40" on integer constant
     374 | >>>>>>> 86982aff2a40 (ice: pass reset type to PTP reset functions)
         |         ^~~~~~~~~~~~
--
   In file included from drivers/net/ethernet/intel/ice/ice.h:69,
                    from drivers/net/ethernet/intel/ice/ice_base.h:7,
                    from drivers/net/ethernet/intel/ice/ice_base.c:5:
>> drivers/net/ethernet/intel/ice/ice_ptp.h:350:1: error: version control conflict marker in file
     350 | <<<<<<< HEAD
         | ^~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp.h:361:1: error: version control conflict marker in file
     361 | =======
         | ^~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp.h:365:20: error: conflicting types for 'ice_ptp_reset'; have 'void(struct ice_pf *, enum ice_reset_req)'
     365 | static inline void ice_ptp_reset(struct ice_pf *pf,
         |                    ^~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp.h:359:20: note: previous definition of 'ice_ptp_reset' with type 'void(struct ice_pf *)'
     359 | static inline void ice_ptp_reset(struct ice_pf *pf) { }
         |                    ^~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp.h:370:20: error: conflicting types for 'ice_ptp_prepare_for_reset'; have 'void(struct ice_pf *, enum ice_reset_req)'
     370 | static inline void ice_ptp_prepare_for_reset(struct ice_pf *pf,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp.h:360:20: note: previous definition of 'ice_ptp_prepare_for_reset' with type 'void(struct ice_pf *)'
     360 | static inline void ice_ptp_prepare_for_reset(struct ice_pf *pf) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp.h:374:1: error: version control conflict marker in file
     374 | >>>>>>> 86982aff2a40 (ice: pass reset type to PTP reset functions)
         | ^~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp.h:374:9: error: invalid suffix "aff2a40" on integer constant
     374 | >>>>>>> 86982aff2a40 (ice: pass reset type to PTP reset functions)
         |         ^~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_base.c: In function 'ice_xsk_pool_fill_cb':
   drivers/net/ethernet/intel/ice/ice_base.c:525:16: error: variable 'desc' has initializer but incomplete type
     525 |         struct xsk_cb_desc desc = {};
         |                ^~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_base.c:525:28: error: storage size of 'desc' isn't known
     525 |         struct xsk_cb_desc desc = {};
         |                            ^~~~
   drivers/net/ethernet/intel/ice/ice_base.c:525:28: warning: unused variable 'desc' [-Wunused-variable]
--
   In file included from drivers/net/ethernet/intel/ice/ice.h:69,
                    from drivers/net/ethernet/intel/ice/ice_txrx_lib.h:6,
                    from drivers/net/ethernet/intel/ice/ice_txrx_lib.c:6:
>> drivers/net/ethernet/intel/ice/ice_ptp.h:350:1: error: version control conflict marker in file
     350 | <<<<<<< HEAD
         | ^~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp.h:361:1: error: version control conflict marker in file
     361 | =======
         | ^~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp.h:365:20: error: conflicting types for 'ice_ptp_reset'; have 'void(struct ice_pf *, enum ice_reset_req)'
     365 | static inline void ice_ptp_reset(struct ice_pf *pf,
         |                    ^~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp.h:359:20: note: previous definition of 'ice_ptp_reset' with type 'void(struct ice_pf *)'
     359 | static inline void ice_ptp_reset(struct ice_pf *pf) { }
         |                    ^~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp.h:370:20: error: conflicting types for 'ice_ptp_prepare_for_reset'; have 'void(struct ice_pf *, enum ice_reset_req)'
     370 | static inline void ice_ptp_prepare_for_reset(struct ice_pf *pf,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp.h:360:20: note: previous definition of 'ice_ptp_prepare_for_reset' with type 'void(struct ice_pf *)'
     360 | static inline void ice_ptp_prepare_for_reset(struct ice_pf *pf) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp.h:374:1: error: version control conflict marker in file
     374 | >>>>>>> 86982aff2a40 (ice: pass reset type to PTP reset functions)
         | ^~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp.h:374:9: error: invalid suffix "aff2a40" on integer constant
     374 | >>>>>>> 86982aff2a40 (ice: pass reset type to PTP reset functions)
         |         ^~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_txrx_lib.c: In function 'ice_ptp_rx_hwts_to_skb':
>> drivers/net/ethernet/intel/ice/ice_txrx_lib.c:200:21: error: implicit declaration of function 'ice_ptp_get_rx_hwts'; did you mean 'ice_get_rx_hash'? [-Werror=implicit-function-declaration]
     200 |         u64 ts_ns = ice_ptp_get_rx_hwts(rx_desc, &rx_ring->pkt_ctx);
         |                     ^~~~~~~~~~~~~~~~~~~
         |                     ice_get_rx_hash
   cc1: some warnings being treated as errors
--
   In file included from drivers/net/ethernet/intel/ice/ice.h:69,
                    from drivers/net/ethernet/intel/ice/ice_main.c:10:
>> drivers/net/ethernet/intel/ice/ice_ptp.h:350:1: error: version control conflict marker in file
     350 | <<<<<<< HEAD
         | ^~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp.h:361:1: error: version control conflict marker in file
     361 | =======
         | ^~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp.h:365:20: error: conflicting types for 'ice_ptp_reset'; have 'void(struct ice_pf *, enum ice_reset_req)'
     365 | static inline void ice_ptp_reset(struct ice_pf *pf,
         |                    ^~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp.h:359:20: note: previous definition of 'ice_ptp_reset' with type 'void(struct ice_pf *)'
     359 | static inline void ice_ptp_reset(struct ice_pf *pf) { }
         |                    ^~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp.h:370:20: error: conflicting types for 'ice_ptp_prepare_for_reset'; have 'void(struct ice_pf *, enum ice_reset_req)'
     370 | static inline void ice_ptp_prepare_for_reset(struct ice_pf *pf,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp.h:360:20: note: previous definition of 'ice_ptp_prepare_for_reset' with type 'void(struct ice_pf *)'
     360 | static inline void ice_ptp_prepare_for_reset(struct ice_pf *pf) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp.h:374:1: error: version control conflict marker in file
     374 | >>>>>>> 86982aff2a40 (ice: pass reset type to PTP reset functions)
         | ^~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp.h:374:9: error: invalid suffix "aff2a40" on integer constant
     374 | >>>>>>> 86982aff2a40 (ice: pass reset type to PTP reset functions)
         |         ^~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_main.c: In function 'ice_init_features':
>> drivers/net/ethernet/intel/ice/ice_main.c:4800:17: error: implicit declaration of function 'ice_ptp_init'; did you mean 'ice_dpll_init'? [-Werror=implicit-function-declaration]
    4800 |                 ice_ptp_init(pf);
         |                 ^~~~~~~~~~~~
         |                 ice_dpll_init
   cc1: some warnings being treated as errors


vim +350 drivers/net/ethernet/intel/ice/ice_ptp.h

   345	
   346	static inline bool ice_ptp_process_ts(struct ice_pf *pf)
   347	{
   348		return true;
   349	}
 > 350	<<<<<<< HEAD
   351	
   352	static inline u64
   353	ice_ptp_get_rx_hwts(const union ice_32b_rx_flex_desc *rx_desc,
   354			    const struct ice_pkt_ctx *pkt_ctx)
   355	{
   356		return 0;
   357	}
   358	
   359	static inline void ice_ptp_reset(struct ice_pf *pf) { }
   360	static inline void ice_ptp_prepare_for_reset(struct ice_pf *pf) { }
 > 361	=======
   362	static inline void
   363	ice_ptp_rx_hwtstamp(struct ice_rx_ring *rx_ring,
   364			    union ice_32b_rx_flex_desc *rx_desc, struct sk_buff *skb) { }
   365	static inline void ice_ptp_reset(struct ice_pf *pf,
   366					 enum ice_reset_req reset_type)
   367	{
   368	}
   369	
 > 370	static inline void ice_ptp_prepare_for_reset(struct ice_pf *pf,
   371						     enum ice_reset_req reset_type)
   372	{
   373	}
 > 374	>>>>>>> 86982aff2a40 (ice: pass reset type to PTP reset functions)
   375	static inline void ice_ptp_init(struct ice_pf *pf) { }
   376	static inline void ice_ptp_release(struct ice_pf *pf) { }
   377	static inline void ice_ptp_link_change(struct ice_pf *pf, u8 port, bool linkup)
   378	{
   379	}
   380	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
