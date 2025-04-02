Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2851853
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 07:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743578690; cv=none; b=JSFURSUE31YczBTVdwxWb2IpBob3vLDRYlCsr2Fo6xwgg7TgGdGcI4ATVdV5LBm1NAcvHcw2BkiZTKoWqpFlk0QlhG0j0LKZeVpYTrUerbHPNtC5tH+Zqc8PXAvNXgSGzBPozuHweIIeSN5y6ywictBON7CSAIUml1L8PzKOuX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743578690; c=relaxed/simple;
	bh=1UsDphe1j2+5pm++84aAcVQa6J6wHOobk2/AZds3dXk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n3sHjmn777twIbHjAY4WI9GAoj58n1G96BtV+5+gxMX69TdN/S8v+uSb+hubwbINXzYCbh69n3RFq03Jo5zkoMb+GcKa4p/kZ4a0+3k1kTe24dtRyR8P87BOil9oFgqLgjdqn+bJ850jRxFBq82KFiOtNLRFpxV3LObNNUv5AKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ELAhlVLy; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ELAhlVLy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743578687; x=1775114687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1UsDphe1j2+5pm++84aAcVQa6J6wHOobk2/AZds3dXk=;
  b=ELAhlVLy32qhun1vTyqaqjhthR0bkClr3D7iKh8LAH/f6cLBrmpBswf3
   SeG44VwQYLXWI6fIzK2IzufpMIT9YKJJC9i0p3zQVzxQFdmn8h4dJz7TV
   UYm/+9yzzM602lcc7VDW1FHIBk3D2BjoeiLPJaADsiJfzioDYK29FvpOk
   GXo/9NWStW+R4rC6ze6rc8AxO1Wcgq9PHQc7hwc05uEwSk+ZZ5dEfz2Fl
   ZCzPS747lgljxFPfWR01qXYvVnBauEAeNlYw9fQk8m7NTlRAlprQHJ9nz
   KMgcdJd/q/TZl1UAgqEZY0IQd0pA82e319p+KC8HBSpIG+4rX+DvdpR52
   w==;
X-CSE-ConnectionGUID: gYUz14htQA2tySrnqz0XKg==
X-CSE-MsgGUID: QMnXkwWeQlSHLvVm+BcbLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="48594945"
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="48594945"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 00:24:46 -0700
X-CSE-ConnectionGUID: 6ZVSqdLRSiyDx60phFdxhA==
X-CSE-MsgGUID: 9nFC3YdAT8KEZdXeBHkI7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="157603279"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 02 Apr 2025 00:24:44 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzsSo-000AXH-33;
	Wed, 02 Apr 2025 07:24:42 +0000
Date: Wed, 2 Apr 2025 15:23:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Erkun <yangerkun@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2830/2830] fs/ext4/file.o: warning: objtool:
 ext4_file_write_iter()+0x893: unreachable instruction
Message-ID: <202504021552.RjBa0DvI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   1a6f72935307d39713f310345f6049fcc3058091
commit: 52c6fec939dd6f0de6d534d8b08ac06be8cfe5c4 [2830/2830] ext4: properly sync file size update after O_SYNC direct IO
config: x86_64-buildonly-randconfig-004-20250331 (https://download.01.org/0day-ci/archive/20250402/202504021552.RjBa0DvI-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504021552.RjBa0DvI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504021552.RjBa0DvI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ext4/file.o: warning: objtool: ext4_file_write_iter()+0x893: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
