Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBF21667C7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Aug 2024 05:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723180068; cv=none; b=t+cYyYY/MloSo1+MO6rhVuy2wBg5PvqgzZscIPV0q0Gr7R6JysltgWJjMk7Q0qxi32IHWCnUH7Z6C7lfGrTKxPqwqlgTQs60ko28mUwxLWVX1RKHoalzUBX0xtRbAkfUDjulBPhO1UwGk85WB01S3pMPbiL7q3J8YX6eTbFXP/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723180068; c=relaxed/simple;
	bh=i9UxpvwNnINSPJPY1kgIPtMp1uVRpcW3V/F2dS4PzV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n3cyxl7jr1jk1qUbfvF2/o+QUn9RRsWgAgAkVVNt97ifI15012If+h0m1SEbeOcjDZ5Dfc1CUrZJGXI3MlujchzDX4b3r9fgBiPVd8Bv6zZweapeSDCwAQakSATVYuF8JGvB9CM8qbkJo+XDICMnaOA7MLGu4+JH0XerKmomyO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=krtODAyo; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="krtODAyo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723180066; x=1754716066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i9UxpvwNnINSPJPY1kgIPtMp1uVRpcW3V/F2dS4PzV0=;
  b=krtODAyosvLoMGZyZMy27W8248tzSZFpRLQV72eLG/pub8K1DNbzM6HW
   6eWvN8T3ir4ru9BFHYiFKHSEe3WvO6CfxAVdhsYSYfBRaNvxfP+NRLjds
   TDhfuVdByKI1vmev08iQ2fP79H8yXXWtk5he11qt33mXOuotNhJEJpveZ
   0tTmZ26RCxb7fFRjVM8G44jQi6hMZDR+SbLw61ToyCIkfucPGa3UaCN+J
   WUP3C6wOrueD//oX1UYcbIlSKfsxLVHEAY/cU7vSpv92i2lLUA5Imqzlo
   gUEQ+0Lm2n8My8ZYvX/kaUZqHWgbkOfedcfzIIX3WCQNZ0mFfKvuuNtBZ
   A==;
X-CSE-ConnectionGUID: qUi+vaBpRG+wwegO5CLY3g==
X-CSE-MsgGUID: Lq0jFuS6Sc+L43eL0y7F8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21200175"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; 
   d="scan'208";a="21200175"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 22:07:46 -0700
X-CSE-ConnectionGUID: c83rrmxDTZqBXIalline0A==
X-CSE-MsgGUID: L9o4kzxoS72MPgQdr8YlQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; 
   d="scan'208";a="58017032"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 08 Aug 2024 22:07:45 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scHqn-0006rA-2t;
	Fri, 09 Aug 2024 05:07:41 +0000
Date: Fri, 9 Aug 2024 13:07:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-5.15.y 264/377]
 pci-epf-vntb.c:undefined reference to `ntb_db_event'
Message-ID: <202408091207.9R0c7sdJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common upstream-linux-5.15.y
head:   7e89efd3ae1cfa05fe918588a92628b9bbeda4b2
commit: e2b6ef72b7aea9d7d480d2df499bcd1c93247abb [264/377] PCI: endpoint: Support NTB transfer between RC and EP
config: arm-randconfig-002-20240809 (https://download.01.org/0day-ci/archive/20240809/202408091207.9R0c7sdJ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408091207.9R0c7sdJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408091207.9R0c7sdJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/pci/endpoint/functions/pci-epf-vntb.o: in function `epf_ntb_cmd_handler':
>> pci-epf-vntb.c:(.text+0xbec): undefined reference to `ntb_db_event'
>> arm-linux-gnueabi-ld: pci-epf-vntb.c:(.text+0xcc0): undefined reference to `ntb_link_event'
   arm-linux-gnueabi-ld: pci-epf-vntb.c:(.text+0xd5c): undefined reference to `ntb_link_event'
   arm-linux-gnueabi-ld: drivers/pci/endpoint/functions/pci-epf-vntb.o: in function `pci_vntb_probe':
>> pci-epf-vntb.c:(.text+0x1550): undefined reference to `ntb_register_device'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
