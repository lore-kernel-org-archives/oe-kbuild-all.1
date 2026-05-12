Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BAA34BA33
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 18:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778609820; cv=none; b=PDq3p707qTSaXyXlJW8I39hnSxLQ6RN70QJJVOwZDz+9NEkTJOhRu6SI99FvfiW5dZ08PXMuBwFAaHr7UwCBoa26uXeyR6a9rNoG2A0bMli9lwOb8x9VrwZlekjs+rQQrM+dKAoiKHjjLWKLG4G9zKttXJflUPtRGR0wQF+iSJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778609820; c=relaxed/simple;
	bh=kvz3r9I5i+OAcGPN47GbR/dmtSfWz7BkwTo6GihK/JA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YJvj5DEjSaC1/pDeM+v1Arq2MF1zHVRgZ+UteVx2upAimCkTbFlmdW4DLmntGQLW7U3H045ZQNGGxuvnQbCn5cDtqWhHehlYTYlQ30OvV689L1qqij9W47aO98GwKWYfaSKr+QJYbSTa/WNEd7jfY9XcAm93cCvg2SOrGJk1sHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TIf+mhgS; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TIf+mhgS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778609818; x=1810145818;
  h=date:from:to:cc:subject:message-id;
  bh=kvz3r9I5i+OAcGPN47GbR/dmtSfWz7BkwTo6GihK/JA=;
  b=TIf+mhgSNoEHMvfzHgyGOnd9kqQuDGwZHea+MjlvmbmCWx42LlhrPzjD
   0bfuZnYESZzOdd1Tc29lIWPMiT8CGc6EkDkjEfkg8gAPXedRm0NQiRcSH
   8l0WskvPd8YwI4LlmRFMMMck7fOI2cRrlmU3Sm7tqJ6hFObA88amXAWsc
   ugWHu1j7L/AlO4O30RE//NfdqujhsC2Rnk3TcflndCvm1Ynn0cvl8b/K0
   SI2eKvKZoB5yMhIDe6XkggfiClfGIjCHwhXB0OQy2H2XOkSsSv46h72Hm
   a7U2Myk2TXZQzPa8ysIHbs0YcscqK0fxXPUwiVIAb7w2MB/reXQHD/NGe
   w==;
X-CSE-ConnectionGUID: OORJuPtKQvOXBUc9oJM11g==
X-CSE-MsgGUID: hiIRYM1WQbuPZqjnqL6maQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79243362"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="79243362"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 11:16:56 -0700
X-CSE-ConnectionGUID: 5pTa2wb4TIWUHarOv7Yr2g==
X-CSE-MsgGUID: 5oCh2quKSwaIGyWpbJqrcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="239654376"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 May 2026 11:16:54 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMrf2-000000002a1-2AwX;
	Tue, 12 May 2026 18:16:52 +0000
Date: Wed, 13 May 2026 02:15:53 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 111/178]
 drivers/gpu/drm/apple/dptxep.c:201:24: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202605130212.7oYtasZW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   4b1d0b029fb1b7f93e72be2d9553a358b8054d7c
commit: b762bb52db63aa1acb03e3fa8ad7491fb976684c [111/178] drm: apple: dptx: Fix get_drive_settings retcode
config: arm64-randconfig-r132-20260512 (https://download.01.org/0day-ci/archive/20260513/202605130212.7oYtasZW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130212.7oYtasZW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605130212.7oYtasZW-lkp@intel.com/

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
