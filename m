Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7BA207DFD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Feb 2025 15:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740324527; cv=none; b=kacOwKjzuR2E1Ydso0NOSXzLldHyi5gXoYhIvbbYYiq21Dx+SVO2QQKXcv4zRy2BvzDJaRR0AUKc6qUe2Q2CiuVq/MtQvykaHy9NFe48EKSVY1WQr8yqp8NqkmS3FMNAxE0lF+ygr5AbOXm1K+ziKVGv4UuQxKu+7pI/nwFzrMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740324527; c=relaxed/simple;
	bh=ykABtmK4Mv6A9CNGCwBxdUrvc3xRylJe2cU3uBgHvOw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NmaX7MOHbuUvoFf7jTYh8V3Ad1p77qnVyYX+ORcoHjg36y2ieNuZKW9s3NUNFhFNIawtjpW/boxPbxcLl1pXiraJcV+mrc2nL2HDKOIIaOD9Gay8e/r1WK9Ho1Tm2DBU9AnH39J04ys4w7oWh+A3kVX8KucmJly+QTw3UlmHJd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IyYbBfdA; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IyYbBfdA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740324525; x=1771860525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ykABtmK4Mv6A9CNGCwBxdUrvc3xRylJe2cU3uBgHvOw=;
  b=IyYbBfdAvutJ9y7R4XwRn9Zla4D5UGb0mBQhOitoRkWFw9DwzNAD87G2
   +0ZCjcKgZwPJyFiMOoAsIhBywe3ZGTdomrIlRQ2/YOGOuZPc2wI+Ibo9u
   mmsg4R1+p4c+xOCruvaLBsNbXCjjhrbeAsEZrOz3lku+4G72+t8pFnRZb
   vZc5YDYpZHI4p6D1BhZHjLNONkchwYuygHGbK6Mxx8v7ebteAFD4APSmt
   tL5mwP5qJkMKhrT1K1ZBhaut+jmvY/QmimcPg7unCi7LSjXEAJe/56pEo
   vhua9UHeCkAOz3pdQrwz2CpWpeL7BylHkzqWMsF3blMniq01UHVV1CL4X
   g==;
X-CSE-ConnectionGUID: HHa+vZh3RjSkly7feY4mvg==
X-CSE-MsgGUID: N+avvYJcQY+doIMOd4NEog==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="41348239"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="41348239"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 07:28:43 -0800
X-CSE-ConnectionGUID: 8X6cScV6TK2pnVeFgwkMtQ==
X-CSE-MsgGUID: ezjX6iivRuCe0pPBLwYXFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="115566309"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 23 Feb 2025 07:28:42 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmDu9-0007PT-1l;
	Sun, 23 Feb 2025 15:28:32 +0000
Date: Sun, 23 Feb 2025 23:27:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 9/9]
 drivers/thermal/mediatek/thermal_interface.c:123:1: sparse: sparse: symbol
 'dev_attr_ttj' was not declared. Should it be static?
Message-ID: <202502232326.tPihcpwH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   be485e577c3a0ec3fd52f17d7b423cadc8fc63e4
commit: f92d27911c80f765803e64a146e7fd2ffad1c707 [9/9] CHROMIUM: thermal/mediatek: add thermal interface driver
config: arm64-randconfig-r112-20250223 (https://download.01.org/0day-ci/archive/20250223/202502232326.tPihcpwH-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce: (https://download.01.org/0day-ci/archive/20250223/202502232326.tPihcpwH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502232326.tPihcpwH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/thermal/mediatek/thermal_interface.c:123:1: sparse: sparse: symbol 'dev_attr_ttj' was not declared. Should it be static?

vim +/dev_attr_ttj +123 drivers/thermal/mediatek/thermal_interface.c

   122	
 > 123	DEVICE_ATTR_RW(ttj);
   124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
