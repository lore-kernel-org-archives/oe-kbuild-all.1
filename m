Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC8D18A92C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Nov 2024 10:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730888244; cv=none; b=YQdSJZvNGYgeUur9tut7dfRMLZjOTFfR3Ea9kBSlu+ddmX/qXtrBZ/11eioCFDTpmd96zU/I8Gylw9aMKirlEQ0j0LILReD5Qjdp2nvGoVV4zWpzbPhc6shh8Svbzt1cX3MVQAMIK26WRFpXn7YPlOHt5wCYQAwBR8NKomPA6KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730888244; c=relaxed/simple;
	bh=bxVbiD0txrJ2hXIy5kk3qagMou1q5DI5tLXqBDdPS/c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PnmMZl/wg1shhm6qIY/pnIfhibusAQvlSIbuh6yAwCsKTX145aKOhtvRwyAz6pWoSIorsRG/U0aL/zH8sJfOqJHGE9LVV5pgejGygoJzpq/ooSgLJeKEptI+YcaPCuPKyIIcgjxPLDBzXOZ78Yp+OoX2HoBNENfZoY2tNYyv/YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P1BuOrw/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P1BuOrw/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730888243; x=1762424243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bxVbiD0txrJ2hXIy5kk3qagMou1q5DI5tLXqBDdPS/c=;
  b=P1BuOrw/WooWGi2FUUb9mDNY7Y3xUbqYjkQ7HwTzIjYLCJfXO6SB48h1
   XDuTus7C57j3MXckugRMDJdy6AiejPrjjMTI7+22dlYQsOERahOPbEvri
   RtBsaDQdYCT7DmhNABCy9KjO5sLZhcCX7FWers30faQSv5NajSlBpyTcY
   xBJsmYPuimx3J8wdjUlRLH5g8ArDSPJvoqfgMMlBJNCX3ZwSkqea+OtMv
   FJ2sK7bjgCy4bDTtXRiovBg+iyI1PZRge9f0QurorKApJwDAT5eaHxtU7
   anS+E/4hhMMLw+2vt69zr+BKqIbQP85t1+KBTVal+DmH+SaJPS8GnqIgM
   A==;
X-CSE-ConnectionGUID: heA+wPsnQuW5QirydRoAog==
X-CSE-MsgGUID: cLlNB0MSQJSoZFsudIfF0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="41270716"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="41270716"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 02:17:22 -0800
X-CSE-ConnectionGUID: HTC3KO3uQguDUSvD3GUJag==
X-CSE-MsgGUID: w9GM9FvSSgi6vYUjxDevxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="89303427"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Nov 2024 02:17:21 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8d6E-000nBC-1s;
	Wed, 06 Nov 2024 10:17:18 +0000
Date: Wed, 6 Nov 2024 18:17:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 414/415]
 include/linux/jump_label.h:260:undefined reference to
 `__tracepoint_cros_security_socket_post_create_enter'
Message-ID: <202411061815.Cl75dvU4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   eebfbf01bf6938dd13cb315873c55c135325ffe2
commit: 0c222baf9d509fdea61d5e821a175093d62f2f3b [414/415] CHROMIUM: add cros_security_post_create_exit tp
config: arm64-randconfig-001-20241106 (https://download.01.org/0day-ci/archive/20241106/202411061815.Cl75dvU4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411061815.Cl75dvU4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411061815.Cl75dvU4-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: ID map text too big or misaligned
   aarch64-linux-ld: security/security.o: in function `security_socket_post_create':
>> include/linux/jump_label.h:260:(.text+0xada4): undefined reference to `__tracepoint_cros_security_socket_post_create_enter'
   aarch64-linux-ld: security/security.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__tracepoint_cros_security_socket_post_create_enter' which may bind externally can not be used when making a shared object; recompile with -fPIC
>> include/linux/jump_label.h:260:(.text+0xada4): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: include/linux/jump_label.h:260:(.text+0xada8): undefined reference to `__tracepoint_cros_security_socket_post_create_enter'
   aarch64-linux-ld: security/security.o: in function `security_socket_post_create':
>> include/trace/events/cros_net.h:387:(.text+0xae3c): undefined reference to `__traceiter_cros_security_socket_post_create_enter'


vim +260 include/linux/jump_label.h

1f69bf9c613760 Jason Baron    2016-08-03  257  
656d054e0a15ec Peter Zijlstra 2022-05-02  258  static __always_inline int static_key_count(struct static_key *key)
4c5ea0a9cd02d6 Paolo Bonzini  2016-06-21  259  {
656d054e0a15ec Peter Zijlstra 2022-05-02 @260  	return arch_atomic_read(&key->enabled);
4c5ea0a9cd02d6 Paolo Bonzini  2016-06-21  261  }
4c5ea0a9cd02d6 Paolo Bonzini  2016-06-21  262  

:::::: The code at line 260 was first introduced by commit
:::::: 656d054e0a15ec327bd82801ccd58201e59f6896 jump_label,noinstr: Avoid instrumentation for JUMP_LABEL=n builds

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
