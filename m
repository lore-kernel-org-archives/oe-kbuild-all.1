Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738F72375F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Mar 2024 04:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711686518; cv=none; b=oGMPYFUYejH7NAaTLusU8nlaqccJg58RSvwlGN+bDFc+J89fMiWkTUH18BD1HSkZRbOXtQ6wLyA9W4kglkifNdRb02DvoTuiIfMtHHla8wbltMNgIA0O9qnK/KAUkoXJEr8KentbsThV8HmYPi4AeuV5ThvQIF+OWflrkT3R8sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711686518; c=relaxed/simple;
	bh=0DMbmw+VmbVp+OClrVUXKb/u19h+uiDb6p0xIKmVJNI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XCd6IYbTCm0oc3QU3HY7jc6U2aZaK0vWyfR6ykOEgaxd4vL6MoVRUorIPF4rKUG4d6pYJNOpxxPvhU//q6lczk6+cIaFMcDXzd2mXwlcG8HTAzNB7vJepw4Ryk4iGfCukLCLVudFBB65HzwnG083OVaLHB8UCx/uGabSkIddv+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iF4cssIb; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iF4cssIb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711686517; x=1743222517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0DMbmw+VmbVp+OClrVUXKb/u19h+uiDb6p0xIKmVJNI=;
  b=iF4cssIbhi1iVZQmzk78ceFapIDAEHbZOGGDur4xvcq5dyWg6iTDSCXN
   qWNQ3aNahjVsoNGGP1ioQlkgI9E69UmutfyXwRfSpRT7DLCHQRXqaWFMd
   tiEnO8Ic0xFszU/IIOLBp5up5gysTMPJuxUWQVzE+h4YVPxzizVsiRGq4
   dxegXRSJfJAQnypikwCSvgziVhfsLNw6qejbq7AMomvtu06jew70hdDyK
   CUsTixJYJe+B/X+Oct1FDrNXCoDwk/w5jeL6ioYh1DS0MqBhPPVwaTXzN
   X3rthFw9dup5aJi/9x7MXTfpLTF6zUOWNUeV24N59tTQqk83JdEdSsQvj
   Q==;
X-CSE-ConnectionGUID: RiS72NPtQmacuyzYrovJsg==
X-CSE-MsgGUID: K7iTf9daQASQO2Md2adhzw==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="17594209"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="17594209"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 21:28:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="16927327"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Mar 2024 21:28:34 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rq3qy-0002qU-0I;
	Fri, 29 Mar 2024 04:28:32 +0000
Date: Fri, 29 Mar 2024 12:27:58 +0800
From: kernel test robot <lkp@intel.com>
To: Anton Protopopov <aspsk@isovalent.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Daniel Borkmann <daniel@iogearbox.net>
Subject: [linux-next:master 2308/2532] include/linux/build_bug.h:78:41:
 error: static assertion failed: "struct bpf_fib_lookup size check"
Message-ID: <202403291215.7vPE6fYk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a6bd6c9333397f5a0e2667d4d82fef8c970108f2
commit: 2a720ccf308cd5cb1b77e587bf42448471a44da6 [2308/2532] bpf: Add a check for struct bpf_fib_lookup size
config: arm-assabet_defconfig (https://download.01.org/0day-ci/archive/20240329/202403291215.7vPE6fYk-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403291215.7vPE6fYk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403291215.7vPE6fYk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/atomic/atomic-instrumented.h:15,
                    from include/linux/atomic.h:82,
                    from net/core/filter.c:20:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "struct bpf_fib_lookup size check"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   net/core/filter.c:91:1: note: in expansion of macro 'static_assert'
      91 | static_assert(sizeof(struct bpf_fib_lookup) == 64, "struct bpf_fib_lookup size check");
         | ^~~~~~~~~~~~~


vim +78 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10  60  
6bab69c65013be Rasmus Villemoes 2019-03-07  61  /**
6bab69c65013be Rasmus Villemoes 2019-03-07  62   * static_assert - check integer constant expression at build time
6bab69c65013be Rasmus Villemoes 2019-03-07  63   *
6bab69c65013be Rasmus Villemoes 2019-03-07  64   * static_assert() is a wrapper for the C11 _Static_assert, with a
6bab69c65013be Rasmus Villemoes 2019-03-07  65   * little macro magic to make the message optional (defaulting to the
6bab69c65013be Rasmus Villemoes 2019-03-07  66   * stringification of the tested expression).
6bab69c65013be Rasmus Villemoes 2019-03-07  67   *
6bab69c65013be Rasmus Villemoes 2019-03-07  68   * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
6bab69c65013be Rasmus Villemoes 2019-03-07  69   * scope, but requires the expression to be an integer constant
6bab69c65013be Rasmus Villemoes 2019-03-07  70   * expression (i.e., it is not enough that __builtin_constant_p() is
6bab69c65013be Rasmus Villemoes 2019-03-07  71   * true for expr).
6bab69c65013be Rasmus Villemoes 2019-03-07  72   *
6bab69c65013be Rasmus Villemoes 2019-03-07  73   * Also note that BUILD_BUG_ON() fails the build if the condition is
6bab69c65013be Rasmus Villemoes 2019-03-07  74   * true, while static_assert() fails the build if the expression is
6bab69c65013be Rasmus Villemoes 2019-03-07  75   * false.
6bab69c65013be Rasmus Villemoes 2019-03-07  76   */
6bab69c65013be Rasmus Villemoes 2019-03-07  77  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013be Rasmus Villemoes 2019-03-07 @78  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
6bab69c65013be Rasmus Villemoes 2019-03-07  79  
07a368b3f55a79 Maxim Levitsky   2022-10-25  80  

:::::: The code at line 78 was first introduced by commit
:::::: 6bab69c65013bed5fce9f101a64a84d0385b3946 build_bug.h: add wrapper for _Static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
