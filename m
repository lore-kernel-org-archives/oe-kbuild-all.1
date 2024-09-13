Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897D4154BFC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 06:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726208501; cv=none; b=eXUf97xrzp6FLIKlurksNQxQRnGXDpe17sOOOYM7NynKMBGNSKi22Up3Lj/5e4OEhscaxnFsno2iztyzQVq7o/WHZpJiEDDCd3yabFXUx3cckph8PvpEiR5KBSlA1o6n/tQugHgKP/jDoW5h11WhAN6hsHrG2vRtHeeXvLPRJUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726208501; c=relaxed/simple;
	bh=TCMHtLjkupDX0iZGNABLpe6srJKVZMe5BFGE74WSEu0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rB3iYwxymWjBsii9Ag725kWDcdwdqhqBWD8wzZfTQmRSZZa4Km/wmasXzHOLko7k1EWfBY0gFKlVMUJ0Blu4ANQJpWjSQBcN6BHjiQwuri+JnG6n3bb7rVtkHadvz+9mHZjgv0WbQpBLl1kLlg0U8wsPN8WDh0SBVTyo6SIDV4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eJb9a36f; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJb9a36f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726208499; x=1757744499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TCMHtLjkupDX0iZGNABLpe6srJKVZMe5BFGE74WSEu0=;
  b=eJb9a36f3QF2n+eU0nVe8Uhv5+NYWYIQ27o7vWka0smlQCtH+947/Hil
   NU88YU7qbNhj5PSLmXQYmf0LhfgJbdSW6qlT/vzFb4O4jHZVsPDtmHVGa
   kWKZKW77lUCjlv+uXfhlYS5cFoOe3kHEeFzlpJGkTqD9+QqLvTs8v4q1/
   G6ULWkTijuNI4PSNc3dMIep4ahG2p6AJ4LeWXFiqCwGac/i0oz32vt5Uq
   mOLuh0aoX5aPfZbJC4hk/rmxIMzZxxbmufSvQS+tTsLuIaMU6k5py8R1m
   R1fL4CapNrRPPy90M3DJpwoMjJC+gzXUp0YOhohQCvFYa7td+wPwpXuK+
   Q==;
X-CSE-ConnectionGUID: 4SJKEPJYRxmIPRp3Z5lTNQ==
X-CSE-MsgGUID: HIdOWLFASqKkeB01AxyiXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="35669352"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="35669352"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 23:21:38 -0700
X-CSE-ConnectionGUID: ttKfuy6ASkyjYYroXy7puw==
X-CSE-MsgGUID: bvITS5BNSseC6WajPe3Sbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="72056991"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Sep 2024 23:21:36 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sozgU-00065O-1N;
	Fri, 13 Sep 2024 06:21:34 +0000
Date: Fri, 13 Sep 2024 14:21:28 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>
Subject: drivers/edac/altera_edac.c:886:28: sparse: sparse: incorrect type in
 argument 1 (different base types)
Message-ID: <202409131434.roYJxLGs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   196145c606d0f816fd3926483cb1ff87e09c2c0b
commit: 4a9a1a5602d82c079325bf37466af0b67d6c0b9e arm64: socfpga: merge Agilex and N5X into ARCH_INTEL_SOCFPGA
date:   3 years, 6 months ago
config: arm64-randconfig-r111-20240913 (https://download.01.org/0day-ci/archive/20240913/202409131434.roYJxLGs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240913/202409131434.roYJxLGs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131434.roYJxLGs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/edac/altera_edac.c:886:28: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] *handle @@
   drivers/edac/altera_edac.c:886:28: sparse:     expected restricted __be32 const [usertype] *p
   drivers/edac/altera_edac.c:886:28: sparse:     got unsigned int const [usertype] *handle

vim +886 drivers/edac/altera_edac.c

1166fde93d5b1d Thor Thayer 2016-06-22  878  
1166fde93d5b1d Thor Thayer 2016-06-22  879  static inline int a10_get_irq_mask(struct device_node *np)
1166fde93d5b1d Thor Thayer 2016-06-22  880  {
1166fde93d5b1d Thor Thayer 2016-06-22  881  	int irq;
1166fde93d5b1d Thor Thayer 2016-06-22  882  	const u32 *handle = of_get_property(np, "interrupts", NULL);
1166fde93d5b1d Thor Thayer 2016-06-22  883  
1166fde93d5b1d Thor Thayer 2016-06-22  884  	if (!handle)
1166fde93d5b1d Thor Thayer 2016-06-22  885  		return -ENODEV;
1166fde93d5b1d Thor Thayer 2016-06-22 @886  	irq = be32_to_cpup(handle);
1166fde93d5b1d Thor Thayer 2016-06-22  887  	return irq;
1166fde93d5b1d Thor Thayer 2016-06-22  888  }
1166fde93d5b1d Thor Thayer 2016-06-22  889  

:::::: The code at line 886 was first introduced by commit
:::::: 1166fde93d5b1d7267992edc7e2c8ee129d6667e EDAC, altera: Add Arria10 ECC memory init functions

:::::: TO: Thor Thayer <tthayer@opensource.altera.com>
:::::: CC: Borislav Petkov <bp@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
