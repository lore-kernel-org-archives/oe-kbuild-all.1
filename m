Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65DC188A3A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jan 2025 07:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738136734; cv=none; b=Hgva9eOILeZ13S7DwSI6UXzcelAGBe2l+G1KyHlR0VbUxyMwPo7y4GYKfYWRmPZeVESmMu137bRU0lkTAfkHzmOc4nsHG5qsD44zW/6FzL0tvpGxy5z00dmWvZuTEMo6I9D9C8Jb9HiKxYqIEYsSHJSkzjTPq7uhywb1JwysvvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738136734; c=relaxed/simple;
	bh=tjMg9yqgb23/8NdWAuKjP0bZM2CuMxiZ8SoJWOwU2Cw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kb3QFjUN9lTEH3+tgUVrsvrjChdbhjCD8n7N1QsrrI/FATZY7NReb/ZXrFwgUM775N8XtoX+IFYmey1Q58/UASIwemL9P8T32/Sbjhhdsfai9KuB+XLk+nBIMLJnYtMe/SipRDyoOTZVmNoWN2hxssW4CRW8y/LTnrXrdCZsOWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=duat0Srk; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="duat0Srk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738136733; x=1769672733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tjMg9yqgb23/8NdWAuKjP0bZM2CuMxiZ8SoJWOwU2Cw=;
  b=duat0SrkohW1mIar9DEKIZpAfDtU1oTvcABVxu2rhqUr7esxFeV9lMAz
   XP0ta5mUDaZ15poVFJvANkbnEvMABSDUlnQJCsgctlpZkxJnDVzfvRnk6
   ez2iG51Hfg/go4AiZI8ANOze41SWHsxiJoQ0OMtZEcaHmuE9Cv40nm4uN
   wgVAGeJ8mfeNQKIDJEgsiytoepg1garpYVQdOBGd/ftlh9Bb4J5fPJq/Z
   Y5Cn0z7LBJ/sz3Nx27C7hNZu6zf/ebZhNhzKNRU88myqofwLPmMGQ3s2W
   wLBuK/hDd5W44Tt8ojZ4AzNcRXcKZ7+o6QnQzntr7BHrlvzBSTqMFW3qQ
   Q==;
X-CSE-ConnectionGUID: h9bzPWEIQYmEuUWdzheIDg==
X-CSE-MsgGUID: N7e83iDERZSxH0gpF6sFaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50054260"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50054260"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 23:45:31 -0800
X-CSE-ConnectionGUID: gM+z6BsQRYSIj9/z2PLd6g==
X-CSE-MsgGUID: e0zJOHPbSWGO+Eqt33zNpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112965945"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Jan 2025 23:45:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1td2lM-000ijP-0L;
	Wed, 29 Jan 2025 07:45:28 +0000
Date: Wed, 29 Jan 2025 15:45:22 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/200-dcp 143/246]
 drivers/gpu/drm/apple/dptxep.c:192:18: sparse: sparse: restricted __le32
 degrades to integer
Message-ID: <202501291502.LdUNIQZB-lkp@intel.com>
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
commit: 0d11b518dbcb1828043ae8c11b1b174ad7076057 [143/246] drm: apple: dptxep: Implement drive settings stuff
config: arm64-randconfig-r121-20250129 (https://download.01.org/0day-ci/archive/20250129/202501291502.LdUNIQZB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250129/202501291502.LdUNIQZB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501291502.LdUNIQZB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/apple/dptxep.c:192:18: sparse: sparse: restricted __le32 degrades to integer
   drivers/gpu/drm/apple/dptxep.c:197:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] retcode @@     got int @@
   drivers/gpu/drm/apple/dptxep.c:197:24: sparse:     expected restricted __le32 [usertype] retcode
   drivers/gpu/drm/apple/dptxep.c:197:24: sparse:     got int
>> drivers/gpu/drm/apple/dptxep.c:198:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] unk5 @@     got unsigned int @@
   drivers/gpu/drm/apple/dptxep.c:198:21: sparse:     expected restricted __le32 [usertype] unk5
   drivers/gpu/drm/apple/dptxep.c:198:21: sparse:     got unsigned int
>> drivers/gpu/drm/apple/dptxep.c:200:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] unk7 @@     got unsigned int @@
   drivers/gpu/drm/apple/dptxep.c:200:21: sparse:     expected restricted __le32 [usertype] unk7
   drivers/gpu/drm/apple/dptxep.c:200:21: sparse:     got unsigned int
>> drivers/gpu/drm/apple/dptxep.c:224:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __le32 [usertype] unk5 @@
   drivers/gpu/drm/apple/dptxep.c:224:33: sparse:     expected unsigned int
   drivers/gpu/drm/apple/dptxep.c:224:33: sparse:     got restricted __le32 [usertype] unk5
>> drivers/gpu/drm/apple/dptxep.c:225:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __le32 [usertype] unk7 @@
   drivers/gpu/drm/apple/dptxep.c:225:33: sparse:     expected unsigned int
   drivers/gpu/drm/apple/dptxep.c:225:33: sparse:     got restricted __le32 [usertype] unk7
   drivers/gpu/drm/apple/dptxep.c:273:26: sparse: sparse: cast from restricted __le64
   drivers/gpu/drm/apple/dptxep.c:273:26: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long long [usertype] lane_count @@     got restricted __le64 [usertype] @@
   drivers/gpu/drm/apple/dptxep.c:273:26: sparse:     expected unsigned long long [usertype] lane_count
   drivers/gpu/drm/apple/dptxep.c:273:26: sparse:     got restricted __le64 [usertype]

vim +192 drivers/gpu/drm/apple/dptxep.c

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
 > 192		if (reply->retcode != 4)
   193			dev_err(service->ep->dcp->dev,
   194				"get_drive_settings: unexpected retcode %d\n",
   195				reply->retcode);
   196	
   197		reply->retcode = 4; /* Should already be 4? */
 > 198		reply->unk5 = dptx->drive_settings[0];
   199		reply->unk6 = 0;
 > 200		reply->unk7 = dptx->drive_settings[1];
   201	
   202		return 0;
   203	}
   204	
   205	static int
   206	dptxport_call_set_drive_settings(struct apple_epic_service *service,
   207					     const void *request_, size_t request_size,
   208					     void *reply_, size_t reply_size)
   209	{
   210		struct dptx_port *dptx = service->cookie;
   211		const struct dptxport_apcall_drive_settings *request = request_;
   212		struct dptxport_apcall_drive_settings *reply = reply_;
   213	
   214		if (reply_size < sizeof(*reply) || request_size < sizeof(*request))
   215			return -EINVAL;
   216	
   217		*reply = *request;
   218		reply->retcode = cpu_to_le32(0);
   219	
   220		dev_info(service->ep->dcp->dev, "set_drive_settings: %d:%d:%d:%d:%d:%d:%d\n",
   221			 request->unk1, request->unk2, request->unk3, request->unk4,
   222			 request->unk5, request->unk6, request->unk7);
   223	
 > 224		dptx->drive_settings[0] = reply->unk5;
 > 225		dptx->drive_settings[1] = reply->unk7;
   226	
   227		return 0;
   228	}
   229	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
