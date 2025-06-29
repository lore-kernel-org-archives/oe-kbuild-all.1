Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8388C320B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jun 2025 03:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751167614; cv=none; b=jfVCwMtGGaoMsrHUlUkRFmp58IzO11z4f0qt9LmkiHo64ib+/NyyDichOaGGoFQY4uZqosquVMY51OLx9n5pnYNJC5/IzbK8equZh5hD0l8vpq/oJ11L3lOiJI+Ms4q4SrH5+AUgfX2GRM2mMr2pSDl13lfh7dRbGzNlqgsnnrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751167614; c=relaxed/simple;
	bh=ft7RV9ZRk8goeL81qwAbCBdoGln/uYB7jP1l0vX5wGI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ezAUFd8aUcfTuvMiyBlLPOutQVRKz6jFHrm5BnYSwTNG1cLCZ+zDecdXPgcBIQio8f121a6EcA1jgvCWNDus6ZRiiqHCDigbR3ux/yh24wuriD1PlwpEjgeBxfHe9VCNMAf5aCoyobOXnh1B5+4Gsb7LdqVy5xoOp3UkHK39AjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fR2Z+t7Z; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fR2Z+t7Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751167611; x=1782703611;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ft7RV9ZRk8goeL81qwAbCBdoGln/uYB7jP1l0vX5wGI=;
  b=fR2Z+t7Zbh2gI+8FJt6iRW56UmCFsA6RhCXWm2nJYMsckQW+yy+7Y7oV
   7aK0ybpYnRkUyZJET5SBB6j0UBzkEF2BVsraHKNHrbf4VqVAGgm9RT19D
   E0XD6oCoBznnjS4Zzw81YPGPADimnpkAMWyqfeZcVkLnPN4RjLHixxtTR
   ahx3OqrZ687W/gw5lfCzoB8ur51tZ+Y9LGqkfRhfVbpZKCyCjlNrT8Xc9
   rOkhwc5U6fF+2FS0MaBxHbWTB6/g24CHBF7ekpBZHbjxq2qL9qtzhKGFK
   CSrLC4vwLG8iNhMbL0Q7m64D1oD5K148RNYS+A91KA/uy+cdpmMhRu4Hx
   A==;
X-CSE-ConnectionGUID: XhUO3cBPQouSmNGQwo9vLg==
X-CSE-MsgGUID: 2G6Z8f71QG+XRP8aTkhZmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="75976192"
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; 
   d="scan'208";a="75976192"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 20:26:48 -0700
X-CSE-ConnectionGUID: rI4jlI7aTtWRHS5BUAwfKA==
X-CSE-MsgGUID: Fquy5jR0Re6Sqg382QbB5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; 
   d="scan'208";a="152529219"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by orviesa010.jf.intel.com with ESMTP; 28 Jun 2025 20:26:47 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVigm-0000rH-0b;
	Sun, 29 Jun 2025 03:26:44 +0000
Date: Sun, 29 Jun 2025 05:25:53 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, =?utf-8?B?6Zer5rW35rab?= <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2411/2411] fs/nfs/dir.c:1498:6: warning: no
 previous prototype for function 'nfs_check_have_lookup_cache_flag'
Message-ID: <202506290538.Adg4qVrg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c02455c4cce8052f74fc11c09e9073c01c7f33a4
commit: 18e360871c3f648ecb0d8cc9b23fd4268a64c17f [2411/2411] add enfs feature
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250629/202506290538.Adg4qVrg-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506290538.Adg4qVrg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506290538.Adg4qVrg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfs/dir.c:1498:6: warning: no previous prototype for function 'nfs_check_have_lookup_cache_flag' [-Wmissing-prototypes]
    1498 | bool nfs_check_have_lookup_cache_flag(struct nfs_server *server, int flag)
         |      ^
   fs/nfs/dir.c:1498:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1498 | bool nfs_check_have_lookup_cache_flag(struct nfs_server *server, int flag)
         | ^
         | static 
   1 warning generated.


vim +/nfs_check_have_lookup_cache_flag +1498 fs/nfs/dir.c

  1497	
> 1498	bool nfs_check_have_lookup_cache_flag(struct nfs_server *server, int flag)
  1499	{
  1500	#if IS_ENABLED(CONFIG_ENFS)
  1501		return enfs_check_have_lookup_cache_flag(server, flag);
  1502	#else
  1503		return (server->flags & NFS_MOUNT_LOOKUP_CACHE_NONE);
  1504	#endif
  1505	}
  1506	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
