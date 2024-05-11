Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D09551C4F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 May 2024 13:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715435532; cv=none; b=DnLtyE71aOnq9z2FhsSG+hpyi51gfb3m4WQDoPVFJBx2oY0wOn60wUIgiqisg9BCH4U0Ici3sE9zVKgkwWRXjol1PodkFWYusM9i6Sx0C9qV0G9Rthao6tUrkVa9dWumY/yggS57V1Pr5YLnI3vdUfSnMRTqv6OOPpGassuvEBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715435532; c=relaxed/simple;
	bh=yzRr5T6OIf5V2vCtwkoAyUiwvUN7EugSShA8pqFt7yY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C2XJU8W56Kz6Rf1dPBFWpc+uKHI/g36NGhypSvzdg04jfEAqfhK5IneYmBhgbGNkJxWNmSeZ7+MBA/D5AJLHu55ALAq8ytYVoCrAhrgbSjNGXcF4CPIL4BAU21k3Rfcb/7ruE/JF/7Qxpkt7BRMP4pBUEIYqw3N7ffw9vEwMf7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zf1i0AQ5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zf1i0AQ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715435530; x=1746971530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yzRr5T6OIf5V2vCtwkoAyUiwvUN7EugSShA8pqFt7yY=;
  b=Zf1i0AQ5yoqR7jxC5Ef5JlLDEHxfAEW2l5D5vyHukw66pFT+EIzg36hg
   k8Nyl+8s70Yig7x3kDrBUaszyqORrDPcLaYL9SZjyfnw+V+oMinbSKqE/
   speDdjUFAZaJz5skbEKCmEWaWftfOp0ipfokkAMZjhJQi9aG0gz6ETYmd
   j78U1sPUSvAeKvEQBNTjzAtZQJFXO2G6E7gLB3iXehIMnAEv5y17qm4Co
   zA+qC5bFhk6qJCKdMP3Gr7s4vWRTRc9FjEdHIGUAfOvJlmJUmfRDiS+SP
   7otR8HOpQWE7+/Hk98NB4GW0H7OsUuo5d6fZesSl8NywLJ637OJKHoC3p
   Q==;
X-CSE-ConnectionGUID: 2ANOfB5DSOSg59/w7ewkug==
X-CSE-MsgGUID: hR9czVyXQCaTeJqI9iSypA==
X-IronPort-AV: E=McAfee;i="6600,9927,11070"; a="28914650"
X-IronPort-AV: E=Sophos;i="6.08,154,1712646000"; 
   d="scan'208";a="28914650"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 06:52:10 -0700
X-CSE-ConnectionGUID: leK/JP3iS56BaiRcKrmBgg==
X-CSE-MsgGUID: 1K2JibUyRLq0G70t6kJZ7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,154,1712646000"; 
   d="scan'208";a="53096877"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 May 2024 06:52:10 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5n8w-0007SN-1x;
	Sat, 11 May 2024 13:52:06 +0000
Date: Sat, 11 May 2024 21:51:49 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/misc-patches 10/13] task_iter.c:undefined reference to
 `init_net'
Message-ID: <202405112106.sVqaTssd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/misc-patches
head:   3c68876290b3daed7a2766d683c73bbb4fa5b3d1
commit: 32d03d460ba261b39cb694e6140d84f2f67c3f8d [10/13] bpf: kfunc for init netns
config: i386-buildonly-randconfig-003-20240511 (https://download.01.org/0day-ci/archive/20240511/202405112106.sVqaTssd-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405112106.sVqaTssd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405112106.sVqaTssd-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/bpf/task_iter.o: in function `bpf_iter_net_new':
   task_iter.c:(.text+0x1779): undefined reference to `net_namespace_list'
   ld: task_iter.c:(.text+0x177e): undefined reference to `net_namespace_list'
   ld: task_iter.c:(.text+0x17ab): undefined reference to `net_namespace_list'
   ld: kernel/bpf/task_iter.o: in function `bpf_init_net':
>> task_iter.c:(.text+0x1872): undefined reference to `init_net'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
