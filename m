Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81611378D7F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 21:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782164809; cv=none; b=L4WeVttwqApEwDek8x7l9W/Nu6/SJ5Rsuw5KIFStpSo8gdAgXT73gHP7ZVPZmFRy63ou0I7xiahFsvTV8OSqo5DGYjxv79LV4blaWWs8pxZPSyWBS9J3QvIFUv530slvpxMvZlqLwRBs6mioDvpFQY3HD1rTzeHZQonUZQuLodM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782164809; c=relaxed/simple;
	bh=ENal9hZ9x7KKHIOW4YhJsLzkQeGTGM/EdyRBPZQrXGo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iWGYHpATrPmS9+s6edjBpHLo+s+Vi1vDXiL2SLxk74dJlR5hmbhzjhaXQ5OWFQKQxmqe3bu+/3rHIom6JZ77QEAG3AlDbmHfma3iHTQwzY0Zo+O0FQR4UxhjyLK46x9BJvX6jn5Vl3O7zdW5OsB5XXseyf8Tyvoa96afGX7s1pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WAzG+QdU; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WAzG+QdU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782164807; x=1813700807;
  h=date:from:to:cc:subject:message-id;
  bh=ENal9hZ9x7KKHIOW4YhJsLzkQeGTGM/EdyRBPZQrXGo=;
  b=WAzG+QdUksKCOaI11MVC+Mzy54VvivXpbEjeW+opOwuSncvCtDBV0kjp
   LJCLsBh2l+oxHpCIxw7rYYKucCnQX3cbhACNnUwFhEpaZn4dXxzKxKfU3
   jz/D8z3g6CbwGlNwqqLV5ajP3GCxpMkU7JPDQWtoYioETRNJlCo3dEHXt
   nJGGZLWoCWl7ZtdPc/O8L96c66ie3rgzg0m3gfToGIX+CY3ElaZAdMZEl
   CDSGpLmRQfUQcYmPB9soDSrYOlNn1Im3V/xp7k1GZvN6ieZ9jHaSGjEwQ
   hJKkgjnku0DLnwwpTPFCIhDS27bOaYqhybccvMGEsK566jycxcYcOjWB/
   g==;
X-CSE-ConnectionGUID: yVb9QnrOTYivLshNLvWN/Q==
X-CSE-MsgGUID: Hgq8NWj6QTGAwOR7gN/KKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="86593312"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="86593312"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 14:46:46 -0700
X-CSE-ConnectionGUID: C7lSs4WvQc2lY26kysBnPg==
X-CSE-MsgGUID: mx7b1j5YSyCa2fl5CLrVGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="246995761"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 22 Jun 2026 14:46:44 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbmTZ-000000001yd-3SRT;
	Mon, 22 Jun 2026 21:46:41 +0000
Date: Tue, 23 Jun 2026 05:46:29 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Paul E. McKenney" <paulmck@kernel.org>
Subject: hppa-linux-ld: fs/xfs/xfs_trace.o(.text+0x3ffa0): cannot
 reach 00002a33_ftrace_likely_update+0, recompile with -ffunction-sections
Message-ID: <202606230559.AQD8epwY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4708cac0e22cfd217f48f7cec3c35e5922efcccd
commit: a46023d5616ed3ed781e56ca93400eb9490e3646 tracing: Guard __DECLARE_TRACE() use of __DO_TRACE_CALL() with SRCU-fast
date:   5 months ago
config: parisc-randconfig-r122-20260622 (https://download.01.org/0day-ci/archive/20260623/202606230559.AQD8epwY-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230559.AQD8epwY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a46023d5616e ("tracing: Guard __DECLARE_TRACE() use of __DO_TRACE_CALL() with SRCU-fast")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230559.AQD8epwY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> hppa-linux-ld: fs/xfs/xfs_trace.o(.text+0x3ffa0): cannot reach 00002a33_ftrace_likely_update+0, recompile with -ffunction-sections
>> hppa-linux-ld: fs/xfs/xfs_trace.o(.text+0x3ffa0): cannot handle R_PARISC_PCREL17F for ftrace_likely_update
   hppa-linux-ld: final link failed: bad value

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
