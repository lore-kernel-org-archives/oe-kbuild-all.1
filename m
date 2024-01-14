Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2A17E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jan 2024 00:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OjjsD5C0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705191956; x=1736727956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qkZWuU1hqBOuIMN5PVXxOOEu7oo/q7fh3bz9ASroDBU=;
  b=OjjsD5C0yBqVUlCxjSSSFMsq7ztsoW/6hXWFwXrPpnvmh7Z+dk1eA1tH
   sr3Ig09G8Zg5SyCvchWCC+N/kvEsjOi3VGGShO5NfaZ5NDJ12h6x/4zbo
   CFFVRxIB7vUnmNQzt17JrjOVCUpin+hJPHflFtu1gPlf/m5FozMsLxXhA
   +RkHj+6iQzCpskWF8d38j5ZhRMbsocYEfEPuns2tIHhrS/61p9MgeMZVw
   7Qj7hl6o+McaovtR6edXrKgPchXx2hcZoMP1v8fn3TsSYqJRUj4CixWT1
   phBZt/EmJxZ/nl2cniJAmiw+2YUa+/lmnmGdK+6ldy/ojDf3+ovUwvI8t
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="6134340"
X-IronPort-AV: E=Sophos;i="6.04,193,1695711600"; 
   d="scan'208";a="6134340"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 16:25:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="786738054"
X-IronPort-AV: E=Sophos;i="6.04,193,1695711600"; 
   d="scan'208";a="786738054"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 13 Jan 2024 16:25:54 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOoK0-000B2O-1L;
	Sun, 14 Jan 2024 00:25:52 +0000
Date: Sun, 14 Jan 2024 08:25:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 13475/21544]
 net/can/j1939/address-claim.o: warning: objtool: missing symbol for section
 .text
Message-ID: <202401140838.0oiMLbww-lkp@intel.com>
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
commit: e0c2ee9edcacfdda0e806166eaec1310cdf9e324 [13475/21544] can: add support of SAE J1939 protocol
config: x86_64-buildonly-randconfig-004-20240112 (https://download.01.org/0day-ci/archive/20240114/202401140838.0oiMLbww-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240114/202401140838.0oiMLbww-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401140838.0oiMLbww-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/can/j1939/address-claim.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
