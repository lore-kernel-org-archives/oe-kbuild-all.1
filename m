Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC9D486432
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 13:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790948915; cv=none; b=F3B1xOmrBaM76RACFpHGvmtUcgRTxIS54RPLhBTnPpFBCINzuq7ZKLlh/9NjLQXOLZzMV8+RNES6uq5la30IAG3u/ZHRkQxZtX/pv3ZdsU4FHXVO7zdWRBtapnqGvTQuUGqwshSYtJkmKiqkyqUoUl7ikB8SCq1ZAC48NUl+V94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790948915; c=relaxed/simple;
	bh=Zon9UpDcKai/H/FiyAWCF7Fd96ZqOhn0kQmIA5Yuk1E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NIfaTcyfiQXg8HUxgTfpIDSL2YvOMpN5KvmkpHdAKYM6Ka/f+3REsQo64glcIRxWfiOT8KPQUVjgKtZ0O84rD4ZKWAuNb1RIqISPbHFuh62jP24NqFXArfFTU/GgxP41TmKho2w1RoxwZXUOY8RK07mF3rHzvHCDttiNv4foO0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mtDY7IdX; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mtDY7IdX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790948911; x=1822484911;
  h=date:from:to:cc:subject:message-id;
  bh=Zon9UpDcKai/H/FiyAWCF7Fd96ZqOhn0kQmIA5Yuk1E=;
  b=mtDY7IdXuz4lvjOKtYGcEhs8SJYpvOUB+2wjxDVIGCELXmcST8ZrsM3v
   mRJl9l2spSHzBxlZUjhMa+PJdvhQ8sLAPZeqAgPsYQ8/CXnQUoSvRQY7o
   mGPWFxNbx6Wijj3qJ2ulOkm7ITLLvqQ959XNfWinWRGMgJ+Rqy+lhp87I
   VNemt0P9gT/OJPv8C7gGZp9snV05F3Fzpr1OYNpmKihnSAvXsCJDFqpy0
   R5nuhzqCDBTw27Es3crL8InQ6w8fFQyJmL3HgwNYsEoPsb1GCghvw4xjs
   n8c8tXZz7AXVP88L3UswluQeEhEqwBBtDWRhm77wLzNWcoW/0ruRa7jxt
   g==;
X-CSE-ConnectionGUID: h6YBZ9btQ9+8FiawQx981w==
X-CSE-MsgGUID: cRQic8g8QXeG/oFk/OxfOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="103086433"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="103086433"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 06:48:29 -0700
X-CSE-ConnectionGUID: GRNjA3zaR2KSklDq380STw==
X-CSE-MsgGUID: /vpCHI14QwWUCaAiBMemBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="279529310"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 02 Oct 2026 06:48:27 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCdcf-000000000Yh-1b18;
	Fri, 02 Oct 2026 13:48:25 +0000
Date: Fri, 02 Oct 2026 15:47:26 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:fermata 40/49] kernel/bpf/blk.c:127:17: sparse:
 sparse: symbol 'bpf_blk_close' was not declared. Should it be static?
Message-ID: <202610021546.Gfji4DAs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux fermata
head:   babde5051be3840becf5a78de91a0b68a99f0e49
commit: be75423b67d512b1abdea0cc7cbef17ffd7e8040 [40/49] bpf: Add block device reads that complete into a coroutine
config: um-randconfig-r2307-20261001 (https://download.01.org/0day-ci/archive/20261002/202610021546.Gfji4DAs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021546.Gfji4DAs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610021546.Gfji4DAs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/bpf/blk.c:127:17: sparse: sparse: symbol 'bpf_blk_close' was not declared. Should it be static?

vim +/bpf_blk_close +127 kernel/bpf/blk.c

   119	
   120	/**
   121	 * bpf_blk_close - close a device opened with bpf_blk_open()
   122	 * @major: device major number
   123	 * @minor: device minor number
   124	 *
   125	 * Reads in flight complete; reads submitted after this fail with -ENODEV.
   126	 */
 > 127	__bpf_kfunc int bpf_blk_close(u32 major, u32 minor)
   128	{
   129		struct bpf_blk_dev *d;
   130	
   131		mutex_lock(&bpf_blk_mutex);
   132		d = xa_erase(&bpf_blk_devs, MKDEV(major, minor));
   133		mutex_unlock(&bpf_blk_mutex);
   134		if (!d)
   135			return -ENODEV;
   136		call_rcu(&d->rcu, bpf_blk_dev_free);
   137		pr_info("bpf_blk: close %u:%u: %lld reads submitted, %lld completed, %lld frames resumed\n",
   138			major, minor, (long long)atomic64_read(&bpf_blk_submitted),
   139			(long long)atomic64_read(&bpf_blk_completed),
   140			(long long)atomic64_read(&bpf_blk_resumed));
   141		return 0;
   142	}
   143	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
