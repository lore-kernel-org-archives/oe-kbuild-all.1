Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F08D53C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 02:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736561616; cv=none; b=rEVMWRRjRWyyUbvx0azrpfNz+ks8c85r1FWlk7M3gU73xocJXERJn1RJA8tRgf5gcRDsCix77gDvtqzWj/n3TRUlW/D1x0XCRW4MCasUu7x6AlOEbYOlGzshnHjcZW2Z4qv/3Wr5gvx2WoTqFlk+yHLVzErwLBEWvmkwokWe84c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736561616; c=relaxed/simple;
	bh=rVRWQu2fzaVlqIv3GftZD79Y08bPh2MxaJafiZFPpiM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IE3pldpzQ2goKxFokdjjhZr2sxQsCPb/87Fsk0FXxw83D7EcQzvsjtvtpG+4cZEW1i/5LmyEZ423mBfbULYYMMS+/Z9Nc0MbgQNcYYT9Fb+RvEEWoofdzZbQszXXqLB0l2LF229hMjhGfoEpGxQ91gZZ1kpY2aMfX+jw/9SQsbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WpMkBnwz; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WpMkBnwz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736561615; x=1768097615;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rVRWQu2fzaVlqIv3GftZD79Y08bPh2MxaJafiZFPpiM=;
  b=WpMkBnwzSrkxzkcajb2tzUH5La7AErAlMwPEvXElCraGeF1Xt7FH3JmF
   1AOD96j4cMRMu9xs27GiioTOhHh0kDqFb+UOoJ8OLzKL1wqOwsQ26VdNB
   sCRAzRkfNLWyWPFKIjefr8A9si9jFYoIbJB1LtEcm4WQ3pbfOSh4QO+vY
   b+6+vn5uj9OAgUA9141eDv9C5DrQxZAqtozeI7SpwGC/dCWaFUlnfqba4
   3o2T46FN4aUdeb9JOfKkl7YW8DcXc0vRpSWeaOvo0cRN7C0ISkCkru30d
   Hp4Vfk3MmyuE4s2EN9scz6LgJXMW2xU7H/Ius/iBVX0GgDPAuX/KOUuri
   w==;
X-CSE-ConnectionGUID: FuCIkzOLTAOzx5U3qLH7dw==
X-CSE-MsgGUID: rN/cNyPITjWliwYhIyqmYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="37097259"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="37097259"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 18:13:34 -0800
X-CSE-ConnectionGUID: QI6XDppTStSrIE2Foh2gog==
X-CSE-MsgGUID: 6iE4nOPvSOa8oILxOiK6ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="108900358"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Jan 2025 18:13:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWR0E-000K2H-1L;
	Sat, 11 Jan 2025 02:13:30 +0000
Date: Sat, 11 Jan 2025 10:13:25 +0800
From: kernel test robot <lkp@intel.com>
To: Katta Dhanunjanrao <katta.dhanunjanrao@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:lkp_test 284/504]
 drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_tx.h:185:33: error: field 'sm_work'
 has incomplete type
Message-ID: <202501111024.58a8fEhy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 18423b91613062a236168cdd7df7a0ce5d999c9f [284/504] drm: xlnx: dptx: Add HDCP1x support for DPTx subsystem
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250111/202501111024.58a8fEhy-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111024.58a8fEhy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111024.58a8fEhy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xlnx/hdcp/xhdcp1x_tx.c:22:
>> drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_tx.h:185:33: error: field 'sm_work' has incomplete type
     185 |         struct delayed_work     sm_work;
         |                                 ^~~~~~~


vim +/sm_work +185 drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_tx.h

   153	
   154	/*
   155	 * struct xlnx_hdcp1x_config - This structure contains Hdcp1x driver
   156	 * configuration information
   157	 * @dev: device information
   158	 * @handlers: Callback handlers
   159	 * @sm_work: state machine worker
   160	 * @curr_state: current authentication state
   161	 * @prev_sate: Previous Authentication State
   162	 * @repeatervalues: The downstream repeater capabilities
   163	 * @stats: authentication status
   164	 * @hdcp1x_keymgmt_base: Key management base address
   165	 * @cipher: Pointer to cipher driver instance
   166	 * @interface_ref: Pointer to interface(DP/HDMI) driver instance
   167	 * @interface_base: Pointer to instance iomem base
   168	 * @pending_events: Evenets that are set by interface driver
   169	 * @downstreamready: To check the downstream device status ready or not
   170	 * @is_repeater: says whether downstream is repeater or receiver
   171	 * @hdcp1x_key_availble: The KMS block has key exists or not.
   172	 * @lane_count: number of lanes data to be encrypted
   173	 * @hdcp1x_key: hdcp1x key pointer
   174	 * @auth_status: first stage authentication status
   175	 * @keyinit: Key Management Block with key initiliazed properly or not
   176	 * @is_encryption_en: Encryption enbalemnet is done or not
   177	 * @is_cipher: is cipher init is done or not
   178	 * @state_helper: to store the An value temp basis
   179	 * @encryption_map: To check the encryption progress
   180	 *
   181	 */
   182	struct xlnx_hdcp1x_config {
   183		struct device *dev;
   184		struct xhdcp1x_tx_callbacks handlers;
 > 185		struct delayed_work	sm_work;
   186		enum hdcp1x_tx_state	curr_state;
   187		enum hdcp1x_tx_state	prev_state;
   188		struct xhdcp1x_tx_status stats;
   189		struct regmap *hdcp1x_keymgmt_base;
   190		void	*cipher;
   191		void	*interface_ref;
   192		void __iomem	*interface_base;
   193		u32	pending_events;
   194		u32	downstreamready;
   195		bool	is_repeater;
   196		bool	hdcp1x_key_available;
   197		u8	lane_count;
   198		u8	*hdcp1x_key;
   199		u8	auth_status;
   200		u8	keyinit;
   201		u8	is_encryption_en;
   202		u8	is_enabled;
   203		u8	is_cipher;
   204		u64	state_helper;
   205		u64	encryption_map;
   206	};
   207	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
