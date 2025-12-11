Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7C71519B4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 00:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765411275; cv=none; b=nn3K3mS207VDnNWyitIpYz1415oiolwNf12/Bduj10nAAo5hqZ8dQ0mdfD5iZZ/DUXJZ7p09+D9Ywmy7Xow2kVjGddmV9SOBBz5UW5JbeUlZUiW5e0tJCUvvAJgFA9sRvafuugD2kmHEBfLU7aCMzGV+y3cSvYN/DtbrO8SHNpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765411275; c=relaxed/simple;
	bh=UWNtHqAD3jkDsrMBc/TRcfyj0mBpFNi/DnY6IkkEeTs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V4BzhDq1sS16hiNoNF8HYy5x63ppsNMnr0k4bzEEOCZgjTQGnGZOwHc24hneljuP2RzlkqdryT2P5Fw8Zwd9RSNl6TbelhHGXyQu9jhjtmMxNIvOt7KILuuw4ZVRWj0nuBa5LAK5MX1Rt9Ww3g91oJFTiGbgc1Q9GovdkXyn+iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GlXQnbrq; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GlXQnbrq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765411272; x=1796947272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UWNtHqAD3jkDsrMBc/TRcfyj0mBpFNi/DnY6IkkEeTs=;
  b=GlXQnbrq4V+RWS86ngDgWGM+KDNYGAYPEPjxokz8jG40QuUHPIQfvMcw
   Nx/4RgB1LeeQwEyRvbkBcH/s1gliNQVhRIJiOs7f9EYSKsCUqXJhDjA90
   Y1gmWzaAFOOEzJGZWNr2MxE/tg+D64YQckP/YA9xyJJbrnPkwitaYUcDQ
   P9LklwyUXEWjjlp7eVOsBd1IpI9NJVnxrFv6bpxNwBm+Fc1wSSVHpGSVP
   xUwqnHLWT76dGChJBRqC2nAK7Ji3kPQU4/yb70sUWtrEPs5Ct8zco/BSX
   urTPJeT/uP+a/Gi66yAXYH8wAPOtlSsrJjtuYPEgeukh4xujfok8FYKY0
   Q==;
X-CSE-ConnectionGUID: mGAhlVJrR6usRSNapvTDxA==
X-CSE-MsgGUID: mWpDNLuHSn65IthyTeNbTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="90036661"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="90036661"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 16:01:11 -0800
X-CSE-ConnectionGUID: QZHBIUsnS2OG16FtvtI+mQ==
X-CSE-MsgGUID: oqGXx1BWQ7WqHJmnPA5t7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="197138222"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Dec 2025 16:01:10 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTU7H-000000003tS-42YS;
	Thu, 11 Dec 2025 00:01:07 +0000
Date: Thu, 11 Dec 2025 08:00:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Guo <guoyongqiang12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3508/3508]
 drivers/ub/urma/ubcore/ubcm/ubcm_genl.c:98:20: sparse: sparse: symbol
 'g_ubcm_genl_family' was not declared. Should it be static?
Message-ID: <202512110717.yxbCknCT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d281438782e3c28a3df71a64513a3312d43dcf01
commit: e34a52d4eed8912f6dfdc7d68152c45f7a071ca8 [3508/3508] ubcore: implement ubcore connection management and messaging feature.
config: arm64-randconfig-r112-20251210 (https://download.01.org/0day-ci/archive/20251211/202512110717.yxbCknCT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110717.yxbCknCT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110717.yxbCknCT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/ub/urma/ubcore/ubcm/ubcm_genl.c:98:20: sparse: sparse: symbol 'g_ubcm_genl_family' was not declared. Should it be static?

vim +/g_ubcm_genl_family +98 drivers/ub/urma/ubcore/ubcm/ubcm_genl.c

    97	
  > 98	struct genl_family g_ubcm_genl_family __ro_after_init = {
    99		.hdrsize = 0,
   100		.name = UBCM_GENL_FAMILY_NAME,
   101		.version = UBCM_GENL_FAMILY_VERSION,
   102		.maxattr = UBCM_ATTR_MAX,
   103		.policy = g_ubcm_policy,
   104	
   105		.resv_start_op = UBCM_CMD_NUM,
   106	
   107		.netnsok = true,
   108		.module = THIS_MODULE,
   109		.ops = g_ubcm_genl_ops,
   110		.n_ops = ARRAY_SIZE(g_ubcm_genl_ops)
   111	};
   112	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
