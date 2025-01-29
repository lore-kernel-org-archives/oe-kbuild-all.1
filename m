Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE6B1922DC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jan 2025 05:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738129402; cv=none; b=Fc1SsDozRQqS2HEKEh2F904/TQ0XOTYGXujiWdjjMsH/arvPsDca0KnhvNgja3X6Sl6uWPSl3gwUi8lN7LYHEaMiSX9ScGE+vEOz7AKhiTIu4+v0LNYh+e2bTrTCrQpaCGe943h9udoEEi/pD7cHSkIO1XfZ105PVk8tNV67uFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738129402; c=relaxed/simple;
	bh=u3Mq2leE207T+MCRi8hm4uQv+Bu1VCdgmD2R9SWE63o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KWWJ1UViGP6vKBvF4Za9Dbk+hf9vZUOGGLFS2SQhGY+WQWe+4W2DX6pJHL2VPxA4fku9tiKrUyiCdwz3JieVqxbuDgYS/dYfLfP8jEDTkK+cHdIx6mMxYjAAvf+/WBkNvjPqnD3Xm9bzn5sDyLfpmcM+SSsherbTuANeut/rUco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TuMTNTyQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TuMTNTyQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738129400; x=1769665400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u3Mq2leE207T+MCRi8hm4uQv+Bu1VCdgmD2R9SWE63o=;
  b=TuMTNTyQ/Mq4533BRl4XdTdgtrsuhZQscaCzphrjQjiG0+vA2Y0oSCSG
   cg+RbwdnR0WsRv68QELdBYqz6ai0/Yx2SeNj0lWS1NAGo7cyuukQ5OtHY
   Bkv2cvQNylN3cmun2OhZSmVQRm/aP7vs7ZfRypVtj6oldbpP/gzgRE3QS
   LY1EKFT8uP9iH98mebc7eXSV64j9cAqjGneh6b5Q9uqsKnVbgS6QZJet/
   3GHLDmFVFHqNB9AecigbEj7l4mRH50G/mA+WtsHJH4EZ/pW+Wka8ausS9
   FIl5OQ6X+UBvZba5qRIAO/UgvdWL952/EBZuf/wQSr4QYM/+kcKvK0ZOo
   g==;
X-CSE-ConnectionGUID: 6hsEaWdFQMO7+1hfgSOMUw==
X-CSE-MsgGUID: 8o5uDbivQQq3f+JV7Hfbyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="42385033"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="42385033"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 21:43:19 -0800
X-CSE-ConnectionGUID: LjfEaBThThqRPx/HyW98jA==
X-CSE-MsgGUID: e0o27ndfSoW3BnJBhBBblw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="108831871"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Jan 2025 21:43:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1td0r6-000idn-08;
	Wed, 29 Jan 2025 05:43:16 +0000
Date: Wed, 29 Jan 2025 13:42:48 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 137/246]
 drivers/gpu/drm/apple/dptxep.c:204:26: sparse: sparse: cast from restricted
 __le64
Message-ID: <202501291313.39IxIFsN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   09b61104494bf97a1f57e4b6a55ec8a96bb380c5
commit: fbedba4e07de7b88496faab0f48276579adfbbdf [137/246] drm: apple: dptx: Add set_active_lanes APCALL
config: arm64-randconfig-r121-20250129 (https://download.01.org/0day-ci/archive/20250129/202501291313.39IxIFsN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250129/202501291313.39IxIFsN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501291313.39IxIFsN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/apple/dptxep.c:204:26: sparse: sparse: cast from restricted __le64
>> drivers/gpu/drm/apple/dptxep.c:204:26: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long long [usertype] lane_count @@     got restricted __le64 [usertype] @@
   drivers/gpu/drm/apple/dptxep.c:204:26: sparse:     expected unsigned long long [usertype] lane_count
   drivers/gpu/drm/apple/dptxep.c:204:26: sparse:     got restricted __le64 [usertype]

vim +204 drivers/gpu/drm/apple/dptxep.c

   188	
   189	static int dptxport_call_set_active_lane_count(struct apple_epic_service *service,
   190						       const void *data, size_t data_size,
   191						       void *reply_, size_t reply_size)
   192	{
   193		struct dptx_port *dptx = service->cookie;
   194		const struct dptxport_apcall_set_active_lane_count *request = data;
   195		struct dptxport_apcall_set_active_lane_count *reply = reply_;
   196		int ret = 0;
   197		int retcode = 0;
   198	
   199		if (reply_size < sizeof(*reply))
   200			return -1;
   201		if (data_size < sizeof(*request))
   202			return -1;
   203	
 > 204		u64 lane_count = cpu_to_le64(request->lane_count);
   205	
   206		switch (lane_count) {
   207		case 0 ... 2:
   208		case 4:
   209			dptx->phy_ops.dp.lanes = lane_count;
   210			dptx->phy_ops.dp.set_lanes = 1;
   211			break;
   212		default:
   213			dev_err(service->ep->dcp->dev, "set_active_lane_count: invalid lane count:%llu\n", lane_count);
   214			retcode = 1;
   215			lane_count = 0;
   216			break;
   217		}
   218	
   219		if (dptx->phy_ops.dp.set_lanes) {
   220			if (dptx->atcphy) {
   221				ret = phy_configure(dptx->atcphy, &dptx->phy_ops);
   222				if (ret)
   223					return ret;
   224			}
   225			dptx->phy_ops.dp.set_lanes = 0;
   226		}
   227	
   228		reply->retcode = cpu_to_le32(retcode);
   229		reply->lane_count = cpu_to_le64(lane_count);
   230	
   231		return ret;
   232	}
   233	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
