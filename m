Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83104BA4B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 10:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727432657; cv=none; b=jVhPa6XCI8kQz/hjc2+8GUvXV8ZlHtJI8/iGsv46MV1t9sV3FxmRv3crJdgmvbNMLBE721mAvLmwdohz+71zEDLZLGX8HjIoCJIZYJfvTt5+YiZEoKAKF/Zo9ZIP+ZoSvHkmbsfMxMZMI3KG9vROS6yJlXWw0QAhJBulyd2NGhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727432657; c=relaxed/simple;
	bh=TdRanNICpusWjId+FRryVPNGPZ0gz8enLidiqMip3kQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oBC48Q1wFRVReJfdoxmQODxwK2l/JBSEH0PDXER43cliMoscL+dDthu0ku5U55gBCHugLP2+pw58l+5Qgy7KSYoZqFuRcPjAbHFuLUXc0U/AisG0pQX2s8ydSdXA3plhQfbSzzzSCgL2dUUx32Yr8xXSzSKkkcte2ptOy81JqGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aT/1lnUx; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aT/1lnUx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727432655; x=1758968655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TdRanNICpusWjId+FRryVPNGPZ0gz8enLidiqMip3kQ=;
  b=aT/1lnUxBxNFNArXIESeMARrNA83VWfvrv7JM5Sc88jU7mRs8sP+1hRB
   4mag52RuL/NjYJfe/0C6cQ32LHRoAA3Ww953t6Ssd+XqoMmiE1Fzk+phV
   PVLr3jSvhFmiLZHgrSFWjQktEBAENr4WECJClpFaC/hKEvoNwU/sUjJnE
   NeZLAWMEtCeC3CwPZNsscZ3SC20dvkv55Qn89Ic8CUkYJsazI9ulnFsUC
   KybJw7urbtCc2V0Rghc53rbG4g0EC1Mj3VgXKEaSlpnry8qt2/Ne5ihWC
   9soW/jee/8ClrcPOgcR0ZQX0waM5frXhp3cwLyu75K2nXp+cv7OsJFu0V
   A==;
X-CSE-ConnectionGUID: N8bP5FMLQUm2MqiwKcRjxg==
X-CSE-MsgGUID: Q59QyRvHRZaTXkc4dGragg==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26518287"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="26518287"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 03:24:13 -0700
X-CSE-ConnectionGUID: 0DScayLtScqMvw5kj+7Ohw==
X-CSE-MsgGUID: NDknpu/5SG2oGj2WgVpKpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="77433976"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Sep 2024 03:24:11 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su88v-000Lnr-1N;
	Fri, 27 Sep 2024 10:24:09 +0000
Date: Fri, 27 Sep 2024 18:23:34 +0800
From: kernel test robot <lkp@intel.com>
To: Katta Dhanunjanrao <katta.dhanunjanrao@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 542/1001]
 drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:41:31: warning: cast to
 pointer from integer of different size
Message-ID: <202409271853.VwuuS9Kd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: 1514aa2c09d4769c971f314e70fd21418547463e [542/1001] drm: xlnx: dptx: Add HDCP1x support for DPTx subsystem
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240927/202409271853.VwuuS9Kd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271853.VwuuS9Kd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409271853.VwuuS9Kd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/little_endian.h:14,
                    from include/linux/byteorder/little_endian.h:5,
                    from arch/x86/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/x86/include/asm/bitops.h:428,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:22,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/current.h:10,
                    from include/linux/sched.h:12,
                    from include/linux/uaccess.h:8,
                    from drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:12:
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c: In function 'xdptx_hdcp1x_keymgmt_set_key':
>> drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:41:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      41 | #define ntohll(x) be64_to_cpu((__be64 *)x)
         |                               ^
   include/uapi/linux/swab.h:128:54: note: in definition of macro '__swab64'
     128 | #define __swab64(x) (__u64)__builtin_bswap64((__u64)(x))
         |                                                      ^
   include/linux/byteorder/generic.h:93:21: note: in expansion of macro '__be64_to_cpu'
      93 | #define be64_to_cpu __be64_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:286:45: note: in expansion of macro 'ntohll'
     286 |                 key_table.data_u64[index] = ntohll(key_table.data_u64[index]);
         |                                             ^~~~~~
>> include/uapi/linux/byteorder/little_endian.h:39:50: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                                                  ^
   include/uapi/linux/swab.h:128:54: note: in definition of macro '__swab64'
     128 | #define __swab64(x) (__u64)__builtin_bswap64((__u64)(x))
         |                                                      ^
   include/linux/byteorder/generic.h:93:21: note: in expansion of macro '__be64_to_cpu'
      93 | #define be64_to_cpu __be64_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:41:19: note: in expansion of macro 'be64_to_cpu'
      41 | #define ntohll(x) be64_to_cpu((__be64 *)x)
         |                   ^~~~~~~~~~~
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:286:45: note: in expansion of macro 'ntohll'
     286 |                 key_table.data_u64[index] = ntohll(key_table.data_u64[index]);
         |                                             ^~~~~~


vim +41 drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c

    28	
    29	#define HDCP1X_KEYMGMT_REG_CTRL_RST_MASK	BIT(31)
    30	#define HDCP1X_KEYMGMT_REG_CTRL_DISABLE_MASK	GENMASK(31, 1)
    31	#define HDCP1X_KEYMGMT_REG_CTRL_ENABLE_MASK	BIT(0)
    32	#define HDCP1X_KEYMGMT_REG_TBL_STATUS_RETRY	0x400
    33	#define HDCP1X_KEYMGMT_TBLID_0			0
    34	#define HDCP1X_KEYMGMT_REG_TBL_CTRL_WR_MASK	BIT(0)
    35	#define HDCP1X_KEYMGMT_REG_TBL_CTRL_RD_MASK	BIT(1)
    36	#define HDCP1X_KEYMGMT_REG_TBL_CTRL_EN_MASK	BIT(31)
    37	#define HDCP1X_KEYMGMT_REG_TBL_STATUS_DONE_MASK	BIT(0)
    38	#define HDCP1X_KEYMGMT_MAX_TBLS			8
    39	#define HDCP1X_KEYS_SIZE			336
    40	#define HDCP1X_KEYMGMT_MAX_ROWS_PER_TBL		41
  > 41	#define ntohll(x) be64_to_cpu((__be64 *)x)
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
