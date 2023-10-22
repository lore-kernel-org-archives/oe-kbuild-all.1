Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B2D3217
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 11:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L6GkJxVo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697974075; x=1729510075;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RYgHBon4H0gr1M6JQZuuEnhucH2VpFtJ2AGj0IW+QBE=;
  b=L6GkJxVowu3ElKP0J1nb2N2xZQDNUvMU/s1b8fyBfZjEpDKQ2llaTHaQ
   dyiL4+q2AgCajJN5b7rUD8iMmTsnq2vgarUF2w2oJ40uejF036or190U8
   4e1VL0aEsN+hH5I938nYu0s5PTVLOQK2ZK1bSnypgrZIv80mOMSvSvmdt
   Tdgnxa0u/22KrHUodRAc3MPvdt7kkZMac6G5ILpGkADLoMc+Nfgluwov8
   JZ8e4joPzALwRk0lbi93AXb57pL71qerpQGh+DLxX6PEjk1Qx3p5aTLCn
   wXrypEXUu5ujcS6PtHh2tAYjpSFqdmcVRRgP3hmMElXBmofGTzyPpRphl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="417827856"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="417827856"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 04:27:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="707658948"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="707658948"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Oct 2023 04:27:53 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quWcZ-0005uk-1U;
	Sun, 22 Oct 2023 11:27:51 +0000
Date: Sun, 22 Oct 2023 19:27:21 +0800
From: kernel test robot <lkp@intel.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 bpf-next] selftests/bpf: Fix selftests broken by
 mitigations=off
Message-ID: <202310221930.0qlXBYfn-lkp@intel.com>
References: <20231022094906.3003-1-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231022094906.3003-1-laoar.shao@gmail.com>

Hi Yafang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/selftests-bpf-Fix-selftests-broken-by-mitigations-off/20231022-175022
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20231022094906.3003-1-laoar.shao%40gmail.com
patch subject: [PATCH v2 bpf-next] selftests/bpf: Fix selftests broken by mitigations=off
reproduce: (https://download.01.org/0day-ci/archive/20231022/202310221930.0qlXBYfn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310221930.0qlXBYfn-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:QUOTED_WHITESPACE_BEFORE_NEWLINE: unnecessary whitespace before a quoted newline
#89: FILE: tools/testing/selftests/bpf/unpriv_helpers.c:30:
+	for (c = strtok(cmdline, " \n"); c; c = strtok(NULL, " \n")) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
