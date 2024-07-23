Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D24E13D52B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 23:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721776258; cv=none; b=oNcGZgDWPTs7F/azPkUuERp48QSD65YbSTheg61+7zcpvykYmF9SHt309ExCdwacthcA3jIclsOdhfyEji/6vVrywhZlN5q1ovNXoLBbeYTobV3qXJbUN/zeY+QP4NlPn8fM6N2zRWKwG1ttMl0dmcyysUpGt+SxFuQTR1LB5EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721776258; c=relaxed/simple;
	bh=I+yc0pfrc1uiIQJupe6jOMOu6YDtQJNLv1Y1Qj0mfyw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u9O6Cv0HQ9QR9GE2oWCGvzfbzpDe/rJK6Q8CEJuTAmEncoV31DuHNupY2kIHQuZylz9B4k/JD4L3TuDI0olY6cTxepzsjZbf6RoQpmj0lfT0MM9EuXtJM49I5FV/jg0CgFoTsKLHO9qd+k7Gf9s9hRZdzpBw+EcqfYpyHGykQlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lJxMiDv2; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lJxMiDv2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721776256; x=1753312256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I+yc0pfrc1uiIQJupe6jOMOu6YDtQJNLv1Y1Qj0mfyw=;
  b=lJxMiDv2Wjt88W56OrYLfzx4dRo9Pk65W5+k0xrIGlrODi5ypAvnN6+C
   oTCeWPQguqTLpRDg/JXeL7pk+K7r59misr3RHlO2IWdhi11N7rABN0Oga
   FHUYxILjRXhaueLatar4IUxUb1n3okMd9dAvKdwkyECYDTalY01htp5Is
   Q/toAnosbLPJDpdladcJk39VQOvFbhdXHPBe2z+jFCxyxOLF6LwvvKFET
   kitk9Mo3jIymIdpD/eXmTxKmOmhXddKO0u6y8O9iAKZEqUOAnP5El3VTz
   kvZUPPBEPzlO6NQc9kBslh2EgzeIighEkmU8RsUbG1EdDzeKaXvWiIfT6
   g==;
X-CSE-ConnectionGUID: HYpoQJqBRPm3KEcR7DbC0Q==
X-CSE-MsgGUID: T+jy2u5HQMqA0AnNP01PZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="44852066"
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; 
   d="scan'208";a="44852066"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 16:10:55 -0700
X-CSE-ConnectionGUID: 57M102KtR0Ov0JE5SzjmDQ==
X-CSE-MsgGUID: voBq4IjmT3SOdR5Ma3Anew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; 
   d="scan'208";a="56925030"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Jul 2024 16:10:55 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWOei-000mRM-1u;
	Tue, 23 Jul 2024 23:10:52 +0000
Date: Wed, 24 Jul 2024 07:10:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [riteshharjani:kfence-fix-wip6 9/10]
 arch/powerpc/include/asm/kfence.h:40:13: error: expected declaration
 specifiers or '...' before string constant
Message-ID: <202407240711.Ba4yKa7i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/riteshharjani/linux kfence-fix-wip6
head:   28d73773290c65f55d22e038b4f13c5c4941a561
commit: 1485eaf17b1e899daad3289e9a960c646e880749 [9/10] kfence refactor
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240724/202407240711.Ba4yKa7i-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407240711.Ba4yKa7i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407240711.Ba4yKa7i-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from mm/kfence/kfence_test.c:26:
>> arch/powerpc/include/asm/kfence.h:40:13: error: expected declaration specifiers or '...' before string constant
      40 | early_param("kfence.sample_interval", parse_kfence_early_init);
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/kfence.h:40:39: error: expected declaration specifiers or '...' before 'parse_kfence_early_init'
      40 | early_param("kfence.sample_interval", parse_kfence_early_init);
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/kfence.h:32:19: warning: 'parse_kfence_early_init' defined but not used [-Wunused-function]
      32 | static int __init parse_kfence_early_init(char *arg)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~


vim +40 arch/powerpc/include/asm/kfence.h

    31	
  > 32	static int __init parse_kfence_early_init(char *arg)
    33	{
    34		int val;
    35	
    36		if (get_option(&arg, &val))
    37			kfence_early_init = !!val;
    38		return 0;
    39	}
  > 40	early_param("kfence.sample_interval", parse_kfence_early_init);
    41	#endif
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
