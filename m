Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D22E376E0
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 04:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730780348; cv=none; b=Ln9UigEy6pQbXNh37KPB44mYRs2Qw+yDEdJvGX67GRyZ9jzKeci8/sWlALRtPaSR/o4XYSWtA8E/i1cWlYIIaJUDUTLlUNRgJnayiDf2E10vsD4mYWuRNTbLvzO+TPXttQKqt+yVn9dnKpM4wkzhJLDcE4NmdAzdcrFaOghmNX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730780348; c=relaxed/simple;
	bh=xuHZtTTkxKLxqOA7TVCw7npWAYuiEbQflgv1BMoDoUY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XCDWFxUCE6+TDmsAyjX6F9LZI1Lx4bULg0ahuwn11233d90HyQ/8hNq5P5xp63889zyiVB8hf4DX3vrWleijHxuwdyxjMPr3+Eq1UIa/xPFt0/mVMn2UXGj/G+kVUmgz14h9zkNiCaxCNZO54fmdStfBhmt73KG1flO/B7flQhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D2hR+JvJ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D2hR+JvJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730780346; x=1762316346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xuHZtTTkxKLxqOA7TVCw7npWAYuiEbQflgv1BMoDoUY=;
  b=D2hR+JvJyJ3goHkqa52ywEH6RJ9OdYcUIXQwBLRlnRE3a0tZZ/KvADbw
   NyzT7rcMA/CdCs9qs5gnpL2MqhK9O9Fr+CUoVe8mwbGdncenh8GN6UOeS
   s/RSkAoTBC1uEHplvy9NReKlsonS3Kljwi+9/jM5AiO86Jywm6KzN2qsJ
   LaFLNpdiMcfDzeITYleEH6kIJGY5cWHhi5otNk1npZSRRHoquvz72AXNs
   BLufj6n1+hKCXX/o1Er5WxdSjLSNysh9I38KbqPQAdHoCPINZO4GCm+qW
   qh+gCqW95l4XepjSm5G7mhX9JOH/oH36t6I/RSv4+mOQUNHgx1eKJI7e6
   w==;
X-CSE-ConnectionGUID: Fhd+mZFRRhKErfDZRBG8wg==
X-CSE-MsgGUID: VG6JoXoeT+aJIUAqYTDCng==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="30384653"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="30384653"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 20:19:06 -0800
X-CSE-ConnectionGUID: GkADB1GOSGOzaJbD6jU0fw==
X-CSE-MsgGUID: RPAXR/6+Rgivklj7HUxaFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="84681029"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Nov 2024 20:19:05 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8B1y-000lbp-16;
	Tue, 05 Nov 2024 04:19:02 +0000
Date: Tue, 5 Nov 2024 12:18:18 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/ibt 10/11] vmlinux.o: warning: objtool:
 apply_alternatives+0x1b7: relocation to !ENDBR: BUG_func+0x4
Message-ID: <202411051227.7nwT5lwb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/ibt
head:   62e8598e1d31c62fc827b23173786c9a5a525fb0
commit: f8c0cdd341a8c29884b35532fd9638a2b320b286 [10/11] x86/ibt: Implement IBT+
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241105/202411051227.7nwT5lwb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411051227.7nwT5lwb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411051227.7nwT5lwb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: apply_alternatives+0x1b7: relocation to !ENDBR: BUG_func+0x4

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
