Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46EF1E2300
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 21:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729720581; cv=none; b=eGMUT7z0EpcqWrQsYARKUZeBs5vYNIDfDLlC7XlNiORzAv6t1AzyxgRqIU3q/zImopP0DrbCeJkqT5yReeFMeZRKi7IwM161YHLqx9SdAA5rTO70nRxQYAMT1yrGm0hUOvx8ImmHPFSKq8nVuiwfGgXxRFyXbEI33qb7lsHGKAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729720581; c=relaxed/simple;
	bh=1uQm3znuxBIfKDOJq9gXbOJ+S6bjyEOnMDwSNKtxB4k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=USr0WGC8GNfUvXsE7OII4+UOB2Ppa5HLSNGFXD9Y6CBUDxLJGokGPy3iS10IgvC6uPFEYN0bWYNkRlVYiqPc1lkm1tWHYml/lwD7lX552GWuFgAdZ75UC7dWT5mCG2t17LWnDny5B3K+Bdan1G1pzY1MaronP3K4JXu8EOq1TMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DbpKxf3i; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DbpKxf3i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729720580; x=1761256580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1uQm3znuxBIfKDOJq9gXbOJ+S6bjyEOnMDwSNKtxB4k=;
  b=DbpKxf3iDigOIsMv2cMO5FGSPNIR2kAsAKZ606R2blHnOE4HFZlc8aYo
   VMBL14MPJeR8rVuhOytKlHppte77xf4W7WA3zxuHahRjqFi21lJ9XSCz9
   6hazkGWZjR0z7wBDPgl/z/L0WZOrrdik/HfBlshBhi0NIqEGx6Rc52Fyx
   J/bTUhfCv/xyxuQE4lSNjyWFWh116GbObR7q18rTmUHdnGxWncQxTSs+B
   rII7mnCC5oHpK4N6o/r1unBXWmZJn1G6YyrVnfSj7WPFSv/FEN/jnYJxR
   9kFmLyFQc98h7KIdVd3fsDVUKGEysxrltj/rT3PXE6TFhVrGULyASg9Xf
   w==;
X-CSE-ConnectionGUID: XmCxDcpuQp6i+VuajY7OsA==
X-CSE-MsgGUID: 8ed9s1UFQESJNjPbVlgEUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29195735"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29195735"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 14:56:20 -0700
X-CSE-ConnectionGUID: XaJhQwd7Ri+HATYUhCQtGA==
X-CSE-MsgGUID: lGjqKjcLQv2ajPthEUeZew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="80707604"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Oct 2024 14:56:18 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3jKx-000VcR-2O;
	Wed, 23 Oct 2024 21:56:15 +0000
Date: Thu, 24 Oct 2024 05:55:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3122/30000] ld.lld: error: undefined symbol:
 latency_fsnotify
Message-ID: <202410240554.7ps8GwXm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   cee28fc9d2d62b27256317f08a526aba907e51db
commit: d11dbe8b4e8ad4c5bd90147912352ef6f13a2bb6 [3122/30000] trace: Add osnoise tracer
config: x86_64-randconfig-161-20241023 (https://download.01.org/0day-ci/archive/20241024/202410240554.7ps8GwXm-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410240554.7ps8GwXm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410240554.7ps8GwXm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: latency_fsnotify
   >>> referenced by trace_osnoise.c:933 (kernel/trace/trace_osnoise.c:933)
   >>>               trace/trace_osnoise.o:(run_osnoise) in archive kernel/built-in.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
