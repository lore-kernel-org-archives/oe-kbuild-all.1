Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990A529CEB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 05:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727587635; cv=none; b=igqQoGQECCuPCmNtPLQkvTDBCdX2Q6nztS3kQJhBrMZl1Iy7WZfX84+mkYMZpztXjfPrzQvK0am+Oms+1zPNStWuPw1w+8KDfXQOazeX7KC/18WCtzRJk+SaOHy4NC2aauxuYkcxcdmhfzSV+SDiYG8vnn+b3nBtwhLDOzkUmHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727587635; c=relaxed/simple;
	bh=b3v53adiqwybcINiR0wosd3UWyEU5QdncxybAtA2FDg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cTWs10rhL67oj0pY6b8O6tUfUq3neCg9BSiOO9PscYbiT1/xvZClhAEWa95Xvc6hCiPLxo1y0ffvLf62J4FIP6fbLmTGD4ooiGzenBykwVQzcrZ0+Msc4oEY5UEnOSdwUXlQXpx5zIYUIjcQ5n4EKeEds+8FB+3ebjHThdQhv00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PJ9yqxWV; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PJ9yqxWV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727587634; x=1759123634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b3v53adiqwybcINiR0wosd3UWyEU5QdncxybAtA2FDg=;
  b=PJ9yqxWVWPRIPnYwgNSd3q/oVfSzmFX5ICIXVlCAuI2oXYV4xID90Ztu
   DQT9DR4kfAiu0AD9nvPgGiTr7/2UzH+rr64J3dt1IOsFUXLPDxKJ/B+Qw
   lhiybG9dL9Yt0jTHUxu0WU6F0ep3rWyYKm67MpxcTTfxLFtav9zYqLKsT
   Qe+ZoLOh6dhhOBnxlaW3Fa1B3GOD9ASIfZQBpVlIjMLaHJGu0iWV/ttMG
   295AIBtC7NZ6thzK9ST8biBWwq2IiWnv3QGaoUTOU8HcqFEB7JBGFsMca
   pZxV9EhTraTyfnLD7chpVos4OoSu0P+Q5/DKJU4bIwaL54pM4wDNJYD0Q
   w==;
X-CSE-ConnectionGUID: I6FjYTCHTtOavPyclIFrrA==
X-CSE-MsgGUID: xWaCIB/tScClYOIDX7VEIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="37258861"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="37258861"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 22:27:13 -0700
X-CSE-ConnectionGUID: p5HClv8nSBKwqXQJun3K3A==
X-CSE-MsgGUID: ggvaHaMLScqOJvbPJDQFBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="77467223"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Sep 2024 22:27:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sumSc-000Nuh-02;
	Sun, 29 Sep 2024 05:27:10 +0000
Date: Sun, 29 Sep 2024 13:26:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 339/447] arch/powerpc/kernel/eeh.c:1936:5:
 error: redefinition of 'eeh_pe_inject_mmio_error'
Message-ID: <202409291300.WDJpieoh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   2a160886dc6861c50df03e043f2b5e6379fba22a
commit: 8cba82d0976aca66bce0d5c31b2b78892f7d6161 [339/447] powerpc/kernel: convert to read/write iterators
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240929/202409291300.WDJpieoh-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409291300.WDJpieoh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409291300.WDJpieoh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/kernel/eeh.c:1936:5: error: redefinition of 'eeh_pe_inject_mmio_error'
    1936 | int eeh_pe_inject_mmio_error(struct pci_dev *pdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/kernel/eeh.c:1670:5: note: previous definition of 'eeh_pe_inject_mmio_error' with type 'int(struct pci_dev *)'
    1670 | int eeh_pe_inject_mmio_error(struct pci_dev *pdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/eeh_pe_inject_mmio_error +1936 arch/powerpc/kernel/eeh.c

  1935	
> 1936	int eeh_pe_inject_mmio_error(struct pci_dev *pdev)
  1937	{
  1938		return eeh_debugfs_break_device(pdev);
  1939	}
  1940	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
