Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26E013AA46
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Sep 2024 11:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726833048; cv=none; b=oHOVRrMRX8/7TBMBpNC93wxSDaLwn+pFcmbZlbP1U5iAoHNJl2ClS19xTdAowO5YO73q8LPnwdeINQZZ6VsdVAEZV+xmRuJb/2PkYsyaUoWC2IUlQu2cj/esQDqmrLn5g+zvMQzbK6Nxx9IYDidW2nuRcwnrdrbuNCbfpi0Oi4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726833048; c=relaxed/simple;
	bh=rq04TlOMTUHBZR/Ub9XI0K+Naau321POAKUBeSMCc3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GJNGoFaris/r7uojDhFsnMw+/i1hEo7EPm39qJyCau3pQMgqqwUpglKyxK3u8Ccz2EAb7PViVWnRxPghL9v7RnsAnyVDul2JBbC9kK0PbsBD7MujdehOb9aCeuKjVR2MpnmHUsgJzY84DCeiYgCiXhRIQoF1ZhHSbFLhmsXnoNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X3xqNLHZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X3xqNLHZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726833047; x=1758369047;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rq04TlOMTUHBZR/Ub9XI0K+Naau321POAKUBeSMCc3E=;
  b=X3xqNLHZpjm+wqy6p0AUfT4GoLx5MvwevUsBQJI0Ja0Z2z8LN2MMeN7a
   EbkymzRRqDcHU1+g8ZVDy5NxD2nGn/UwLQNXVrOQ8oT06MDvfL4fq01ew
   xhm8sA+nTQgsr2a1eIGKfDSjDJw8FV6pNDzUJk1MLFWXDTzWkoQOM06EH
   hxGOBKKPwlwHi8VUhdv/wajUeDf5GxmkuaXdgTZgrClRqZOTDos+570+t
   fWuPgzMh1exoS9TO674Dc8H23QG6CppHJz7dOwMID5uJo4dP7D3GQ+lxc
   nIP3TFXpoFV5uDJW4ApwtXxCGgubCVd9d24ZSJ3qPNVcjs0EhT6FmCI2w
   A==;
X-CSE-ConnectionGUID: W1jPvLqOT9qr1TinphHeBQ==
X-CSE-MsgGUID: nut3tVRmTni08s9UwIrnyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="29568042"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="29568042"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 04:50:46 -0700
X-CSE-ConnectionGUID: g9j6ZvJmSMWQR2mwldwFYA==
X-CSE-MsgGUID: tyPdsZfrTrKtuIiX5r8EeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="75059155"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Sep 2024 04:50:44 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1src9p-000EKf-20;
	Fri, 20 Sep 2024 11:50:41 +0000
Date: Fri, 20 Sep 2024 19:50:31 +0800
From: kernel test robot <lkp@intel.com>
To: Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	alistair@popple.id.au, joel@jms.id.au, jk@ozlabs.org,
	andrew@codeconstruct.com.au, eajames@linux.ibm.com,
	ninad@linux.ibm.com
Subject: Re: [PATCH 12/15] fsi: occ: Get device number from FSI minor number
 API
Message-ID: <202409201954.IYcZNCSj-lkp@intel.com>
References: <20240917171647.1403910-13-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917171647.1403910-13-eajames@linux.ibm.com>

Hi Eddie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.11 next-20240920]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eddie-James/fsi-hub-Set-master-index-to-link-number-plus-one/20240918-012109
base:   linus/master
patch link:    https://lore.kernel.org/r/20240917171647.1403910-13-eajames%40linux.ibm.com
patch subject: [PATCH 12/15] fsi: occ: Get device number from FSI minor number API
config: arc-randconfig-002-20240920 (https://download.01.org/0day-ci/archive/20240920/202409201954.IYcZNCSj-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240920/202409201954.IYcZNCSj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409201954.IYcZNCSj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/fsi/fsi-occ.c: In function 'occ_remove':
>> drivers/fsi/fsi-occ.c:708:16: warning: 'return' with a value, in function returning void [-Wreturn-type]
     708 |         return 0;
         |                ^
   drivers/fsi/fsi-occ.c:690:13: note: declared here
     690 | static void occ_remove(struct platform_device *pdev)
         |             ^~~~~~~~~~


vim +/return +708 drivers/fsi/fsi-occ.c

   689	
   690	static void occ_remove(struct platform_device *pdev)
   691	{
   692		struct occ *occ = platform_get_drvdata(pdev);
   693	
   694		misc_deregister(&occ->mdev);
   695	
   696		mutex_lock(&occ->occ_lock);
   697		kvfree(occ->buffer);
   698		occ->buffer = NULL;
   699		mutex_unlock(&occ->occ_lock);
   700	
   701		if (occ->platform_hwmon)
   702			device_for_each_child(&pdev->dev, NULL, occ_unregister_platform_child);
   703		else
   704			device_for_each_child(&pdev->dev, NULL, occ_unregister_of_child);
   705	
   706		fsi_free_minor(occ->devt);
   707	
 > 708		return 0;
   709	}
   710	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
