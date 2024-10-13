Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80332907
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 08:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728808964; cv=none; b=LcW7KDdyNC1LsZa/Pw0KmYAu8OgYHyzUgzockhEhTrxgnJMYu/4xZZBVeuNoZR5MMGXyNmEjXkRk4X1ropMvj2JrIjB/uJhcyIdLSUzYKvF3cR5zLrzlr0aJpJbHSrFrz67Esta0YCJpzHauQi8HItABnLpZwF7PewcxJQafock=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728808964; c=relaxed/simple;
	bh=Ndb4uGwqF/QNRU6ZrW1YLBuMUFR5/faozp3oGSiJYUg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PGi3jNBndVkif/rAwF00bxkQvblaariqZVnDIwvABSHKOTa+PosWJdkthJuyFXsBUI1D4EKTMAx6KJDjEecEOkUECkOi3KNS2KeOM31+T3WJaYIaJlrtyEQnVszjqrM7CkCXn4PnGrFmtF+95CXXfc86pNbDx2S38pLTWkaoAis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kZr2GKg+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kZr2GKg+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728808963; x=1760344963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ndb4uGwqF/QNRU6ZrW1YLBuMUFR5/faozp3oGSiJYUg=;
  b=kZr2GKg+5rVOUn/jDNOTyb5Soqt6jzGKgzgOvcsgHD+nwAtKge8MZM6N
   72B549t3F8xfl4EE/2rQKcY+nMImJ+fd3S1rsVLXqXqhk1CUEB3iZnGnB
   1oQPnp6P6VVctf4pit5p5iMNhmqBFzT5wCukOHiT5PnvfLfEEUwtwvKPl
   bBCy4wLe+OIhOM5xVQI048hwVtIqXyCWJa6x1KiLCsAfCMZOwnRrhWzmj
   PtuOJAL4d4OXPKrmwr3kKzd6h3Qs5ESdp5rnz9KZKxxHV7M3SV/eyKjJ/
   9EPzv/nwsj/nAE8SLDEpSGelOi+wUOBY7LTncXulBeldk3k1FCpUuo5r/
   A==;
X-CSE-ConnectionGUID: x1UtohQLRAm32oA6+ObA7A==
X-CSE-MsgGUID: tLFndMnGQYytFPQuC5tn2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="38738361"
X-IronPort-AV: E=Sophos;i="6.11,200,1725346800"; 
   d="scan'208";a="38738361"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 01:42:42 -0700
X-CSE-ConnectionGUID: OBt9dtf7T66IDMLy7BMccw==
X-CSE-MsgGUID: 7OHxzub4R8eZdDNVL89Jiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="82083889"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Oct 2024 01:42:41 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szuBS-000EDr-2V;
	Sun, 13 Oct 2024 08:42:38 +0000
Date: Sun, 13 Oct 2024 16:41:41 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.4.y-st 2706/2707] ERROR: "is_console_locked"
 [drivers/video/console/fbcon.ko] undefined!
Message-ID: <202410131600.7kRgJmgO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st
head:   b5f5caba9e17aa617f5764a9888662c3d0a90540
commit: 7c4bd759d48d5dbf60707ce64bd51fef36910309 [2706/2707] fbcon: Prevent that screen size is smaller than font size
config: arm64-randconfig-002-20241013 (https://download.01.org/0day-ci/archive/20241013/202410131600.7kRgJmgO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241013/202410131600.7kRgJmgO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410131600.7kRgJmgO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ERROR: "is_console_locked" [drivers/video/console/fbcon.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
