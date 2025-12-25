Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077408F48
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 04:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766637101; cv=none; b=L1bbcZobyeCEYmI/DIsLrvWMdx+qnoxE31vtkJVFJm1z95PQbfECCelQZNdf9vdBPCrJvp+4UPfnO4EDSSmb3c/2fEBmhOfw1ms699sjzxfWBb5Q8urKgnldIAhc4VFno6dH5QS6zW1TSMmys4GK8OCkv9Zu65U18lJku2yo600=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766637101; c=relaxed/simple;
	bh=HW5YTp3RbhGXUtfNfURozraMB3bYKrfts2bhi95ipqo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J/ruu1Du+o4iz0VJMtKK6sTLCcj7t6QCNtWE7asJ7dKZwDdHtp7k8gyT3xbzI3PP5yY7g1NWQOBpf8z9RbrdrW7RjgvUlpe9Bfbx7T0V+pEVdLuwVbavyrFDCUg0iiftaZtnCjgZyXc6PXuLFcjaOCAfV+opsavSk5VDewSfRZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iKledFfw; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iKledFfw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766637100; x=1798173100;
  h=date:from:to:cc:subject:message-id;
  bh=HW5YTp3RbhGXUtfNfURozraMB3bYKrfts2bhi95ipqo=;
  b=iKledFfwyYMBX2LKDOcYMws932iVNpDF1TQzLjKlkZADjqaYixpZVO+a
   1hZOzkJNGh0+r/rb0IZqxnDnz5V4+Y0hh3hvBW5upXUHISgsT/E3e+he9
   q3RGIK/MK3LmQt8NZD8G3/hXU1eQcdRGMLb0sMqWH62rW06pttwwM1J7X
   jAIKRy415NUnA5c2MF2Dp5ji/WyBTd95XVLgu/MkEkcuscf/1iWrlK15r
   5BfmP1Vk3WpRkuXCdzQeZK8r+YlQxboso7/7kuPsGcFeqBgQou9EhzVJb
   l3HInKxuUJlMXRR/Aw4B8Efj89pHy2SYw9/XnEz2hxtA+3UH6x/e3k0GB
   w==;
X-CSE-ConnectionGUID: nl43cGiuSF6DP+W576NfKQ==
X-CSE-MsgGUID: LZgez8qjTEWfXTALrWs2Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="72080890"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="72080890"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 20:31:40 -0800
X-CSE-ConnectionGUID: ft4YZyf6RgiP03aSB7WbkA==
X-CSE-MsgGUID: eKMw6HYBSRW8TCBcTmReNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="199391869"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 24 Dec 2025 20:31:38 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYd0h-000000003kN-3WZr;
	Thu, 25 Dec 2025 04:31:35 +0000
Date: Thu, 25 Dec 2025 12:30:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 50/50]
 drivers/mtd/nand/raw/nand_hynix.o: warning: objtool: hynix_nand_init+0x17e7:
 unreachable instruction
Message-ID: <202512251219.uUPt5kZD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   b3ee0976c4976145a60fdd1ff7fc4133b8673d96
commit: 3115fb2cc55c45d237e7bfdcd04ed6eab3932b4c [50/50] mtd: rawnand: hynix: fixed typo
config: x86_64-randconfig-r052-20251225 (https://download.01.org/0day-ci/archive/20251225/202512251219.uUPt5kZD-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512251219.uUPt5kZD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512251219.uUPt5kZD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/nand/raw/nand_hynix.o: warning: objtool: hynix_nand_init+0x17e7: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
