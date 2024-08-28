Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0A515B0E8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 07:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724830609; cv=none; b=pwrKMKO82cMyVEGnzmvQA1ML3/pXHIzHu6fhThRTfAQ1lm3Q4o42Kvzcden0ZKbc9I95eB6M5bEjZPHMQNim4jJ8TFHdqglphW+6NmXhFsr04iFS2Y9mArdMWpfUpajTb8x2LQ9iNL0qadUMN5CM6dsr1mS5nanGx2l2gacHkN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724830609; c=relaxed/simple;
	bh=PCDChFgRMBlM/+tzmwLDgZaee47J5KAocqBx2oqUyPI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sr0p85yIoP49YAVEcsM4YggC8jTe6qrgAhNWuBlsk42QRKKLzxoubol3OO8B7Px0MzXF81xw/5jON4LGHCqbmRMjebzf/FwHBDPTy3xZfb6dFug7YnwKBTN9sN4uj1evKJZKsBH1tj4zdSxCWQX9dBgofvYrsv6g8STPtj/8+9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dEYauKDt; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dEYauKDt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724830608; x=1756366608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PCDChFgRMBlM/+tzmwLDgZaee47J5KAocqBx2oqUyPI=;
  b=dEYauKDt7+sh+Rwhycit/9pkuaB65ih19CXo9KskalPo+HLkLjKlAeQW
   rjkMOz99lovecAAePGlNaxuy6BgffWrmw/vZfWg+PJkzSHyAzqF7crlOX
   NrYNki5C3SXh9eKcpGo4D5/dcirXq1tKqkOIYsOWaROeN8INoc2Gao4NX
   ygYziqEqm/GqKtD+ObIgdYGPqmhxlNtswzyjJBu5WhnyCGcb/pTZoVbdZ
   NKL2GrwBvPH0KcV5d4Phj/GTkcRvRlw+JS6RIYIx6v45DYgqVlaEfLLZv
   c7p+Erb52tjrAgHwzUhEwA/kGx2kYP37/lBAONNiU8FVNeIR168Rmvm7h
   g==;
X-CSE-ConnectionGUID: 5Lmvp5DaSeueu0d3pCjFNg==
X-CSE-MsgGUID: yS/OQDepRwe/v79P1QpXzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23470831"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="23470831"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 00:36:46 -0700
X-CSE-ConnectionGUID: KLj7Z7qdRfubyDa59EJzqg==
X-CSE-MsgGUID: 1vkAkJaCR0afYbZ0v5YQdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="67994233"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Aug 2024 00:36:44 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjDEQ-000Kbm-0b;
	Wed, 28 Aug 2024 07:36:42 +0000
Date: Wed, 28 Aug 2024 15:36:27 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?4oCcaHVhbmd5aWZlbmfigJ0=?= <huangyifeng@eswincomputing.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Subject: [esmil:eic7700 13/20] drivers/reset/reset-eswin-eic7700.c:48:
 warning: Function parameter or struct member 'regmap' not described in
 'eswin_reset_data'
Message-ID: <202408281558.nXdvZioj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux eic7700
head:   eb44174b12f99d320be704b45db6b994f6a014bd
commit: 3b45fbe3ce381684af36a10f1ef72b98dd433d57 [13/20] drivers: reset: Add eswin reset driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240828/202408281558.nXdvZioj-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408281558.nXdvZioj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408281558.nXdvZioj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/reset/reset-eswin-eic7700.c:48: warning: Function parameter or struct member 'regmap' not described in 'eswin_reset_data'


vim +48 drivers/reset/reset-eswin-eic7700.c

    36	
    37	/**
    38	 * struct eswin_reset_data - reset controller information structure
    39	 * @rcdev: reset controller entity
    40	 * @dev: reset controller device pointer
    41	 * @idr: idr structure for mapping ids to reset control structures
    42	 */
    43	struct eswin_reset_data {
    44		struct reset_controller_dev rcdev;
    45		struct device *dev;
    46		struct idr idr;
    47		struct regmap *regmap;
  > 48	};
    49	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
