Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CE973477
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Mar 2025 02:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741575289; cv=none; b=bMPS4medLwHoPuAVWP7u0m3MB6/UK5lnubiUGh9ZFmS09irxm64HRe7Txp+etdpSX7iLc2GgeKcPzGtvmqPXv1ZY8khw5I1cbuONSHVy2qlm6fj3OBe2AVyxo6O3HdMNGiNRvdecox0yTWEaB5sXXIYh2vmsHEn9MSPmQ97Bn+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741575289; c=relaxed/simple;
	bh=NQCRMgx9b+z3CRRnWK760Y1hmnoJCrM0WSFyqb5zKeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ow8EuMKlG2C2sodcHw1f+X4c4yT46BF5EQENua8D9y1rVwolOMDyHv6ElFVOhIS4eD7SnRWQgN2hAkrkE1WOb2p6v2f/J0x1K9eYNLdG7Mvmhjp+sWaQRKYiIEHT6edG1ycupo4RgdKqz/Jav+/QjICBdHDY3ksJHNFsTjXwjto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EqLrKu9L; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EqLrKu9L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741575287; x=1773111287;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NQCRMgx9b+z3CRRnWK760Y1hmnoJCrM0WSFyqb5zKeE=;
  b=EqLrKu9LADAT2sciuVTO4LkUoOFx5r+0pnycjgvkf1bdxjKFmwBJayWl
   RkfZV2bSTM2AC3H/ItnnP6+gTExm0+zzd0ms3nsEP0sa6kTzkDWI/oSe6
   05MWRhLmtd6+P+D2VjXm+XCD4SZqD7yvg2+w1p/JPJmcXYa4ehHUFXrWw
   rk8KGDHUKl8ZqdBKocEydh/zxxgnuIvqKd4t0XSAzpUzJXqdp7u1yslzj
   eTxxS8kjoaymOeeBkNTGnAKNv5l2xMGh+ESHlt5dEigobVLPJDlT+GTes
   mesdbuy9jKQKcSleRV8WV6vSne+QPw++5GJb0al+yrhcw7lnOJdbGvqvP
   A==;
X-CSE-ConnectionGUID: KFhMfJSRTtS5kd5Lh/YY+g==
X-CSE-MsgGUID: GxoAc3F5R+CI5ePvXyLxNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="42693961"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="42693961"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 19:54:46 -0700
X-CSE-ConnectionGUID: G2gfnZf4Q8eRpaBULJ9wvQ==
X-CSE-MsgGUID: Ns5fxT99R7Cpfd4lfu8KZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="124935708"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 09 Mar 2025 19:54:45 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trTHv-0003kK-1Z;
	Mon, 10 Mar 2025 02:54:43 +0000
Date: Mon, 10 Mar 2025 10:54:12 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/3] ubsan/overflow: Rework integer overflow sanitizer
 option to turn on everything
Message-ID: <202503101035.rpwDzqYD-lkp@intel.com>
References: <20250307041914.937329-1-kees@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307041914.937329-1-kees@kernel.org>

Hi Kees,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kees/for-next/hardening]
[also build test WARNING on masahiroy-kbuild/for-next masahiroy-kbuild/fixes kees/for-next/pstore linus/master v6.14-rc6 next-20250307]
[cannot apply to kees/for-next/kspp]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kees-Cook/ubsan-overflow-Rework-integer-overflow-sanitizer-option-to-turn-on-everything/20250307-122130
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/hardening
patch link:    https://lore.kernel.org/r/20250307041914.937329-1-kees%40kernel.org
patch subject: [PATCH 1/3] ubsan/overflow: Rework integer overflow sanitizer option to turn on everything
config: s390-randconfig-r112-20250310 (https://download.01.org/0day-ci/archive/20250310/202503101035.rpwDzqYD-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250310/202503101035.rpwDzqYD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503101035.rpwDzqYD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/test_ubsan.c:62:16: sparse: sparse: cast truncates bits from constant value (7fffffffffffffff becomes ffffffff)
   lib/test_ubsan.c:72:18: sparse: sparse: shift count is negative (-1)

vim +62 lib/test_ubsan.c

    55	
    56	static void test_ubsan_truncate_signed(void)
    57	{
    58		volatile long val = LONG_MAX;
    59		volatile int val2 = 0;
    60	
    61		UBSAN_TEST(CONFIG_UBSAN_INTEGER_WRAP);
  > 62		val2 = val;
    63	}
    64	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
