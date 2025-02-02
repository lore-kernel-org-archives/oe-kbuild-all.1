Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE37288A5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Feb 2025 08:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738485982; cv=none; b=rTuo7SsLvmzpuS6qQxL4yT4biT2KA5GOqVlBHnJ6JtNHgJKJyVj797KNpEucwccBu8FXqplWGxc1BwqghV6YNQY+k6+w1rthSmb3mfuIYhUSKxBVd2FiT+4Slhl/KnjaBx0bJd7l7rLMVuhEAi0r89qilDvKMPnSaC1v7RGwQ0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738485982; c=relaxed/simple;
	bh=KJmPx3a22xxphHDDY96GGNPpdDOjQKzNnEXoNl9qnCY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RScurvXClBZIAJG3YC0J42TtNMuArKgeFhcL+ny4ziFN5s4ystQby4jkihgXMqTXCgMRTGT7yXpzn7anHDQ8AajLrQqhx4FUDw45RjLE7/8LvBWWfJQupmUNQKfuSCikTWXq36/XMnn98u9PfsfMYIfwU6bW/60OVIpaXO4YWZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BhvvTKUu; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BhvvTKUu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738485981; x=1770021981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KJmPx3a22xxphHDDY96GGNPpdDOjQKzNnEXoNl9qnCY=;
  b=BhvvTKUuuAWCC1vXRKvmZGsNLsLghsGYL/xZc3kDyWC1ANYjYp5rUSHq
   hXfKF/EOLSebvXB94HlKFbIrVcXx3VLVDJOJ8Rd/SGDNTIdJ2eBRFsPUd
   Yxgct3WX4CLlanJfVXijIS/k4z4ls6xgjnQAT1V8aAqDkhH2SM9Ykk8H9
   Od6ukIuZ8Cr9VVPmrZOz3b988HbV1xj9lWw3iAhfl+uEhk3gA0EOwnlZe
   XLy0f/tNlwKFzb1tVZxK5GkesjxKBgAg2vqKJ2g3rZaMqDBXYXUtDIM4A
   i756gGwJEZzSeYoyRFav8QXs9+FbZdWeEANSjLSO7FLyB0eTbdvC8Tfm2
   A==;
X-CSE-ConnectionGUID: 0RA/U7+nSsWM4YnrSwkdtQ==
X-CSE-MsgGUID: Czf1bqdmSsKhJ7JyAqU1JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11333"; a="39139777"
X-IronPort-AV: E=Sophos;i="6.13,253,1732608000"; 
   d="scan'208";a="39139777"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 00:46:20 -0800
X-CSE-ConnectionGUID: u7ZmznO9S6et0LvnIddKaA==
X-CSE-MsgGUID: jmNST7WbRs+L23zpzcAaUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133266913"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Feb 2025 00:46:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teVcO-000pUL-1L;
	Sun, 02 Feb 2025 08:46:16 +0000
Date: Sun, 2 Feb 2025 16:45:22 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:sframe_unwinder.rfc 1/8] aarch64-linux-ld: warning:
 orphan section `.sframe' from `arch/arm64/kernel/vdso/vgettimeofday.o' being
 placed in section `.sframe'
Message-ID: <202502021633.3qiJG3hg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git sframe_unwinder.rfc
head:   0cc3157743fd72033cfa5de243943249f9d67cea
commit: c4b755d914e12aaf7a2638ebe7c623764a1754b5 [1/8] unwind: build kernel with sframe info
config: arm64-randconfig-r123-20250202 (https://download.01.org/0day-ci/archive/20250202/202502021633.3qiJG3hg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250202/202502021633.3qiJG3hg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502021633.3qiJG3hg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> aarch64-linux-ld: warning: orphan section `.sframe' from `arch/arm64/kernel/vdso/vgettimeofday.o' being placed in section `.sframe'
>> aarch64-linux-ld: warning: orphan section `.sframe' from `arch/arm64/kernel/vdso/vgetrandom.o' being placed in section `.sframe'
--
>> aarch64-linux-ld: warning: orphan section `.sframe' from `arch/arm64/kernel/vdso/vgettimeofday.o' being placed in section `.sframe'
>> aarch64-linux-ld: warning: orphan section `.sframe' from `arch/arm64/kernel/vdso/vgetrandom.o' being placed in section `.sframe'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
