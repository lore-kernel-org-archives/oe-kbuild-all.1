Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA681CCB4B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 15:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735916785; cv=none; b=UEPggmBDmC9Ovetj2sJC9AR4MqW5edwzhAJEw+Q6bugOE2PX2yaFjauzKs5VsHbfmbaVo96N3a1dNmwFrr5lqTgBjkt+HT1TY/jHb6nb8il4VZvIH0/jX/5jr35+biTh3oZCR2mWITyRKwSYij5keMDRbPh/sqAMGUiRmCxFVqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735916785; c=relaxed/simple;
	bh=iQOuDXQEa3gXmJP+pSAuVzh9doI4Wwu8JT3F+BpT69M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JesS3GYPQeJepYZo3Pb8nmLXzC7lFmcAAze+bH4c3OQvrvcW0sNEqkLo252/9SBbE9cq595qD8tIyCTCDbOXTeTk+B5zp1t3fLh+tAeNJNbXv1ueS8341vtCTvYUSFbp+Jrsp14VWv4mGofYlGlBtrfU4iLSwWfJ+EDT0fYR7ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XBOZsFBq; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XBOZsFBq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735916784; x=1767452784;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iQOuDXQEa3gXmJP+pSAuVzh9doI4Wwu8JT3F+BpT69M=;
  b=XBOZsFBq8qaZAsA54OqDef2QE3Wd1SkSmhsFrMUdLT42QT2pv67G2Uk+
   TTpX10CyiqxpJYUu/LaWzL9hSShcVZ4rzD1SWTH1FsHs6si+6d374tYdj
   F4BZWEFfb/KBRO7T/2dMBnOLfpa2NnJvOU3vJgjuMgkbRRKf75hJG6b4u
   ydmQJIpgrOosrPI0EzPN2XtARp9D4WTvbHGnj6/HGDaqwpdiPHAn+T0wf
   BohsCF2Xlc0mvtJtdmqyaIVTmoRoLJt8Tgmi6E4VQ1dlHzmhGe7n0UEJI
   BuBwf+9w7Hwzp0vuIHB3MO6vB8pGX9PW3MPSSI+F8h9lYn5QHwTX75ad3
   g==;
X-CSE-ConnectionGUID: 2VefMPW2Tm+trNCBvJ7ZUw==
X-CSE-MsgGUID: 1TXns+tbQA+LzaV3bO4RBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="58630101"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="58630101"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 07:06:23 -0800
X-CSE-ConnectionGUID: ne7akuA5SpiIxeoXKq4QEg==
X-CSE-MsgGUID: uYZkI9lrQ1ef41NVx9If2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106859797"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Jan 2025 07:06:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTjFj-0009sG-1t;
	Fri, 03 Jan 2025 15:06:19 +0000
Date: Fri, 3 Jan 2025 23:05:20 +0800
From: kernel test robot <lkp@intel.com>
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Min Ma <min.ma@amd.com>
Subject: [linux-next:master 480/5236] drivers/accel/amdxdna/aie2_ctx.c:24:6:
 sparse: sparse: symbol 'force_cmdlist' was not declared. Should it be
 static?
Message-ID: <202501032200.9nVnEUgY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
commit: aac243092b707bb3018e951d470cc1a9bcbaba6c [480/5236] accel/amdxdna: Add command execution
config: x86_64-randconfig-122-20241231 (https://download.01.org/0day-ci/archive/20250103/202501032200.9nVnEUgY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501032200.9nVnEUgY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501032200.9nVnEUgY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/accel/amdxdna/aie2_ctx.c:24:6: sparse: sparse: symbol 'force_cmdlist' was not declared. Should it be static?

vim +/force_cmdlist +24 drivers/accel/amdxdna/aie2_ctx.c

    23	
  > 24	bool force_cmdlist;
    25	module_param(force_cmdlist, bool, 0600);
    26	MODULE_PARM_DESC(force_cmdlist, "Force use command list (Default false)");
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
