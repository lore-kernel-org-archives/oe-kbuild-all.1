Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7534378F4B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Feb 2025 19:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739648126; cv=none; b=NhSfhdqmiKonsCIEWqACmyOPXV2qfGZ4YCM0RrySfSJf+cGmj5M0Qg3haFx1cx06mq772S+w4ad7yuuxYs9HnM5ksw8l5NcIadpV+huBFUb84fCeAobxi78zWSfIGSOOeOKV+xLprKb5MoBASenNVEvHAj8DpHnn4gqvgUZgAfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739648126; c=relaxed/simple;
	bh=F9VMLiQ564yzVsa+Ft3LSvb77FfGpb3BnUEuN/G8g2I=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cFcKuiKbvAn9XL+e10ZfRu/6bEkShEwshtyNOu5P1H99ir25QUeezglqiu7l1OZywPXNGFDwB+JWpRiGT+7NWzskAg5rXxItYHz8XGHZnmfxjOajL8k9+5WVDengbowx/TJGQAoDtKVGgLn7Q/SX/unFBmyhDCcZc88m9uB6LYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b6yy8daC; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b6yy8daC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739648125; x=1771184125;
  h=date:from:cc:subject:message-id:mime-version;
  bh=F9VMLiQ564yzVsa+Ft3LSvb77FfGpb3BnUEuN/G8g2I=;
  b=b6yy8daCquLc/Y4AbQHJxzEy/UIM0zwOwjsPWs44imU+lUHmEH4rxsze
   pY1r0axPO4dE68c77VnUcksHtDofBgZXTjcDUDM1yPwLVRPspK1LenGAn
   izR4cdIK85O3RsxXKo2+0a4jNCa7D26ZqjctMuOjMTLHbjVcgalVZ4Est
   poNEMzFDhAsbXZODg7S9VHmrU9O+cyCVAN8OmtZ7nlNv9cXBEKJMN2gfA
   oPD2S5uXvbNFNhsNM3VkqmsTjQH7OyX17F3FoyuWz6eO/M49rS9v6ZoKQ
   6LeBvdYtVT5TqnlaUL26ZDTfu+lolUw5xVIu2OpdQJrIubfpWUJ2vlOsO
   w==;
X-CSE-ConnectionGUID: +722IqM8TLqaARu2CTndug==
X-CSE-MsgGUID: rkwWDyNESPyVeJATEdRSHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="51356931"
X-IronPort-AV: E=Sophos;i="6.13,289,1732608000"; 
   d="scan'208";a="51356931"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 11:35:24 -0800
X-CSE-ConnectionGUID: /x1RNKlXR3q9V2vRdMPJtQ==
X-CSE-MsgGUID: 1CZ2/tAQSIusdp0hEKJ69A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136972269"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Feb 2025 11:35:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjNwe-001B7P-2j
	for oe-kbuild-all@lists.linux.dev;
	Sat, 15 Feb 2025 19:35:20 +0000
Date: Sun, 16 Feb 2025 03:34:50 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.6/preempt-rt 3/3] ld.lld: error: undefined symbol:
 screen_info
Message-ID: <202502160340.i5hQwphd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 6.6/preempt-rt
head:   da3aec3fdaa3fcb8c9f9760d4edef06741ccfc6e
commit: d9a5d5c4930656b913b6473cc16a2d28a260c530 [3/3] vgacon: rework screen_info #ifdef checks
config: riscv-randconfig-001-20250215 (https://download.01.org/0day-ci/archive/20250216/202502160340.i5hQwphd-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250216/202502160340.i5hQwphd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502160340.i5hQwphd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: screen_info
   >>> referenced by vgacon.c:0 (drivers/video/console/vgacon.c:0)
   >>>               drivers/video/console/vgacon.o:(vgacon_startup) in archive vmlinux.a
   >>> referenced by vgacon.c:0 (drivers/video/console/vgacon.c:0)
   >>>               drivers/video/console/vgacon.o:(vgacon_startup) in archive vmlinux.a
   >>> referenced by vgacon.c:156 (drivers/video/console/vgacon.c:156)
   >>>               drivers/video/console/vgacon.o:(vgacon_startup) in archive vmlinux.a
   >>> referenced 22 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
