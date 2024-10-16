Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4512018C920
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 11:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729077073; cv=none; b=UhhXnNsjUOS4VSVjeiWDuIj3CB5zov7NG/WYZ6QIcD+CJfnoexnUbAvn8+V1a0UCmCE3jXndmfBxDiF5aRKHMTvs86bp1kA+umwdpFkhc5+T02eFAGQmC27sWGs/UUUwt4OWEi4KKEOlvpLslE4RZfD9IC02YO/aDTmu9VNZGHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729077073; c=relaxed/simple;
	bh=Tz+QY/ieiDJBEFgsc1X5I0ZiwVIM5AqCZYKVxfMb9Ws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IsRQEHmkIDFEr6eSowLAJig4KCX4B8Y2XzJsift5C3pz4nQkU3+OsQaNLlVJ+/Ckskz8Ux+zTI3ApGLpTRBf/PU8i3HUHUy++eWhz2c0+gYZFs6i17hTAPUrumWsu9q/xrQ0EO/8w/VtZR8RhNZazfD6eBUUFuNBYdobcg8Pk78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nYcQzXDo; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nYcQzXDo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729077072; x=1760613072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tz+QY/ieiDJBEFgsc1X5I0ZiwVIM5AqCZYKVxfMb9Ws=;
  b=nYcQzXDozebCqnF9U4DMuSRvAL8PXKT1GXJrBQyzWhxfqAJkl7RKyMSu
   6EcS25SEJYkAmP2P0dVptJd4lb1Sm8fUwXAejAzJz/JiMUnjHQoOMfOj5
   YgvSPFzVatwk5p2pA0kdJQRqr2hIAovg7gVL03rYdZE3N1WC3rdqtM70P
   PayRn7KqZ5sdnkllWP4MCeWa0VrydoFcuL8bUTkygLoveZIwIVURlVNYO
   f1WPkZPx7u9M8A6JQAL4iYp0k8Z/PiZdWHIBAUgVRaAgZ1zhBNl+R+Me+
   T/kyS218ffPvaNMOm9NJwim6xrsQ4JNQFn3p2ssB3qjj1FGcmsXVTq19L
   w==;
X-CSE-ConnectionGUID: L28b6O9mTFaa1bxh5Wx/sQ==
X-CSE-MsgGUID: yM/d9TDsSPSDmtx5G2lRew==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45991634"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="45991634"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 04:11:11 -0700
X-CSE-ConnectionGUID: RDyls/NhRm22mJ/bdc4xIQ==
X-CSE-MsgGUID: DAehHcgYQCOVu7qj/TvD9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="78255819"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Oct 2024 04:11:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t11vm-000Kop-2P;
	Wed, 16 Oct 2024 11:11:06 +0000
Date: Wed, 16 Oct 2024 19:10:49 +0800
From: kernel test robot <lkp@intel.com>
To: Naohiro Aota <naohiro.aota@wdc.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>,
	Qu Wenruo <wqu@suse.com>, Christoph Hellwig <hch@lst.de>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: [linux-next:master 4584/4954] ERROR: modpost: "__cmpxchg_small"
 [fs/btrfs/btrfs.ko] undefined!
Message-ID: <202410161911.LbOFjfPQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   15e7d45e786a62a211dd0098fee7c57f84f8c681
commit: c87222d18145c93b0ebd860ae9166afb1457129c [4584/4954] btrfs: fix error propagation of split bios
config: mips-ip30_defconfig (https://download.01.org/0day-ci/archive/20241016/202410161911.LbOFjfPQ-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410161911.LbOFjfPQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410161911.LbOFjfPQ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_inflate/zlib_inflate.o
>> ERROR: modpost: "__cmpxchg_small" [fs/btrfs/btrfs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
