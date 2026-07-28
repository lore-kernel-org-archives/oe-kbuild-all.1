Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E22C423EB2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 11:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785237280; cv=none; b=a/XYBiJEm5txl4zJw+gyIkuUMPZTlA1NRPUegdUyAYcp2oFljSgKQXDrhdZCLlvonXEF6Fb5CpN0Q3XzbimNY0oTS7zv204JVjAJXDGaAM1VbSSKRDUuHHnOmjh1VlLnFdHNeCkklVaKB8izvjaxIfTDGzTxKPnTTgAIpioDcrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785237280; c=relaxed/simple;
	bh=qqKBy0vCjHvQIHoT1uURxLbO8DJrx6zB/QHTbwVd8l0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZL2kOA7VWy8ZojiB/9u5S5tnWUUcfyMI4WPhjmySaIa540FZYkXErRWYBEG4PcWd61FBNVvRSl1Yd53OsiOajHn1lDmzgWcrc0xfw7KodKVnUrEldYp2ONYBoY5dFMCNoyL6og/rsX5GX7qzh5Y9rzxhG2dZKa8xqknk9sT6kNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A471cA4V; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A471cA4V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785237278; x=1816773278;
  h=date:from:to:cc:subject:message-id;
  bh=qqKBy0vCjHvQIHoT1uURxLbO8DJrx6zB/QHTbwVd8l0=;
  b=A471cA4VhWW6xSyyDpwp4WC00OMqXm//cx8bZARvVWpNydKwBNQMpWV3
   t09GSYvyZ1x+MJwc4p0KwoS9oy0CJEFnnkQXuKJmivdjVrjuUa6//Ui9j
   UOW4tNG9jwb4nMY/5AHF38kBBPb/389LviJj3WPQeM9TfyI166EW9YNMB
   P21+8q4XndnH4rsEKaUP4YHlkebxUZJ+AiJqoSy8w3kaP/rQF23QnqZ0U
   wX4+OXqg/7k+rmcO+S7THhLHE4DDiazzLa8PQ6PcFbvMosz/sjgnfFGIh
   qxelyOaDLkiaBEQVWcMOA+7zg18RumkVAqbMGbq67kNax8iNkHhFGTbPB
   w==;
X-CSE-ConnectionGUID: I9BdGU5qSKyPQIXZH0Fx5Q==
X-CSE-MsgGUID: G/PhY8tSS1ybKO/uZ7vfPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85666977"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="85666977"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 04:14:38 -0700
X-CSE-ConnectionGUID: iEy0ozogThKgKiR/4giGaA==
X-CSE-MsgGUID: yxiqDacKTSuyWMpU6DS7hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="260321624"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 28 Jul 2026 04:14:37 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wofla-00000000eIE-1C6A;
	Tue, 28 Jul 2026 11:14:34 +0000
Date: Tue, 28 Jul 2026 19:14:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jan Kara <jack@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Christian Brauner <brauner@kernel.org>
Subject: [brauner-vfs:vfs.all 208/263] ERROR: modpost:
 "__inode_attach_wb" [fs/ext4/ext4.ko] undefined!
Message-ID: <202607281811.F3c6kRvX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
head:   e6f9ac7f8b2d4704a972e843688fa736ea0431db
commit: c26339e1df335423bcbb83d6fa6ff94b1545b8ed [208/263] ext4: Fix data integrity writeout issues in nojournal mode
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260728/202607281811.F3c6kRvX-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607281811.F3c6kRvX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607281811.F3c6kRvX-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__inode_attach_wb" [fs/ext4/ext4.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
