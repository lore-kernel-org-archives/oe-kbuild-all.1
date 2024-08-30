Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22AC1B5EBF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Aug 2024 16:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725034704; cv=none; b=OyT8KDi7a0SaWBcu2XvHo3+Fixcz9GlwDaPKJ2tLPaMGllWCbYibdH5JsBLlEa+LBJ8S2qdg3tkgfKib03CssRJCxgnqciuf8TlqidA8po+fBhWIumVYzu9EbBp4DU8QjBgT25R6wgOoVAeP8mMsdPa7OUWz9cwmuFNbARX+Dk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725034704; c=relaxed/simple;
	bh=JCOqLvrLqOx3DNojy4FXBmVcn7BGm5zq+V6ecOYS73c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UxJ/AcXGXxk+RY1SZS+ihNy3NP5vtiwnQrFNeC2flqvqZBOj2c/NOrYM2vMQtA46BZQJZ3Yol6yKRGj4u3xsHoxFtrlaN/unNHrsZMUrHWMcejqza563XOgFppK/uQoUjJ4qtgaoN1lc4QBQIGm08kGHzxasHgfMh1fzgtrj64U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZlL699VS; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZlL699VS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725034702; x=1756570702;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JCOqLvrLqOx3DNojy4FXBmVcn7BGm5zq+V6ecOYS73c=;
  b=ZlL699VSQXit3SWAgC32784mXfVdFiwoh9/FegjD20ppKpQaanwT2b8h
   XejS9e0Q+pjy47p+aTdzU4yTpbhVeLjFtK5lIKFsDHVNqUxJ2peFQ/NVF
   vAZhD1VrcNXhTUcotEyw4ERjGhsY/gnNucvniN2M9IQUMhF9LtFs/ofIX
   skwtAnov/5eQSIKKKI2wL8LzkVZLwUI6zT1vMd9LMF0Bk7I00USqnT6VG
   QnHyDNw7KJ8x3E/HllzQW6fLN2VTDIDmL0Mmy6biHVSvI5jEwLhRVOV/x
   GzYqYIFcNrx3EQuKjY14qqzhNfGzb4Uf+vng4RzIHES+m+1c/tn/nreFJ
   A==;
X-CSE-ConnectionGUID: 4L4KQ2WVTBKJItPt2vIQfQ==
X-CSE-MsgGUID: kG3ygvuDS/itW6ShnMCbwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23201139"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="23201139"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 09:18:22 -0700
X-CSE-ConnectionGUID: n9AH2EjpT3uItkVQoWElZQ==
X-CSE-MsgGUID: /+BV2KMXRRuZacypThYJTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="64134781"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Aug 2024 09:18:17 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sk4KF-0001dQ-0I;
	Fri, 30 Aug 2024 16:18:15 +0000
Date: Sat, 31 Aug 2024 00:18:09 +0800
From: kernel test robot <lkp@intel.com>
To: Joe Damato <jdamato@fastly.com>, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, edumazet@google.com,
	amritha.nambiar@intel.com, sridhar.samudrala@intel.com,
	sdf@fomichev.me, bjorn@rivosinc.com, hch@infradead.org,
	willy@infradead.org, willemdebruijn.kernel@gmail.com,
	skhawaja@google.com, kuba@kernel.org,
	Joe Damato <jdamato@fastly.com>,
	Martin Karsten <mkarsten@uwaterloo.ca>,
	Paolo Abeni <pabeni@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Johannes Berg <johannes.berg@intel.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 3/5] net: napi: Make gro_flush_timeout per-NAPI
Message-ID: <202408310026.wxZySizP-lkp@intel.com>
References: <20240829131214.169977-4-jdamato@fastly.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829131214.169977-4-jdamato@fastly.com>

Hi Joe,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Joe-Damato/net-napi-Make-napi_defer_hard_irqs-per-NAPI/20240829-211617
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240829131214.169977-4-jdamato%40fastly.com
patch subject: [PATCH net-next 3/5] net: napi: Make gro_flush_timeout per-NAPI
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240831/202408310026.wxZySizP-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408310026.wxZySizP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408310026.wxZySizP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/minmax.h:5,
                    from include/linux/jiffies.h:8,
                    from include/net/pkt_sched.h:5,
                    from drivers/net/ethernet/intel/idpf/idpf.h:12,
                    from drivers/net/ethernet/intel/idpf/idpf_dev.c:4:
   include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct idpf_q_vector, __cacheline_group_end__read_write) - offsetofend(struct idpf_q_vector, __cacheline_group_begin__read_write) <= (424 + 2 * sizeof(struct dim))"
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
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:475:1: note: in expansion of macro 'libeth_cacheline_set_assert'
     475 | libeth_cacheline_set_assert(struct idpf_q_vector, 104,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct idpf_q_vector) <= ((((((104)) + ((__typeof__((104)))((256)) - 1)) & ~((__typeof__((104)))((256)) - 1)) + ((((424 + 2 * sizeof(struct dim))) + ((__typeof__((424 + 2 * sizeof(struct dim))))((256)) - 1)) & ~((__typeof__((424 + 2 * sizeof(struct dim))))((256)) - 1)) + ((((8 + sizeof(cpumask_var_t))) + ((__typeof__((8 + sizeof(cpumask_var_t))))((256)) - 1)) & ~((__typeof__((8 + sizeof(cpumask_var_t))))((256)) - 1))))"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/net/libeth/cache.h:28:9: note: in expansion of macro 'static_assert'
      28 |         static_assert(sizeof(type) <= (sz))
         |         ^~~~~~~~~~~~~
   include/net/libeth/cache.h:48:9: note: in expansion of macro '__libeth_cacheline_struct_assert'
      48 |         __libeth_cacheline_struct_assert(type, __libeth_cls(__VA_ARGS__));    \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:64:9: note: in expansion of macro 'libeth_cacheline_struct_assert'
      64 |         libeth_cacheline_struct_assert(type, ro, rw, c)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:475:1: note: in expansion of macro 'libeth_cacheline_set_assert'
     475 | libeth_cacheline_set_assert(struct idpf_q_vector, 104,
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
