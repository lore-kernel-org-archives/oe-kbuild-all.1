Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E49301002
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 08:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764663634; cv=none; b=sBgMU+c0sCF8pnAz7qKTFc1iciezo3ffW9nzi7IqkFD9IrpY8b6y3j7lelpDmATmH9a3Zc7CwnA/34RkyHs/tkppBNsk6fwlvzFUcL2w+dQRyscaxDG1Giu5PJAG/6lCI4Z2XIRl92NNL6tYKE5nw5W1PJXC8iOYIZmyq4dca9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764663634; c=relaxed/simple;
	bh=nZoou4Ctelj5Auu8HbC8LSVFi3mgd66PIASACAY0apQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NGiJHgxZKz3gvoqFgXKs3FptbIhT8VjoLNVSISEdCJAJbNYG/xP0VEB3MUrxYx1h1r/jjbIG86xJYK8HxilHAD4W6u4Lu52NpGgD+5Cuq9V24VWqfs7xsaEhpy74DAKH2Rt68xnPr9+UyCAxRRYrIJVuXhkY0yMD6+M03MU6X38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VIbzb6B3; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VIbzb6B3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764663632; x=1796199632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nZoou4Ctelj5Auu8HbC8LSVFi3mgd66PIASACAY0apQ=;
  b=VIbzb6B3k/A1he/JosOc8cAX5U3vN/b/grlMTaTUUXTiFnexb4eTff/1
   hsNuq3Byl10CLDWr3cqSydcT2diiZsshaBGKSm9DZw+q/zEE8gjiUF7+D
   yqjGyqD6cqIn1SoOKYIvY5gqAN9IWOXzkzQZC1WgoR7PmT/tR2lBE+QYg
   caujS2S5JoaEfhjMfQ1wQ6LdPEhxwwwIq4O+TxUWHnzyyj9zOm4HI2o07
   mUzU3WDhhtnWvpVuIUp2yvJq9GY+rs/u4BWjr6cdN3FhG8xUfGi/flD3y
   CiOSnEPm/NAZu5mIyC1Tl7PeSZS1xFUO9RUkzVENEQaHtc87B8A3hvd1e
   Q==;
X-CSE-ConnectionGUID: A5g+64oYRyOxKmrd2KkDLQ==
X-CSE-MsgGUID: w4Z4IfINQXaJWnN4To052w==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="70470951"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="70470951"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 00:20:10 -0800
X-CSE-ConnectionGUID: LitBmdUYTqCr19gJvopE6A==
X-CSE-MsgGUID: im4cswOAQh+OiI1k+0h1Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="194302071"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Dec 2025 00:20:09 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQLcE-000000009a7-1ZT9;
	Tue, 02 Dec 2025 08:20:06 +0000
Date: Tue, 2 Dec 2025 16:19:22 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [linux-next:master 12362/13055] include/vdso/bits.h:7:26: warning:
 left shift count >= width of type
Message-ID: <202512021613.97jVprvJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47b7b5e32bb7264b51b89186043e1ada4090b558
commit: 256a21743d911f94ce92fe28f793cd586f3860b2 [12362/13055] i3c: Add HDR API support
config: sparc-randconfig-001-20251202 (https://download.01.org/0day-ci/archive/20251202/202512021613.97jVprvJ-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021613.97jVprvJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512021613.97jVprvJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bits.h:5,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:22,
                    from arch/sparc/include/asm/bug.h:25,
                    from include/linux/bug.h:5,
                    from drivers/i3c/device.c:9:
   drivers/i3c/device.c: In function 'i3c_device_get_supported_xfer_mode':
>> include/vdso/bits.h:7:26: warning: left shift count >= width of type [-Wshift-count-overflow]
    #define BIT(nr)   (UL(1) << (nr))
                             ^~
   drivers/i3c/device.c:272:61: note: in expansion of macro 'BIT'
     return i3c_dev_get_master(dev->desc)->this->info.hdr_cap | BIT(I3C_SDR);
                                                                ^~~
--
   In file included from include/linux/bits.h:5,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:22,
                    from arch/sparc/include/asm/bug.h:25,
                    from include/linux/bug.h:5,
                    from device.c:9:
   device.c: In function 'i3c_device_get_supported_xfer_mode':
>> include/vdso/bits.h:7:26: warning: left shift count >= width of type [-Wshift-count-overflow]
    #define BIT(nr)   (UL(1) << (nr))
                             ^~
   device.c:272:61: note: in expansion of macro 'BIT'
     return i3c_dev_get_master(dev->desc)->this->info.hdr_cap | BIT(I3C_SDR);
                                                                ^~~


vim +7 include/vdso/bits.h

3945ff37d2f48d Vincenzo Frascino 2020-03-20  6  
3945ff37d2f48d Vincenzo Frascino 2020-03-20 @7  #define BIT(nr)			(UL(1) << (nr))
cbdb1f163af2bb Andy Shevchenko   2022-11-28  8  #define BIT_ULL(nr)		(ULL(1) << (nr))
3945ff37d2f48d Vincenzo Frascino 2020-03-20  9  

:::::: The code at line 7 was first introduced by commit
:::::: 3945ff37d2f48d39fd1751d282c80176654049e4 linux/bits.h: Extract common header for vDSO

:::::: TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
