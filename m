Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF3726E706
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 21:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766439250; cv=none; b=pypJWL6kLEQJJt4QHzTf17+sMwq19mCWNpdYzuESpuf5+FLITso7wPZekWXYvxXCb7d9ujDWODBGkmh3cQlfP32PY9eLV1c0tXVHrta4ubXIhN5kAnaHeeaP29n7hk3yaMkt3eItsnAY6obf8mH417EcC9Bleu50rcknpRVlbH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766439250; c=relaxed/simple;
	bh=WXkON/fFKe2YWW0Ylcjbaq10phW3KB38purr7WBfq1Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n09Z9460sbVo1Qc2KdL6t9GWQzmlAcJQWeHlyN135nYPsPG+wcjbtFOfnKH47/ykdCAAKNdUIbSjWvMvvwdzIsIkYGG8/9AJbFJCNXSFxPObdT0KlwlOhfPx24QSUKhOk0NH/envQLHrCpI2YY+uQ7l+03furOcD+hbw1wcZ6LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cEnT35k6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cEnT35k6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766439248; x=1797975248;
  h=date:from:to:cc:subject:message-id;
  bh=WXkON/fFKe2YWW0Ylcjbaq10phW3KB38purr7WBfq1Q=;
  b=cEnT35k6ImZZ/SGXHjakBNFG5UqEUaPDQ231kef5Nx96jXNgq18eCnVQ
   ++lCYwomRUqf1BLyfJI4Xi6X76HpHGyn5s/4FVtUgD/Kygdwf+LTQIMYE
   2HjhooJnwHBVqIqJGpHTBevw5ugdpJTnaG7iV9O+hFOE9mFZw1VQzD8ez
   7Kd95AaG85cTdXhlIGcpr2r5pI97F+A9X0/wf8lskjHFVfLpZE4x43k33
   UVr7aqSQFJbJbKBI4GdekrPKmsPhzIlLDLtLKODyFJzdVG5dC/4kzWGjG
   59SZpCEDZx/vjID2Vl3K/WFxIo9ADk6T8zyuoIVz7IfLaGBzoIT15ahkC
   g==;
X-CSE-ConnectionGUID: qQK9zHZ1SfCsx58bnZ0VXw==
X-CSE-MsgGUID: yQ3fMAoLQUeLkxHQGzPpgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79414142"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="79414142"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 13:34:06 -0800
X-CSE-ConnectionGUID: zliEiT8KTc+DFhd1Z5Xt9Q==
X-CSE-MsgGUID: M0jsT7r/QaW0VgFHLOb/IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="199925891"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 22 Dec 2025 13:34:05 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXnXW-00000000193-20br;
	Mon, 22 Dec 2025 21:34:02 +0000
Date: Tue, 23 Dec 2025 05:33:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Jian <liujian56@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3407/3407] kernel/cgroup/cgroup.c:6217:
 warning: Function parameter or member 'f' not described in
 'cgroup_get_from_file'
Message-ID: <202512230521.c3DzuiJA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Yosry,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   1588d318a9e388d05b6cf5e2a63134c8beb6a355
commit: 590ef7039097222551e104343ae4ba74e4ed2f87 [3407/3407] cgroup: add cgroup_v1v2_get_from_[fd/file]()
config: arm64-randconfig-r071-20251212 (https://download.01.org/0day-ci/archive/20251223/202512230521.c3DzuiJA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230521.c3DzuiJA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230521.c3DzuiJA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/cgroup/cgroup.c:6217: warning: Function parameter or member 'f' not described in 'cgroup_get_from_file'
   kernel/cgroup/cgroup.c:6369: warning: Function parameter or member 'kargs' not described in 'cgroup_can_fork'
   kernel/cgroup/cgroup.c:6430: warning: Function parameter or member 'kargs' not described in 'cgroup_post_fork'
>> kernel/cgroup/cgroup.c:6716: warning: Function parameter or member 'fd' not described in 'cgroup_get_from_fd'


vim +6217 kernel/cgroup/cgroup.c

  6211	
  6212	/**
  6213	 * cgroup_get_from_file - same as cgroup_v1v2_get_from_file, but only supports
  6214	 * cgroup2.
  6215	 */
  6216	static struct cgroup *cgroup_get_from_file(struct file *f)
> 6217	{
  6218		struct cgroup *cgrp = cgroup_v1v2_get_from_file(f);
  6219	
  6220		if (IS_ERR(cgrp))
  6221			return ERR_CAST(cgrp);
  6222	
  6223		if (!cgroup_on_dfl(cgrp)) {
  6224			cgroup_put(cgrp);
  6225			return ERR_PTR(-EBADF);
  6226		}
  6227	
  6228		return cgrp;
  6229	}
  6230	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
