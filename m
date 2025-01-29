Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CA92D627
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jan 2025 09:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738144424; cv=none; b=bhYqpleSvWg/+20fcsvgSiQYvm4HSA10p+7N8cc7r8TcSClY+qWHAwfmxhhK8TmOtSGRnF2ZusfDcMwNqrdVgBSLySvaC+dQ1blbMUBIYj3rGM0y1wamVpI59BOBzECbD1InVjSBeKKpSKeGXjO87DQCPeJNF5ui2onlqlVChoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738144424; c=relaxed/simple;
	bh=Fno350lJQ3mJK0/tAdTdDd49PrLcHzuzLqgDTsRBx0g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XGLZWeHWmp1QnCTGQY+F8g5rGgRhii8OIFJajrdo4NyzJX7kuT+1OI66Y1mRuflxOlRCQITkoOL1B2lECPEQnSAUr7pD7q0OOnyqSLQXIEu3dIN+qf4Tqp8uePfpZc2rbjdu93K6tGjELhIgJGlu493OkSHiIaFB3yS6Q+zeVVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U+5gjsxL; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U+5gjsxL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738144422; x=1769680422;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fno350lJQ3mJK0/tAdTdDd49PrLcHzuzLqgDTsRBx0g=;
  b=U+5gjsxLl68rb8cUu9OuOb6Fpc8vvEE1CKpmH3ot+kJTmTgafjUe+aMq
   eFjBFexPylO44A91Cf62vu416bDBOrnXV6gI0/uTGGcsury4xl24ourVd
   /9C0azwiWSyjsfmMXDNGX5pkYU6ZsC8F3NxFS4VEVlRrT+MXE+4sPJ5yB
   1rX0xjRxj7i3As01lzMjOGLuXu4kMuEnKt8vA55+0GXvJiwYMhOgbsr0p
   MdZwzdnE0jqDE80zJvDZ1vLA32gPWGk6s9u4Ms/GizsCAtaMZHRZAP8wA
   2ttzYGdnnIzF4jpnjqhlEccnPaAMR2xcHlRK3fw/JUX2KcIUz2Tm9LDBs
   w==;
X-CSE-ConnectionGUID: fl6luYkeTBKnbixHKG3l+g==
X-CSE-MsgGUID: OZVizDbyReKK+gJFjiaWiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="56187532"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
   d="scan'208";a="56187532"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 01:53:42 -0800
X-CSE-ConnectionGUID: dsmn+3S/Tp+qYVBmHhcXmw==
X-CSE-MsgGUID: PQ3ZYvlDSMiS6tAjosx2oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="146181812"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Jan 2025 01:53:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1td4lO-000iod-2v;
	Wed, 29 Jan 2025 09:53:38 +0000
Date: Wed, 29 Jan 2025 17:52:44 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 203/246]
 drivers/gpu/drm/apple/dptxep.c:201:24: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202501291746.yn2BBQ8r-lkp@intel.com>
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
commit: c9f5627b26a25999d93160af30e62449ec20cc77 [203/246] drm: apple: dptx: Fix get_drive_settings retcode
config: arm64-randconfig-r121-20250129 (https://download.01.org/0day-ci/archive/20250129/202501291746.yn2BBQ8r-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250129/202501291746.yn2BBQ8r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501291746.yn2BBQ8r-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/apple/dptxep.c:196:18: sparse: sparse: restricted __le32 degrades to integer
>> drivers/gpu/drm/apple/dptxep.c:201:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] retcode @@     got unsigned int [usertype] lane_count @@
   drivers/gpu/drm/apple/dptxep.c:201:24: sparse:     expected restricted __le32 [usertype] retcode
   drivers/gpu/drm/apple/dptxep.c:201:24: sparse:     got unsigned int [usertype] lane_count
   drivers/gpu/drm/apple/dptxep.c:202:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] unk5 @@     got unsigned int @@
   drivers/gpu/drm/apple/dptxep.c:202:21: sparse:     expected restricted __le32 [usertype] unk5
   drivers/gpu/drm/apple/dptxep.c:202:21: sparse:     got unsigned int
   drivers/gpu/drm/apple/dptxep.c:204:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] unk7 @@     got unsigned int @@
   drivers/gpu/drm/apple/dptxep.c:204:21: sparse:     expected restricted __le32 [usertype] unk7
   drivers/gpu/drm/apple/dptxep.c:204:21: sparse:     got unsigned int
   drivers/gpu/drm/apple/dptxep.c:228:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __le32 [usertype] unk5 @@
   drivers/gpu/drm/apple/dptxep.c:228:33: sparse:     expected unsigned int
   drivers/gpu/drm/apple/dptxep.c:228:33: sparse:     got restricted __le32 [usertype] unk5
   drivers/gpu/drm/apple/dptxep.c:229:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __le32 [usertype] unk7 @@
   drivers/gpu/drm/apple/dptxep.c:229:33: sparse:     expected unsigned int
   drivers/gpu/drm/apple/dptxep.c:229:33: sparse:     got restricted __le32 [usertype] unk7
   drivers/gpu/drm/apple/dptxep.c:277:26: sparse: sparse: cast from restricted __le64
   drivers/gpu/drm/apple/dptxep.c:277:26: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long long [usertype] lane_count @@     got restricted __le64 [usertype] @@
   drivers/gpu/drm/apple/dptxep.c:277:26: sparse:     expected unsigned long long [usertype] lane_count
   drivers/gpu/drm/apple/dptxep.c:277:26: sparse:     got restricted __le64 [usertype]

vim +201 drivers/gpu/drm/apple/dptxep.c

   174	
   175	static int
   176	dptxport_call_get_drive_settings(struct apple_epic_service *service,
   177					     const void *request_, size_t request_size,
   178					     void *reply_, size_t reply_size)
   179	{
   180		struct dptx_port *dptx = service->cookie;
   181		const struct dptxport_apcall_drive_settings *request = request_;
   182		struct dptxport_apcall_drive_settings *reply = reply_;
   183	
   184		if (reply_size < sizeof(*reply) || request_size < sizeof(*request))
   185			return -EINVAL;
   186	
   187		*reply = *request;
   188	
   189		/* Clear the rest of the buffer */
   190		memset(reply_ + sizeof(*reply), 0, reply_size - sizeof(*reply));
   191	
   192		/*
   193		 * retcode appears to be lane count, seeing 2 for USB-C dp alt mode
   194		 * with lanes splitted for DP/USB3.
   195		 */
   196		if (reply->retcode != dptx->lane_count)
   197			dev_err(service->ep->dcp->dev,
   198				"get_drive_settings: unexpected retcode %d\n",
   199				reply->retcode);
   200	
 > 201		reply->retcode = dptx->lane_count;
   202		reply->unk5 = dptx->drive_settings[0];
   203		reply->unk6 = 0;
   204		reply->unk7 = dptx->drive_settings[1];
   205	
   206		return 0;
   207	}
   208	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
