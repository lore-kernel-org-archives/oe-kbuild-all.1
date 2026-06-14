Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477232E2850
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 18:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781463403; cv=none; b=VYkYp0WOz4dcdTtkwJWuEDb9MiQMgSNl+mfJONfwwIFgIaWy+izq8ZCKtusdWKsiG7U/RZ7PSVlsMcr2GM/j8ZpWRsxjBHQm1/l9DyowYmVbaQqX3qZbOhNzQRPXIFAG5MePCgh+nHjfvF2lfFZuV+NI91cVch23i3LqNwXrjm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781463403; c=relaxed/simple;
	bh=jXMxvj1bBhp7qO/ihixxaATIon8JcjoPBeaeRmRtNyo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LWKaAoCoumOi3OZnxy+ASbwEAhDacaX6597cF/iJpV6CXCOTN1tzYySKDJvn8L2S/lYRlSbPfbrAfLm1cTQUGkQHpSS/q8RvsHhyaR+LRJqPWxKfJwG3mo4SNmqWnK2/fnGk5XUsc6SDahFWNC+KvHqwAtUxM/Hp2z15uAF05wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TEF56XTt; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEF56XTt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781463401; x=1812999401;
  h=date:from:to:cc:subject:message-id;
  bh=jXMxvj1bBhp7qO/ihixxaATIon8JcjoPBeaeRmRtNyo=;
  b=TEF56XTt+f2UKlaVoNNYri1RZXvlnuQh/O72Msum9MdX68z5UPfmbLCk
   fLkAxF+MC/aaZll8ak57ypK0foSkIJqvLuiS9EfVkaPD3sIVx7d7AuDT6
   sWZo0LrSGNiZ9LH8f8ukoLZZ5mlxSM88enami0Lg/XA4VRKxOZoDtJR0C
   6I3iwIyBnere72qqfeOzGUk6gs1D7iUJV9ZXeZ27upsLNjhHg7zcAs/VX
   2g2vDcEN/66Z6p4gVUa3WanRo0gAkNBzB7zo+xb3/Jd7YQzWJwrmzYFyO
   Jn57wPpMD/s8+bAZKNNIhJWurI14RgP3VtAjZRC3/vteq/UeIFhUXbbsf
   Q==;
X-CSE-ConnectionGUID: yghqAXGaQcOOiPvjzXbE3g==
X-CSE-MsgGUID: 4rlNxkucTDqcBbXtbAjkNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="69756795"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="69756795"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 11:56:41 -0700
X-CSE-ConnectionGUID: mOc3uE0mTmeUzM9BkZdqEg==
X-CSE-MsgGUID: 9g9gzvZuR0SMdpotQ6b1YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="270957346"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Jun 2026 11:56:39 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYq0b-00000000R8Q-2BLk;
	Sun, 14 Jun 2026 18:56:37 +0000
Date: Mon, 15 Jun 2026 02:56:25 +0800
From: kernel test robot <lkp@intel.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tamird:b4/bpf-ringbuf-callback 10/11] ringbuf.c:412:9:
 error: ISO C90 forbids mixed declarations and code
Message-ID: <202606150201.QBTLSmit-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/tamird/linux b4/bpf-ringbuf-callback
head:   60bd75d7c79a01786dd5da0b5264a58fc5a3c3be
commit: 669fde8241bd5bb91c22df6640b243ca1da272b9 [10/11] libbpf: ringbuf: Add a caller-owned iterator
config: arm-randconfig-004 (https://download.01.org/0day-ci/archive/20260615/202606150201.QBTLSmit-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606150201.QBTLSmit-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606150201.QBTLSmit-lkp@intel.com/

All errors (new ones prefixed by >>):

   ringbuf.c: In function 'ringbuf_process_ring':
>> ringbuf.c:412:9: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
     412 |         struct ring_buffer_iter it
         |         ^~~~~~
   cc1: all warnings being treated as errors
   make[6]: *** [tools/build/Makefile.build:95: tools/bpf/resolve_btfids/libbpf/staticobjs/ringbuf.o] Error 1 shuffle=1351407704
   make[6]: Target '__build' not remade because of errors.
   make[5]: *** [Makefile:152: tools/bpf/resolve_btfids/libbpf/staticobjs/libbpf-in.o] Error 2 shuffle=1351407704
   make[5]: Target 'tools/bpf/resolve_btfids/libbpf/libbpf.a' not remade because of errors.
   make[4]: *** [Makefile:62: tools/bpf/resolve_btfids//libbpf/libbpf.a] Error 2 shuffle=1351407704
   make[4]: Target 'all' not remade because of errors.
   make[3]: *** [Makefile:77: bpf/resolve_btfids] Error 2 shuffle=1351407704
   make[2]: *** [Makefile:1557: tools/bpf/resolve_btfids] Error 2 shuffle=1351407704
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1351407704
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1351407704
   make: Target 'prepare' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
