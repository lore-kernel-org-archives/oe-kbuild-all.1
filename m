Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A071DDE9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Dec 2024 15:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734278154; cv=none; b=AOYPIO3dfltPycuUtn0060AEzbuaQLkEOiG1dxvWlnEHoqp2rcExaQ4H5DcWQOCuMCnZEXLBJG8oIiJfa/BVygEiXPFK7rPM1Q4Ef+PRxC8CeOf5OIv7gV/DIHZtFbWHLyF8FOaoQBY8js7ZaxwvpvyisMiXqd/0V1WAQva6vw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734278154; c=relaxed/simple;
	bh=0F/oe6aQH9Pq+g4ovdEGVsjYcI8wbNJYuQS+p5M5nzg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D2KNPn59TRfnltWdb3PSdIcNC01JiMXyvbwO5kA+SeVz79SyUGsp+n0jXze9fxENCqWFFTS0d72ID370gdini5v9mySv8kDgJH995xPFc18WJfHJpJAifdfyvMb2OHTTV6FidEE/jwXCAUyMNhBZbBsWsbq1jO0IaJoLz8CKs3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Le0hdbkh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Le0hdbkh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734278153; x=1765814153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0F/oe6aQH9Pq+g4ovdEGVsjYcI8wbNJYuQS+p5M5nzg=;
  b=Le0hdbkhh5mZjUTrbygf2Q2IwCj4yVy4wgbjam5z+Q7Q7jNxiOf0gp2Y
   Ya6yZilyd0iqsEHvo56iTFXXVpl5+k6hNap53aKEaiOAhQHNw5cqGvFBt
   AKOxmPi8JCqezh3oQVmXLJdcnsYhBx7tP4lVNAb9KVbTN4qv88ZemLVsP
   0gna5OV+flz40lcnXSrj+Agmkqwlmtwcoyz65Dtczw0YWSbNiZjG1u90M
   tlbIVtV2LaevWUAZsIzz46ioanYerzELFQt8l2s2E8KFzLND1lm5nBQko
   LJs+eDc1KenhxQ8LgcBWb1REsHKNtT6IotHkvkzr6/DASpF+GRrG6ygO3
   A==;
X-CSE-ConnectionGUID: DfALLoFXRDivSye1hILybQ==
X-CSE-MsgGUID: jY0rGjRPRXi8vNIW0zbF7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45673704"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45673704"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 07:55:52 -0800
X-CSE-ConnectionGUID: IzzimgvMRtOyem/KbsuioA==
X-CSE-MsgGUID: dEe98tNqQ+2mRzi+XYwvag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97780347"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Dec 2024 07:55:51 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMqyC-000DhE-35;
	Sun, 15 Dec 2024 15:55:48 +0000
Date: Sun, 15 Dec 2024 23:55:31 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_frag_cache_part2_v3_old 6/11] clang diag:
 include/linux/page_frag_cache.h:36:21: warning: 'static' function
 'encoded_page_decode_page' declared in header file should be declared
 'static inline'
Message-ID: <202412152318.Ps5O1kU4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_frag_cache_part2_v3_old
head:   68b52bf3f8fc7db3d837efaadd688f096a20b3f8
commit: a92c7b766c1f707dfd31e87822695e276e9d0aac [6/11] mm: page_frag: introduce refill prepare & commit API
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20241215/202412152318.Ps5O1kU4-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412152318.Ps5O1kU4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412152318.Ps5O1kU4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   clang diag: include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
>> clang diag: include/linux/page_frag_cache.h:36:21: warning: 'static' function 'encoded_page_decode_page' declared in header file should be declared 'static inline' [-Wunneeded-internal-declaration]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
