Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7137DA66
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 06:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790920907; cv=none; b=G+4cGxhWWxyz6yyB2/bhzlvrgsYlMkZk5bWXiI+ei4Ihu+9k3MjgyxLrwwuby2dESF3e/EvNHnA1/pR+82Nzs4jSalo/Lqg3tRoeRIHwFUpvrq3Y8zYdPuH6h+PUg3IEqUrzfAKsEUJz4vfsgXpUfxXi0q/lWLv4kdi009yUGUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790920907; c=relaxed/simple;
	bh=iIrXkzHKeAxgXkpSqrAax3JLMJVyN3ijl4ZltSwBcIk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=skvNwTzLDlFkq7exHqphqurc4d5XRAGFOOjA780FCtYfIypfJ1HsuFJhJIMpRBuIETncL6qFS3VPG+Ei2gyHCOYLmR/9SdooOb9zoMV5X8aYL7R6AwySgSsRwv7GXzHfENkfssVZdzw+7B1wxj1MRA3Rzro7dPBsZC+qDcpll4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FZRlfOhs; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FZRlfOhs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790920904; x=1822456904;
  h=date:from:to:cc:subject:message-id;
  bh=iIrXkzHKeAxgXkpSqrAax3JLMJVyN3ijl4ZltSwBcIk=;
  b=FZRlfOhsY9tUFcRgJdmyE9V1Tab76hT8w9QJSvi0y8wH4RwMm5sQ25H2
   YFNh7ZFo2iyn6c0DTQ56DHaDF6ABbL7bupacfktXZ+Q3a78Q1V8uRvX5n
   Mb+SQ5XNVWlN233OM56ErX468y11BxbxLxI4mamQNHT0AoKC74v1W8j9D
   XLCHDothooJ/x+BDn3Ny8+wWvD1E80m8Oq3WHsREX6KrniSejklrg/2fe
   G3e0mw70Aegz1oN4h9ujQGq8X74ov/oWxqr7D1U7Tr4n3/RCl8EYReebr
   UxTcWPus+1Eh2lMJz1MKo8s+uwM69ItjGWoL92qmnvhLcUD2Oup/dcBQC
   A==;
X-CSE-ConnectionGUID: q+Hq4hmkSL2ulYB49Yg3dA==
X-CSE-MsgGUID: u92tHRCOSqGD3EqWC+9BtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="103060442"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="103060442"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 23:01:43 -0700
X-CSE-ConnectionGUID: RlwNQ1SZRCu7X1VfKdnU4w==
X-CSE-MsgGUID: NRsXt8sqTNGkkepR0WplKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="304135843"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 01 Oct 2026 23:01:42 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCWKy-000000000Qh-1J7f;
	Fri, 02 Oct 2026 06:01:40 +0000
Date: Fri, 02 Oct 2026 08:00:53 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:fermata 32/49] include/linux/rcupdate.h:504:9:
 error: dereferencing pointer to incomplete type 'struct bpf_waitq_kern'
Message-ID: <202610020742.Pz5YYv3f-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux fermata
head:   babde5051be3840becf5a78de91a0b68a99f0e49
commit: 43f503501754803751762d06e0ff50980b709ca0 [32/49] net: Let a BPF poller take over NAPI scheduling
config: sparc64-randconfig-2001-20261001 (https://download.01.org/0day-ci/archive/20261002/202610020742.Pz5YYv3f-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020742.Pz5YYv3f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020742.Pz5YYv3f-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/compiler_types.h:44,
                    from <command-line>:
   net/core/dev.c: In function 'napi_set_threaded':
>> include/linux/rcupdate.h:504:9: error: dereferencing pointer to incomplete type 'struct bpf_waitq_kern'
     typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
            ^
   include/linux/compiler-context-analysis.h:218:2: note: in definition of macro 'context_unsafe'
     __VA_ARGS__;   \
     ^~~~~~~~~~~
   include/linux/rcupdate.h:625:31: note: in expansion of macro '__rcu_access_pointer'
    #define rcu_access_pointer(p) __rcu_access_pointer((p), __UNIQUE_ID(rcu), __rcu)
                                  ^~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:7266:18: note: in expansion of macro 'rcu_access_pointer'
     if (threaded && rcu_access_pointer(napi->bpf_waitq))
                     ^~~~~~~~~~~~~~~~~~


vim +504 include/linux/rcupdate.h

76c8eaafe4f061 Paul E. McKenney        2021-04-21  501  
573d76f7db5ba0 Paul E. McKenney        2026-06-28  502  #define __rcu_access_pointer(p, local, space) context_unsafe( \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  503  ({ \
24ba53017e188e Chun-Hung Tseng         2021-09-15 @504  	typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
423a86a610cad1 Joel Fernandes (Google  2018-12-12  505) 	rcu_check_sparse(p, space); \
24ba53017e188e Chun-Hung Tseng         2021-09-15  506  	((typeof(*p) __force __kernel *)(local)); \
573d76f7db5ba0 Paul E. McKenney        2026-06-28  507  }) )
24ba53017e188e Chun-Hung Tseng         2021-09-15  508  #define __rcu_dereference_check(p, local, c, space) \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  509  ({ \
ac59853c06993a Pranith Kumar           2014-11-13  510  	/* Dependency order vs. p above. */ \
24ba53017e188e Chun-Hung Tseng         2021-09-15  511  	typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
f78f5b90c4ffa5 Paul E. McKenney        2015-06-18  512  	RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage"); \
423a86a610cad1 Joel Fernandes (Google  2018-12-12  513) 	rcu_check_sparse(p, space); \
24ba53017e188e Chun-Hung Tseng         2021-09-15  514  	((typeof(*p) __force __kernel *)(local)); \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  515  })
24ba53017e188e Chun-Hung Tseng         2021-09-15  516  #define __rcu_dereference_protected(p, local, c, space) \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  517  ({ \
f78f5b90c4ffa5 Paul E. McKenney        2015-06-18  518  	RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() usage"); \
423a86a610cad1 Joel Fernandes (Google  2018-12-12  519) 	rcu_check_sparse(p, space); \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  520  	((typeof(*p) __force __kernel *)(p)); \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  521  })
24ba53017e188e Chun-Hung Tseng         2021-09-15  522  #define __rcu_dereference_raw(p, local) \
995f1405610bd8 Paul E. McKenney        2016-07-01  523  ({ \
995f1405610bd8 Paul E. McKenney        2016-07-01  524  	/* Dependency order vs. p above. */ \
24ba53017e188e Chun-Hung Tseng         2021-09-15  525  	typeof(p) local = READ_ONCE(p); \
24ba53017e188e Chun-Hung Tseng         2021-09-15  526  	((typeof(*p) __force __kernel *)(local)); \
995f1405610bd8 Paul E. McKenney        2016-07-01  527  })
24ba53017e188e Chun-Hung Tseng         2021-09-15  528  #define rcu_dereference_raw(p) __rcu_dereference_raw(p, __UNIQUE_ID(rcu))
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  529  

:::::: The code at line 504 was first introduced by commit
:::::: 24ba53017e188e031f9cb8b290286fad52d2af00 rcu: Replace ________p1 and _________p1 with __UNIQUE_ID(rcu)

:::::: TO: Chun-Hung Tseng <henrybear327@gmail.com>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
