Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC681F956
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jul 2024 22:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722120165; cv=none; b=Yr5hS4AlCSbdz5QZU/7tnY4hHuKYolu0O6GIwxHsHEdvT7PPjDXqINoiJ8klEJxZaTOOE+LzoT6a2XwMlw3b/oSTCADtjskaLuVlBtSFfph9m6G45BVH1PvOKOI0Ypi+XF4d3brKdaHPSfXN03/nTLkDpOgzzKWoCO8OXRZVCJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722120165; c=relaxed/simple;
	bh=g1kkN0KSpkejOvMQLUFPJATOIN2Y7cn1eyvc5DFI8rU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EUiQixq7erv90hmns83TkBTmv3Xo7nTzu0GYL8Hr3tlbKWlzsAD0RFK6C8APkNP33lM7rWoYF4yhqUbb9n2fUtMUkSYYnIvoBCArL4I6+9u9YcjjS71GMfTxaa1N/oJDEuqYqHyvk8olAvIzmK80r4FKPqIEHF+PNENjwfDEfkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G0m3ugqE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G0m3ugqE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722120163; x=1753656163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g1kkN0KSpkejOvMQLUFPJATOIN2Y7cn1eyvc5DFI8rU=;
  b=G0m3ugqE1sHN8n1K1XGX9NLBxZ+S2VxZNlD69fALjdHsFdSjfb2FjHIF
   i4okgB2+36rlgmSzxnKcsxgAT7XPQDZj6VDWawFqInrrPp4ftxbQxKrcj
   zl/lGklLZGkI5pIpXv5PDF1JeC3VYKYhbyIEenl0XB+zRD36slCGbbDfz
   B1UvZWbaueYABxgVXLYGwhghbgExd+v7n10j5Qa/6YCr+GSuRPy8PmH80
   h4GKeZzZpEyRceu9747zaAXtiy8QP88NqlaBoG2M9bNS3WX9XQSnR5tTL
   RfcfWZI0p3mUrkQK/4xu7SeM8mWdZhNijrZIebW4BrOUAeFq+J2SaYU4i
   A==;
X-CSE-ConnectionGUID: tVyGxHVwQxGfuqUbaGk+Lw==
X-CSE-MsgGUID: ByahrOEiTJSVN8+phQ2Uew==
X-IronPort-AV: E=McAfee;i="6700,10204,11146"; a="19493290"
X-IronPort-AV: E=Sophos;i="6.09,242,1716274800"; 
   d="scan'208";a="19493290"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2024 15:42:43 -0700
X-CSE-ConnectionGUID: 2FDHh4ZGQFqjrSWbgZWZKw==
X-CSE-MsgGUID: G4jU7pooQuSKpK5+wyUx/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,242,1716274800"; 
   d="scan'208";a="53256570"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 Jul 2024 15:42:41 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXq7b-000qJ9-30;
	Sat, 27 Jul 2024 22:42:39 +0000
Date: Sun, 28 Jul 2024 06:42:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 11551/23376]
 drivers/net/ethernet/hisilicon/hns3/hns3_cae/.tmp_hns3_cae_checksum.o:
 warning: objtool: missing symbol for section .text
Message-ID: <202407280656.dQn0SLk3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   0e54270d90f09583500ef61f20ffb02efafa8031
commit: cbfc331af49be9d450cdf64943af2167aa34e17b [11551/23376] net: hns3: split checksum's kernel cmd from hns3_cae_lib.c
config: x86_64-buildonly-randconfig-005-20240727 (https://download.01.org/0day-ci/archive/20240728/202407280656.dQn0SLk3-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240728/202407280656.dQn0SLk3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407280656.dQn0SLk3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/.tmp_hns3_cae_checksum.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
