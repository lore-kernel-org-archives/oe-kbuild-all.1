Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135807081A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 01:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782957501; cv=none; b=SaDxv5X/vHXGLSCM7dPExFYbbU2AGMs/0p8dsQDJlP39bwtISCn4/Ie5uUOqyI/7uOb9i2J44lU7xcPrURGtJ4f83I3lj8otdIFGm1nZ5+g4Fmbaf/IGSdLuLkbVOotM5d+LIL8syWnfD6RtMPLOJm3mEDa9UqoyQu2XvHGCmW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782957501; c=relaxed/simple;
	bh=eOzX7DG8QaV28Jzqpxa7v4LLkhvRhf4sWS+nmK9sRh4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bt+pJpZXF6M+rVETMxYnxGvb3mlohWXuVmiLTRd66bsN/sDJ80dqi6Hsr6gEibq3qRRpGVwy3ipEDjPocUd9mjnEWtBa71f1Bnp1Y48GLxS7DRt4+y/66BoSbLsc7pPF5wUB3k2Ys3gmPzz0pqmtZtOCbdcaDygiAZeOu6+rrkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T0Crc3Fk; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T0Crc3Fk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782957500; x=1814493500;
  h=date:from:to:cc:subject:message-id;
  bh=eOzX7DG8QaV28Jzqpxa7v4LLkhvRhf4sWS+nmK9sRh4=;
  b=T0Crc3FkvGuof+jih6RU93tUHEodfvbUeA50IJDJ8CVBH5KSSakFhYoJ
   arEUwsFiMfel4aqWLoS6kvMhwXPJaxjO/ufe8NRayPgpMOKJSoML23wLS
   3U+omvrMZN3fyM8VCz1Fc8sbScWNBcgzUzZD6xIY0FA/fdzd1zR/SMotC
   oxd5TKKZhLGEuX2EYEJUHztC72a12ul5imIw7Jqe+lUgbFbCK6xJZGE1C
   0yT2ddE/0M4qqg20Due6ZsMhcwA3UqfmGX4+8ShczLrPUBOa7qOGqkHFa
   jWgFDDVUK6MPy94AGDvzdEd4f6phbvVR5ILKEFWKWlE73ar558By0naTx
   g==;
X-CSE-ConnectionGUID: jzYXqOKRT3SUeH0Z0hSHZg==
X-CSE-MsgGUID: 2dPsMxhAQym1uQNFEppZ0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="94856587"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="94856587"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 18:58:20 -0700
X-CSE-ConnectionGUID: +DY/U+96TKyDgiS/9B3oiw==
X-CSE-MsgGUID: fOSk6VLFSvqNleGXIKUiGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="277033976"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 01 Jul 2026 18:58:18 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf6gv-000000009rF-2QO0;
	Thu, 02 Jul 2026 01:58:14 +0000
Date: Thu, 02 Jul 2026 09:57:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-lts 1/1] Warning:
 drivers/dma-buf/dma-buf.c:413 function parameter 'dmabuf_info' not described
 in 'dma_buf_account_task'
Message-ID: <202607020952.kaM4Nu5r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mercier,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18-lts
head:   1820d6db23bfd13e77fd48752705da1ea203d091
commit: 09725f5bd79ddb1909d7d05ec74c9378c9e662c3 [1/1] ANDROID: Don't use current pointer for per-process dmabuf accounting
config: arm-randconfig-002-20260702 (https://download.01.org/0day-ci/archive/20260702/202607020952.kaM4Nu5r-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607020952.kaM4Nu5r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607020952.kaM4Nu5r-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/dma-buf/dma-buf.c:413 function parameter 'dmabuf_info' not described in 'dma_buf_account_task'
>> Warning: drivers/dma-buf/dma-buf.c:428 function parameter 'dmabuf_info' not described in 'dma_buf_unaccount_task'
   Warning: drivers/dma-buf/dma-buf.c:953 function parameter 'name' not described in 'dma_buf_set_name'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
