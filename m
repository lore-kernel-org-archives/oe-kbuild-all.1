Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82381DE8AD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Oct 2025 01:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760838822; cv=none; b=icwp+sK1edCv14jbh6pAwIykjS9gz+oCBpk2tndGiwbVx/e+Q5GvAq8OB6tjILp1VSMxQ9DVcKLW3/PHPrmBMNe0dDCbbSxvUK+jJLxd2GrvMWVwib/FcfA0chwOApVRQCOXO+hjMkoqFnbKYOpJZi/qsCfeZIQrCZBQvgaN04A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760838822; c=relaxed/simple;
	bh=a9VrV8mollee/oFMMAGnsFXdemrsmT0CZUgh/UTxrWk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cA0f7l+niUNMEikI03VdsBs/FgRXaeRSQRY1KO7XHNFeQ7aKiY9/H7fH30GxQVDL0hMsXykhzUq9ow8G2EPxPV5Uv6NVTTv0yOLL+f0nbSC9w8ZlUnGPqlwfCL6lupwetZNZkR863/iJi11U5cmfvXux1jSYPZGAr8LC0b7cO8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iTs/yGZU; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iTs/yGZU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760838821; x=1792374821;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=a9VrV8mollee/oFMMAGnsFXdemrsmT0CZUgh/UTxrWk=;
  b=iTs/yGZUv0BgAugHMictckyhAD0JAnvqMzorZd462YO8yYLekeqpzClx
   C28tox3YUZ6HOc/CJGCkqdlAYl/tqi3GC+nPyTOp/NYeXMfQhfuwzs46h
   906Y5CL3V2W1wvDrnzcLLxEq9C45rVLeSI31DTMCzpQHSuJJV0ViZ4GfN
   HWIaNy8y1nzZo9eMdl6l4vBMVYYfRUEyMYA4YCDA23p/XjDD4fraKYvNJ
   xl1XQEuIElZkD736IpswIerpZOtf6FW81ymwFo7kzpyG8qY001+vEWLYJ
   uMqQI1gjTdYKryyFexNLNvJhkx9lAwaewMsTQINMdZPS9q7gTZGy0wanE
   Q==;
X-CSE-ConnectionGUID: 8rpQ/zb3T7OO6+3avRfS4w==
X-CSE-MsgGUID: 2aMQA2jyTOW5WpIJqekU7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66874561"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="66874561"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 18:53:40 -0700
X-CSE-ConnectionGUID: GsVdB4wQQCaAAbxBK1NXZg==
X-CSE-MsgGUID: oWDtv10ZTr+2JIJpBLWi+g==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 18 Oct 2025 18:53:39 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAIc5-0008l8-0j;
	Sun, 19 Oct 2025 01:53:37 +0000
Date: Sun, 19 Oct 2025 09:52:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2-session 6/13] include/linux/cleanup.h:228:22:
 warning: ignoring return value of '__must_check_fn' declared with attribute
 'warn_unused_result'
Message-ID: <202510190940.rnpFvgAq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2-session
head:   471794e609af596c5e0fa3d0be3dc47553048aac
commit: 1c5c2e1982b61c3c006ae4b7fdf23d64d25008fc [6/13] KEYS: trusted: Fix memory leak in tpm2_load()
config: i386-buildonly-randconfig-002-20251019 (https://download.01.org/0day-ci/archive/20251019/202510190940.rnpFvgAq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251019/202510190940.rnpFvgAq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510190940.rnpFvgAq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:7,
                    from security/keys/trusted-keys/trusted_tpm2.c:9:
   security/keys/trusted-keys/trusted_tpm2.c: In function 'tpm2_load_cmd':
>> include/linux/cleanup.h:228:22: warning: ignoring return value of '__must_check_fn' declared with attribute 'warn_unused_result' [-Wunused-result]
     228 |         ((typeof(p)) __must_check_fn((__force const volatile void *)__get_and_null(p, NULL)))
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/trusted-keys/trusted_tpm2.c:399:17: note: in expansion of macro 'no_free_ptr'
     399 |                 no_free_ptr(blob);
         |                 ^~~~~~~~~~~
--
   In file included from include/linux/string.h:7,
                    from trusted_tpm2.c:9:
   trusted_tpm2.c: In function 'tpm2_load_cmd':
>> include/linux/cleanup.h:228:22: warning: ignoring return value of '__must_check_fn' declared with attribute 'warn_unused_result' [-Wunused-result]
     228 |         ((typeof(p)) __must_check_fn((__force const volatile void *)__get_and_null(p, NULL)))
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   trusted_tpm2.c:399:17: note: in expansion of macro 'no_free_ptr'
     399 |                 no_free_ptr(blob);
         |                 ^~~~~~~~~~~


vim +228 include/linux/cleanup.h

85be6d84244706 Peter Zijlstra 2023-08-15  226  
54da6a0924311c Peter Zijlstra 2023-05-26  227  #define no_free_ptr(p) \
366fef794bd2b7 Ilpo Järvinen  2025-03-10 @228  	((typeof(p)) __must_check_fn((__force const volatile void *)__get_and_null(p, NULL)))
54da6a0924311c Peter Zijlstra 2023-05-26  229  

:::::: The code at line 228 was first introduced by commit
:::::: 366fef794bd2b7c2e9df933f6828dd9739bfba84 <linux/cleanup.h>: Allow the passing of both iomem and non-iomem pointers to no_free_ptr()

:::::: TO: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
