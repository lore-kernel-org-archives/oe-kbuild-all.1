Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AE72D1F44
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 05:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771047437; cv=none; b=njzoaW4MJMSY9ANQrPyTuOCGEIygZgP0dqBshvI/qt9KCHfa2MuV1x2T9tYy13hYMjbMOKjpTRpltEo9u/btufBwnFxMZYkGSyNkhHSEsMGgQcDznCofW7yqLFz8B55vaheCfEMOC4y6ap/WwmcSr6GJuvD9sZgZqxiIwg30IfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771047437; c=relaxed/simple;
	bh=CzkswlEV4X2Jxq0Lj5sGNtoRkT44VpELkKZ7jn2ELsg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Hm1Od3Gh7+mQn9KjeMadDbuqIgwNvSnzYSLYj2NO3c6yq+QVHQ+d5pJASH0INglEaKroIVHrKxa8/QULLH4h39/XM+MJL2ILg/ncwDIAxyNz3BkU820M+7N3UIxXMdfa8k+PdjA6dtJYEiOThgIdMjN9ASnywOWlity3qvOMQJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XmuPfV8l; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XmuPfV8l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771047436; x=1802583436;
  h=date:from:to:cc:subject:message-id;
  bh=CzkswlEV4X2Jxq0Lj5sGNtoRkT44VpELkKZ7jn2ELsg=;
  b=XmuPfV8lJMwbYCDwWmCI420IzfCET1qCUmEM49FfNlpfZsA1XzmBk2df
   41LKi6/j5tHZ6Y8Q4/8oUqMhZuS6kcEwa/DjuaUIYTDyH9D6FLchIeB7I
   y1X56uvSm86zH/j73nn+YvJLjffkejaWdXvGjAn2BLsY++hSxciyyPHB8
   PKh6NxrrZNdueDdSHVdllbPOaLQjjF/CTIsZkz8RUkUdQO+yWqYXsRT7j
   HEcT0SQujZ/lWFEytKl7IsiuknlOKIZaJ5bss9peESMG4Qcr3VKv00vlO
   O+0dOFaeuyutke6n+yMCVsbKo/+WsgMV/VJOSoWOwnVO+QFPF2UZNAU8r
   w==;
X-CSE-ConnectionGUID: J9WyUBOjTQq961G/vhwSUA==
X-CSE-MsgGUID: Is+cWg8XQGOCcK3G5qbYuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="75847425"
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="75847425"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 21:37:14 -0800
X-CSE-ConnectionGUID: HUu5SMTQRXSciNu6ODuFNg==
X-CSE-MsgGUID: 7eW1o6yIQ8iylZjdLPaq1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="212504587"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Feb 2026 21:37:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr8L8-00000000wG4-0cEz;
	Sat, 14 Feb 2026 05:37:10 +0000
Date: Sat, 14 Feb 2026 13:36:49 +0800
From: kernel test robot <lkp@intel.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>
Subject: kernel/bpf/crypto.c:264:18: sparse: sparse: symbol
 'bpf_crypto_ctx_release_dtor' was not declared. Should it be static?
Message-ID: <202602141319.fKNAntVC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f50822fd8675c68d294e89bd102f7b487ca3acd3
commit: b40a5d724f29fc2eed23ff353808a9aae616b48a bpf: crypto: Use the correct destructor kfunc type
date:   5 weeks ago
config: microblaze-randconfig-r123-20260213 (https://download.01.org/0day-ci/archive/20260214/202602141319.fKNAntVC-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602141319.fKNAntVC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602141319.fKNAntVC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/bpf/crypto.c:264:18: sparse: sparse: symbol 'bpf_crypto_ctx_release_dtor' was not declared. Should it be static?

vim +/bpf_crypto_ctx_release_dtor +264 kernel/bpf/crypto.c

   263	
 > 264	__bpf_kfunc void bpf_crypto_ctx_release_dtor(void *ctx)
   265	{
   266		bpf_crypto_ctx_release(ctx);
   267	}
   268	CFI_NOSEAL(bpf_crypto_ctx_release_dtor);
   269	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
