Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C663432B13A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 23:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782256374; cv=none; b=CgCaWT4DKTxa4SCIizoBba2QkKXHNM1nfBjt2yzwcJ1whrQhFEoYgFjuLp7/p9v9pT77ajGPsRl2vsINv1UT8zag8LnfcNNILwkVtgezgN/wk6/JbPX49WO452vH/fk62zDVUw4DhGicyldiffbsDYwxM1TAhOeh/y5ORO8eOy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782256374; c=relaxed/simple;
	bh=ZVWNVmMnVJRpXJyH6gJIq+PprIgPXYNLLpNQLav12e8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h/ta0iKe1ywzbEcc+pmoOk4BDx+mnHLiEX/4Zd0pVkGBWD1fA2A1veqPVOcgSyvwHHaFl50xe1z9NAMJ5QYt7CyZDXmQ949YXVPoZ6IbPUPEmnrAFi2YQKri4VM5jfdTVMe8YpCuRFDtVOK1mtDp9TTRDx88XZ9mNUVXR2owLho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fTu6rSja; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fTu6rSja"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782256373; x=1813792373;
  h=date:from:to:cc:subject:message-id;
  bh=ZVWNVmMnVJRpXJyH6gJIq+PprIgPXYNLLpNQLav12e8=;
  b=fTu6rSja3L8TEjeNal5QtvSloTBpUTca4m0FdcRQmY+Kadgw4PbzR6q1
   b+xD0JaBsBhSaQScQoS5L28SaNVPnQi7MUP0a7aVUCYs940A9NPqIu7gZ
   t0Oww41FcvoDSGMpKTh2yzWu+3UlCUTnACP7MM8JPt8nKvVxIMoDGB9JL
   t9V9gcIXoibKmZ8NQRBS/PquGG4FQ9DZr2l8nhGH4rfz2lJkXcU9Zrn98
   W05BLoOVWjJ7T1s9+9a87bYltHNTlscpKDrx7Tx8GIzvfz1AGXcnm+49P
   soHw4B1WkkYRrMN8zTPPyUyGi9bM7MNGYT8W2TIa/meQTCasfRIjUR+YG
   A==;
X-CSE-ConnectionGUID: Es9f1lT+RQ+i6aJ2o4X57A==
X-CSE-MsgGUID: Vlm4wG+ZSby33EBcdsMWmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="86847338"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="86847338"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 16:12:51 -0700
X-CSE-ConnectionGUID: x73Qj6+CRMygVoguJ2rDWQ==
X-CSE-MsgGUID: VWUx0ARaR/6gA2tK3rTVxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="279815488"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 23 Jun 2026 16:12:49 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcAIQ-000000002x1-3Nw9;
	Tue, 23 Jun 2026 23:12:46 +0000
Date: Wed, 24 Jun 2026 07:11:58 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v3 2/12] arc-linux-ld:
 fs/configfs/mount.c:33: undefined reference to `init_net'
Message-ID: <202606240735.EcQfDpr6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v3
head:   59472df96a84fb076a2b47a90a0bb353c80f239c
commit: 0dbf11d8f95b2100f7ea5b21e40ae1fd76d5c712 [2/12] fs/configfs: dynamically allocate super_info
config: arc-randconfig-001-20260624 (https://download.01.org/0day-ci/archive/20260624/202606240735.EcQfDpr6-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606240735.EcQfDpr6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606240735.EcQfDpr6-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-linux-ld: fs/configfs/mount.o: in function `configfs_ns_id':
   fs/configfs/mount.c:33: undefined reference to `init_net'
>> arc-linux-ld: fs/configfs/mount.c:33: undefined reference to `init_net'
>> arc-linux-ld: fs/configfs/mount.c:33: undefined reference to `init_net'
>> arc-linux-ld: fs/configfs/mount.c:33: undefined reference to `init_net'
   arc-linux-ld: fs/configfs/mount.o: in function `configfs_fill_super':
   fs/configfs/mount.c:126: undefined reference to `init_net'
   arc-linux-ld: fs/configfs/mount.o:fs/configfs/mount.c:126: more undefined references to `init_net' follow

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
