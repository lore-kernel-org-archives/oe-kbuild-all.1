Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1312BB10
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Aug 2024 03:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722484524; cv=none; b=gxiwylOSFIFVFpSUPmnrQt/pnXGXf05bf5XqUUAHHvsDc2ieJvd7KTPhL6+skNAzHHl5jYT86Lt8kaI9Orm7zM9mypDj7QVUS6cZlGpJfmMvdfj31XiO9Ju6stpd8imQFAoKc19BVRxUy4PrWHt2bOtLjSNiS+wPbuLrospMUA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722484524; c=relaxed/simple;
	bh=f3m5QPZw1OsoiAH0cyqn7tywn1C5qr+FlB+C87Ya8iY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XlfezqYaCWyX2dJCw4PLOvDNfOCInq6w9TGPlmLo3Sig8CrCbjgkxfIwRNNHz2DbbZH+DMGhj24flq4Dv73s+J7Cr59YjZXjZdoOOoQFxDf8U1DxWP408Ua/J7ZqiX8t6wFNpW3J3notdC5gWz2LWDcJ3XwK6nf4gD1esJy0Ka8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X6onaCxZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X6onaCxZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722484523; x=1754020523;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f3m5QPZw1OsoiAH0cyqn7tywn1C5qr+FlB+C87Ya8iY=;
  b=X6onaCxZiqD1ijEdN8u9So+9FOQ8rEk1rWwGN8t8lLZRH9sswJBHSW2R
   peCgBRTvUjqZWL4J9W0Oj7+G1Z9nKiKQ9JTKmruAuJLj3oxcOLpaEpwdf
   N4YtcEaftjc+tTbb+Sml5j1evEhh623bGXQbgAEkWhebR1nmDbn52JyQG
   +Y339SPMZyOjg2BqQQ0YLZz+J8UdVcVeLvwr3v39GEt2ld4mcbN1f2VbO
   FFrG8TAyNyWiHCswOnnZFGBqxyGCVmHgr32ydX+QM13G4sd8KDORE/L1B
   j3KuaWS0gY75I8J+jYmIGSUSs+22pvqM905M90al+a+uPu2TTtthBBpe2
   A==;
X-CSE-ConnectionGUID: 8C/VeUksSzCt4npv0ZjZIw==
X-CSE-MsgGUID: JUE/LTNVR3iXLwjrqNXUfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20593776"
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; 
   d="scan'208";a="20593776"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 20:55:17 -0700
X-CSE-ConnectionGUID: XGIqsD/mS8SdWU9VR+O5Lg==
X-CSE-MsgGUID: hvfNo9ZoQD2KAeA7E7b4Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; 
   d="scan'208";a="59751761"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 Jul 2024 20:55:14 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZMuF-000vAE-30;
	Thu, 01 Aug 2024 03:55:11 +0000
Date: Thu, 1 Aug 2024 11:54:31 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Aleksa Sarai <cyphar@cyphar.com>
Subject: [brauner-vfs:work.procfs 2/2] cpqphp_sysfs.c:(.text+0x3bc): multiple
 definition of `proc_self_symlink';
 drivers/pci/hotplug/cpqphp_core.o:cpqphp_core.c:(.text+0xf08): first defined
 here
Message-ID: <202408011147.MPJh8YJI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.procfs
head:   168c8d86d8ac87a04878717d8d13d6b63339db8d
commit: 168c8d86d8ac87a04878717d8d13d6b63339db8d [2/2] [DRAFT & RFC]: proc: restrict overmounting of ephemeral entities
config: i386-buildonly-randconfig-003-20240801 (https://download.01.org/0day-ci/archive/20240801/202408011147.MPJh8YJI-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240801/202408011147.MPJh8YJI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408011147.MPJh8YJI-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/pci/hotplug/cpqphp_sysfs.o: in function `proc_self_symlink':
>> cpqphp_sysfs.c:(.text+0x3bc): multiple definition of `proc_self_symlink'; drivers/pci/hotplug/cpqphp_core.o:cpqphp_core.c:(.text+0xf08): first defined here
   ld: drivers/pci/hotplug/cpqphp_pci.o: in function `proc_self_symlink':
   cpqphp_pci.c:(.text+0x58): multiple definition of `proc_self_symlink'; drivers/pci/hotplug/cpqphp_core.o:cpqphp_core.c:(.text+0xf08): first defined here
   ld: drivers/pci/hotplug/cpqphp_nvram.o: in function `proc_self_symlink':
   cpqphp_nvram.c:(.text+0xe0): multiple definition of `proc_self_symlink'; drivers/pci/hotplug/cpqphp_core.o:cpqphp_core.c:(.text+0xf08): first defined here
--
   ld: net/netrom/nr_dev.o: in function `proc_self_symlink':
>> nr_dev.c:(.text+0x26c): multiple definition of `proc_self_symlink'; net/netrom/af_netrom.o:af_netrom.c:(.text+0x150c): first defined here
--
   ld: drivers/parport/ieee1284.o: in function `proc_self_symlink':
>> ieee1284.c:(.text+0x144): multiple definition of `proc_self_symlink'; drivers/parport/share.o:share.c:(.text+0x1234): first defined here
   ld: drivers/parport/ieee1284_ops.o: in function `proc_self_symlink':
   ieee1284_ops.c:(.text+0xf94): multiple definition of `proc_self_symlink'; drivers/parport/share.o:share.c:(.text+0x1234): first defined here
   ld: drivers/parport/procfs.o: in function `proc_self_symlink':
   procfs.c:(.text+0x0): multiple definition of `proc_self_symlink'; drivers/parport/share.o:share.c:(.text+0x1234): first defined here
   ld: drivers/parport/daisy.o: in function `proc_self_symlink':
   daisy.c:(.text+0x340): multiple definition of `proc_self_symlink'; drivers/parport/share.o:share.c:(.text+0x1234): first defined here
   ld: drivers/parport/probe.o: in function `proc_self_symlink':
   probe.c:(.text+0x0): multiple definition of `proc_self_symlink'; drivers/parport/share.o:share.c:(.text+0x1234): first defined here
--
   ld: net/rose/rose_dev.o: in function `proc_self_symlink':
>> rose_dev.c:(.text+0x1ac): multiple definition of `proc_self_symlink'; net/rose/af_rose.o:af_rose.c:(.text+0x154c): first defined here
--
   ld: net/ax25/ax25_uid.o: in function `proc_self_symlink':
>> ax25_uid.c:(.text+0x6c): multiple definition of `proc_self_symlink'; net/ax25/ax25_ip.o:ax25_ip.c:(.text+0x70): first defined here
   ld: net/ax25/af_ax25.o: in function `proc_self_symlink':
   af_ax25.c:(.text+0x184c): multiple definition of `proc_self_symlink'; net/ax25/ax25_ip.o:ax25_ip.c:(.text+0x70): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
