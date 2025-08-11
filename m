Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F15311C25
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Aug 2025 21:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754946034; cv=none; b=XTyhY2oFx0yvdOmJ2UKMBbjLfO4VPMPk6R1qZORm1HnBWaZkg38NOW3fLrOqZKmmiMdRT6HvD+esGRwN9zSwX1UxBXgbxJepYjWZ7kiCrs7HkfN+zWXX5zknk0+ei2Rfc22kUYZZCjjAUmPwBadhuTMxmi+fnAuF1YytUPl53QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754946034; c=relaxed/simple;
	bh=pXulXkxkZW/aa/ce3EsoTSQj3S7rZA2FXr+CLbAMSI0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IEQyLdnBnl4EUBynp9V6Pq0aEmdNZq48TxeqAoRziiQCWNDXM5q/N5kDxbZLgRgJq12Vvvm7m80qjekm6HpAa82pdetfLaszWxZsmdgQgSjL4FDb6z9iE71UuKP46s8Z5qQZ4lEaHT7BI67z2lILUkCMHFhDYuzgM8Z9qofZNzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iBuDHnJO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iBuDHnJO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754946033; x=1786482033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pXulXkxkZW/aa/ce3EsoTSQj3S7rZA2FXr+CLbAMSI0=;
  b=iBuDHnJOFnm1jcyLvFMG7PZfeiIFT4vjX9nf8HNNLHIFqvZo6aChmIaj
   xT4ANkcZ7A5P82tQKmmn64YyxnusESHZMh1QRHXpTBmx8Ew6ZuHxte6Dp
   HFGOMKS5B2xAFVYIB/1BVNd89linLBgk9S2bmB/Mkl6ZSLmCsOVHr1QBt
   TkGxEUuX7Px3iV74dafxpTmBurrSeS8pxQlMA4M1wCvbMNEyXTFvV/YqO
   ydtxDxJlcHTSlxW5C090cLRuiHBn2qhpzp6rvdjPKP23L1UfNPLIDdHGC
   d6PMW0pqcKdQK4YjV+LHA+EG+31aQKEZxknpJ/PM6p1//bipu/LW/0DPN
   Q==;
X-CSE-ConnectionGUID: 60QQAIR1SsafVv8kBUF7JQ==
X-CSE-MsgGUID: mDPn3OsUSjm/iEu8oqycTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="68579682"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="68579682"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 14:00:32 -0700
X-CSE-ConnectionGUID: Vwfl/x2TSZqMvtCbJCbfDg==
X-CSE-MsgGUID: DCBxClMUQUiqNlYryUcc1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="166313908"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa008.jf.intel.com with ESMTP; 11 Aug 2025 14:00:31 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulZd6-00037X-2g;
	Mon, 11 Aug 2025 21:00:28 +0000
Date: Mon, 11 Aug 2025 22:59:29 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1750/1750]
 fs/ext4/.tmp_block_validity.o: warning: objtool: missing symbol for section
 .init.text
Message-ID: <202508112211.dkvzG8yP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a7892155ca524e224cb2da85c85cc1bd4303179d
commit: 026f041867fa55cd19074713fb1756dc5b67e18c [1750/1750] ext4: fix potential use after free in system zone via remount with noblock_validity
config: x86_64-buildonly-randconfig-2004-20250805 (https://download.01.org/0day-ci/archive/20250811/202508112211.dkvzG8yP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250811/202508112211.dkvzG8yP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508112211.dkvzG8yP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ext4/.tmp_block_validity.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
