Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4914D1DFD0
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jul 2024 13:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720357506; cv=none; b=Z/JqIvxXBygtbpuReYnNHbNkMtEKWYGAFvwvaJAHw6nSmJ27S3ghOUbfyEPjnVn91IslJR5WCXs5gSLf42iXPGpVoD5i1WVC5tXNUQpNJJrpxOOBPSsykNi+myNl73kAh1XK8v1jfmT6VT2iKRfACS1CFv6aYTlOpke4VwYepCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720357506; c=relaxed/simple;
	bh=mYCYze0uKAsRLYR+1oi6gFaLz/0RiUDX2dcWl5NwRg0=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u2ZJ3HbeaOVzVnEWvlrKPe+B5kiTb/4toe6ehjURmjt/teqvLaFrsCi1OnPQLB6b2wZYYq9cGEC0mU8C4wAr8ej81KjI+V2Sm9Iu31+fB2ujDHHCFgJhriHcurGao429FjhylhYTpqpVyVUgQ5PYbnYUNC/Ho117Cdx6rnAG1Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=irsuWNyA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="irsuWNyA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720357504; x=1751893504;
  h=date:from:cc:subject:message-id:mime-version;
  bh=mYCYze0uKAsRLYR+1oi6gFaLz/0RiUDX2dcWl5NwRg0=;
  b=irsuWNyAkPZGEcysKbzzn3Jca4pIH1vhn8PwW+BoYEe6r1SAhOKre/b9
   zFBXfza2+euZ7oYJsMLwJYp+BkWk+9zE3+3i9bjt9HlvpcNIMdedE1AGD
   wUEzTPu2HVc4cyvj564d4ng8EmT2v93oxVHrlistG265hqzjN4j/dy4DT
   ZBtuJyxyDwF8HGou2NZ6HUT9qsjxfIZV5h81/3KVWMiy6OUDgrlOvYFzW
   vF2BvB31pCu6lb3dm3T31B1hc627bUZw46RlLOaan28TctOkoqxF2zTVl
   awa6ug0sQxkgV39p3mTUGSQzdd/UdEAK98qDFgG2fD6Dhp9tcN2yXskRr
   Q==;
X-CSE-ConnectionGUID: qc0J6iVXTeifD9dBxZaWkQ==
X-CSE-MsgGUID: nuCKQwlOR26UrtXqUIWgJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="28723672"
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="28723672"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 06:05:04 -0700
X-CSE-ConnectionGUID: cTS6QUw9RwKDyreQCGKiwA==
X-CSE-MsgGUID: VeBOBj2bTqyvc2J0qhQCPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="52211593"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Jul 2024 06:05:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQRZc-000Uxh-0G;
	Sun, 07 Jul 2024 13:05:00 +0000
Date: Sun, 7 Jul 2024 21:04:28 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>,
	Vibhore Vardhan <vibhore@ti.com>, Dhruva Gole <d-gole@ti.com>
Subject: [ti:ti-rt-linux-6.6.y-cicd 30/42]
 drivers/pmdomain/ti/ti_sci_pm_domains.c:54: warning: Function parameter or
 member 'lat_constraint' not described in 'ti_sci_pm_domain'
