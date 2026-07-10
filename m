Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E0639934C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jul 2026 20:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783714896; cv=none; b=TD43fxonI6KPZiz+7i5atPIUEJvYtG6i5JU+idCl7AqfSszVE4FflpzifQLXdOKuqvOSX4Zsre/RXAurNe6MoaPF1XPfZY/w+7e3U9T2uX2xziyJLYWtTacHB8kUfE+SPBKs3tIN1eb9PjwryXgumu5uUSY27xrH6Qhrot7mJ5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783714896; c=relaxed/simple;
	bh=mvIoqAVYq2xsuhH1xrAdKY4xr9FNvutwIWxeJYAl3PE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QACZpcrcqo4YmUOQnZi13VN4prW7p3rW4yRKOsVb+1tviBc+o6KSObMxWzAIV4EuUtRXKz9gu9hWJwJniJWjmHghPkne+4Ypfo2Fnp1Pcbpcs7SYCoCoeLbI4I5zIM1o9noviragws/83p5U94glWOdrWrteyNyd0xlOHRIHeSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YevyHK0/; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YevyHK0/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783714894; x=1815250894;
  h=date:from:to:cc:subject:message-id;
  bh=mvIoqAVYq2xsuhH1xrAdKY4xr9FNvutwIWxeJYAl3PE=;
  b=YevyHK0/kKzhZtiopEUs2w64Q+JG3gW7AmX1HkhrKvOteCCWrttzXjfN
   Z9p7nCzdw+TqaTMgBJXzPGenTV0ztDUUjUc73F27i6wtdAKvs+9lbRc5q
   vL+Sn37cK8HDcYOR2izNQCpZ1VSjQu9byXqOlUCfqzEqYeEvfKVegnc0V
   Q4Aas+hxtftB/AcrkQPvpgHzWAfuhzSShgL/0Zb8eoF9TbEijaWFMJfGU
   XYNm34jjVlegrTGkR5JS2sndVcFLbXZdEdAwRsRrC78Q67UDwOT4IEqN0
   +1eboYAg0+o3mFAzHY/PRUXEKyVX9nXeN0poZpUi8iANd/ynrvRj2Uf4+
   g==;
X-CSE-ConnectionGUID: Ijw4fZB7T8CKmajEUA4Qeg==
X-CSE-MsgGUID: 4NafmOBlQhmAxPJuJ5K8zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="109963983"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="109963983"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 13:21:28 -0700
X-CSE-ConnectionGUID: xTtqodeaSry6UvO9Y3QuqQ==
X-CSE-MsgGUID: btMtEmDOQl22Yisj1JXZxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250554153"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 10 Jul 2026 13:21:27 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiHiu-00000000JK3-1zE9;
	Fri, 10 Jul 2026 20:21:24 +0000
Date: Sat, 11 Jul 2026 04:21:02 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/200-dcp 52/177]
 drivers/gpu/drm/apple/dptxep.c:224:35: sparse: sparse: cast from restricted
 __le32
Message-ID: <202607110323.duJMf0bt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   b9ff2d08b7ac00a981c1725dd329677ca94e5bce
commit: 5c6ae6268ac0e6ef27e765e859397bc9d2b58199 [52/177] drm: apple: dptxep: Implement drive settings stuff
config: arm64-randconfig-r112-20260710 (https://download.01.org/0day-ci/archive/20260711/202607110323.duJMf0bt-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607110323.duJMf0bt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607110323.duJMf0bt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/apple/dptxep.c:224:35: sparse: sparse: cast from restricted __le32
>> drivers/gpu/drm/apple/dptxep.c:224:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/apple/dptxep.c:224:33: sparse:     expected unsigned int
   drivers/gpu/drm/apple/dptxep.c:224:33: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/apple/dptxep.c:225:35: sparse: sparse: cast from restricted __le32
   drivers/gpu/drm/apple/dptxep.c:225:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/apple/dptxep.c:225:33: sparse:     expected unsigned int
   drivers/gpu/drm/apple/dptxep.c:225:33: sparse:     got restricted __le32 [usertype]

vim +224 drivers/gpu/drm/apple/dptxep.c

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
 > 224		dptx->drive_settings[0] = cpu_to_le32(reply->unk5);
   225		dptx->drive_settings[1] = cpu_to_le32(reply->unk7);
   226	
   227		return 0;
   228	}
   229	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
