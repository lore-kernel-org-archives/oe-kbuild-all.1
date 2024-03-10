Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4873EA921
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Mar 2024 08:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710060125; cv=none; b=ciglqN8vRGFnVTGKu+OR2AWNCjnRUh4hhLyB8PDdMkRViQXuvgrAEWdoHV8dj+7L0nO7Nl5gxq80IvFmy5j/0mqHdqAdLk3AXdjpONVPgvEKyWUyCLVNPnN8rVT6JlRlBm3r+YkiU+lL7cxUAu2qRIfRRlcNKN9zEdlknAO9NMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710060125; c=relaxed/simple;
	bh=QyIOWk9wqj6jh/LiA4KzkOkDEWpngQdU869pAg65qKk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nyDyFEyl4MsSFQHvwwVZaPp+wGHMiSxXYaMjsqrQzvMzwZm6W2mTKxeey883eTdFL4+ZEZkAjXh3qjjKfPTrHgaFXEPVAvCMtTNezeFiTk2sZKaiLJXsiF4R2Spd+gwetbXE1Zz85eBGSuOm/GP6WWOc5GbPnFyoajSN78yTj/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N1VHepz3; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N1VHepz3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710060122; x=1741596122;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QyIOWk9wqj6jh/LiA4KzkOkDEWpngQdU869pAg65qKk=;
  b=N1VHepz3EeW7CYBwYWxVNLGO4buO1jDws4RY9yQFgla4uzszmKRGePc6
   XkJImMGZ01aPzWJ926updQ9Jl+rOOyERHxixP8JeUJ3AUd0dXaVgzza0W
   kX4I2yNYt4GH+md/oWUcoQyC3uu4slEt2ilbZWDejSi69IMSpl0XWLhFk
   sDescDd0+RDEx/viB8BmiYxd6MPpyrlo2do9P7jKcEC1GS5Dgd72TUAKc
   LPZaNeMwtFeMXfz3E1ZPWCAadByowJ9xAsm0h4QuhX6TinIR8z8wzYELD
   k5r7ltlpnWZ+lqPsxlJUCulEkU83BDVhnT5zxt4vQ3F8EVi2a6TkAwMdh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="8557006"
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="8557006"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 00:42:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="10751735"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Mar 2024 00:42:00 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjEko-00086x-0p;
	Sun, 10 Mar 2024 08:41:58 +0000
Date: Sun, 10 Mar 2024 16:41:56 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie-new 49/61] include/linux/build_bug.h:78:41:
 error: static assertion failed: "!(sizeof(struct xdp_buff_xsk) %
 __alignof__(struct libeth_xdp_buff))"
Message-ID: <202403101608.nYNHGm4I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   f896c293302a9ec5710485e2bff89b49bb4a77d2
commit: 8f55117c27aedc17e4724ad1327d292b2688f810 [49/61] libie: add a couple of XDP helpers
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240310/202403101608.nYNHGm4I-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240310/202403101608.nYNHGm4I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403101608.nYNHGm4I-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/timer.h:5,
                    from include/linux/netdevice.h:24,
                    from include/trace/events/xdp.h:8,
                    from include/linux/bpf_trace.h:5,
                    from include/net/libeth/xdp.h:7,
                    from drivers/net/ethernet/intel/libeth/tx.c:4:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "!(sizeof(struct xdp_buff_xsk) % __alignof__(struct libeth_xdp_buff))"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/net/libeth/xdp.h:36:1: note: in expansion of macro 'static_assert'
      36 | static_assert(!(sizeof(struct xdp_buff_xsk) %
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
