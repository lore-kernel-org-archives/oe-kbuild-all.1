Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC0722094
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Sep 2024 15:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726931637; cv=none; b=RtJR44sQqLSxnHDBCzzSxox4rd1JQc+L+jvA1fi2fqiOHl7jG7umdiSbK9hKXAsKtNV508oSa6EHbAaATQsn3TIIebP2SqC2zPl/1yvvOOpDmLRJAa+rg808Xjo5/EwAtXSdHXQS9lj8cI7LTCGga7kPMlAUaRk4DulNCJUgF+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726931637; c=relaxed/simple;
	bh=53r1eauXapTjILMWfHuULmVG882CH8EP+54KEIRJ/v8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N+5wQr5h0G6CqAQqABURkVbeNl5vNOaNdxbpCVpaPHuMxIwfNQHgJunJYbhKtpC96u5iU2I+0zZWxF6MGKlQWjYeHidLE2SMgbnivuEM3MregOZYPZo/0M6G2Lta+8RC6CZtEae1kFsdrp5zQ+Ujjf/bqhoqDnkvojwsxEOBUMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UMXvvmy3; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UMXvvmy3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726931635; x=1758467635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=53r1eauXapTjILMWfHuULmVG882CH8EP+54KEIRJ/v8=;
  b=UMXvvmy3OL+oj51nWLOzBc9I/AlyvmnWZNZtyNTgGDrOKckX55MkyEWe
   /oU7PmfC9M0DGkBAoFqNAiRx1cucHAbXEwO0qAhEiOLH3YVmLcqxjXhIT
   xYfKg+LTyDi/JsAg5zJx8lgX8E+GOvO8VpSloY6kIJKDr4/80N0q9RXeo
   5nl0qp7BkkS6rwKqYD3MyuPwGPyHUKwr913vSmUe3DLKGh47ZSAOHqVYX
   7NtCd0Y2ofnzayKc/T5CbNyBmT8ACWYKHAiyqVA3WDGv7VM3AgB+ZkzRs
   lXpw/vWSWyxsF3y3+dG3EwvzISoO01Y4duEXetgyshS3lubiAI7ulkuV0
   Q==;
X-CSE-ConnectionGUID: rGi0X/a+TiqIgLIy4F5iLA==
X-CSE-MsgGUID: QCbpTEoVQpGfSevipIrwtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="29822883"
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="29822883"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 08:13:54 -0700
X-CSE-ConnectionGUID: 0+/gFYCcRnmSzs2ggs918g==
X-CSE-MsgGUID: 5DVKqrsuS5+TJvsP33ClwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="70605740"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 Sep 2024 08:13:52 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ss1nx-000FWd-38;
	Sat, 21 Sep 2024 15:13:49 +0000
Date: Sat, 21 Sep 2024 23:13:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 12075/23728]
 drivers/clk/renesas/rcar-gen3-cpg.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202409212339.uW6OSjiT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3bbb0f885bf0f93bee0bb99c623877588ae005ee
commit: 91f5f1778fb3bc7ad3ad50a2256737c90da215b6 [12075/23728] clk: renesas: rcar-gen3: Set state when registering SD clocks
config: x86_64-buildonly-randconfig-002-20240911 (https://download.01.org/0day-ci/archive/20240921/202409212339.uW6OSjiT-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240921/202409212339.uW6OSjiT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409212339.uW6OSjiT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/renesas/rcar-gen3-cpg.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
