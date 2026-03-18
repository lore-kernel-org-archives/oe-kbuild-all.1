Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A352E3D6CAA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 13:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841093; cv=none; b=jjanKEONQrngldNcW1TuvOaAx1v0NWfVyoSKbyvaKdvjrH/qwzzf4dhzsM82+xHZSRYHVcW31SmaJEj/HTOa8oYt8CiI2djXie0Vh8FWxlsGryJbJE1Ih6DDl9e9ycOdR6P98ZtQwb36hk4E3c9gJBgPaTEriKP8b8FZf8T6Ix8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841093; c=relaxed/simple;
	bh=sBzkV0Kdcp9MjPymCnv9C93edeOiOvVrqPBtGmzIoxY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XcN/0cc07+fRyraf4bJOSsYK2tqNPUC+nvMR9zIREvYd2o12MwYN54wVxKW+F/Uw46Y10xL4/Ibz3RPQEjHnVYkFJLwnHV0gbPq2NRpnXTlfFLeBoCQ+r6QJvGwAvQQhrs2EXO1MkbJ5D0zkDuVMd21A2Y/NpVR04aXbDLAdAJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CACmA0Ow; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CACmA0Ow"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773841091; x=1805377091;
  h=date:from:to:cc:subject:message-id;
  bh=sBzkV0Kdcp9MjPymCnv9C93edeOiOvVrqPBtGmzIoxY=;
  b=CACmA0OwzQYNOc9GK+HV41xMO52NLZa9oTtg+OnrcjVroFEkSeoEemq/
   8h9lbrcHAV11ezgP92UnVf+IvGw9RgaiINsDS3DtyYHXItizyBG8lefwZ
   Kqvyu8m+w9qrFlNLDTYJ0TMdw9RtiacJVQ1Dmv/BvB7hTNHikSnoWILBq
   v7rEw5/pvKmAQW5IiybIMV8zKi57jEc+o1evUeTzqGr8rWxnNOzz9Zxmt
   zCjsvzKtUIHGkCGqyOzXRH3swfe1Q+lzMN8aSvg6fVmC7+yCDinVMpOwC
   vtdpt939EigqO6ZDPIEOJYNkYlJRixPzNIk3PZRsqq7+B/B/cmnEZyVG+
   w==;
X-CSE-ConnectionGUID: tG2cSzz2RFSL2e91QLn33Q==
X-CSE-MsgGUID: 4F/x0SPJQk6FMJzYVTvVjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74969519"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="74969519"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 06:38:09 -0700
X-CSE-ConnectionGUID: WOasxZ/GTACKER9xAm/FUg==
X-CSE-MsgGUID: e3Jcq+zZQjWRxm7eOCpg6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="245654480"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Mar 2026 06:38:00 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2r5y-000000002xT-0apy;
	Wed, 18 Mar 2026 13:37:58 +0000
Date: Wed, 18 Mar 2026 21:37:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2] Warning:
 drivers/virt/gunyah/rsc_mgr.c:161 struct member 'pm_nb' not described in
 'gunyah_rm'
Message-ID: <202603182139.Zc589q7T-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   b0e662fb17ec139a265b282999e920fe1f021414
commit: 3db5d840fdbe2110fc14bb003421a241e8b7a68a [2/2] ANDROID: virt: gunyah: Fetch fresh Gunyah information after restore
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260318/202603182139.Zc589q7T-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603182139.Zc589q7T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603182139.Zc589q7T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/virt/gunyah/rsc_mgr.c:161 struct member 'adev' not described in 'gunyah_rm'
>> Warning: drivers/virt/gunyah/rsc_mgr.c:161 struct member 'pm_nb' not described in 'gunyah_rm'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
