Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CC6161
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jan 2024 00:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705881934; cv=none; b=NobT1CEncl+NpF3rWa49D1aZE3xU42TFmQl5SrxxvwM6K5z/eXL5zM/eoDWuwn1OEaruTR6Vb1rGa0mAlSLvq3bs46G4ffambc66pMGn3sWx2HNCqdaplavb1UI6PFvd1Yve/wTD/HpaCe8U3NlPzdzkiXRq6NVg+MOoCMVPs1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705881934; c=relaxed/simple;
	bh=T8u2cNsxlF4xme99Y+iZu56PchdmFAki8JXfE5oxdBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=djVB9yqVp1qsCHMr3Ah19Nbl6s8QJV35Eubky2RN8QYpVnpL3ckazF3+3BhWc9z48krqWDzwNPNuP1VaBgALM5Eb9D//x6a3y+CEGNfYroGwIyQvK2Qw48HvHwuHDRwIoxqqSsYkV8YxyeGZsoK27zYToAqTazoUWZEb5Jpl5Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bM3uOeAt; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bM3uOeAt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705881932; x=1737417932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T8u2cNsxlF4xme99Y+iZu56PchdmFAki8JXfE5oxdBE=;
  b=bM3uOeAtTWRNaF5yb7PU6eqfNZkwhCxPG7Lu8+949IQZD9CpCExVOviL
   ENYBFIkOz+AOYmjrlgBOpDhLT9WGn1toFI7ofvZuMOjc0kqgVCAfEIHdI
   tj5i9JCJV+wsG0p4KfApeG+9c2MRMPJxnMBExXPrBSvXgqjGdokaei8uz
   6q18h1XlbBbrX+Esc0JEKQesVrigf48S3bxvSJvWA/lclL6yXSUgFRm24
   KqIAQv4KDV4DzOSR0ryvkphod9x/RGIOaNl9NdHKuYJB37W6B6XaHBMqK
   xftxT7bjJqj6UdCuzQMS9ZeJfeuydR/ub3mmJHI5IHfZSntvOmpTMuqTN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="964987"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="964987"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 16:05:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="33874977"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Jan 2024 16:05:30 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRhod-0006Ga-2j;
	Mon, 22 Jan 2024 00:05:27 +0000
Date: Mon, 22 Jan 2024 08:04:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:devel/overflow/wrap-around 58/77] mremap_test.c:undefined
 reference to `add_would_overflow'
Message-ID: <202401220808.BEJFbJnk-lkp@intel.com>
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
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240122/202401220808.BEJFbJnk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401220808.BEJFbJnk-lkp@intel.com/

All errors (new ones prefixed by >>):

   mremap_test.c: In function 'remap_region':
   mremap_test.c:401:21: warning: implicit declaration of function 'add_would_overflow' [-Wimplicit-function-declaration]
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
   /usr/bin/ld: /tmp/ccBDVY9y.o: in function `remap_region':
>> mremap_test.c:(.text+0xee1): undefined reference to `add_would_overflow'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
