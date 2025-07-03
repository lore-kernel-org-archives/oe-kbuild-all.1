Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B70922A4F8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 15:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751557357; cv=none; b=JyJ081SktT3dwcnzAlXvLjn6sLPl31saJSJMZRJzocp0tosEmpIBDDoaYPiiuHX82mnapwodzSFFEIdoxh/auUn/09OLGDFvjg0Rvx/7x+6Jsv/eFl5zG+CRpxLun3CzfdaoZDtSKIYtpB9ASxdrk/jSUg8T9gqTQeALLkBu/ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751557357; c=relaxed/simple;
	bh=+hpc04d6W5eynQgdrgX9YGRfob5jVETNM4gcgjJwA+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kSgwakZ6ygNgLXIak4tyh69WMcIPyp9o6fHi21ivnLGRCKizcxdCJPf+9mO9hQGzB2Pl3kQAMUD4xFR4qVMRPUDeAUNf5xLX9zYrd98h03Nq4VRSNrMFTZp9R+hMP1LOhu4y+zlJjy/XbautWFHTUx2mczi47B3d8DnPsUqsKbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AyFmNcj4; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AyFmNcj4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751557355; x=1783093355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+hpc04d6W5eynQgdrgX9YGRfob5jVETNM4gcgjJwA+U=;
  b=AyFmNcj4FQLoc0eknA7BVsESfRiV6tpHuGmTifrGVRTXqC2eJPrOXXpK
   iuZnfBkf/0twpnq9cEKQxq0nA2YKdxGH1hDqs6eLtLzmDdXHLhAm3sKEN
   yRsyB6SBn+EQ9OsSbHiHJRP/Wqz+oJ5xcd0bdfG/oTcrrAMTtXHGehfj1
   5m/hJMQ+UCRs8Iy1WdGQHolWmWOasvf3/6+0RIaQppXjkzZvc8UJzIZ6U
   EfP5sox9Z3KZpQUooiOLiVwTTg5QIw2i3Vp90cNLKQKcle/59kEGEMYte
   iHD17eCwHmkhIThtgPvw9Oe9HszSlR6T/P0XC4HhoD+mfDKpFl801vIE0
   Q==;
X-CSE-ConnectionGUID: 1GPrzaLeR+yhTEFHMjAMlA==
X-CSE-MsgGUID: yzdOJiNLQkiSVpDDtFSz9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53984628"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="53984628"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 08:42:34 -0700
X-CSE-ConnectionGUID: 8ws56mIhRDGSp9WGafT2uQ==
X-CSE-MsgGUID: AUsMIx5gRKyC8mM/bprMog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="185348531"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 03 Jul 2025 08:42:33 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXM51-0000Ub-0g;
	Thu, 03 Jul 2025 15:42:31 +0000
Date: Thu, 3 Jul 2025 17:41:36 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Tengda Wu <wutengda2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1605/1605] kernel/trace/trace_output.o:
 warning: objtool: missing symbol for section .init.text
Message-ID: <202507031719.pl3k7B4C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Steven,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5536700e483b14a193ce40d6be90b95fb2d7532e
commit: 31bf327231bb582ec7dca0490cc90c364b36e095 [1605/1605] tracing: Make sure trace_printk() can output as soon as it can be used
config: x86_64-buildonly-randconfig-2004-20250501 (https://download.01.org/0day-ci/archive/20250703/202507031719.pl3k7B4C-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507031719.pl3k7B4C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507031719.pl3k7B4C-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/trace_output.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
