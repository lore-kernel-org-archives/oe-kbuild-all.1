Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987AE33ADAE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 23:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769644197; cv=none; b=VBpwPo2eBWqhlWQCGym4StFr4/3taUhv04jh2GU4A/mjj5ayNCZzxokk9DvjJetJXxNzvywsML4eSr5av4J3lBnl1JdWqzOYe6rTxvlLyuDBVh3hvinL3enkLP/j1R6sNyKoZWQjmKHOM60HJ0nnfw+Nu5hWJP5VXXSd6Vhtrwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769644197; c=relaxed/simple;
	bh=uI3RDr7HqUZjxLfQKmdKrlNh8La0nTbxIAzpjwhvhL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GvPGTFnXZIjK32gIZ60BNatH8qK7d8Pgi6E7ObMLykDkudHhs/aiIueV47g9VgCmyrgKDHL3GWINjLzqMbDJZg8aFIOoP0ySpYbQxactUjFVUnibrmzBbqqoMnma273/Fd/4zNCYJRISTto7Pur98n+CvRVnCoKyaATWiR3pceg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L+M0cReD; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L+M0cReD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769644196; x=1801180196;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uI3RDr7HqUZjxLfQKmdKrlNh8La0nTbxIAzpjwhvhL0=;
  b=L+M0cReDyWpe8Y4irkASpa744AvxO65phHypLOTHYBXQ3GRuQLRuM/0a
   lEvYREicZYZwuM4jVW4ji2aO1Q6ENCWgji2WzrGON49v2oovhuhmtXZ2r
   s9JgI81eGoXXQc+2eiNFXNe1HJbkpyYlGAPshrFZgNN/+jR47o/kP6FrN
   FIM9jn8NJ3Z1womb7Wt0ESZDc8Xj/2Wry1QRSBaxj3U7rF4WYDqbS3BLd
   LNYMhHtcvWa2TWsK4rB9fhV6tcwDGLIz8bmMkOTA31YpP70r8qsv6kwfP
   /pcjZTx2q6Sk9uH8pMkIuTsUd0JF906TZ87jcygAkApOtfRNLvqmjU5zO
   Q==;
X-CSE-ConnectionGUID: bb4iMtTvQpaSWoTBlvJpDg==
X-CSE-MsgGUID: UhlIFFXaTqqLSZhLtOWgJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70766510"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="70766510"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 15:49:55 -0800
X-CSE-ConnectionGUID: wWr+rVRHRnCwxh2cpWOBcw==
X-CSE-MsgGUID: +lVlpeSaQQ2nnHHivX0AoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208299916"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 28 Jan 2026 15:49:51 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlFIB-00000000289-3eBH;
	Wed, 28 Jan 2026 23:49:47 +0000
Date: Thu, 29 Jan 2026 00:49:12 +0100
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH 3/5] selftests: kselftest: Add ksft_reset_state()
Message-ID: <202601290039.37LnFCGx-lkp@intel.com>
References: <20260128-kselftest-harness-v1-3-cb259fa81cd0@linutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-kselftest-harness-v1-3-cb259fa81cd0@linutronix.de>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6d6ad32e22f028c525d5df471c5522616e645a6b]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Wei-schuh/selftests-kselftest-Treat-xpass-as-successful-result/20260128-182856
base:   6d6ad32e22f028c525d5df471c5522616e645a6b
patch link:    https://lore.kernel.org/r/20260128-kselftest-harness-v1-3-cb259fa81cd0%40linutronix.de
patch subject: [PATCH 3/5] selftests: kselftest: Add ksft_reset_state()
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260129/202601290039.37LnFCGx-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601290039.37LnFCGx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601290039.37LnFCGx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from ovpn-cli.c:35:
>> tools/testing/selftests/../../../tools/testing/selftests/kselftest.h:488:2: warning: extra ';' outside of a function [-Wextra-semi]
     488 | };
         |  ^
   1 warning generated.


vim +488 tools/testing/selftests/../../../tools/testing/selftests/kselftest.h

   478	
   479	static inline void ksft_reset_state(void)
   480	{
   481		ksft_cnt.ksft_pass = 0;
   482		ksft_cnt.ksft_fail = 0;
   483		ksft_cnt.ksft_xfail = 0;
   484		ksft_cnt.ksft_xpass = 0;
   485		ksft_cnt.ksft_xskip = 0;
   486		ksft_cnt.ksft_error = 0;
   487		ksft_plan = 0;
 > 488	};
   489	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
