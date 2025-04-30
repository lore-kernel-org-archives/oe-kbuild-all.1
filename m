Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779631754B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Apr 2025 00:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745971416; cv=none; b=ChvZfyMaPjdNisW3ennpbSuFK4/GiGPmoc5V/ZfnQz860R+DCN36yNCS6mw4WxdBuN/9P5hhJQPDfhowK523sV9BcHC+vrekBJ+Coyko4YSe5LksbVsxJN8U3i/ftsm0XEJxcino/B31E5D0cogmFzUde5vl6ljVmC+larHJdio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745971416; c=relaxed/simple;
	bh=Zj4By4cUBB6mIIZgB/Oy83Ptdx0owbWgmCZNmjw5zVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gcew0sftNVyjTw/IpY3NuSEnpYGTq/rRJb2dJNxVBQd6aH6Fa9F4xFP0GOGFdhOitgxxCFh/48qjCJlqtJ0QemTzvWjA5JKLdIMXguteQWwM0nhH4Bs+MbveMRSfCDIeZU4WEEK8Cx0asuxT0FLHZuvIwwQfG9w2GSQIn7IwnSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kC5iBxvZ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kC5iBxvZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745971411; x=1777507411;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zj4By4cUBB6mIIZgB/Oy83Ptdx0owbWgmCZNmjw5zVQ=;
  b=kC5iBxvZjL0D1sOF3xABgIGj+zHnIPI1Tr4Ni+NYssEeT4Yuw2RxSQBX
   KqR2Tmwu4el1x3PxuB7ka9zv1TZiQ1i0ujyRgebV8Tvshp6fJ92W0MZkD
   JBpovMGPPHI32hpqKBvI5yl7CDjZy39TGaq0JkUZVtFUz3nGwQZq2kjWw
   af6ILQHaz2KFmQUrBlAwoVPGiXRvfk+5/zwR4PeXdbDAq1xet2OHmjfMF
   D6/JWn7BGzhNIotPo3ARIM/rwVNNqQFXUt3ylbCYmB8sqCjkKtje0aoIU
   cKb3mXWmJSAtRP5MD6xk6VzBJyAEDj7MNnjpmJ8sh71binj4NwA+LRWE7
   Q==;
X-CSE-ConnectionGUID: 9hfDqGUiQMaS4azZ3NrHAg==
X-CSE-MsgGUID: 4I+oDB5dTDuLWfz+qt+ccQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="58991556"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="58991556"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 17:03:31 -0700
X-CSE-ConnectionGUID: hqcsFDYmQNqrXRxtqWByxA==
X-CSE-MsgGUID: ynTosAYeRvOT2u5jUFvpaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="133870717"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Apr 2025 17:03:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9uv9-00032D-2b;
	Wed, 30 Apr 2025 00:03:27 +0000
Date: Wed, 30 Apr 2025 08:02:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 0/1] include/linux/blk-cgroup.h:
 linux/blkdev.h is included more than once.
Message-ID: <202504300742.N3Yy8vrG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   1aec9e76fe4a65b0a26fa1b30bdb3400d9728b2d
commit: 3f91687e6e5d0171768f3234405f7b568958c47c [0/1] block: don't merge across cgroup boundaries if blkcg is enabled
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300742.N3Yy8vrG-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/blk-cgroup.h: linux/blkdev.h is included more than once.

vim +21 include/linux/blk-cgroup.h

  > 21	#include <linux/blkdev.h>
    22	#include <linux/atomic.h>
    23	#include <linux/kthread.h>
    24	#include <linux/fs.h>
  > 25	#include <linux/blkdev.h>
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
