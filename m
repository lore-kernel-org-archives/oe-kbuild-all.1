Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5831A25A645
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jul 2026 01:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783734823; cv=none; b=BiflNBFH33qlsToigxqKUvJl1CDrGSU1+bb5O5hkBjS/Adil15AtnYuL0AjZpMefuZJ4HKhpMgj2Y6SaiUx6qi4p2o1PapyRds3Dt9aUyKbKKifLHZSdpI9Eh4PLjb1PY97PIxeGxWydkDI72QbbEPdUTMZkv+raYWPqHI0gmVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783734823; c=relaxed/simple;
	bh=JS99+JpJfbwnfzuBZCJXAuvW0DHORJwyykQ1GA3XixI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o9cM+2alk1UEWD+ezs3ptmhlt+G8g4LYsvIWJpdtYeIDSnjkz2dfC44C8P+QjYscBEy5pt3IOP2L2Kqq16TCs412wkl7BzCK/XITH/1VnKvpSmhQLpqO+MlLiuRNxwNq5hmkmeOpZkp3rBipd4garU8A5vSn9ID65w/w8fto8X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d4ELN1rN; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4ELN1rN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783734821; x=1815270821;
  h=date:from:to:cc:subject:message-id;
  bh=JS99+JpJfbwnfzuBZCJXAuvW0DHORJwyykQ1GA3XixI=;
  b=d4ELN1rNVZAhWxOTsSfJ1I7AXfSPnnqnFPdQPEbE+ApNnaq6jPLN3inb
   jFfJ9tj9p1086ODbzjcl5+vWCP5m47k44G+iBUXrRXt3eFoL8pI5eJcNm
   snd2LHzoQ0/VkipxOU63dEE5BNJZVpOq6jco+7V54yEvehXeW7TT8E1QT
   dkEn6+DDzNFVg7O3VlvpCP9qci9Bd5/krG5nwPMIjtwlPlmpWFtbfL/tr
   k4GAiN4+nBUPHbKkVSHFYrYGI4jJhcvc1cBbyS0noskDRTmexvYSEM4kV
   oCZtFsfR0OZ2FFpGqg36rXvkNiUA4el+ycV/eTTOT65+IFAUJLBNegFW/
   Q==;
X-CSE-ConnectionGUID: XGjWGHjeTES9/WgpI6Unyw==
X-CSE-MsgGUID: avs7aAVNRpeIFyMU87T2zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83412574"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83412574"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 18:53:40 -0700
X-CSE-ConnectionGUID: Z/6Xq0pkS/2uFrh6d+ElFQ==
X-CSE-MsgGUID: opCBVeQLSQeTb6+As8qLXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="258909303"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 10 Jul 2026 18:53:39 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiMuO-00000000JcG-1mpN;
	Sat, 11 Jul 2026 01:53:36 +0000
Date: Sat, 11 Jul 2026 09:52:56 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 111/177]
 drivers/gpu/drm/apple/dptxep.c:196:13: sparse: sparse: restricted __le32
 degrades to integer
Message-ID: <202607110912.tNg5c2qN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   b9ff2d08b7ac00a981c1725dd329677ca94e5bce
commit: f390525e7ac6f2e3a895ca245cf3504618b1b5a2 [111/177] drm: apple: dptx: Fix get_drive_settings retcode
config: arm64-randconfig-r112-20260710 (https://download.01.org/0day-ci/archive/20260711/202607110912.tNg5c2qN-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607110912.tNg5c2qN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607110912.tNg5c2qN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/apple/dptxep.c:196:13: sparse: sparse: cast from restricted __le32
>> drivers/gpu/drm/apple/dptxep.c:196:13: sparse: sparse: restricted __le32 degrades to integer
   drivers/gpu/drm/apple/dptxep.c:228:35: sparse: sparse: cast from restricted __le32
   drivers/gpu/drm/apple/dptxep.c:228:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/apple/dptxep.c:228:33: sparse:     expected unsigned int
   drivers/gpu/drm/apple/dptxep.c:228:33: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/apple/dptxep.c:229:35: sparse: sparse: cast from restricted __le32
   drivers/gpu/drm/apple/dptxep.c:229:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/apple/dptxep.c:229:33: sparse:     expected unsigned int
   drivers/gpu/drm/apple/dptxep.c:229:33: sparse:     got restricted __le32 [usertype]

vim +196 drivers/gpu/drm/apple/dptxep.c

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
 > 196		if (cpu_to_le32(reply->retcode) != dptx->lane_count)
   197			dev_err(service->ep->dcp->dev,
   198				"get_drive_settings: unexpected retcode %d\n",
   199				reply->retcode);
   200	
   201		reply->retcode = cpu_to_le32(dptx->lane_count);
   202		reply->unk5 = cpu_to_le32(dptx->drive_settings[0]);
   203		reply->unk6 = cpu_to_le32(0);
   204		reply->unk7 = cpu_to_le32(dptx->drive_settings[1]);
   205	
   206		return 0;
   207	}
   208	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
