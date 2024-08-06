Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12C48F6C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Aug 2024 15:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722957367; cv=none; b=rFehCXLZxmT4CWYCFnGlVyKkw3gQ3kTwbtHYdctgjMqInEcXQQJ/I8mSv0ILwBcvqA1lnZIsv1GUM8Lc4OAdCkN++1CyQRsWgWqaOrgeQn4DyclCw8hSXKhzwF4Lx3q98QgzgD38I4oZPL4qpBJU5spVjhxdAW2tV9eMe1J9UaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722957367; c=relaxed/simple;
	bh=O4essSMG0v4YBgjiEy09sg0lK3m52nq0V70QUe4ti8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cC5pPXENxziBfXPMI3vwA/rhE9ey6Naql0FTv/psDetPRZPb1PreQoolhHwVGos7RsOPkOXIvfx/eIDhxcIESY+BInRAllWKXqK4EeR3ceZWf1LmwMUeedwew8ayPL+PJpJdre1Z1K8U0EPYkdGGZQEiY7HAIUeSaCGp5WVg6cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VQTCb1Cy; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VQTCb1Cy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722957365; x=1754493365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O4essSMG0v4YBgjiEy09sg0lK3m52nq0V70QUe4ti8Y=;
  b=VQTCb1Cyb06t5MWSfasTRJdVqyqTJ5RUOkYOWNj8E7aSE5iiUn8LgvGd
   r7n5k38kL7YzCj7HSMk/1at3IObqYAb+aaznTKhEWA8Sv3KweWRybwwsY
   wvFIWHpZSws0RQNJF0ZWB2PvtYvopIepM9rXFvgPLLcAFJGf8cI201ORW
   LS+m1gYIZWBVjEaGjsH16GQmzczE0ei5EnFqtB4LlFDCmPc85ZiVD1Eat
   WY4O1t/M8rHAh9WElpdyK32naTaPcuip3NWJVCscnW6DXUVUNv9Clk/zC
   pCUc7VXMZyssKJSf9ohZjivyMcBpHkmQo2ecuCMZCJyT7UDQ8T3WQtQqH
   Q==;
X-CSE-ConnectionGUID: uLN8vWv6QECtN3jyxCiOMg==
X-CSE-MsgGUID: BQVFQWdATSOB5Hsok5yPqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="21132789"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="21132789"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 08:16:05 -0700
X-CSE-ConnectionGUID: MEzuBspwQWq6a5VI07hi2A==
X-CSE-MsgGUID: mWkuTCGoRiW0JPxGLGWspQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="56515867"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 06 Aug 2024 08:16:04 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbLur-0004bQ-3A;
	Tue, 06 Aug 2024 15:16:01 +0000
Date: Tue, 6 Aug 2024 23:15:16 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 11568/23451]
 drivers/net/ethernet/hisilicon/hns3/hns3_cae/.tmp_hns3_cae_led.o: warning:
 objtool: missing symbol for section .text
Message-ID: <202408062209.71Gj0prX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b99509998bfe488900920c783664b4b4a70795da
commit: eb3a8c90a2b27a2f2dbe26e8a2e7edff6b61417c [11568/23451] net: HNS3: Increase the dft for the command of led
config: x86_64-buildonly-randconfig-005-20240727 (https://download.01.org/0day-ci/archive/20240806/202408062209.71Gj0prX-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408062209.71Gj0prX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408062209.71Gj0prX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/.tmp_hns3_cae_led.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
