Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C0E1870
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 21:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718486564; cv=none; b=k92inGa37/C12IcpZDkt/Hjyi1J1XvF86tqMv4slX+ZiQg9Axg9QRRW7F12ETWtCtTY+eCR3vqsvQQ8adWVdzB9vlNQJXWMBDOSYq07cWglrPr0hj+w+8jlZEs++Sw1AS6tOxHbEMJxblb7UT32BobYRcP/kgIjcTSYYpExeT1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718486564; c=relaxed/simple;
	bh=1BP5bSMGogS2+Uzh7n8DsKo0yhPcC9etTq5WZwpGZdk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iMe/VmRqc23u8zS0jEaaFNXqgYIxW6QBsLVPBzSw40Fk1+MhBLCqQR17kaEFsT3oCeUy7V68oFq5Rt+GzYh6B+bP3Qq9op4f7/km8F8OsqpP1zWRsxLCLa5C1geyhvRKMy/HTGpuiMbW5DyBFkwl12gqDINfm0oDBhyeVkB7MLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VV+Gcfwu; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VV+Gcfwu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718486562; x=1750022562;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1BP5bSMGogS2+Uzh7n8DsKo0yhPcC9etTq5WZwpGZdk=;
  b=VV+GcfwuypWZcqj7T+0qKkJaVsAF4UWq0T5F2EEHNSayXoBi2QIAChNQ
   ztJXfrMhS52ATdBjydCqRuvvh4vJX87qtSgQ/fah4FlH6cPBt0u6rgcth
   /Hyd4cav3Be7TJNFVhmUXy9+Zal9Lw9numtCx9YcoFk4JYBsBsGDRhc3C
   rJqz2EAg2lMClzn3l8RN30nyeIvv02f0pxsT5QFR5TCVRVN69ijterAmg
   Qh32nciAsrnyBa2eLBFzLg4J5FqVhUF2p3uiIPcQAGMxT3ydBOy8hcb2g
   Pg/49D0q/a7VztRtLwc0A+zVkVnebn/6giThEjurkNCVr8kqqUdBF03Pa
   A==;
X-CSE-ConnectionGUID: D2tfQG/BR5qryWeA5rySNA==
X-CSE-MsgGUID: Hg8W7ZsVRbKjQds+06O+Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="19141966"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="19141966"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 14:22:41 -0700
X-CSE-ConnectionGUID: W5pz9zajT+yFCP8fayQtWw==
X-CSE-MsgGUID: kNt0iBIWSeCNzf92Gwq9qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="40689515"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Jun 2024 14:22:39 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIar7-0000W8-2C;
	Sat, 15 Jun 2024 21:22:37 +0000
Date: Sun, 16 Jun 2024 05:21:39 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org
Subject: [driver-core:const_driver 16/23] drivers/tc/tc-driver.c:100:19:
 error: initialization of 'int (*)(struct device *, const struct
 device_driver *)' from incompatible pointer type 'int (*)(struct device *,
 struct device_driver *)'
Message-ID: <202406160508.Gcwjzku0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git const_driver
head:   b411bfe8b70c2b8590e05378a00e198d72214635
commit: 86c8a04fc60e4241b0088328cd0455726bf97dba [16/23] driver core: have match() callback in struct bus_type take a const *
config: mips-decstation_r4k_defconfig (https://download.01.org/0day-ci/archive/20240616/202406160508.Gcwjzku0-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240616/202406160508.Gcwjzku0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406160508.Gcwjzku0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tc/tc-driver.c:100:19: error: initialization of 'int (*)(struct device *, const struct device_driver *)' from incompatible pointer type 'int (*)(struct device *, struct device_driver *)' [-Werror=incompatible-pointer-types]
     100 |         .match  = tc_bus_match,
         |                   ^~~~~~~~~~~~
   drivers/tc/tc-driver.c:100:19: note: (near initialization for 'tc_bus_type.match')
   cc1: some warnings being treated as errors


vim +100 drivers/tc/tc-driver.c

b454cc6636d254 Maciej W. Rozycki   2007-02-05   97  
aaf2230036b709 Ricardo B. Marliere 2024-02-13   98  const struct bus_type tc_bus_type = {
b454cc6636d254 Maciej W. Rozycki   2007-02-05   99  	.name	= "tc",
b454cc6636d254 Maciej W. Rozycki   2007-02-05 @100  	.match	= tc_bus_match,
b454cc6636d254 Maciej W. Rozycki   2007-02-05  101  };
b454cc6636d254 Maciej W. Rozycki   2007-02-05  102  EXPORT_SYMBOL(tc_bus_type);
b454cc6636d254 Maciej W. Rozycki   2007-02-05  103  

:::::: The code at line 100 was first introduced by commit
:::::: b454cc6636d254fbf6049b73e9560aee76fb04a3 [TC] MIPS: TURBOchannel update to the driver model

:::::: TO: Maciej W. Rozycki <macro@linux-mips.org>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
