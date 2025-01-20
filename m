Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C3F186E58
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 18:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737396393; cv=none; b=kDy6smcW/actxLpLTj8hWDWwvfQ1qh7mentH47lqO7kYuv+s1HKUaTAYow4ndQePrEtrVSIwBUWzoJlesDZXoRHJxLM6SmE69VSXrK2OeF7wtMi52JT9/rVfKFgvZTdAYDpoB3b2UQn5XAqmJysUaMRM7Ck92h9IxTip55Q1LBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737396393; c=relaxed/simple;
	bh=TKAScLU+tNJ/AZ0VPH/XzwxeCdMR6ssdLMEDqhA1w64=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OT7KjrbPgia9feaPh2rEhMPue9rHHz9JUUkQz0pcRxP9A0qXyM05HdUvU3YbO0JYA8k8/RQ7FZ2Wjuls74dkWGLPyfD/TJJL4GpAwqKvG8/yZU8Cewpv/Hf6eqdqk2ZJjRJV0Crm4jwTAtLDTWHhjI5PqoPG5b6JNloQ/9WF/TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lHUZ+3Fs; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lHUZ+3Fs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737396392; x=1768932392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TKAScLU+tNJ/AZ0VPH/XzwxeCdMR6ssdLMEDqhA1w64=;
  b=lHUZ+3FsgOyR5xLrqVo1pwhR8P1Kbo43V0ThjdgO9yfxHG1fZZ9pFHrB
   cM0FNdPkZFR4Q5lmskQG9RqkySkPEChlspoOfqraSKxvo9uxb6ikeRQds
   080eMCNRu3fj7yizCGlsfW1V9TRhT8+4uLXfU9rXBogBge8lzah8h34i7
   gjQThlwAd9V5I8HwtRpUc24GChx34/y8Bv0c2w8OtwhPJlSUeWe2/q+3j
   77Bu4tKBN/4Io0A9fYWiWiH4q00Ny9/VqCOzRFdMKJZ7eEafZfTlhlw4X
   TJC4Z1Y8xAuI45ArzFDEwhcoC0NLNy1h2d3DP0GAu+WVB/SEM/qZTlB2s
   A==;
X-CSE-ConnectionGUID: 1bNT5xssSzmYTmNVs0vSZQ==
X-CSE-MsgGUID: Yqq6I4eLTmqAassAq835JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37676655"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="37676655"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 10:06:32 -0800
X-CSE-ConnectionGUID: /dYvsmnvR5uF0YazAXHgAw==
X-CSE-MsgGUID: dBiyvI9wRf6WCKbbocBp6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="137442075"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Jan 2025 10:06:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZwAO-000Wql-13;
	Mon, 20 Jan 2025 18:06:28 +0000
Date: Tue, 21 Jan 2025 02:05:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 414/414]
 include/linux/blk-cgroup.h: linux/blkdev.h is included more than once.
Message-ID: <202501210402.2Vrbv1Cf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   f1886058f185ab564cd7b401b33228bae9414871
commit: 3f91687e6e5d0171768f3234405f7b568958c47c [414/414] block: don't merge across cgroup boundaries if blkcg is enabled
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501210402.2Vrbv1Cf-lkp@intel.com/

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
