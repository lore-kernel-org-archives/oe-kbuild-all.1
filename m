Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFFC2D1926
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 21:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757541134; cv=none; b=bm7B/R/Q5gPPbZHOJlOILWjq1REb2R4orkcpkDb1Uwy75/dPGe2jF1ZNhBwTaOEiXONDts6XseemBGvialZN7HD3T5xJQI68JLrLvLiWWM5zNf4ho8E9zPqM44QzduauWg6+cjZYi43L/Di1Pba3J1/W6kvgX14U8IclRBq4Jdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757541134; c=relaxed/simple;
	bh=3rcepyCOO9jD5mIW6c4bzg0OTbjbP3NHVJGKtzG9QN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h1Je/GFSNw195cli+XsBhtqit7xQJ1PQmOEWdvhZqYt9/zukvlE//TUHrIQz7G+HNaraaVfAGV1oywTKs2gBqRNXLAdYVct4S2rmGzcqWRuLW7XXJbo0G4PpqIeHfg9GEQUoUkhFgPT6yvBGP9Pt2SWvRPIyh2CL0w8tx6yzR/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MqhOXfzv; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MqhOXfzv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757541132; x=1789077132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3rcepyCOO9jD5mIW6c4bzg0OTbjbP3NHVJGKtzG9QN0=;
  b=MqhOXfzvfrazeFuX4Jzx8bnJZyXt9HLBtckubj5DF2dkGDmt5KlCyCCK
   VbsYL/8OmkIxnF8rScs/4/RziEo0Rqq6DAvJzUbzM1E0616t+ii6OkYyo
   pcKd0BoefsE8EpdpO0Zf6av/RDkoIFhU2TCoOfcYP++FvX2Hc4LBR8u/9
   niTSCnMlFGg1xD68jAIRx35bIqLwk7cpNMt9IsKzpHKJ7tTQpFIxvfiM1
   BkTCrKDe/NutacTTR3t69xf1kN9NgBndLrmoiYfkd7A+AqIxIOIZNUTf/
   JDkFKrYmmX5agUvcO4vOy5UcCOqCvH8XrZZCG9ob3gsIy6qvxsjK43AtB
   Q==;
X-CSE-ConnectionGUID: f/Sc3vnXTHy4TXykes50XQ==
X-CSE-MsgGUID: H1pD1kxvRhem0rxf9WRnWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59800707"
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; 
   d="scan'208";a="59800707"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 14:52:11 -0700
X-CSE-ConnectionGUID: ktJXwzK9QzegF0Dfpwxtyw==
X-CSE-MsgGUID: r8pzlV7cQdiMQWzYGsqfdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; 
   d="scan'208";a="173582835"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Sep 2025 14:52:10 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwSjX-0006K3-0N;
	Wed, 10 Sep 2025 21:52:07 +0000
Date: Thu, 11 Sep 2025 05:51:22 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 5843/7856] depmod: ERROR: Cycle detected: mtd ->
 mtd_virt_concat -> mtd
Message-ID: <202509110504.JZKrtqy3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5f540c4aade9f1d58fb7b9490b4b7d5214ec9746
commit: c64295ea28808590b15341f4f8065c886a2bb372 [5843/7856] mtd: concat: Set virtual concatenation to tristate
config: x86_64-randconfig-006-20250911 (https://download.01.org/0day-ci/archive/20250911/202509110504.JZKrtqy3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250911/202509110504.JZKrtqy3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509110504.JZKrtqy3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> depmod: ERROR: Cycle detected: mtd -> mtd_virt_concat -> mtd
   depmod: ERROR: Found 2 modules in dependency cycles!
   make[3]: *** [scripts/Makefile.modinst:132: depmod] Error 1 shuffle=3628295961
   make[3]: Target '__modinst' not remade because of errors.
   make[2]: *** [Makefile:1917: modules_install] Error 2 shuffle=3628295961
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3628295961
   make[1]: Target 'modules_install' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3628295961
   make: Target 'modules_install' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
