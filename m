Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B99728691
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717891; cv=none; b=ojRni8Dp//RSHAGw9grCIgTPIImMK9bUjRqN77cBXurhGHHdLYpCWjtdtmrbRkorcm8XtCIpgjC/GM7GxPXIpORZ5aBhJbWpIQfU2idUISSfuY7Nu8ViLJu7mXC5aowwBtZLEFWB7sFfYXA4dd0TZ4VHCNIL4r7HPTkO9vvHF5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717891; c=relaxed/simple;
	bh=uMIESTrSiJKuum6QYimfSoExieck/fC0Vn9Er4UJhek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dZ1HIfaZ4x21mOhuGTBV6BVDxHEqIzCVPOJS4AgozY5grK+tO3uYlDie4wlvEUTepIRBT3Xs5MZjgsSiFdqMX7t6BLoe/KVgSA+y9qbBnVD9Jwo5kxLjQsTI2KEt8Ek0pPTa4EdWr24DI8N5CswPZV+yynPfscQXiMkIMlVgTjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=STQH3+/5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="STQH3+/5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717891; x=1765253891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uMIESTrSiJKuum6QYimfSoExieck/fC0Vn9Er4UJhek=;
  b=STQH3+/5BdQbBr8YM88NgSlTpebvYVTI1aOSP9T4gZqG4WzodPK0N2Zt
   JZW9AkDLvzbnhLLf2YDUp1fkQe1z7rBE2Vt8RdVNRSkVPl0ajaG0UL8lk
   ltya9KFfd/6vF+QfS5k6AhJ2eEn4i0Er+aRiYM6WQKX2oGCfBt+4b1f4t
   0NBKQuqDAtXPfOrZZOr7RT1CfNGa5PCWY1NEUclVnvyeOou7x8F7M9XeZ
   PML96PufKgzPvKj7JAUtYwie5iCz5xFP6dCmvd8+IRJsw/lPxGDw2Qvcw
   D5IpQjV9V1mSFdvub9eqGcSC1UDq7DH1Yn+7VAyijKvhPbPSigrXgcXyg
   A==;
X-CSE-ConnectionGUID: 4CjpIpDvRUeiVvj6jyUGgg==
X-CSE-MsgGUID: mFCXzBWLTbWxcgz+i+2sLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="56483014"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="56483014"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:18:10 -0800
X-CSE-ConnectionGUID: MlObR/bnQy6ICZZpxuuxKQ==
X-CSE-MsgGUID: +eqm41ygTE6wKR+bBhKTOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="94795950"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Dec 2024 20:18:09 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVDi-0003pN-1o;
	Mon, 09 Dec 2024 04:18:06 +0000
Date: Mon, 9 Dec 2024 12:17:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 194/196]
 fs/bcachefs/btree_node_scan.c:155:33: sparse: sparse: symbol
 'found_btree_node_heap_cbs' was not declared. Should it be static?
Message-ID: <202412071930.8nCEgJWg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   1e50bc1ed8f08e32678d83b4216f26be485d15a5
commit: 1d711817a0606c707ef62d0c5b50ab5f6b4dff13 [194/196] bcachefs: Use a heap for handling overwrites in btree node scan
config: alpha-randconfig-r111-20241207 (https://download.01.org/0day-ci/archive/20241207/202412071930.8nCEgJWg-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241207/202412071930.8nCEgJWg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412071930.8nCEgJWg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/btree_node_scan.c: note: in included file:
   fs/bcachefs/bcachefs.h:998:9: sparse: sparse: array of flexible structures
>> fs/bcachefs/btree_node_scan.c:155:33: sparse: sparse: symbol 'found_btree_node_heap_cbs' was not declared. Should it be static?

vim +/found_btree_node_heap_cbs +155 fs/bcachefs/btree_node_scan.c

   154	
 > 155	const struct min_heap_callbacks found_btree_node_heap_cbs = {
   156		.less = found_btree_node_cmp_pos_less,
   157		.swp = found_btree_node_swap,
   158	};
   159	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
