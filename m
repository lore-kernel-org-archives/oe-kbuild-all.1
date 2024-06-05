Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8A819D88D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jun 2024 14:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717599414; cv=none; b=Ue2lsA6+5TewTxBusPC0Hy9OSCpqZvQXNh/mrVw2UewEbiEIi1xzutD1vftm0DlagyB7tEagq0BDNw8LWxRvptLLyZjuEwEQ2ZfE60ik5aV0ssKF4u4MMs31rqhNHi8NofMTlN2LdNZdPuC+pCIBISAxnFYUpoTCEwxa8VqLs4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717599414; c=relaxed/simple;
	bh=F3j/lytD3nCUi3r11cGow/xJG4sKzL9UUPAG7DM8WII=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AsN4Y4qFDfxlWDv48WSl39KHqm9txhOeqgehYbK0UzEcrZgACYwvb90zAVLrGaF9GTIK/utZ9d09gsGLTz7R9uSsPHG68O1q6cpUgO2wQ9qLjW5L29lcJui2G76G3swTrfcQxh63PqjF2kLOZDiApTs/Q/N01NTQkySdM3gQFQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XbbJBo5V; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XbbJBo5V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717599412; x=1749135412;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F3j/lytD3nCUi3r11cGow/xJG4sKzL9UUPAG7DM8WII=;
  b=XbbJBo5VH+fZh8ttk9Oqn38DDjLk2eyn+qM2yA3z5E1Em9QkoYr7BlUQ
   vpvde48gVXBn17N5DepiSoTJWeYZsuqk0EFeNyAkidN7y612fXAdqKUkt
   D4x2sOLTEWeBLjZjrUbvTirIa9lFnnJNKC67V53LEyolg3hKnAAEean0s
   IYiPueLK/WNhUwilrRkh9UfE2RFSo/kDFJ92jHwSqfbGu3/kiQkqdjABR
   s1p1m5x72OGgt2YIBY9mS/ls5mM5W9m1l5mfKe1AMFb/nr8tzqWyFq/Dl
   ydsoS675/vEnOL18gcCATt2GJIuel06seEQEccOwa65iNe2FL/GfDPXmE
   w==;
X-CSE-ConnectionGUID: xKLwCn9tQD2F4kt7unykiA==
X-CSE-MsgGUID: vd31yC4/QgWMjVxh5xnYIQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14333049"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; 
   d="scan'208";a="14333049"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 07:56:51 -0700
X-CSE-ConnectionGUID: 6shwG0qPTOycUptbvFEpTQ==
X-CSE-MsgGUID: M2UQOTgHTkSY7ZUxyt1HOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; 
   d="scan'208";a="42074958"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 05 Jun 2024 07:56:50 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEs4F-0001ls-2H;
	Wed, 05 Jun 2024 14:56:47 +0000
Date: Wed, 5 Jun 2024 22:56:14 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-filter 21/36] drivers/acpi/svkl.o: warning:
 objtool: __ex_table+0x0: special: can't find orig instruction
Message-ID: <202406052236.w0x49pyX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-filter
head:   2f2a140aaf04ba58f289ad0d6484ca1df92fbf04
commit: 12d3b18a031ec154303e4556b2fb40cbcc46dd89 [21/36] ACPI: Add SVKL table support
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240605/202406052236.w0x49pyX-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240605/202406052236.w0x49pyX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406052236.w0x49pyX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/svkl.o: warning: objtool: __ex_table+0x0: special: can't find orig instruction


objdump-func vmlinux.o __ex_table:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
