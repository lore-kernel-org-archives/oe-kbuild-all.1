Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89718A29
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 04:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737693226; cv=none; b=c29gvGtfYbH1MqiqnaggZxuODU59HeyOsCdN/45mPiMosQWltpGH/nfLPuUIjCMTsUNlm0y8rvnh2KdvHg51D10J4l1LUXz0SD3PHfDug6Dz+v0Mls92aGk46jV/lHF6VUDFFHdgPsdunIo/pmMBd8NrCWJqz2Wmr5IwDhNkFmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737693226; c=relaxed/simple;
	bh=Y86ykDpvj9MWbkf55X1WEhMWUg85lQ28kUEm8HixK5s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zf3eDZHQfdR+FKC1clxaYOTkLovCZJRszqTOum2BhX7hICNHsPFa/zZdlVWQ8We9/YlBIKuUBcr8J8p5SnjJ+rTjuSmPBSwl+sZbzdTTT74VxfsccfhxPAB5yRmP7W0ztJgDITFJxvUWB/wbKslVf/nQht+Axm1WdGWbVTExgTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TmiH4A5c; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TmiH4A5c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737693224; x=1769229224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y86ykDpvj9MWbkf55X1WEhMWUg85lQ28kUEm8HixK5s=;
  b=TmiH4A5cHvsGiZQJoGeCVnsIHZHk18DmjsY3RBDMjt0cqD/zL16w/N49
   CRDDqRiRzhJArPUipNp2SGpVGN06LX0iMCkbUSySb1OQVO/OiM2H2Durp
   RTpJE6Sm3n8Div5VBt9YoqgcPHn01Gm4C0Mhv/HfBbtNVpYyGYsoIidU0
   NZjUmrFYpEpPLKFAtjVU3Ko1Y0zzjuh340RO/URXTm75z82DsKJTO9z/u
   NoCnNLCmTvVlDJmzgqRFj0+j25WrZBqvP3yy32RCqgPUicvMABYLy+xU6
   NGqqQIALXCDGB6b+K7P1sO1+RyNIljihO/Tdb4XwXUNOlKyJYzFUVUW9y
   g==;
X-CSE-ConnectionGUID: 2CYkGhOqRJ2zS3WsOywuzw==
X-CSE-MsgGUID: AdhfGGwuTlKUDyhHfuZ/jQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="42148406"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="42148406"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 20:33:44 -0800
X-CSE-ConnectionGUID: h6XRTAu7RvehL2asn/b6Gg==
X-CSE-MsgGUID: sYqjF4N5RQiBKXwmjgkX6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="107482128"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jan 2025 20:33:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbBO0-000c9X-2v;
	Fri, 24 Jan 2025 04:33:40 +0000
Date: Fri, 24 Jan 2025 12:32:49 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Sagi Grimberg <sagi@grimberg.me>
Subject: [hare-nvme:secure-concat.v14 10/11]
 drivers/nvme/target/auth.c:243:23: sparse: sparse: Using plain integer as
 NULL pointer
Message-ID: <202501241232.sSEsPvsx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git secure-concat.v14
head:   a8583c3780cf2d6a18b817c66a670d1570a23923
commit: ab5a9cdbc7e4de0ecb4bc2e9b936f39acd75fb5f [10/11] nvmet-tcp: support secure channel concatenation
config: sh-randconfig-r113-20250124 (https://download.01.org/0day-ci/archive/20250124/202501241232.sSEsPvsx-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250124/202501241232.sSEsPvsx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501241232.sSEsPvsx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/target/auth.c:243:23: sparse: sparse: Using plain integer as NULL pointer

vim +243 drivers/nvme/target/auth.c

   238	
   239	void nvmet_auth_sq_free(struct nvmet_sq *sq)
   240	{
   241		cancel_delayed_work(&sq->auth_expired_work);
   242	#ifdef CONFIG_NVME_TARGET_TCP_TLS
 > 243		sq->tls_key = 0;
   244	#endif
   245		kfree(sq->dhchap_c1);
   246		sq->dhchap_c1 = NULL;
   247		kfree(sq->dhchap_c2);
   248		sq->dhchap_c2 = NULL;
   249		kfree(sq->dhchap_skey);
   250		sq->dhchap_skey = NULL;
   251	}
   252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