Message-ID: <202407072044.mVaUaOyX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y-cicd
head:   fb89cd4d622ce6cc1b7b254ae21298570d437a08
commit: ca11e100862310b1abdd072b113bae8a68ad26b7 [30/42] pmdomain: ti_sci: add per-device latency constraint management
config: arm64-randconfig-001-20240707 (https://download.01.org/0day-ci/archive/20240707/202407072044.mVaUaOyX-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407072044.mVaUaOyX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407072044.mVaUaOyX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pmdomain/ti/ti_sci_pm_domains.c:54: warning: Function parameter or member 'lat_constraint' not described in 'ti_sci_pm_domain'
>> drivers/pmdomain/ti/ti_sci_pm_domains.c:54: warning: Function parameter or member 'constraint_sent' not described in 'ti_sci_pm_domain'


vim +54 drivers/pmdomain/ti/ti_sci_pm_domains.c

52835d59fc6cc7 drivers/soc/ti/ti_sci_pm_domains.c      Dave Gerlach 2017-04-04  35  
52835d59fc6cc7 drivers/soc/ti/ti_sci_pm_domains.c      Dave Gerlach 2017-04-04  36  /**
52835d59fc6cc7 drivers/soc/ti/ti_sci_pm_domains.c      Dave Gerlach 2017-04-04  37   * struct ti_sci_pm_domain: TI specific data needed for power domain
efa5c01cd7ee20 drivers/soc/ti/ti_sci_pm_domains.c      Tero Kristo  2020-09-11  38   * @idx: index of the device that identifies it with the system
efa5c01cd7ee20 drivers/soc/ti/ti_sci_pm_domains.c      Tero Kristo  2020-09-11  39   *	 control processor.
efa5c01cd7ee20 drivers/soc/ti/ti_sci_pm_domains.c      Tero Kristo  2020-09-11  40   * @exclusive: Permissions for exclusive request or shared request of the
efa5c01cd7ee20 drivers/soc/ti/ti_sci_pm_domains.c      Tero Kristo  2020-09-11  41   *	       device.
52835d59fc6cc7 drivers/soc/ti/ti_sci_pm_domains.c      Dave Gerlach 2017-04-04  42   * @pd: generic_pm_domain for use with the genpd framework
efa5c01cd7ee20 drivers/soc/ti/ti_sci_pm_domains.c      Tero Kristo  2020-09-11  43   * @node: link for the genpd list
efa5c01cd7ee20 drivers/soc/ti/ti_sci_pm_domains.c      Tero Kristo  2020-09-11  44   * @parent: link to the parent TI SCI genpd provider
52835d59fc6cc7 drivers/soc/ti/ti_sci_pm_domains.c      Dave Gerlach 2017-04-04  45   */
52835d59fc6cc7 drivers/soc/ti/ti_sci_pm_domains.c      Dave Gerlach 2017-04-04  46  struct ti_sci_pm_domain {
efa5c01cd7ee20 drivers/soc/ti/ti_sci_pm_domains.c      Tero Kristo  2020-09-11  47  	int idx;
efa5c01cd7ee20 drivers/soc/ti/ti_sci_pm_domains.c      Tero Kristo  2020-09-11  48  	u8 exclusive;
52835d59fc6cc7 drivers/soc/ti/ti_sci_pm_domains.c      Dave Gerlach 2017-04-04  49  	struct generic_pm_domain pd;
efa5c01cd7ee20 drivers/soc/ti/ti_sci_pm_domains.c      Tero Kristo  2020-09-11  50  	struct list_head node;
efa5c01cd7ee20 drivers/soc/ti/ti_sci_pm_domains.c      Tero Kristo  2020-09-11  51  	struct ti_sci_genpd_provider *parent;
ca11e100862310 drivers/pmdomain/ti/ti_sci_pm_domains.c Kevin Hilman 2024-07-03  52  	s32 lat_constraint;
ca11e100862310 drivers/pmdomain/ti/ti_sci_pm_domains.c Kevin Hilman 2024-07-03  53  	bool constraint_sent;
52835d59fc6cc7 drivers/soc/ti/ti_sci_pm_domains.c      Dave Gerlach 2017-04-04 @54  };
52835d59fc6cc7 drivers/soc/ti/ti_sci_pm_domains.c      Dave Gerlach 2017-04-04  55  

:::::: The code at line 54 was first introduced by commit
:::::: 52835d59fc6cc7f3c3cfdb4a194ddc9ebd6c0c31 soc: ti: Add ti_sci_pm_domains driver

:::::: TO: Dave Gerlach <d-gerlach@ti.com>
:::::: CC: Santosh Shilimkar <ssantosh@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
