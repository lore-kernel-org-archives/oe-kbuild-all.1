Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AE0372
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jan 2024 00:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gpg8ed80"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705191956; x=1736727956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=myyNpup8zShDmA+Jx5s+r1LKVjbhA/xbF84qjFmLpwY=;
  b=gpg8ed80bkkEe7EZIPswClKOaC1i+k2zxAZ3/9PgDvvrZZ0fg/QJXJch
   ivS4Gu+ql9AWiRTsNylbMflkPOEm4UbkGkEFgFBAiR4r8OZpfozB9/tDy
   Xpme+A/xYA6DkN6E5nG3OLfO/UZ9kFZ6JmSYI8cj6U+MnOMFV1Dl8PYMd
   Irho24HOz5Vb08bQKhx3XNPFS/mcTEZHZ+tvBUsHGzhyFKnDeX8mrQ3qJ
   gclNrJtqZATelNqln67OLwW/iU8HBJjwsqy4updeFWZzJOIDPCnKbummm
   DOzk01IAfMsoR9o65aYl+yMumHRKFP+DPgq5udaswyXnj+qC/1CCgKen+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="6774384"
X-IronPort-AV: E=Sophos;i="6.04,193,1695711600"; 
   d="scan'208";a="6774384"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 16:25:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="1030286725"
X-IronPort-AV: E=Sophos;i="6.04,193,1695711600"; 
   d="scan'208";a="1030286725"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 13 Jan 2024 16:25:54 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOoK0-000B2Q-1V;
	Sun, 14 Jan 2024 00:25:52 +0000
Date: Sun, 14 Jan 2024 08:25:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21121/21544]
 drivers/net/ethernet/3snic/sssnic/hw/.tmp_sss_hwdev_link.o: warning:
 objtool: missing symbol for section .text
Message-ID: <202401140822.9Mw6gnHv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1f0983450549eeea71fb9333517330947a779262
commit: a6a7981cbf66d4951425d33cdce6ef39206eba83 [21121/21544] Net: ethernet: Support 3snic 3s9xx network card
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240114/202401140822.9Mw6gnHv-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240114/202401140822.9Mw6gnHv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401140822.9Mw6gnHv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/3snic/sssnic/hw/.tmp_sss_hwdev_link.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
