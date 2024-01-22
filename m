Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173ADEBB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jan 2024 14:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705934340; cv=none; b=mA/vwmUQzMM+K2HsFPt2WJpaHjpUQ6MzMJntAr8rm0NX3Qt6odt8OO918jAkD8J9k2IY2j7RVoMGAB0YRr7nobpHM+9I8JGdJjuT9GQKZp1EEV7cCDPdZVQe5ZjOUEDDSRC7cfLLaEhB9y8oLSMH30M9K0U1Z9Xm2E+/t/Qowow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705934340; c=relaxed/simple;
	bh=s4UHGy6PIAI2K3fqUn0eud0yNF0Qc13GKdYHULx1cSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZuLR9PI3oALYSkT1dIRnu7pffTNQ7d74y0uoeVaUIGFV8CbJbozqf/GOEu9JTdTl7s3VJh1++ebrAn7NNG1Ixb6qqmmAHbIgYV0nsbzsN4DOgpOY+AgIXvRQhQgXJ/K6+cxW7Htq186a//l2W9UpbYfOvjzW4HkBeSEP7R35Z1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nnbGNu1L; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nnbGNu1L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705934337; x=1737470337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s4UHGy6PIAI2K3fqUn0eud0yNF0Qc13GKdYHULx1cSw=;
  b=nnbGNu1LxL0gA/yY1MoXPSlMtUhj26keHlb6Qj3FWratZCNkk3J5fvGT
   Vc9Pjz9kjwMjBOSUDoc3Oj/30F8IswSu7wemcvbuwLIkkCTJVsqGgNGAQ
   I4VAfkG49flXasarArtEzOvfIBqZBeK2t3wXLXxD0Pnrys61ZH/wtMl4x
   LWBD+XJ2lDFMB+grqXp9kw8hYWUEQkYlXH1yc2yt6b39K57GfqfvaxrnC
   RL7Vn/j/bOXYX+GclvpL/fzNr5NyLX7rTF6ymLHm9Pf3pCuxq0y8kelvk
   Unw92mYMVlPJ8QSGWfwfpgcRxo4NeZNuNH4P/Dw9WoN7woQXehczk4A1M
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="1111463"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="1111463"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 06:38:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="904871659"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="904871659"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 22 Jan 2024 06:38:57 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRvRv-0006ga-06;
	Mon, 22 Jan 2024 14:38:55 +0000
Date: Mon, 22 Jan 2024 22:38:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:devel/overflow/wrap-around 58/77] mremap_test.c:undefined
 reference to `add_would_overflow'
Message-ID: <202401222201.2ujOjrhu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git devel/overflow/wrap-around
head:   e89bc1e50a4aea7c77987a344e7917eb41d290eb
commit: 30a377d0347bd7eda27eedf736f4b7789f7bac4e [58/77] mm: Refactor intentional wrap-around test
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240122/202401222201.2ujOjrhu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401222201.2ujOjrhu-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   mremap_test.c: In function 'remap_region':
>> mremap_test.c:401:21: warning: implicit declaration of function 'add_would_overflow' [-Wimplicit-function-declaration]
     401 |                 if (add_would_overflow(addr, c.dest_alignment)) {
         |                     ^~~~~~~~~~~~~~~~~~
   mremap_test.c:460:100: warning: format '%d' expects argument of type 'int', but argument 2 has type 'long long unsigned int' [-Wformat=]
     460 |                                 ksft_print_msg("Preamble data after remap doesn't match at offset %d\n",
         |                                                                                                   ~^
         |                                                                                                    |
         |                                                                                                    int
         |                                                                                                   %lld
     461 |                                                i);
         |                                                ~                                                    
         |                                                |
         |                                                long long unsigned int
   /usr/bin/ld: /tmp/ccoR9ijk.o: in function `remap_region':
>> mremap_test.c:(.text+0xee1): undefined reference to `add_would_overflow'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
