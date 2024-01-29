Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF82D153BCE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 16:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706546646; cv=none; b=Ung5YqI9kFQG2qI6nmLsIfm7KiFmZTVB19hJHJH69JARhEHCgtHA2gxc0FlUIuVqU4RTDHgTNq9iqVYF6OinmXTXN7PZwRDccxc0aS/5YuFqyKHlq9E3Ot/WdI3hOzf7dCMffZn/jNVnR+g1y+wAVCzPtjYAraKBDdlvk7qv484=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706546646; c=relaxed/simple;
	bh=2EWxBbdCvSobo8xXtFVq12CMqOswV+pV890i6kZK174=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hIANUuyhcoo4d8/FORldoqWWtSaQQg0K2N0gB51XaxsxcAYLF4pYPjJPe9AzoUpW0NpO5WqR1ewK/TOEdO/jx47vWYqZABX0euXJfxEGwy2tAt4DcS8zSnz5y7r/7080tJ5KlB8sxd0SWy+C6sMzMSL7yc983beL6vhIpE1NJ84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nTKsikkn; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nTKsikkn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706546645; x=1738082645;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2EWxBbdCvSobo8xXtFVq12CMqOswV+pV890i6kZK174=;
  b=nTKsikknqrqxbS3WdSQAjuPWOiT8wfoAkGMU69QFchZyGMhAREPKiqrm
   i1zPsW7Q1JsG0vg67iJ5DdBfKCgvJRH9z/QELTWj/yIQMoVzAKFlAG/Wa
   bc8raCojmT99T299+VpZbDV8ba12BiKDx8Dm8NQGquMVJ/6jltOypZLCc
   HI8KQb9P3SLb6TxR8MQHIgyKvjLpAufQs5OyIgMXdg8jOAe4BeFUrmDry
   xccH6jBxh+1H3le2/+lJc87QXPwmg/2SeMeuRinktb2Dj9ikwnjxWbQg3
   5QvqLP9hOu6i1TqJ1HxtxiLqFZ/itOJ30Xk28KKyQNgTzqS55bhChp+s6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="434178289"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="434178289"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 08:44:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="911119567"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="911119567"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 29 Jan 2024 08:44:02 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUUjo-0004Ss-0n;
	Mon, 29 Jan 2024 16:44:00 +0000
Date: Tue, 30 Jan 2024 00:43:52 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:5.4-main 3542/26476]
 net/wireguard/crypto/zinc/chacha20/chacha20.c:169:12: warning: no previous
 prototype for function 'chacha20_mod_init'
Message-ID: <202401300056.PX6qfB73-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 5.4-main
head:   645dca86a686ddae272b209432af075ecc0185c5
commit: dabd02495f84488ea48192d40aa013f3749c1bc1 [3542/26476] added wireguard, tag:0.0.20191219
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240130/202401300056.PX6qfB73-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240130/202401300056.PX6qfB73-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401300056.PX6qfB73-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/wireguard/crypto/zinc/chacha20/chacha20.c:169:12: warning: no previous prototype for function 'chacha20_mod_init' [-Wmissing-prototypes]
     169 | int __init chacha20_mod_init(void)
         |            ^
   net/wireguard/crypto/zinc/chacha20/chacha20.c:169:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     169 | int __init chacha20_mod_init(void)
         | ^
         | static 
   1 warning generated.
--
>> net/wireguard/crypto/zinc/poly1305/poly1305.c:144:12: warning: no previous prototype for function 'poly1305_mod_init' [-Wmissing-prototypes]
     144 | int __init poly1305_mod_init(void)
         |            ^
   net/wireguard/crypto/zinc/poly1305/poly1305.c:144:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     144 | int __init poly1305_mod_init(void)
         | ^
         | static 
   1 warning generated.
--
>> net/wireguard/crypto/zinc/chacha20poly1305.c:381:12: warning: no previous prototype for function 'chacha20poly1305_mod_init' [-Wmissing-prototypes]
     381 | int __init chacha20poly1305_mod_init(void)
         |            ^
   net/wireguard/crypto/zinc/chacha20poly1305.c:381:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     381 | int __init chacha20poly1305_mod_init(void)
         | ^
         | static 
   1 warning generated.
--
>> net/wireguard/crypto/zinc/blake2s/blake2s.c:252:12: warning: no previous prototype for function 'blake2s_mod_init' [-Wmissing-prototypes]
     252 | int __init blake2s_mod_init(void)
         |            ^
   net/wireguard/crypto/zinc/blake2s/blake2s.c:252:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     252 | int __init blake2s_mod_init(void)
         | ^
         | static 
   1 warning generated.
--
>> net/wireguard/crypto/zinc/curve25519/curve25519.c:89:12: warning: no previous prototype for function 'curve25519_mod_init' [-Wmissing-prototypes]
      89 | int __init curve25519_mod_init(void)
         |            ^
   net/wireguard/crypto/zinc/curve25519/curve25519.c:89:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      89 | int __init curve25519_mod_init(void)
         | ^
         | static 
   1 warning generated.


vim +/chacha20_mod_init +169 net/wireguard/crypto/zinc/chacha20/chacha20.c

   167	
   168	#ifndef COMPAT_ZINC_IS_A_MODULE
 > 169	int __init chacha20_mod_init(void)
   170	#else
   171	static int __init mod_init(void)
   172	#endif
   173	{
   174		if (!nosimd)
   175			chacha20_fpu_init();
   176		if (!selftest_run("chacha20", chacha20_selftest, chacha20_nobs,
   177				  ARRAY_SIZE(chacha20_nobs)))
   178			return -ENOTRECOVERABLE;
   179		return 0;
   180	}
   181	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
