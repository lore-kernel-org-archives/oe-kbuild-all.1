Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC143C6A43
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 08:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782201662; cv=none; b=MRJJxjPvddVsRAk8JEXepx3gBMp8I5zHZcSMWLIFzjlZ/ie6sTn44Lmb9ItixuqzcV3qVwIV3SXiOct0Dyqq50VXFBx8xuf4vZl4cUE7NF/FxjJlp4pK6HEeoOkWuhZugeYon/XcCD+HSNAMeKUKvYj/wrDwqAsFvA32VvsI7qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782201662; c=relaxed/simple;
	bh=IGOYgdBerpLZrd40i6ZE7Laj3OtY4bLDKAzUR99Sqtk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uC0Ps1iQzhlGgp8aruSL3vpYrfg7P0rNxCGuIp8JLxhUi8DrJ7HNYHLBKZ83rL3zSzgTh1+eEpnsu8DRSEEocsoWF6j7HxjRkSApNsrqs2A4qw10klW4DIcWt8qaa6aZTGMV/y8roRhgMlyPIbD3O2Jc6hI1SXQAB6vgoIeuKzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mhiD9OPj; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mhiD9OPj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782201661; x=1813737661;
  h=date:from:to:cc:subject:message-id;
  bh=IGOYgdBerpLZrd40i6ZE7Laj3OtY4bLDKAzUR99Sqtk=;
  b=mhiD9OPj7ng8JQpZmV5fMLfZrgjG3iOcTJpyZ5/wEcSTrzauB2tqYOIU
   SKXWxw43GYhnGylAtaMBYYMFArSjKMhMQTVkEiHgKBoC/AjVaIzrYbjpQ
   fFv00O4kpLyCFcL9yDjAH8yk3nrlYeb1i++uEyrf8P8yxfvL6KvutZOIv
   Ax9XmvMA8HeA3cPpm1GiWrNp02vYF6+S3n1clEBMAMlFYvQo86NQ1BeNH
   l++XTHZb8ivuyca8UHWu78NDNoQlA3qTc9oWN8A95Bg23Cshyo99/nQNZ
   nN/PwS9imKdy8J1KiBbPCFXGyKr/IZiC/TEMKtEyvTH4iDeLI0LtYrxqN
   A==;
X-CSE-ConnectionGUID: rGj3ikB3Q4mHIoaqrQ3RYA==
X-CSE-MsgGUID: 3k9JPul9RQa+QpZsE28WRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="108481446"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="108481446"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 01:01:00 -0700
X-CSE-ConnectionGUID: I0VFhHeVRLiLFGs63iMEnw==
X-CSE-MsgGUID: A19/2LpZSDSLW6tbQrwleA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="247107937"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 23 Jun 2026 01:00:59 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbw41-000000006Av-0zl1;
	Tue, 23 Jun 2026 08:00:57 +0000
Date: Tue, 23 Jun 2026 10:00:13 +0200
From: kernel test robot <lkp@intel.com>
To: Kaitao Cheng <chengkaitao@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/core-api/list:775:
 ./include/linux/list.h:793: WARNING: Definition list ends without a blank
 line; unexpected unindent. [docutils]
Message-ID: <202606230940.yeWFIO56-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Kaitao-Cheng/list-Add-mutable-iterator-variants/20260622-193620
head:   72faf2855f60a21ac98d3e63d13a20dc1db9d8a1
commit: 7858c2cc567eace0010e1727aabb1967f14c98f8 list: Add mutable iterator variants
date:   20 hours ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260623/202606230940.yeWFIO56-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230940.yeWFIO56-lkp@intel.com/

All warnings (new ones prefixed by >>):

   1             automatic adjustment of input current limit
   0             no adjustment of input current limit. This
   helps for more unusual power sources like
   solar modules. [docutils]
   WARNING: ./block/blk-map.c:366 Excess function parameter 'op' description in 'bio_copy_kern'
>> Documentation/core-api/list:775: ./include/linux/list.h:793: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/core-api/list:775: ./include/linux/list.h:826: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/core-api/list:775: ./include/linux/list.h:971: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/core-api/list:775: ./include/linux/list.h:1009: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/core-api/list:775: ./include/linux/list.h:1048: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/core-api/list:775: ./include/linux/list.h:1089: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
