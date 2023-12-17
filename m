Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A86EA3D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Dec 2023 02:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="chEAR3U7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702779976; x=1734315976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pxzkdKqlEbgbVkl3fo6sCrNrlgbVwhyD29UXcj1dBHk=;
  b=chEAR3U7jyC0AHls7cSca72N71IEf3tCOeSafSMTsLb/tKowr12uq4pL
   CKc/n/TyKxBnnukhLuEdXqBX6XffJ4RyB/HT74Zj5F8VK0fK9+8ckkmVf
   U6WlQZgglAlVSseK01o1Eiya/n5hNv5u842s6fRzFUvFuA4XG3DM8PmzH
   Y2v/pUxJl6WxSNCEyOiLN5ncYgg366weU01aZwZsMPDBkAB2ohrUeYKw0
   S70Ge3j6KK4fn9qawK7cvmYeeC0mjqUaSpUCTzIk6l30udX4yu1Nwa9ya
   wNIV9568wZzwXMswy5whGxLC2bZH5vheyHGsmdewLARo+way/y6QdVEID
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="8821726"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="8821726"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 18:26:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="1106549174"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="1106549174"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 16 Dec 2023 18:26:14 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEgr6-0002WG-0Z;
	Sun, 17 Dec 2023 02:26:12 +0000
Date: Sun, 17 Dec 2023 10:26:03 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 6853/8213] csky-linux-ld: rotate.c:undefined
 reference to `__generic_xchg_called_with_bad_pointer'
Message-ID: <202312171007.c8vKL1Og-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   17cb8a20bde66a520a2ca7aad1063e1ce7382240
commit: ba97d6b747f2d1e78346a4f996c303d3e5a7a4f2 [6853/8213] afs: Fix fileserver rotation
config: csky-randconfig-r025-20220908 (https://download.01.org/0day-ci/archive/20231217/202312171007.c8vKL1Og-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171007.c8vKL1Og-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171007.c8vKL1Og-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: fs/afs/callback.o: in function `__afs_break_callback':
   include/asm-generic/cmpxchg.h:76:(.text+0xa34): undefined reference to `__generic_xchg_called_with_bad_pointer'
   csky-linux-ld: fs/afs/callback.o: in function `__afs_break_callback':
   fs/afs/callback.c:99:(.text+0xaec): undefined reference to `__generic_xchg_called_with_bad_pointer'
   csky-linux-ld: fs/afs/rotate.o: in function `afs_start_fs_iteration':
   rotate.c:(.text+0x664): undefined reference to `__generic_xchg_called_with_bad_pointer'
>> csky-linux-ld: rotate.c:(.text+0x70c): undefined reference to `__generic_xchg_called_with_bad_pointer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
