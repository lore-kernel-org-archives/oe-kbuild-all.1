Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FD32040B1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 20:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731530136; cv=none; b=GRl/0T7nCLAULCh5Yj+pKLL3drkrR7xLdLbhYA08YoeS8/cqJw1RmUaS/ViZIjhgu2yQIKsvYX+YInS77Hpcr1f3KhbdsFM9SjPfwvEoNLuPE1Ibnl5n9uIDu9+1f/3KjhGnCTljSMiVcwqgrp6SWmu/+fp+6mQnERIEl5r7zDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731530136; c=relaxed/simple;
	bh=XBqZ9gitH6TvjlE+rFQwA9pvB4QeBbxL9GrmZyKxhiA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rlF7oOCMIF0dRqATY7ydRFjPzPkZ9hjUhA55MP4VyZOMHmS5HRAlTq6vLx5P/hkggI9jrYq/zEvL7hZse7bRuMprZddyQZvFNTNUU42H/unWZ2BycptQz4FKp34KDo40vgSEemw6AAIcPxqob81Uu07SryRVzid4KdJ3/r0iGeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WOKJKOfb; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WOKJKOfb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731530135; x=1763066135;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XBqZ9gitH6TvjlE+rFQwA9pvB4QeBbxL9GrmZyKxhiA=;
  b=WOKJKOfbHmOsswdeS2PY7xYnQdPwjSeF3/YKnyu2SSLiZTTfrfyQ2FKk
   Fft0YeBH3POdw18eJPy5GwwiicsqFHrm/oFJdFBMRsB7R7O2lV3GLL4X5
   fRmhuDtCFY2leeWxIGMgICKQqxBvkFjMFR2stk5r4cU7wUIQvyyx8U6ID
   y+nF1ojvtB52IYNm2l6Fc8T6G96x0s2kCNDMNx633NR4CRzYjqh80CcHB
   Rl3vphEKnm/b2gXJ2j8GLJurLxPKhfTP7ZRyCgjmohlsufmMeYkvL5rGj
   zBiHhhqhiTtPY9IsiKiinH93bbauFltgTDRi9Kickg0UyHfzsuonLhT1H
   w==;
X-CSE-ConnectionGUID: ma0AX8f+TM+1REs7Of/qkQ==
X-CSE-MsgGUID: /kSw9mSZQCKHnwByDqH4pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="19049269"
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="19049269"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 12:35:34 -0800
X-CSE-ConnectionGUID: DTZdVMD6TiatswenaW6EXw==
X-CSE-MsgGUID: tuQVW9ciSAWQ1XU59eN2jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="88411470"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Nov 2024 12:35:33 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBK5K-0000hV-3D;
	Wed, 13 Nov 2024 20:35:30 +0000
Date: Thu, 14 Nov 2024 04:34:51 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [abelloni:rtc-next 25/27] ERROR: modpost:
 drivers/rtc/rtc-amlogic-a4: struct of_device_id is not terminated with a
 NULL entry!
Message-ID: <202411140443.G6jl4uM7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git =
rtc-next
head:   eb4ffa40010472dffdc276da307161545aab45a3
commit: c89ac9182ee297597f1c6971045382bae19c3f9d [25/27] rtc: support for t=
he Amlogic on-chip RTC
config: arm64-randconfig-r131-20241113 (https://download.01.org/0day-ci/arc=
hive/20241114/202411140443.G6jl4uM7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241114/202411140443.G=
6jl4uM7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140443.G6jl4uM7-lkp@i=
ntel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test_modul=
e.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/exportfs/exportfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
drivers/rtc/rtc-amlogic-a4: struct of_device_id is 200 bytes.  The last of =
2 is:
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 =
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 =
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 =
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 =
0x00 0x00 0x00 0x00 0x61 0x6d 0x6c 0x6f 0x67 0x69 0x63 0x2c 0x61 0x35 0x2d =
0x72 0x74 0x63 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 =
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 =
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 =
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 =
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 =
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 =
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 =
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 =
0x00 0x00 0x00 0x00 0x00
>> ERROR: modpost: drivers/rtc/rtc-amlogic-a4: struct of_device_id is not t=
erminated with a NULL entry!

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
