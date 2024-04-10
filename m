Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B095338D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Apr 2024 01:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712711536; cv=none; b=obX3mRtwalB2yLsWYvXtbxtEHrmgJH37qFpiCZViNjlg1yO9nGMnbUEDVi+t8DxX0jZsMopl8h4AwzZewpB2jI+XRjExBlm3veQfBFFo+4P5N4r9FnForscZONk0EbGcqyIsdURa28S9Wz2Ld/XwmRM5WlqemFVqFdSeG54kB9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712711536; c=relaxed/simple;
	bh=A+tt8qTXpsrnYFRcU0KGpMt2lACkafdttqq673sRS6I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZLvygpk7hBV5rG7gqC4c12pNhw3I/rX354G9ycrMpyQCtB4pTW+YVJ6VatrxrZpClPcMvNcB0hgDifnSA1pJmKbAoJscX2XETnpKLIJJUw9oiDMKCLGLgmTEf/SclznAUXP4C4cP/5/gG4AmT+4ujknksRP4xfL1RACeUOW9Qys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=co9usKFj; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="co9usKFj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712711533; x=1744247533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A+tt8qTXpsrnYFRcU0KGpMt2lACkafdttqq673sRS6I=;
  b=co9usKFjt4Vwk2vlc1FRoB8oz3EcDo63NJTKCZwCl9tBrjHBOc2gGy7B
   UQwDttZauhwNfHl+D+AOYYCLwzDyfCGsPbMErI6agWydiZN1IaUqlc4TB
   +1M17sz39GFpwp15tMId7kEFoEGI6+nS356442w3a4Dtl/1t4rrBh1/aS
   ACBGhXRYf8jiYGGav0RMPun23H8h0YHbTAEfAmpb+7ib8Pn7qiWAPsEpY
   /lJgfmo9w+mPfOCNaK3e/wE9XMbgmtE88fvhZa4SSXL1AJ/e/jTB8Ugtp
   QqSiz/c7Jl3Xam3nuVnJdrz2uetwZ/hRKnOTS5aJdX83/nnMHPft346i3
   w==;
X-CSE-ConnectionGUID: 7UEh+tG+QOWzOJGvegkwXQ==
X-CSE-MsgGUID: UBO547ZwRTaReSFuL2b1Tg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8628264"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8628264"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 18:12:13 -0700
X-CSE-ConnectionGUID: P6FWgMLgTgWEEUuW03iU9g==
X-CSE-MsgGUID: yUx6fCPhR3GoVrv+7GTRQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="57842600"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Apr 2024 18:12:11 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruMVV-0006gA-2L;
	Wed, 10 Apr 2024 01:12:09 +0000
Date: Wed, 10 Apr 2024 09:11:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:execmem/v4+x86-rox 18/22] include/linux/text-patching.h:5:10:
 fatal error: asm/text-patching.h: No such file or directory
Message-ID: <202404100949.oGE19GXv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git execmem/v4+x86-rox
head:   a14551111ff8bbf3c520771e89892d599463da71
commit: 158774f2959493d41916e8ea6af40ba2de85c04f [18/22] module: prepare to handle ROX allocations for text
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240410/202404100949.oGE19GXv-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404100949.oGE19GXv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404100949.oGE19GXv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/execmem.c:7:
>> include/linux/text-patching.h:5:10: fatal error: asm/text-patching.h: No such file or directory
       5 | #include <asm/text-patching.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +5 include/linux/text-patching.h

ffdd58e8bffb1b8 Mike Rapoport (IBM  2024-02-29  4) 
ffdd58e8bffb1b8 Mike Rapoport (IBM  2024-02-29 @5) #include <asm/text-patching.h>
ffdd58e8bffb1b8 Mike Rapoport (IBM  2024-02-29  6) 

:::::: The code at line 5 was first introduced by commit
:::::: ffdd58e8bffb1b8316c7abdabd8b2e9bbbb921ff asm-generic: introduce text-patching.h

:::::: TO: Mike Rapoport (IBM) <rppt@kernel.org>
:::::: CC: Mike Rapoport (IBM) <rppt@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
