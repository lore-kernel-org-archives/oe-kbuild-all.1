Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2348BFB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Mar 2024 20:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711311176; cv=none; b=qbsPupOGiHAYiGZlIF1cDfTixgmrkLK6G1E5csBe4nawlvYZ99Oz80IrIj2jvvt5nkTjyCKXi5h6g9IcHooK12Z3H7RgwAvy34PQDm9WniOCm8M564GeZ4DjuXrstDDh2JN5unvvfSsoLUfrk1purbup7RN7Oqc5oTLvkV54AZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711311176; c=relaxed/simple;
	bh=acG1iF2mcfdC7nLPF942FHK5qzmmXMafp0dAEol0kng=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ukAtyYlK/7lYZv9AtOoRB94u2CgUa8fTxqViYjhtU/zENvpTz5vW/cV4QW/jNx1EgOaYEeHEgYJQTd2lxdwj3U1Kd+38sI2PdWAu1xq6OHrHPuzXsKR9+3TlJ0mro9gV2NlMsv4kEwXtDAnbIbw1TjRv89UmolOWl7Bv6smUd7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eoQDGaLf; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eoQDGaLf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711311174; x=1742847174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=acG1iF2mcfdC7nLPF942FHK5qzmmXMafp0dAEol0kng=;
  b=eoQDGaLfMrD/rMuWVv0k6x6f52YEwxFBwx8ZVi++YkmT2rGVvtC0Qnwq
   lrrKjxzysG11/XCbdQRNhvuxD6Kh0X1ZRjvO4p3tlGYr/K2kTnXKm9uap
   vfoFQGy6oQvrUtp0hK+u+cnpgf6Y1WjkxJaxDN3PnoB8cYPCTEEOHc9zr
   cPj+e5TjPZndT05+0Ke4QQoeG7DmD/RK0FqPV/13xiQRLywS/qC+hgVx7
   xkAJKT6qcxB6gckzXQc+BZ3WVxnDdBItcLkA8oHTnrbM9KsktVb3tf1W3
   52H9ICZmiVploqsIOnEDw2WPFqQL9+OLOqvJ5Ijocb4R8XwuYKk1JoKRz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="9254452"
X-IronPort-AV: E=Sophos;i="6.07,151,1708416000"; 
   d="scan'208";a="9254452"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 13:12:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,151,1708416000"; 
   d="scan'208";a="20160513"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Mar 2024 13:12:52 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roUD3-000M09-1V;
	Sun, 24 Mar 2024 20:12:49 +0000
Date: Mon, 25 Mar 2024 04:12:12 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie-new 30/68] include/linux/build_bug.h:78:41:
 error: static assertion failed: "offsetof(struct idpf_q_vector,
 __cacheline_group_end__read_write) - offsetofend(struct idpf_q_vector,
 __cacheline_group_begin__read_write) <= ALIGN(672, __IDPF_LARGEST_ALIGN)"
Message-ID: <202403250418.jZvrFtha-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   b336f2db592517d25e745924c92e8604eeea0502
commit: a4aa3543ab8bd78277f53d4994ad3f8258608470 [30/68] idpf: strictly assert cachelines of queue and queue vector structures
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240325/202403250418.jZvrFtha-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240325/202403250418.jZvrFtha-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403250418.jZvrFtha-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/minmax.h:5,
                    from include/linux/jiffies.h:8,
                    from include/net/pkt_sched.h:5,
                    from drivers/net/ethernet/intel/idpf/idpf.h:12,
                    from drivers/net/ethernet/intel/idpf/idpf_dev.c:4:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct idpf_q_vector, __cacheline_group_end__read_write) - offsetofend(struct idpf_q_vector, __cacheline_group_begin__read_write) <= ALIGN(672, __IDPF_LARGEST_ALIGN)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:487:9: note: in expansion of macro 'static_assert'
     487 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -        \
         |         ^~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:602:1: note: in expansion of macro '__idpf_cacheline_group_assert'
     602 | __idpf_cacheline_group_assert(struct idpf_q_vector, read_write, 672);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +78 include/linux/build_bug.h

bc6245e5efd70c4 Ian Abbott       2017-07-10  60  
6bab69c65013bed Rasmus Villemoes 2019-03-07  61  /**
6bab69c65013bed Rasmus Villemoes 2019-03-07  62   * static_assert - check integer constant expression at build time
6bab69c65013bed Rasmus Villemoes 2019-03-07  63   *
6bab69c65013bed Rasmus Villemoes 2019-03-07  64   * static_assert() is a wrapper for the C11 _Static_assert, with a
6bab69c65013bed Rasmus Villemoes 2019-03-07  65   * little macro magic to make the message optional (defaulting to the
6bab69c65013bed Rasmus Villemoes 2019-03-07  66   * stringification of the tested expression).
6bab69c65013bed Rasmus Villemoes 2019-03-07  67   *
6bab69c65013bed Rasmus Villemoes 2019-03-07  68   * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
6bab69c65013bed Rasmus Villemoes 2019-03-07  69   * scope, but requires the expression to be an integer constant
6bab69c65013bed Rasmus Villemoes 2019-03-07  70   * expression (i.e., it is not enough that __builtin_constant_p() is
6bab69c65013bed Rasmus Villemoes 2019-03-07  71   * true for expr).
6bab69c65013bed Rasmus Villemoes 2019-03-07  72   *
6bab69c65013bed Rasmus Villemoes 2019-03-07  73   * Also note that BUILD_BUG_ON() fails the build if the condition is
6bab69c65013bed Rasmus Villemoes 2019-03-07  74   * true, while static_assert() fails the build if the expression is
6bab69c65013bed Rasmus Villemoes 2019-03-07  75   * false.
6bab69c65013bed Rasmus Villemoes 2019-03-07  76   */
6bab69c65013bed Rasmus Villemoes 2019-03-07  77  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013bed Rasmus Villemoes 2019-03-07 @78  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
6bab69c65013bed Rasmus Villemoes 2019-03-07  79  
07a368b3f55a79d Maxim Levitsky   2022-10-25  80  

:::::: The code at line 78 was first introduced by commit
:::::: 6bab69c65013bed5fce9f101a64a84d0385b3946 build_bug.h: add wrapper for _Static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
