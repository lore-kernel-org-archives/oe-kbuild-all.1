Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6500638E8CB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 10:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778583578; cv=none; b=adDtUTPuzmV4PBmMaoT92yNsSS1qunPjdyx2uElZ5mxd+GxM8AOu2ML8m7WZg2TpBIqqgTEi/MEhFIQdKFsfWYuZZn8L94ecL7NtVBvvRNRP9QKpmeGhf9QIzQTnIRZ3wKtWYnDgS15qbJV7Q+imoBcT5d04Vkw+ygN6c8Rwzcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778583578; c=relaxed/simple;
	bh=MzAXZMSCpoulHGZ0qChDgt/EitQscjvdEdl8GvnEwRo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r00QSUCafnIg+ohaL7TI1i3iD/gWcD2526xlFAgxmAkoN418m0xajEbmMoZ2rQ6LhbQju4Wsa9mxqCRI6HVnC7R0JTG2HPwqFaMibsEvIUorBvqeJ7rsr5Hn+ooI/2/vFfHQZ1OGIpzr782RcBZsU3FMmJy9UnmpjFDlWPszvqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E+BtI7yf; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E+BtI7yf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778583577; x=1810119577;
  h=date:from:to:cc:subject:message-id;
  bh=MzAXZMSCpoulHGZ0qChDgt/EitQscjvdEdl8GvnEwRo=;
  b=E+BtI7yfcGP9eJ/0Js34NbBCe4mNSPnxn3Yb7aRZEJZ5yhv/oG2yGDTN
   Kp1PoYnLxNode9zFOCj2zZ/dJqJmqbT69OzmrGa1JvhSZsmeMPi3vs1aX
   qQwnufUhZseYOjZToqVhQZShH7xe+34aJsfqOqo73cwhg9ePum+yEcTut
   3QMYsHfr0qpJixMrSwNQWD/sL9/0IgvnIQxpdYdxk5rpQtsUFDfV3rtWG
   bMoGifcx1RbC+tJSaIzuTHHhh8vn6w7S3FPNtn21o+7/oZAJTjDD1RRsf
   YuNlEpuPwYOpk7WxU9H+X5nSQ1jLqK+TMhj3aBt+xwFh6v9mpjYE08cpZ
   A==;
X-CSE-ConnectionGUID: NHM5axVeQcKryysdgB3rgQ==
X-CSE-MsgGUID: 7+KdiAp9QNOh5E3+A9bL7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="83361060"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="83361060"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 03:59:36 -0700
X-CSE-ConnectionGUID: vGMA/Xk1TWO4Uztc3M3Liw==
X-CSE-MsgGUID: HO2pitqsQaGvycMsl1Vg5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="242704123"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 May 2026 03:59:34 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMkpo-0000000020y-0os9;
	Tue, 12 May 2026 10:59:32 +0000
Date: Tue, 12 May 2026 18:59:16 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 46/178]
 drivers/gpu/drm/apple/dptxep.c:204:26: sparse: sparse: cast from restricted
 __le64
Message-ID: <202605121832.9hBUgwvF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   4b1d0b029fb1b7f93e72be2d9553a358b8054d7c
commit: e195c24325c721ace3005a5ffe668e0870ec7138 [46/178] drm: apple: dptx: Add set_active_lanes APCALL
config: arm64-randconfig-r132-20260512 (https://download.01.org/0day-ci/archive/20260512/202605121832.9hBUgwvF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605121832.9hBUgwvF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605121832.9hBUgwvF-lkp@intel.com/

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
