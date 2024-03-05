Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429461AADC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 19:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709666700; cv=none; b=A+L7VAfIrJ8UROflIqwxJU+UTPT5AuevuGy8zrRNIC78k7NX+6OJjv8F5t8J+HAfQ9hDYBSK9l0meoJR9TarrlGOEbzY1zK1e//z+r7bhiIVWZKwOc7onLIkX/kuItfN6jjjl2Vg8EkIm6E7uZSN2EXxEmOm1lbLd5oGz63YdB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709666700; c=relaxed/simple;
	bh=HzmnPw/KagddfZrjXeslSsK8iyLWpysbOAo1fgloUD4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UIv4DmOgD/pY+sc/CckUv6oHlF1plpEP6xzDYOfuHB7woDyAaFTjDltO/etXN1en/mcNkzLyAk+wfmymLgzb56QrmmhLPoVJrFQzYZvVWW2okQ0g24+xfMzAJcL862vgEWShKmHKCan73ka0bP4c20prh1FcJVrD+0AFH0xAgto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TpDoza3o; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TpDoza3o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709666698; x=1741202698;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HzmnPw/KagddfZrjXeslSsK8iyLWpysbOAo1fgloUD4=;
  b=TpDoza3oj/rsjrb/R28aUxVjb7uZXSAi25bUzi/Po7V5PxBivd+Zx+m0
   Q40S0uGwKnya03e9quVOxVE4zhsjhVonBKczTyaMDWuem08gmUAVug3WW
   /mtxhl7orjFStxrRjJIua8Iei/TR5LyjT7AiuJEwhdHYZ4YrYV19+y5c1
   r2fN8woF7sBQ+KVM6THf+Km/vnuKgDkuwNZP2Kx7BjImhoVDmNZ/ME5I0
   UIm+/QwbUBXjOHBmAfKKc80cWNngw5OGztOl4sio7alM+2mNgTGk3AQZE
   +ZxPydzo5OMSt3tfsW8zl3v+5kg2KIR3m4pjkYr7gMuXjsrH46eBTPcL1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4107146"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="4107146"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 11:24:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="9349070"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Mar 2024 11:23:57 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhaOJ-0003bZ-0j;
	Tue, 05 Mar 2024 19:23:55 +0000
Date: Wed, 6 Mar 2024 03:23:23 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 26810/27434] htmldocs: Warning:
 fs/overlayfs/Kconfig references a file that doesn't exist:
 Documentation/filesystems/overlayfs.txt
Message-ID: <202403060305.bRyfBmcH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   0e88d1c26496999d1b2e37f3393b602d28b03faf
commit: 2ae16fc533dfb52853bbae122360f58ad7e0f3c8 [26810/27434] docs: filesystems: overlayfs: Rename overlayfs.txt to .rst
reproduce: (https://download.01.org/0day-ci/archive/20240306/202403060305.bRyfBmcH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403060305.bRyfBmcH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: dist/templates/kernel.template.spec references a file that doesn't exist: linux-%%{kernel_unamer}/tools/perf/Documentation/examples.txt
   Warning: drivers/media/v4l2-core/v4l2-fwnode.c references a file that doesn't exist: Documentation/acpi/dsd
   Warning: drivers/net/ethernet/faraday/ftgmac100.c references a file that doesn't exist: Documentation/networking/phy.txt
   Warning: drivers/net/ethernet/pensando/ionic/ionic_if.h references a file that doesn't exist: Documentation/networking/checksum-
   Warning: fs/cifs/cifsfs.c references a file that doesn't exist: Documentation/workqueue.txt
>> Warning: fs/overlayfs/Kconfig references a file that doesn't exist: Documentation/filesystems/overlayfs.txt
>> Warning: fs/overlayfs/Kconfig references a file that doesn't exist: Documentation/filesystems/overlayfs.txt
>> Warning: fs/overlayfs/Kconfig references a file that doesn't exist: Documentation/filesystems/overlayfs.txt
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/kunit/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
