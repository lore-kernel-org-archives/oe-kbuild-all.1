Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7974244EB6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 21:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739050628; cv=none; b=NNvgPEyTKMCHG0oIiIrttiQbQEMt+sp1zysXeP8lP28ejvcqirdrs5XlHP0EZDiLjml4wDgJZHBa3VDWKf1Hxf+xv/gN683V2JpsRxFKvPWaCvYTvtzzl88m1WsW9myRaTdzqVtZv6lOsjkBdY8oOwkZ7kfSlHWORB3huEPOrl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739050628; c=relaxed/simple;
	bh=znj6FGoMrh0gVVF3KF4eCWxqBW84RIZxJrar+9622gw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nkAY3HPIMR/ziX+noU32HbfykHX2vShdpQ4iFtU7c1d//dElsVEvOvpQXdgAyZ9SIsqDMdfzXQa0q6NPt4lptX9WkGEvF5KgcRj95eF/ai9r/2fB9aaLFqmXXBfupCqy6gvPJ7qE4mdQpd3VSnvcPQrQ2jg8AU1JBtWU0K+kdjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gJQAhdVZ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gJQAhdVZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739050626; x=1770586626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=znj6FGoMrh0gVVF3KF4eCWxqBW84RIZxJrar+9622gw=;
  b=gJQAhdVZyDhjk56gM9HR97U6i/Ma31ZYaNIH3tWpXJkOES9N4vcS/Rsn
   Yy1PIgB2Zppa/xlTK9qdJH2aQQZiFFdnGeD7wPpbTfXnyjOcQicK6cbln
   iT/XSWlALz3dVSCEQrjMNCbKvs5xdJk7MgCoAiFtR+qjCiLiHiFA3Q8M3
   wZlaxAx7oIazpCdA2Wtp0uocsuk04YIQWs9ttw1SQNMzRZVhYkD7/pW4v
   zTKQhov1/2iJldWHgbHCG1j5ttkUwg8eQg46n+1EOTfTtAKOcscgK2Uob
   4AiL54doZ74Y+7LMQwwdm9Zh2JOMrROql63Yt1CuOPE13mE69TV6XBFI9
   Q==;
X-CSE-ConnectionGUID: 60U5W/aAQp+jOw+stvxspg==
X-CSE-MsgGUID: 18OjXIFGTr+wc/bvw2unRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="38868690"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="38868690"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 13:37:05 -0800
X-CSE-ConnectionGUID: vv7rVTrFTe6FvD8SIBEWWA==
X-CSE-MsgGUID: XZKW4odMRg2xYJ2jli1TdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="111661761"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Feb 2025 13:37:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgsVa-0010f3-2z;
	Sat, 08 Feb 2025 21:37:02 +0000
Date: Sun, 9 Feb 2025 05:36:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 243/243] arm-linux-gnueabi-ld:
 error: .btf.vmlinux.bin.o is already in final BE8 format
Message-ID: <202502090553.soo0VLSj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d544cd6e0c7429dc973c694b27e40cb6ba8df2a1
commit: 245653ed73e34bae95bc8f27c82fa56757d37946 [243/243] block/blk-iocost (gcc13): keep large values in a new enum
config: arm-randconfig-r053-20250207 (https://download.01.org/0day-ci/archive/20250209/202502090553.soo0VLSj-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090553.soo0VLSj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090553.soo0VLSj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arm-linux-gnueabi-ld: error: .btf.vmlinux.bin.o is already in final BE8 format
   arm-linux-gnueabi-ld: failed to merge target specific data of file .btf.vmlinux.bin.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
