Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993B615E97
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Mar 2024 05:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709702714; cv=none; b=EV8xXKUbGSInbu8YLs5gG25WiTHhYzBY6NEAOHuUP1JrOHnYtX+fzftugIXuaSGAonLSas71eQBQEKENOVb/QkaUHfSHmUKE4SC/Tl3BjPpJb4LsjZXmHLtwMwNhT7S7DhmXUtGFjHrWVuECJiZaaYFfLLP+/8R6C8quUMN7QQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709702714; c=relaxed/simple;
	bh=0Sj/4cAspNJUJdXgLlxX7X+02T+pI7jm1PpZNVj2Urg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oqEjUnM2JOwMIlRtpgWDDO2H2ZQMfIpsr05N8W93te7yRCnh0hnBtniE8CvCLRWXwq8QxbDDEUjWk5VzzEgA13Lp1L+hQWnGIsGkmPewVCFfqjtXaAmkF2RPPDZQn9ro0CjzxpcLksgNZsXNsPLwafTRfz7QYWdEtw3xlTxbSw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g25tWM39; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g25tWM39"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709702712; x=1741238712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Sj/4cAspNJUJdXgLlxX7X+02T+pI7jm1PpZNVj2Urg=;
  b=g25tWM39DF9DjoYq5mJAE4CzLm8ZQLtCvSCTmA2dabi/es/9s/5+AmMl
   rhfkmJOOcxuLzYeQEbmlESuPOmyIgzStHg4ZvbnNgK+POU179vaG8tIqm
   PjGXOSKucwGs65qrpwTsEW8bSWQyBuZP7RykUmRruTDSmayIEyS4EVABV
   XD2hqmbu+T1ds996MDElovMMsvW1t/KKv+WPwLQg9/Zxowj1WFlTs1WEv
   sCPTCPkLee5yTrvp+NyHxJTHf9+LevPwXtXTet4GcFGJXs+cVFXgI+AoW
   kiHSp89YmGMUq5KoBKX4TQSgYwP3T/GxVSEz4YkirDgSPBQt/lSiycX7v
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="21750685"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="21750685"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 21:25:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="40516619"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Mar 2024 21:25:11 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhjm8-0003wz-1E;
	Wed, 06 Mar 2024 05:25:08 +0000
Date: Wed, 6 Mar 2024 13:24:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kui-Feng Lee <thinker.li@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Martin KaFai Lau <martin.lau@kernel.org>
Subject: [linux-next:master 8264/11963] ERROR: modpost: "__fentry__"
 [tools/testing/selftests/bpf/bpf_test_no_cfi/bpf_test_no_cfi.ko] undefined!
Message-ID: <202403061307.f7nX2Ma5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kui-Feng,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   11afac187274a6177a7ac82997f8691c0f469e41
commit: e9bbda13a7b876451285ab15fb600b809e5e2290 [8264/11963] selftests/bpf: Test case for lacking CFI stub functions.
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403061307.f7nX2Ma5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403061307.f7nX2Ma5-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: Module.symvers is missing.
Modules may not have dependencies or modversions.
You may get many unresolved symbol errors.
You can set KBUILD_MODPOST_WARN=1 to turn errors into warning
if you want to proceed at your own risk.
>> ERROR: modpost: "__fentry__" [tools/testing/selftests/bpf/bpf_test_no_cfi/bpf_test_no_cfi.ko] undefined!
>> ERROR: modpost: "__register_bpf_struct_ops" [tools/testing/selftests/bpf/bpf_test_no_cfi/bpf_test_no_cfi.ko] undefined!
>> ERROR: modpost: "module_layout" [tools/testing/selftests/bpf/bpf_test_no_cfi/bpf_test_no_cfi.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
