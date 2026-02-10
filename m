Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C8421B9C0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 22:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770762802; cv=none; b=lDvPZAH8Z2aTaPPo4YqJpSSHHKFlLw4/TjE54yBwdDA6kUOYt98ojBYY1yEe0HCbjhxUEcjb8XHiGIRTDjVIxKKKxhlHjU71cCw7Y1odlhWsWivlQQS2ZnoYPFY+PwlUugM/aR+O/HnSDcVqTq5/9uhqRpY/t9dryk8H86tt+4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770762802; c=relaxed/simple;
	bh=DurisQXWW/p1oZS3a5UmKsalXFBHyb3efPS6DZoXkBI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M+PIUoIB0YJNBGPmoZVjhQ5cQatt9srQPpkaSHJPiO3Ll7tqPRv8LZ8FFwak1Suq+pTe2ga2xW6uxD727MGt/jUNfm/mysPE7XmXzQ0rv9hvO9LtgRXpuB4WBEYc7LcwuSrRyPzp9hd4qaLBnvrh600s5RIlNUXJfnobpD0ZlVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QohyLDRb; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QohyLDRb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770762801; x=1802298801;
  h=date:from:to:cc:subject:message-id;
  bh=DurisQXWW/p1oZS3a5UmKsalXFBHyb3efPS6DZoXkBI=;
  b=QohyLDRbROQ4Kd1xIQ1Xc96lHSW0vNsPzGcu8hXl2hD4sx4t7+fusJDi
   NM/tc+yaj9Pa5Kxa7BesvmC9Yj2JS5WtsjjARqdLjjfJqNxX9ea239Cdt
   XZ0MjiYHFe0Ik/MxwBN/kZffVwxFa8SxLnFqaQp0ASrMHpu/R5tieFWOw
   Y8Zh4PDs78mjXWKfLaG3C7w0x3ey8iEM/7/PuMjqUm240alJ4FnwMptiZ
   3m4ujV/S+vjt7AK2Pxby2toHKFbcA17pHT7+d8PiazHiAhR+mzKykl68o
   4tWliLpAf61aBiBi9tIisWcGXdgEae/zfheSHfHnEMKnmcFovvjM4LPl2
   g==;
X-CSE-ConnectionGUID: 5BtFoU0dQsWNdf92kMlzGA==
X-CSE-MsgGUID: 9ASqeN8NTrymqXUnJ0JHVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71802374"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71802374"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 14:33:20 -0800
X-CSE-ConnectionGUID: BvUDGnlZR52TsgX5OS5epg==
X-CSE-MsgGUID: ENDwfEZmSgKdhPBik4AIlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="241947605"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 10 Feb 2026 14:33:20 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpwIH-000000000wT-2Yct;
	Tue, 10 Feb 2026 22:33:17 +0000
Date: Tue, 10 Feb 2026 23:32:30 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1] /usr/bin/ld:
 tools/testing/selftests/vfio/lib/vfio_pci_driver.o:undefined reference to
 `ioat_ops'
Message-ID: <202602102302.lsNO5sT8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   409a26120e3ef4670c01dbbe25374031b46702ab
commit: 2223587df5c5e935cc6f973f62a9608eef81bec8 [1/1] vfio: selftests: Add driver for Intel CBDMA
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260210/202602102302.lsNO5sT8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602102302.lsNO5sT8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602102302.lsNO5sT8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /usr/bin/ld: tools/testing/selftests/vfio/lib/vfio_pci_driver.o:(.data.rel+0x0): undefined reference to `ioat_ops'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
