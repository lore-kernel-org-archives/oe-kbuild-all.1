Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C16E143895
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 19:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727550752; cv=none; b=BzjpkZfnXNMXDHalesSj1Y2DL8LP8D4DjfIF2dD3ttDJcqtj62JHif6tGppcGEqrayXlqr1toksutXPEwxrHdUfw4LPwrT0qQtSTW3tqlb/fjQN8lHqRhsAy9B/C/zs5jfiRsSo074pEu6CtlxivcPriBbLRQpOaSAuTawPrwr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727550752; c=relaxed/simple;
	bh=VfkxJ+C6a1HhY/ltH5G+WfUvmZF6bh5N5O1zlJQLvRE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mGMZefH3DkvdU951xjrw97J0h+l5YexP4NSpSFdlN3AtcGWB/8RfaiYr/XKi4bKzzPyKjWYtiEq+HvUnNfpjHqjhpR2O2jwy4d9JJf0STTUSfD8hDWBt1eOGDYlJuYGval0xsGK2dLQDCtlpHBrZXiE2DgDQNNVrmxKIvXT45jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RBQkPxRd; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RBQkPxRd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727550750; x=1759086750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VfkxJ+C6a1HhY/ltH5G+WfUvmZF6bh5N5O1zlJQLvRE=;
  b=RBQkPxRd61pG9KLCh+qwI7PkgpNFDOEK07yYZH8nbjhJ1s7KaTbex8+b
   1v0To3eOEplBUhFqFudAQ1BBo3HhzsD5RAhEVXtf0qUMXmoSUyQpSm/2z
   pCpvXXLYmYEAixde3KWEVqihgK4OeWu5+5rYbAuF4wRdK9ZloPntnVori
   KyXixzlvyGvQezuH+P8KNDSUtNtCrcYnGzJAYLmue5niQNX7TjiPahOLW
   M6MHms/GWqZQ0zIVeUodGKQPAlnCx7dIWeb1HslhTRkHiceQRXAYDSvKb
   aQY8AJMydtNf5c4/a68zpQHk0D733V3KC+O81T0qjWtYTM3bLHtbuBhEz
   g==;
X-CSE-ConnectionGUID: cibpRpyCTGmCTF60K0eULw==
X-CSE-MsgGUID: b81Sa81aQpKu3eFvDH8LBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="30378648"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="30378648"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 12:12:30 -0700
X-CSE-ConnectionGUID: 69PkAHRmQ7O0Xsts37TfLQ==
X-CSE-MsgGUID: 2LjTstcHQCaEBSwJdulf0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="73663039"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Sep 2024 12:12:29 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sucri-000NXv-2T;
	Sat, 28 Sep 2024 19:12:26 +0000
Date: Sun, 29 Sep 2024 03:11:45 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:memblock_align 2/2] srat.c:undefined reference to
 `set_memory_block_size_order'
Message-ID: <202409290354.rAuhjiR9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux memblock_align
head:   f0872fa1a7074d7d5049a450c48eb97dfe49c2a4
commit: f0872fa1a7074d7d5049a450c48eb97dfe49c2a4 [2/2] acpi,srat: reduce memory block size if CFMWS has a smaller alignment
config: arm64-randconfig-002-20240928 (https://download.01.org/0day-ci/archive/20240929/202409290354.rAuhjiR9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409290354.rAuhjiR9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290354.rAuhjiR9-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: drivers/acpi/numa/srat.o: in function `acpi_numa_init':
>> srat.c:(.init.text+0xc10): undefined reference to `set_memory_block_size_order'
>> srat.c:(.init.text+0xc10): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `set_memory_block_size_order'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
