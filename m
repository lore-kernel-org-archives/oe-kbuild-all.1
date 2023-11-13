Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D1524A14
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Nov 2023 20:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ndzR90Vq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699907382; x=1731443382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8XW60X/tTsBI07uLEdl5RoEwS31qjmz2h5QTQ+8kN9w=;
  b=ndzR90VqdBqqRBJ/C9cLCA6ez9m1dl7enfaBiF3zd79sF9TdnjkSzC/F
   WB7ZsfRoWqQp0sFHuvygZugOJxkEQjmEt8vpM0ROZR1zt5/CwnYaq7ayR
   oq3uD/EFNz2XuucnxUnLzLIOX7SVoKfcuHu6Kt/NgR5e/V1ihfWp9S6ky
   Eo/hzrz17JWKHIdr/Jt4vx4iwtKNJ6q7o0ta6tv2i1Q7sEQiKd4sLaSwi
   Ly/ShGAl4k+n3EuTRrHwnwKxEohym0MZ6zsRAi28Wa+8fDeaBHl6FtdIG
   o6B28PJrwJK/LBv+Ay1hQpz4bwmpJH2dOVgNuOzXuYT6Sd8ukY9KbJS9r
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="3593423"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="3593423"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 12:29:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="881791126"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="881791126"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 13 Nov 2023 12:29:41 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2dYx-000CRB-0x;
	Mon, 13 Nov 2023 20:29:39 +0000
Date: Tue, 14 Nov 2023 04:29:18 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:afs-fixes 38/41] csky-linux-ld: callback.c:undefined
 reference to `__generic_xchg_called_with_bad_pointer'
Message-ID: <202311140436.WxaX0cKL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git afs-fixes
head:   9e6938066eb39856ef50be2da622f8e7214d4009
commit: d1c52720397aad8dbd73b94b808c2484ca69ad1b [38/41] afs: Overhaul invalidation handling to better support RO volumes
config: csky-randconfig-001-20231114 (https://download.01.org/0day-ci/archive/20231114/202311140436.WxaX0cKL-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231114/202311140436.WxaX0cKL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311140436.WxaX0cKL-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: fs/afs/callback.o: in function `__afs_break_callback':
   callback.c:(.text+0xee): undefined reference to `__generic_xchg_called_with_bad_pointer'
>> csky-linux-ld: callback.c:(.text+0x158): undefined reference to `__generic_xchg_called_with_bad_pointer'
   csky-linux-ld: fs/afs/rotate.o: in function `afs_start_fs_iteration':
   rotate.c:(.text+0x104): undefined reference to `__generic_xchg_called_with_bad_pointer'
   csky-linux-ld: rotate.c:(.text+0x14c): undefined reference to `__generic_xchg_called_with_bad_pointer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
