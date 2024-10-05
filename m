Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D437A19BBC
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 06:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728110042; cv=none; b=f4YMcRJvCLSUt4EYbAWp4UmObIeGo4liXPfZvdF2+oKCzxk2qFD5NRVe7sLD4JOwGAAWVlkx6wIbYp4SWL9SXy/qcoMrIK16JuwbnhOYtxI/1aHAIPPVOA6mxGoRHDUJ2HEAK4JXDWAOamZa2u9jCOj1SDTEs3hGNsekucJYcm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728110042; c=relaxed/simple;
	bh=VqCYY2lSXVWvIwaLXBMRf5svg22m4hI3l2w66MyUxfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z4pihLemyowfqOicwGwOxmGJqTY5rC5FbLZoumKlBxMCpHppO/bMIDicfsnPKDwbhq8oXDW0UIwVkPoiUGRm47uMFiixJTV6YIpSwkoTbTWM5ly8kD8BH8grpVGxOGowca+l6M6FMoNbkuZhrjm+eHuxuP0V/xVs0nugvjofPi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KZq0uh7k; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KZq0uh7k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728110040; x=1759646040;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VqCYY2lSXVWvIwaLXBMRf5svg22m4hI3l2w66MyUxfQ=;
  b=KZq0uh7kHQE3thfinPsycFNdNEqDatP2axCdVPv2ZLeWYmVc82MnI0Pb
   1lIE/dMKpzwB1BS+QZ8MA3JdWAzee9VmGzuy0t6X/Vs/WrLxdO9+lYQzb
   1NpCzOP/LVlTdJ4q22AMxob1L8joqgV309OGUS2WZDDAHW6vgCNXdQmg6
   5APtDojRpxpXnZIEczwqQr1RwXXtdK/hsNDOTx4GarysjC6UkmOnu8pz5
   JSRVkYUYALHZTNhRax9BWcfVYJAZcdC1Ve+0Yi60EwQChcwb7IyNrGwK+
   SAiYBBHgGoqD5HtOQdCYAAA9XtLJ5G1BIdJs9BKjqH1CRfabJeznfQ/+Q
   w==;
X-CSE-ConnectionGUID: A3yKUsoTQs+ALL4WFULVGg==
X-CSE-MsgGUID: 3s1fTs61SrmBSXa7IaOMyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="26800021"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="26800021"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 23:33:59 -0700
X-CSE-ConnectionGUID: qT6IP3R2TGyskiy7sVj9Pw==
X-CSE-MsgGUID: DHN9ivzYSkq52wVv1z21fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="74749330"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Oct 2024 23:33:58 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swyMW-0002ec-00;
	Sat, 05 Oct 2024 06:33:56 +0000
Date: Sat, 5 Oct 2024 14:33:25 +0800
From: kernel test robot <lkp@intel.com>
To: Joe Damato <jdamato@fastly.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next v4 5/9] net: napi: Add napi_config
Message-ID: <202410051446.5XN3L5fU-lkp@intel.com>
References: <20241001235302.57609-6-jdamato@fastly.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001235302.57609-6-jdamato@fastly.com>

Hi Joe,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Joe-Damato/net-napi-Make-napi_defer_hard_irqs-per-NAPI/20241002-075725
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241001235302.57609-6-jdamato%40fastly.com
patch subject: [RFC net-next v4 5/9] net: napi: Add napi_config
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241005/202410051446.5XN3L5fU-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410051446.5XN3L5fU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051446.5XN3L5fU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/minmax.h:5,
                    from include/linux/jiffies.h:8,
                    from include/net/pkt_sched.h:5,
                    from drivers/net/ethernet/intel/idpf/idpf.h:12,
                    from drivers/net/ethernet/intel/idpf/idpf_dev.c:4:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct idpf_q_vector, __cacheline_group_end__read_write) - offsetofend(struct idpf_q_vector, __cacheline_group_begin__read_write) <= (440 + 2 * sizeof(struct dim))"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/net/libeth/cache.h:24:9: note: in expansion of macro 'static_assert'
      24 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -          \
         |         ^~~~~~~~~~~~~
   include/net/libeth/cache.h:62:9: note: in expansion of macro 'libeth_cacheline_group_assert'
      62 |         libeth_cacheline_group_assert(type, read_write, rw);                  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:440:1: note: in expansion of macro 'libeth_cacheline_set_assert'
     440 | libeth_cacheline_set_assert(struct idpf_q_vector, 112,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~


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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
