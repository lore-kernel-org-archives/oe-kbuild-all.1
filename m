Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9AACA5E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Sep 2025 01:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756775883; cv=none; b=cF5c/ptZImSme0cOsnt87wZSQK2psmnizLJCFEwbeyWf7UAIXqd0JFKKSXSZ57s6heRam5WioixCKyZtwZExUohQrwBvBpCIgv5KrZhETio9Hl5sjy9vdFjXjDvNvvtaHgwxmMohK5bmjrVmjSDXvwi5/hlGd8YBQAPzfT7mNmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756775883; c=relaxed/simple;
	bh=Ku+4xSRxCzV9BfXaB7JP+kMCONo6M8EHsDSp8MuecGg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YGktQMxy6ri51HrHv6sTxrqID7hMOds1ISUrcbzNCb83qy1WW8mmT9wOM/KjGZdvfrwgZAGb5S+dQPkM8P/5+b9Fth4p9wsALg9kdaQ4ugwVZj7EKuMbGiNZyNzOuLPQ53At/KcV2Mptm+ltY/W/31F8OZYTOObo7rfL1+Mo+aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U+RlLFpj; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U+RlLFpj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756775882; x=1788311882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ku+4xSRxCzV9BfXaB7JP+kMCONo6M8EHsDSp8MuecGg=;
  b=U+RlLFpj/ueEvYIgKA0Xlj9kFZQdyH6RBIIPYzTWdc5UzbNb7XsgIU85
   sakhCJ/LK3inflTKzFZwzGg+jkAgFWh/8Cw4/RiMiOD/UpvKT7csfYuE6
   s+jEj1rYmASKh1Rs+Z45dGmhNDfBsPdtV7NR3VGdsWMUaM1D61pSac2Ip
   HjfWnplXjxmj6TQ4YW14HbEgvifD8y3hhlCDN5TchgNOTmam0+7+AWcMh
   nNTd6HnnavgwTfDG/8reFM3nHKE8MAzRIa4bZ14r/MoQpHM6EyYFEBGu1
   Yw8FVRXH8BT64eP7uFcauLVaPGbEw4E3bXTc5+lL/odiNtiuBXGKB/A+B
   Q==;
X-CSE-ConnectionGUID: NYPP6WnhSOuUS9GMkuTdNg==
X-CSE-MsgGUID: PCDTjAAlQIGZVquQWB4XjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58728625"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58728625"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 18:18:01 -0700
X-CSE-ConnectionGUID: Y89WhVWoSGmJ16kCd9XZeQ==
X-CSE-MsgGUID: N6qv3panT5iXws85Yt85Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="171580457"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 01 Sep 2025 18:17:59 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utFen-0001HY-1P;
	Tue, 02 Sep 2025 01:17:57 +0000
Date: Tue, 2 Sep 2025 09:11:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1774/1774] mm/.tmp_ioremap.o: warning:
 objtool: missing symbol for section .text
Message-ID: <202509020919.PwhZw5yj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nicholas,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   54968bf23106d2ac31ede8dca013a7fadeb3dd75
commit: 004cface9c1c0b6351473934a4ce452193e05b07 [1774/1774] mm: Move vmap_range from mm/ioremap.c to mm/vmalloc.c
config: x86_64-buildonly-randconfig-001-20250902 (https://download.01.org/0day-ci/archive/20250902/202509020919.PwhZw5yj-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509020919.PwhZw5yj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509020919.PwhZw5yj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/.tmp_ioremap.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
