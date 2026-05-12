Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDDE3876DB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 13:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778593287; cv=none; b=p6yPjaRw13joUowfI8vMe6wbbHtUHMqRJ2rdbHMlkhbZwJuCjIp275bDDSvd03ooU4BFqXuJz7yFAu5g3UiKjGFrOAy9VE125QLTTlDdo8pAk7XoYegl+Lok6YHvI6a5s2ytGQh1lmwPXhfi373l5GGxqEjeekr5qKfC+FyVgmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778593287; c=relaxed/simple;
	bh=9sSB3qpSO6yk+o5CQEK0FEk/nL/deDmax/kuGocPK1k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Gw/GYfpDWwgouVpsgTVrlqPHO05CotA7A2V4i4B8GFCGAew50ZzmscG0fFqA5679WkSwE/YxYq4yOsGWyiY0Kb2Uq3hfiQwdWsHMifeK4oS3P2qmZNGdHOdiP7dgeFfQgOSW7IIlZH62eXexcGYx2aZYakudxcENoN+Ed1WbvW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TGc24rRT; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TGc24rRT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778593285; x=1810129285;
  h=date:from:to:cc:subject:message-id;
  bh=9sSB3qpSO6yk+o5CQEK0FEk/nL/deDmax/kuGocPK1k=;
  b=TGc24rRTjmdSvdNNwCgzE7FY1vOS6To2q/8bmIvpaO6FbZ5ZTcU8Zo8W
   zKxBQe3SpBIeaQlCp8pHsJhlPv21SIz+UDPrQCT2SLJ/yUtPLPVuR4H1z
   5LxYi7JZFBl14+0OxIyIsf5XACqX5zvN5/3pw+RL8V3HP+4EpOVIoEmZy
   YzAz5YJv+hldTgtA7glnO4WNJIPU989JSLXx3erOg2QZ0Z9jfU+l6wAX8
   ///xhv7iHT6QXx7BDpDa/BYbc4T0jRRz72zMJ9vYh1jz0bi+Ep/jjNLNS
   ZMjYVLolrYiKzFQAlw0Nm7/05fkjbnPviDri5cEllGHsCb4zKopMBsAUB
   Q==;
X-CSE-ConnectionGUID: 6gGZBRvLQLqYGcPLnMdg7Q==
X-CSE-MsgGUID: i2Z/HaFAS/GsBW8DO0JFFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="78647931"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="78647931"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 06:41:24 -0700
X-CSE-ConnectionGUID: zfKH/AT7RhCk+j4xPvTJWg==
X-CSE-MsgGUID: rbghtRp9Qu+wPDo/t87jMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="239596212"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 May 2026 06:41:23 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMnMO-000000002DJ-3GyB;
	Tue, 12 May 2026 13:41:20 +0000
Date: Tue, 12 May 2026 21:41:17 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/200-dcp 52/178]
 drivers/gpu/drm/apple/dptxep.c:192:18: sparse: sparse: restricted __le32
 degrades to integer
Message-ID: <202605122107.EzSBG7nb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   4b1d0b029fb1b7f93e72be2d9553a358b8054d7c
commit: 68e61f6b6bebdb158ab69e9050393402bc96d9c1 [52/178] drm: apple: dptxep: Implement drive settings stuff
config: arm64-randconfig-r132-20260512 (https://download.01.org/0day-ci/archive/20260512/202605122107.EzSBG7nb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605122107.EzSBG7nb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605122107.EzSBG7nb-lkp@intel.com/

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
