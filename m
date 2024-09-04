Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E709F43152
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Sep 2024 04:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725423768; cv=none; b=pJhoRQ+8l8CyV/QY9hPGsIoGLz1wAFNXxZWiWaSZniDSh2vNJLdRUUBEt2mu+6vmRXgKO5DlelWkTrpVMOyN3Z3SJ1Pri+Y255Srd0feoMqpUzhWtP3jFeubMCchBvgti4pq4DjBEyiwaJ/udz7ZMtnKQPodhpAOC48RUgqvF7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725423768; c=relaxed/simple;
	bh=bbarQPo+wPWE/sTFboFehPDx8WnxXU3at2sOXRNiJKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GApR9g6AUJKNgMKGma9wx8TGi8gcT0IhlT4iy9gG296V+ha7wanpmGY9xkNQkb4vZDZp8RkogaRw7RUA2Yhw7IbHB0iQAffjbaoK9YZ7PByYs3J729Xm/BGckonHxiErPyRrCrv0KI789QUFab49RITZeRqoEo+vTujm2bNPzms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hoMSaRHt; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hoMSaRHt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725423767; x=1756959767;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bbarQPo+wPWE/sTFboFehPDx8WnxXU3at2sOXRNiJKE=;
  b=hoMSaRHttEKTgqZ0nA/okSGigfwP3149bSA2B+0x7QHEfPxBD8gHFuM/
   WPFjcyVQx7nWIYcWBWsoFusBAZ6fAvOziLZbmb8MWA+IT7sW+ffjst78p
   RxJr/lzH0V2go5WGXlEb3UxNV5GN3XIINT4wrlRw2QWaZEGMMrxFcGnVP
   5Z+5TbLOCExSMH0hErWrmi9USkssH5NWmRvO1oiP0PB/uzXd3k/SLTvsF
   XwuZjvhhrMJtMSoRhFmsRMCDyrL6BiY0CTqMxkD9oPvyXnKNcZ6gkELou
   +jse7lW+THdYn/bwhuh+00kddIycgq/uivVBJJ6gB9E0dG2GPshbnETn2
   Q==;
X-CSE-ConnectionGUID: 8qZzapC4TSuIq3NVSd85CA==
X-CSE-MsgGUID: zsx00hG1Tt6OsF1ymYIIGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="34657569"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="34657569"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 21:20:49 -0700
X-CSE-ConnectionGUID: 8E8+tbmLSDeS/JGKfcWGgg==
X-CSE-MsgGUID: UYRjWeV9QZCy4OVfkD9HkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="64816406"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Sep 2024 21:20:48 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slhVd-0007XI-2j;
	Wed, 04 Sep 2024 04:20:45 +0000
Date: Wed, 4 Sep 2024 12:20:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kaixiong Yu <yukaixiong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 -next 01/15] mm: vmstat: move sysctls to its own files
Message-ID: <202409041218.fH0N9vJg-lkp@intel.com>
References: <20240903033011.2870608-2-yukaixiong@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903033011.2870608-2-yukaixiong@huawei.com>

Hi Kaixiong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20240902]

url:    https://github.com/intel-lab-lkp/linux/commits/Kaixiong-Yu/mm-vmstat-move-sysctls-to-its-own-files/20240903-113226
base:   next-20240902
patch link:    https://lore.kernel.org/r/20240903033011.2870608-2-yukaixiong%40huawei.com
patch subject: [PATCH v2 -next 01/15] mm: vmstat: move sysctls to its own files
config: x86_64-randconfig-121-20240903 (https://download.01.org/0day-ci/archive/20240904/202409041218.fH0N9vJg-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409041218.fH0N9vJg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409041218.fH0N9vJg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/vmstat.c:1934:5: sparse: sparse: symbol 'sysctl_stat_interval' was not declared. Should it be static?
   mm/vmstat.c:1518:47: sparse: sparse: context imbalance in 'walk_zones_in_node' - unexpected unlock

vim +/sysctl_stat_interval +1934 mm/vmstat.c

f6ac2354d79119 Christoph Lameter 2006-06-30  1931  
df9ecaba3f152d Christoph Lameter 2006-08-31  1932  #ifdef CONFIG_SMP
d1187ed21026fd Christoph Lameter 2007-05-09  1933  static DEFINE_PER_CPU(struct delayed_work, vmstat_work);
77461ab33229d4 Christoph Lameter 2007-05-09 @1934  int sysctl_stat_interval __read_mostly = HZ;
5d2c79d8e72439 Saurabh Sengar    2024-08-11  1935  static int vmstat_late_init_done;
d1187ed21026fd Christoph Lameter 2007-05-09  1936  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
