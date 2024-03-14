Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B861070CCB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 18:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710439602; cv=none; b=FqwywSpB5ysveX/E1m/XEd8hJe/tGLeOQCEz/U2JRCVJ5ZUHE3j96g8h9lb8gzhw5kJkSoGCaw3AB9n+H85awqMsDweu7swMBd84+boPWYeZLfCAmpnvXpMePPOjKoOCuxRZy04q0/DOUw9uGw7YDEfsm+83HjzmIlcxjfTPZ2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710439602; c=relaxed/simple;
	bh=TFjcifkiYtDcaSpK/Dpa5GyqjjECNT2E35QUaG2bwxg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FODxZfbbVk9iST5k12sttA3RsIxnT3PfO7VxudZWRAMgK6DVobxAF9B/+433BYEUIcEjvVDQYBh7MlGhFMLrJx2Nn2/tH6N2M8/eKSGRcMCwZcMv6G0D28ebQk/xm/yR6RA7NZKPxAhQ1Bg9WSI2+z8lzR7NZH8JEzqSXoYdNOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fcYYRRyD; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fcYYRRyD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710439601; x=1741975601;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TFjcifkiYtDcaSpK/Dpa5GyqjjECNT2E35QUaG2bwxg=;
  b=fcYYRRyDcL3Y5C57RSSqQdF0fyesXRhFOP2uPfnZh31U7mxYQbnOuLAf
   9MGqagwz2nQshZyr06xMnPWP8AeX1K7vzL0CBoYpHp6jqceZ9kDMCRS5w
   d8IgyVESvgSXUY8MRb3OijjTSiBdfmbp0bapPfG1ohEBsmJWDbCLfLmmD
   UnrPDVBhl/GDziOZfvW4BUUJ5ULUk0IMGktVoojo4ntN9E09ni/IMsSag
   pgXwwte1lHvrg14cN5dV0ynBtpIvLsFDV4HKZ9NLVnwXKngq2XqPXOgx+
   ngMn7f1pSgYvHkfGxQpIBQkU5fUTQI54a1uyzNSDxAJXVft9tneCs3vfO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="22739969"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="22739969"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 11:06:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="35500352"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Mar 2024 11:06:39 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkpTQ-000Dh5-2O;
	Thu, 14 Mar 2024 18:06:36 +0000
Date: Fri, 15 Mar 2024 02:06:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 24725/30000]
 drivers/ub/urma/ubcore/ubcore_main.c:61:5: warning: no previous prototype
 for 'ubcore_open'
Message-ID: <202403150158.8RInG6yZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   9e82708a746dc5d4ec8995a3e6edace2cf23c6fd
commit: 95c713224477ac3433652331dd715e9bbcbc793a [24725/30000] ub: init ubcore module
config: arm64-randconfig-003-20240312 (https://download.01.org/0day-ci/archive/20240315/202403150158.8RInG6yZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403150158.8RInG6yZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403150158.8RInG6yZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/urma/ubcore/ubcore_main.c:61:5: warning: no previous prototype for 'ubcore_open' [-Wmissing-prototypes]
      61 | int ubcore_open(struct inode *i_node, struct file *filp)
         |     ^~~~~~~~~~~


vim +/ubcore_open +61 drivers/ub/urma/ubcore/ubcore_main.c

    60	
  > 61	int ubcore_open(struct inode *i_node, struct file *filp)
    62	{
    63		return 0;
    64	}
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
