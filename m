Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD7022B8CF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 10:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752749; cv=none; b=Z9bl3y/nR7iOdi1/kzBpAha7TWgJOrCbhMevakvKhP7y/7xOKPRVuNoDN46aleLQ960C3JJG5MAumYwuEXbSF8glzznCaXQlhvwatX8xZU1BVTYzNX+6hHCrW2IKfYJ7BBNIgE44noS7ZWON6Ej/+QEz66emvJGN6FjxRg6QbVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752749; c=relaxed/simple;
	bh=ZogsLWgiS3RD3VgPgTt1gxFT8G4W6CFvkPrY4f+UFQs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SOm9X7jK1qa0Pk3eAFjB6BcbwWc9WM7RryudsU8EA3feJeC0InMV1fkcvs8g+yEE+iI/WuACYpWmH+X2GryZuMSy8N0bALVIjGeP4BNJCoJxTBvfXRJF9RPWk/5rlatxVXbbQQtcMZt3h/13MOKD6/sIXmxuUK0QD2I3UQQqJiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AFwdkohT; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AFwdkohT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738752747; x=1770288747;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZogsLWgiS3RD3VgPgTt1gxFT8G4W6CFvkPrY4f+UFQs=;
  b=AFwdkohTiVwbjjeleTiEZ91lDoL1ZGoKO/IGhaj0QORD6Z3oh+YGi333
   WO0w829BD+80/bB+UQznavck6j1YbqryZagELLU6DT3bhhliOe2Fe4W/n
   5+GIc55SkvvnqQWDeUROH/eWicfCuOdXSwkoDssDsmjwFcBFcS+wbDcE7
   X8kEBufWl637ugsif0pONpXtL1GgCozpANCMlbj9ybuF4vAj1gF/af2wQ
   xgRA1xBzCsnffP/6cFv0qhu45GkeNXUiHhbOsRIdZcNc6dol72n56Xz0h
   2MiFGxOrwJApn5fPUY4IvVQq4f7DXWJmwjVjdP7XjWYM2hKhjfcY4WbZI
   A==;
X-CSE-ConnectionGUID: oFMxJbhkSpmHSzIOiamxaw==
X-CSE-MsgGUID: ldZU9DLkQVOBy708dmp5xQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39423650"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39423650"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 02:52:26 -0800
X-CSE-ConnectionGUID: 49MBORU9S3q3szTz1xMalg==
X-CSE-MsgGUID: zvaucGqQQnWK9x+lRfXuvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111751084"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Feb 2025 02:52:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfd14-000tnP-18;
	Wed, 05 Feb 2025 10:52:22 +0000
Date: Wed, 5 Feb 2025 18:51:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 192/192]
 drivers/soc/mediatek/mtk-dvfsrc.c:139:5: warning: no previous prototype for
 'dvfsrc_get_required_opp_peak_bw'
Message-ID: <202502051807.CWTMRN3E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   1b7d37693f7bd7e9f37c02d15753e16b5bac8c79
commit: 4014ffff6b44438619d705ef34f0829617760be3 [192/192] CHROMIUM: soc: mediatek: vcore dvfs: add vcore dvfs driver
config: arm64-randconfig-001-20250205 (https://download.01.org/0day-ci/archive/20250205/202502051807.CWTMRN3E-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502051807.CWTMRN3E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502051807.CWTMRN3E-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/mediatek/mtk-dvfsrc.c:139:5: warning: no previous prototype for 'dvfsrc_get_required_opp_peak_bw' [-Wmissing-prototypes]
     139 | u32 dvfsrc_get_required_opp_peak_bw(struct device_node *np, int index)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/dvfsrc_get_required_opp_peak_bw +139 drivers/soc/mediatek/mtk-dvfsrc.c

   124	
   125	#ifdef DVFSRC_OPP_BW_QUERY
   126	u32 dram_type;
   127	static inline struct device_node *dvfsrc_parse_required_opp(
   128		struct device_node *np, int index)
   129	{
   130		struct device_node *required_np;
   131	
   132		required_np = of_parse_phandle(np, "required-opps", index);
   133		if (unlikely(!required_np)) {
   134			pr_notice("%s: Unable to parse required-opps: %pOF, index: %d\n",
   135			       __func__, np, index);
   136		}
   137		return required_np;
   138	}
 > 139	u32 dvfsrc_get_required_opp_peak_bw(struct device_node *np, int index)
   140	{
   141		struct device_node *required_np;
   142		u32 peak_bw = 0;
   143	
   144		required_np = dvfsrc_parse_required_opp(np, index);
   145		if (!required_np)
   146			return 0;
   147	
   148		if (of_property_read_u32_index(required_np, "opp-peak-KBps", dram_type, &peak_bw))
   149			pr_info("%s: get fail\n", __func__);
   150	
   151		of_node_put(required_np);
   152		return peak_bw;
   153	}
   154	EXPORT_SYMBOL(dvfsrc_get_required_opp_peak_bw);
   155	#endif
   156	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
