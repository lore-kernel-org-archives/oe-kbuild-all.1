Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2651F3A6B6E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Mar 2026 15:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773157605; cv=none; b=OtgWf6Rb7gNEXGQDjERotc+XoNg9/evsFyw78m42Ey20KEKYBMMiTQ2CsA9DgVVsbOFcUehVmHpfpgcmfde1020h1l5vc4aPwI+Dqnt6C6JB/sYNfit6/cgGD9rVTVAHDjGYg9KDlBE+Nh47yh85mo76qayE4S92c3vHYJNTv/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773157605; c=relaxed/simple;
	bh=IwgOgxKT7eEBb1xtxtLOsJzZnoDg9XOvrMY65HW0358=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dZCidTVOP7i/7wFP3sfrLFin28LdyULJxIbS/m3IuS9VUXWyUIBTEW8C71iaRYp5XvUHZ+li4p6uRg6Cu/Ul/kHLGldAEPpc1zg5jRuKvDS+e3GypqPBV4ReGejHYyx1ftGKVD6xegQiXmoJBFd1j167ThfupAaymwH+s+JBFFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ih+kb0me; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ih+kb0me"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773157604; x=1804693604;
  h=date:from:to:cc:subject:message-id;
  bh=IwgOgxKT7eEBb1xtxtLOsJzZnoDg9XOvrMY65HW0358=;
  b=Ih+kb0mepeWQDX+WjHjPM6g16K7CLdIS2PQvbqKG+j2QZB/uKzySSpQH
   fnZjNij2cZvTVeRiRLzNrRz7cmzUJLhi/360CftKxqtosKKNE3FQcZ/Yw
   U9/XUfAhhkzfn3qVQU2icvcGHbtYL/rrsLlm27FIW7FpmrXlXkEVN9n2G
   FdRBWKmbZPBnKpsiuuNlyLtyHBGVORaAfjJa1PEzn1hKCrldSpo5ZxHlP
   0liiEGIzdEtvnLJG/80yjwDrE2HYG82qQqQBzYXWwf/vCKAPnbuGfiWWk
   sVAIW4VMFO6FTnO5W5Flk95RW1KiEkeyjTd+mCMMCYmXh/wYjZagW3WMT
   w==;
X-CSE-ConnectionGUID: o/zW5hpOS0KvDk0SdLcQbA==
X-CSE-MsgGUID: MKKteeSQS0iYuQdtYB/y1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74180185"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="74180185"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 08:46:44 -0700
X-CSE-ConnectionGUID: 8JxtbqvTRqSVeiGmpGZQAQ==
X-CSE-MsgGUID: 2VKbqa3HSPa4+gwNxXxXhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="225104203"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 10 Mar 2026 08:46:42 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzzI7-0000000036P-40LP;
	Tue, 10 Mar 2026 15:46:39 +0000
Date: Tue, 10 Mar 2026 16:46:35 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 116/116]
 tools/testing/selftests/../../../tools/include/asm-generic/bitsperlong.h:14:2:
 error: #error Inconsistent word size. Check asm/bitsperlong.h
Message-ID: <202603101635.nh4CvGNB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   4326a928dd60688b2286fb031f879fe535fa3449
commit: c8def8cde13bfb58e4ac663dfa27713cba54c60e [116/116] tools bitmap: Add missing asm-generic/bitsperlong.h include
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260310/202603101635.nh4CvGNB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260310/202603101635.nh4CvGNB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603101635.nh4CvGNB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from tools/testing/selftests/../../../tools/include/linux/bitmap.h:6,
                    from lib/x86_64/perf_test_util.c:9:
>> tools/testing/selftests/../../../tools/include/asm-generic/bitsperlong.h:14:2: error: #error Inconsistent word size. Check asm/bitsperlong.h
      14 | #error Inconsistent word size. Check asm/bitsperlong.h
         |  ^~~~~


vim +14 tools/testing/selftests/../../../tools/include/asm-generic/bitsperlong.h

bb9707077b4ee5 Arnaldo Carvalho de Melo 2016-07-12  12  
2a00f026a15d16 Arnaldo Carvalho de Melo 2016-07-13  13  #if BITS_PER_LONG != __BITS_PER_LONG
bb9707077b4ee5 Arnaldo Carvalho de Melo 2016-07-12 @14  #error Inconsistent word size. Check asm/bitsperlong.h
bb9707077b4ee5 Arnaldo Carvalho de Melo 2016-07-12  15  #endif
bb9707077b4ee5 Arnaldo Carvalho de Melo 2016-07-12  16  

:::::: The code at line 14 was first introduced by commit
:::::: bb9707077b4ee5f77bc9939b057ff8a0d410296f tools: Copy the bitsperlong.h files from the kernel

:::::: TO: Arnaldo Carvalho de Melo <acme@redhat.com>
:::::: CC: Arnaldo Carvalho de Melo <acme@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
