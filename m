Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F7A336897
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 19:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778786846; cv=none; b=UEsvk1KikUDK9s2rOPzyZs0peojUSd7spPi4pZYC1b3HlFEESX+a+bDnerzAbD1rOLjxf3Do/lKpY67iTNMRF4ipK8lewzlsZkewMGjdqE6Q95qChHizWCqCWQJAVK4J6TG8CjWvZ6fRQwvJSEH6x70yi+8eDsr0AYlCre/+lL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778786846; c=relaxed/simple;
	bh=rzNfHYA4LArVErzBILDBMgTMQsNF879xmqYRmA2W8Jw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BlypVFFX3zkgyBXDpT88AeoPlvcYqrr8R6iPts3bXsN1HUtl7itr6Ss5zVZf3C0Ft7FKdmowWkUpzpX7P8hfxZNdaCehaVzjjNdDGVore/tBmIuZk3vUYY5hApYi9lbS0hr6w/nq3R5+unySo2I2+2q4N00BMYQEQ1/Bg5PBrCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lEkQZTlb; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lEkQZTlb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778786845; x=1810322845;
  h=date:from:to:cc:subject:message-id;
  bh=rzNfHYA4LArVErzBILDBMgTMQsNF879xmqYRmA2W8Jw=;
  b=lEkQZTlbxyn8mdnLEd9bX+kwkI92t1EvC9M53UVaurfpqX6lEzYQJ1Wy
   hEbXFzR5Qm3V6cKWf6ckV8dKE56h1xzvF+5bxkWN5/bnRq0nY6k4T7r0T
   BMsVe8yynySDZxJHSYk+dnfiQf3dcXqXODvG68uODf80TlTix26+J/0+J
   9uNUYeVMVq+h5PgcLgByBX4EUSwfmjjRHdy3hF1xUyIHi8NdaD5IcLzjo
   jqlXkI1QDw02kauBnvRk6isTTANfgkfswxEL2XZ+w/IufXKQwImb7DM8p
   sTxY2TOIXZIYJNmqcnhD6rYlLvzDmzZk/74AIQrch6+IcssZhnXybym9g
   g==;
X-CSE-ConnectionGUID: KH0HfrzATC+J10lSi6PLCA==
X-CSE-MsgGUID: 5GG2XNQ1RoWDwolrrd8afg==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="91124355"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="91124355"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 12:27:24 -0700
X-CSE-ConnectionGUID: BIc3UMOKTcu9xTlWUrf/QA==
X-CSE-MsgGUID: 98Gn7zAWSE6SBn6qWglJBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="238352915"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 May 2026 12:27:23 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNbiK-000000006zv-21yD;
	Thu, 14 May 2026 19:27:20 +0000
Date: Fri, 15 May 2026 03:26:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 0/2] shmem.c:undefined
 reference to `ashmem_memfd_ioctl'
Message-ID: <202605150358.QHwayoXv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   b74b1013078afa4a35948e15087a1e42f57fd168
commit: 3f06e745a13c92ac95fda0fde0266cda407f73ae [0/2] ANDROID: ashmem: ensure that tmpfs file is memfd in ioctl
config: i386-buildonly-randconfig-001 (https://download.01.org/0day-ci/archive/20260515/202605150358.QHwayoXv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605150358.QHwayoXv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605150358.QHwayoXv-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: mm/shmem.o: in function `shmem_ashmem_ioctl':
>> shmem.c:(.text+0x4d3): undefined reference to `ashmem_memfd_ioctl'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
