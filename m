Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06C72116F4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 18:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769364515; cv=none; b=dabHN1O2B06fYU2iIhQ5cLE0Vo+O2w0gU8+jokP4Q7sLvy5ovee8pIS30UqperZ4OhYT4KNiGFqEXKu3gd5UJ8ZJUTimR+4fIt3MSaL063QzuufpZ8C3VNMH5ujK+2W4DhnpfEtozS9OhcwipaTffXuzRI5N5BIIytRerMeN7IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769364515; c=relaxed/simple;
	bh=wxc/++9nCp14HiNdNa3ivJgn6cqW7Vxd/ORZtr0ENIU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Vkq6V2/7lZXUw/YfxBAnFXinlBS6kcwexY87nmkSBF2F1svlGSQsi5wvzTSlZtl56kq61quzL1u2sG6MWW8+YLE56b2KWVO3qPb19P2ylRfTS2rxrKvyOPm1+xeLqrKVYgFPXIdyBQWq9QLs9p9PIZt1JVgR8oTCsTvi2SrwHtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WHP5RtGH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WHP5RtGH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769364513; x=1800900513;
  h=date:from:to:cc:subject:message-id;
  bh=wxc/++9nCp14HiNdNa3ivJgn6cqW7Vxd/ORZtr0ENIU=;
  b=WHP5RtGHLdBuHCbjuU0FsoMS8pcwSrQNR0X4kNAvTXYLdbdK9JvoNs4d
   vkVIPQqe/g6ymSlz7+FJvmHQVhbarsmGk6Jk4KpSRJKgIiFtjTUKHnur3
   agwE0xahEzFlZWFGRu6E7jEz2+15f13rabCPabJm5UFFX+RR/JnvccfiL
   1HVdSgHNyvAvxj+6VolwvrMl5MMxJiRA1vVoP6m+mRzNxBDnvektylzW8
   cjJ5gaFV0AiZTwePXJV5wR6g5fBhD6GS8HhCyuG5sYfSoSghjwVlgd53H
   Br28StJdZQ2RZ3nUoVE+3BHHjDaaq7wQBcPyTw01+Og+bv42OmqnvK1LA
   A==;
X-CSE-ConnectionGUID: L/Oq1hXOQXu8vu3JTVWNGQ==
X-CSE-MsgGUID: ilOOu6QQQw+hBhiAZ2cXnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="81185018"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="81185018"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 10:08:32 -0800
X-CSE-ConnectionGUID: zG4okddHSVWrdx5YMwZ1yg==
X-CSE-MsgGUID: SNIMxKIvRxqnNyPSyNCeMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="206617732"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 25 Jan 2026 10:08:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk4XD-00000000WJq-3KOT;
	Sun, 25 Jan 2026 18:08:27 +0000
Date: Mon, 26 Jan 2026 02:07:39 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:fsverity 16/16] ERROR: modpost:
 "fsverity_readahead" [fs/f2fs/f2fs.ko] undefined!
Message-ID: <202601260228.I0s589kd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git fsverity
head:   eba92b72d249a658167692b21e905ca907a093d3
commit: eba92b72d249a658167692b21e905ca907a093d3 [16/16] fsverity: use a hashtable to find the fsverity_info
config: sparc-randconfig-r131-20260125 (https://download.01.org/0day-ci/archive/20260126/202601260228.I0s589kd-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601260228.I0s589kd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601260228.I0s589kd-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "fsverity_readahead" [fs/f2fs/f2fs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
