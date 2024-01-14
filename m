Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A4228F7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jan 2024 16:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jmGWlKQM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705250868; x=1736786868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9QVaePlaYo+kBOFCvPKbGCVyk5v5WpOwsaWxu45aAZI=;
  b=jmGWlKQMu8QKQvcHA1w/FT5J97Ovs07iObu0Wj6anKc7tNqfGS8KQX9F
   s+N+mO9ctBqzcpgjSeiG2R54ppI8PdBYo8LfXzZo4ilE2v7NKNyHcC8PF
   +wYF7FL19dI0h+altBR6DeVH6nKnG/lc4IPt0mo5hsczik2O+DxzSz/Wf
   FKHOWAkYAh9Exzn3WF7AXwGP721wisstYPL5LB+uSGbZOxdmhWqnMCeUa
   EZGyYWFlCpAwnm7kGtIGWH7JAPlfWJM7/+Tqd0SpoYbF/pY91RQ3OjBxM
   zGgpnN+g8cO8NdOQ15S07Z7irvWn8RGZCqNbSwmEpNDc0+eDElnmLQvLB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="463757679"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="463757679"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 08:47:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="31911541"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 14 Jan 2024 08:47:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rP3eC-000Bfy-1o;
	Sun, 14 Jan 2024 16:47:44 +0000
Date: Mon, 15 Jan 2024 00:47:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 26903/30000]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_transform_v.o:
 warning: objtool: dce110_xfmv_set_scaler()+0x19b7: unreachable instruction
Message-ID: <202401150030.lN4q7iI9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   6d9d4951bf741189c66627715d5ae8a8cf1df85f
commit: f2c902d8c653f8021f9761092a27f7b9db42b662 [26903/30000] tracing: Make tracepoint lockdep check actually test something
config: x86_64-randconfig-071-20240114 (https://download.01.org/0day-ci/archive/20240115/202401150030.lN4q7iI9-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240115/202401150030.lN4q7iI9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401150030.lN4q7iI9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_transform_v.o: warning: objtool: dce110_xfmv_set_scaler()+0x19b7: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
