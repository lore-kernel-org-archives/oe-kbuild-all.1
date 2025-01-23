Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7F929B0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 06:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737614347; cv=none; b=BG1OsBRBPtE4wGOLWI8po8zEqP135gUr/L5LlESAKh1l9TJ1qcG6KZ6fLtlfYPF0lWyX7EIpI8M23vq8S672J5jG2ILIVqC/BkhEBzexwCXYpl+LkXrHDD0E6tYdBeyIQHyvJBRT4XzAufFgUKQJj3PvNI0DKqrhAKnGVDbADL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737614347; c=relaxed/simple;
	bh=xAhkKN1fL5nKBlFc8l7sMfYqkWZWwOhegSZkAmVPLmk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lDRe0DHPrPduShSWLYAM5iWOeDMBj39xeFq1n9LJcn5zw0TsgNJiDbbwAmJ8H8grM8jGdqRh4HUvPfcX4in7L9XXwRJ1qACzGqBZ0vicOV1uWgoApePUp9xN8cc1MQJ75/gac/DjjY6x4dJ4aMCyrxC+EVsHsYOegmHsjkr3R94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=REQVy2xv; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="REQVy2xv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737614345; x=1769150345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xAhkKN1fL5nKBlFc8l7sMfYqkWZWwOhegSZkAmVPLmk=;
  b=REQVy2xvdAW7MTSrQHSk8TPf7/42ReuTZqw3vjR4Kc8MVwoxk9wemkmU
   6dD/qkvD6MwRJqtF91HF9RJsM6PnUsFCTso8moEz9q9x6lpebrYKfQwYl
   TVGf94F8koud3WFK7/PlmpLfsPmNDADeUKQ70+CnT0Do5bGYIlJDa0eeh
   0NSvBpxXPDcHbx6JG2gHAJ2SBT7BrUc/AqLBqbn7ntQ4quE32ShCUFSB6
   Z+KextE+iL1B62hJ6jJDcuTZahNA3PLjdkVup74sZU74WGxWhbhuRkmal
   zwgBXZeox03yOLG0YwN72/vCiFAd+ehO23pcIfI73ZRLq3xWUw+o+Itb/
   Q==;
X-CSE-ConnectionGUID: 1SsAU7nMRHetv864i3xcWw==
X-CSE-MsgGUID: bvo69A8hSv6N2LHMw1OeFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49514885"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="49514885"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 22:39:05 -0800
X-CSE-ConnectionGUID: 25u3WgvcRcStGIsonaigIw==
X-CSE-MsgGUID: x78QKhONSnOUXEP1LdooJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112014033"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Jan 2025 22:39:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taqrm-000aqJ-0F;
	Thu, 23 Jan 2025 06:39:02 +0000
Date: Thu, 23 Jan 2025 14:38:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 0/68]
 net/netfilter/nft_immediate.o: warning: objtool:
 nft_immediate_destroy()+0x2b5: unreachable instruction
Message-ID: <202501231420.ycm91oT3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Pablo,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   c88990ac86aff8cf0984a1e9a5d94360e7226471
commit: 6cd0cd38930f98a1e17626c47ca8a06ed9162ce4 [0/68] UPSTREAM: netfilter: nf_tables: report use refcount overflow
config: x86_64-randconfig-123-20250122 (https://download.01.org/0day-ci/archive/20250123/202501231420.ycm91oT3-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501231420.ycm91oT3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501231420.ycm91oT3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/nft_immediate.o: warning: objtool: nft_immediate_destroy()+0x2b5: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
