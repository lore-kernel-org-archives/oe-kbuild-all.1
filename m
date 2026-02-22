Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283312836F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Feb 2026 10:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771756540; cv=none; b=K34AgyKOnlr9aR40vp/durEqACQDkEIhBky+xmpkupVAhR3GeFC2BfTpJZIBN1q8bMChSX0d/JArO9r7AhPx9J1KWYScQ2Zvz9LJriJ73fSrF7SUy/0hjjHwWorAMAFfPJ5Z7XsW9xvhIsvjm9F+ZaXa4NJ9xNq4lOmYB7ToU4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771756540; c=relaxed/simple;
	bh=CiMmVp3clfjKwCgI1WgmhGTvOKVKmF9c5fHLG6JJw/E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BQysn7S6AzIaPGHfV0A4ZeIXoOSdXIsD6/FZrNM83bX4KMIY2Jz0w/6HS8vbhnjNhakh1+Q65FaOM9EEtbdhDB6G3AlI0UgGvjxrL/oVNVbmEH+H0Cr9qGUg9seDIzGhRVBn8H0gyZLF0Wvkmph6t3RSxJx3OtLGnWNZ5GWZYWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lUfkZhGU; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lUfkZhGU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771756540; x=1803292540;
  h=date:from:to:cc:subject:message-id;
  bh=CiMmVp3clfjKwCgI1WgmhGTvOKVKmF9c5fHLG6JJw/E=;
  b=lUfkZhGUQh69jrMkKC60CCKRtVeepewb0gAehYuYrn7I7RsugSHlPch4
   5VUDbJM0yFPzybtBumZkJxd3oF1wqH1j3BDpiv4+OeFCmwFVdyVPMi+E8
   hKHWsifLCS50oQ6fFRsucDfSOq3AGlUeji/BAac6txq4r/MFMbSxx+DbU
   H3uiAojRwHUtrPyewOz650CqAUsbp/8WghOevbY440WIjaLXvmmHFnDdv
   H56qa2a32xeMg8886OEw5jHroxHnkKxYfng+fHkzGE+qLfZNNrA3igYWw
   fd8zk1cbIwVSohSG/CaOpauaXY8ktG0ZHedhdYHmjPXnAOLCUUB9FCtRq
   g==;
X-CSE-ConnectionGUID: CRhMBmOoROOwjnZ+DZwhwQ==
X-CSE-MsgGUID: 65KXRXSTSoKkOLukfO41YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="83096682"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="83096682"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 02:35:39 -0800
X-CSE-ConnectionGUID: gzg+eR2zQnupP+w0eTCU/g==
X-CSE-MsgGUID: MhIKyyY0Smq9QgBx/KT+SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="218889960"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Feb 2026 02:35:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vu6oJ-000000015Qy-0WgL;
	Sun, 22 Feb 2026 10:35:35 +0000
Date: Sun, 22 Feb 2026 18:35:07 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:private_compression 48/60] Warning:
 mm/page_alloc.c:5593 function parameter 'candidates' not described in
 'find_next_best_node_in'
Message-ID: <202602221808.e9nNSYlL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux private_compression
head:   9fa5ffee4fd4726e31f05deebb938cccfa0b460f
commit: 48a8ea8dcaa2781e2ab529cf440334d15dca5512 [48/60] mm/mprotect: NP_OPS_PROTECT_WRITE - gate PTE/PMD write-upgrades
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20260222/202602221808.e9nNSYlL-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260222/202602221808.e9nNSYlL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602221808.e9nNSYlL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/page_alloc.c:5593 function parameter 'candidates' not described in 'find_next_best_node_in'
>> Warning: mm/page_alloc.c:5593 expecting prototype for find_next_best_node(). Prototype was for find_next_best_node_in() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
