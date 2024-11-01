Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21323398A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 14:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730470365; cv=none; b=CDsIyIT1kJT/rL7rEum798GjQ0gjc8LSDXIeZXdNmvYAatIhCkc1rqSUv2uoZe0kTWiB+bMmH7X2xYa5u0a1HqMOJ8gQFXjEs0uS47YO40JIqH5AoIhhmxZNNInamyIQ/7pEWIEYA4ZpantOOrl1VO7O3viIqphpXkMsxYlqFVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730470365; c=relaxed/simple;
	bh=bgceeZ6a160D4uCQujLLNwNZoWFQUPabog52HuDkgHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aRcsy5fTbrM29SAioqlKQB9JkMA+AA4BUEnFq/UpbjsAQKD1CkggiZarqyAceCZ4IkUjaCWbQJKoRU3Og/h4ElHLgvX+agfZiXUpajLhJo5tycO1ex6SdzZCmJzgcM3oj273qRoiwHHJDL3LNlC9Sf1K3yG+edFyxeS+wbBX4hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ssq1sv7r; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ssq1sv7r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730470363; x=1762006363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bgceeZ6a160D4uCQujLLNwNZoWFQUPabog52HuDkgHM=;
  b=Ssq1sv7r6wU0WTA9h/qXwoeYxJ34fKeb69NHNNKinhfHDtDDpiVpdKza
   oEE/bNnOgLidIprIUkf8/qciE+/AV/wNxer4dw06Zn4LJ1PAvj5D3vQYl
   nLiIy+6BPThZNcHegeL/MjyHarwRU/akdih4DP3ksa2/SvVCzZb2KsZAC
   zcZV1Lz43+ORo6HULzY7OR7hbyggsoW0HQ67PDn9Ho7d0XN2XCH0ZlReV
   EwHQXUwC5e6o8QS3JASkdHyvpdkixQu4R+LUez4c/0bFErR+Wp0CX9iT2
   /czrzWC+VFo4EnTKkNg86T2CSrP73qLgeKYGpllWNCNPww/iZl6ODvgek
   Q==;
X-CSE-ConnectionGUID: 4NW3/WC0RzS0URAPj2vRaA==
X-CSE-MsgGUID: UFYRY0MPQQOMxWrtV2EW3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="41631136"
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; 
   d="scan'208";a="41631136"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 07:12:42 -0700
X-CSE-ConnectionGUID: P4i18JN0SPOITjApW5lxlQ==
X-CSE-MsgGUID: +BArapLrRTi7KQOxC+E4Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; 
   d="scan'208";a="83409567"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Nov 2024 07:12:41 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6sOE-000hcv-33;
	Fri, 01 Nov 2024 14:12:38 +0000
Date: Fri, 1 Nov 2024 22:12:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Pu Lehui <pulehui@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2341/2341] kernel/trace/trace_uprobe.o: warning:
 objtool: __uprobe_perf_func()+0x1e6: unreachable instruction
Message-ID: <202411012238.VsICkiep-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   cc5e1415473b95a8a68887dbb9c459ed50de9f1e
commit: c59687cc7631aea65c88ec0f1162492b8470adf3 [2341/2341] uprobe: avoid out-of-bounds memory access of fetching args
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241101/202411012238.VsICkiep-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411012238.VsICkiep-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411012238.VsICkiep-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/trace_uprobe.o: warning: objtool: __uprobe_perf_func()+0x1e6: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
