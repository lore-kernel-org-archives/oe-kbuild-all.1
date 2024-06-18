Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C18A15EFA3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jun 2024 23:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718754932; cv=none; b=FFMumqJEiZFaXqZjw5mJcGBOtAWQ4ysY2qZ/EhLhcVSjK0UfrVhEglRT5eci4fNOsSYu4NnVP86vlVfHoVgC/kXHGdQtgO0u4evN5bwfC3m0HY90RHxaLPDYmnuUnGH2cWSXZC3aD9QKWrrs1+1aA6aYF3U/KWjfKDp1NNhliyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718754932; c=relaxed/simple;
	bh=zXLcOd8f/IUUZWBIjRO5fkxslRG/F3OnbgS9d0uMKXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UEtiNFNpX9t+qeZE1+VUGHe4EsIGPctAepbrCL1IyptG0NJeRLLmsfs//WEz2k24spBt8WCICzVPHiWkth6VP/z6E+cZcrNKlGOqzNYKYFrESGNptU1zdImrKCZdOvN4IC9lf9XEdfVdtxfMIjw2r4K73iM2AmFrWRz/HDVWb2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OeRBXNyF; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OeRBXNyF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718754930; x=1750290930;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zXLcOd8f/IUUZWBIjRO5fkxslRG/F3OnbgS9d0uMKXg=;
  b=OeRBXNyFo6VII30C3k+Ct+fvqtzFma4ZVCwReAWW7lkJAX38riADdJCL
   d4wvwo/DT8lXHJBPK9Cdq5HLVACZTGs/QirzGp8m9Q1v8bBQZWIRXa1P+
   A+7AIUzF233up0k0ZY1NM66/F2tau2UYSQIez/EOCctbre8e7xlfDqhfl
   xKaVt4zcld76LQ1I4A2LJTrEiTXjAUTY+rNkikRUfQlCN6mPENR6XfqJ1
   ihzO8vRmWNewnvZdFYl6+WnQ595h2iGVquNbeqPARNuPlSWPuX7Dq4qwW
   PViLcy1xzWSoJDP1jZZ8tWVo7ULuR4ctiKyDcd2Bu9ytHtFFTghUbFeqw
   g==;
X-CSE-ConnectionGUID: g0GJMzCqSzmv56vW2KcgNQ==
X-CSE-MsgGUID: qvmnSX+CQ5OQaYfcmvzAKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="27086555"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="27086555"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 16:55:30 -0700
X-CSE-ConnectionGUID: djeRHtVPSXWB3YKZHEZGiA==
X-CSE-MsgGUID: LL6VSOT4THy4ys1LL4hZEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="72933203"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jun 2024 16:55:28 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJife-00062q-1n;
	Tue, 18 Jun 2024 23:55:26 +0000
Date: Wed, 19 Jun 2024 07:54:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, jani.nikula@intel.com
Subject: Re: [PATCH 5/5] drm/i915/frontbuffer: make struct intel_frontbuffer
 opaque
Message-ID: <202406190757.Uv3UaYyb-lkp@intel.com>
References: <ba2e3e16b5c47f7e6d434d8fa815e965458a98d5.1718633874.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba2e3e16b5c47f7e6d434d8fa815e965458a98d5.1718633874.git.jani.nikula@intel.com>

Hi Jani,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-intel/for-linux-next-fixes drm-tip/drm-tip drm-xe/drm-xe-next linus/master v6.10-rc4 next-20240618]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-i915-frontbuffer-un-inline-frontbuffer-bits-checks/20240617-223108
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/ba2e3e16b5c47f7e6d434d8fa815e965458a98d5.1718633874.git.jani.nikula%40intel.com
patch subject: [PATCH 5/5] drm/i915/frontbuffer: make struct intel_frontbuffer opaque
config: x86_64-randconfig-003-20240619 (https://download.01.org/0day-ci/archive/20240619/202406190757.Uv3UaYyb-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240619/202406190757.Uv3UaYyb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406190757.Uv3UaYyb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/err.h:5,
                    from include/linux/dma-fence.h:16,
                    from include/linux/dma-fence-array.h:15,
                    from drivers/gpu/drm/i915/i915_gem.c:28:
   drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.h: In function 'i915_gem_object_flush_frontbuffer':
>> include/linux/rcupdate.h:463:9: error: dereferencing pointer to incomplete type 'struct intel_frontbuffer'
     typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
            ^
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   include/linux/rcupdate.h:582:31: note: in expansion of macro '__rcu_access_pointer'
    #define rcu_access_pointer(p) __rcu_access_pointer((p), __UNIQUE_ID(rcu), __rcu)
                                  ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.h:24:15: note: in expansion of macro 'rcu_access_pointer'
     if (unlikely(rcu_access_pointer(obj->frontbuffer)))
                  ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.h: In function 'i915_gem_object_get_frontbuffer':
>> include/linux/rcupdate.h:463:9: error: dereferencing pointer to incomplete type 'struct intel_frontbuffer'
     typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
            ^
   include/linux/compiler.h:76:40: note: in definition of macro 'likely'
    # define likely(x) __builtin_expect(!!(x), 1)
                                           ^
   include/linux/rcupdate.h:582:31: note: in expansion of macro '__rcu_access_pointer'
    #define rcu_access_pointer(p) __rcu_access_pointer((p), __UNIQUE_ID(rcu), __rcu)
                                  ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.h:50:14: note: in expansion of macro 'rcu_access_pointer'
     if (likely(!rcu_access_pointer(obj->frontbuffer)))
                 ^~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/array_size.h:5,
                    from include/linux/kernel.h:16,
                    from include/linux/sched/mm.h:5,
                    from drivers/gpu/drm/i915/i915_vma.c:25:
   drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.h: In function 'i915_gem_object_flush_frontbuffer':
>> include/linux/rcupdate.h:463:9: error: dereferencing pointer to incomplete type 'struct intel_frontbuffer'
     typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
            ^
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   include/linux/rcupdate.h:582:31: note: in expansion of macro '__rcu_access_pointer'
    #define rcu_access_pointer(p) __rcu_access_pointer((p), __UNIQUE_ID(rcu), __rcu)
                                  ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.h:24:15: note: in expansion of macro 'rcu_access_pointer'
     if (unlikely(rcu_access_pointer(obj->frontbuffer)))
                  ^~~~~~~~~~~~~~~~~~


vim +463 include/linux/rcupdate.h

76c8eaafe4f061 Paul E. McKenney        2021-04-21  460  
24ba53017e188e Chun-Hung Tseng         2021-09-15  461  #define __rcu_access_pointer(p, local, space) \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  462  ({ \
24ba53017e188e Chun-Hung Tseng         2021-09-15 @463  	typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
423a86a610cad1 Joel Fernandes (Google  2018-12-12  464) 	rcu_check_sparse(p, space); \
24ba53017e188e Chun-Hung Tseng         2021-09-15  465  	((typeof(*p) __force __kernel *)(local)); \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  466  })
24ba53017e188e Chun-Hung Tseng         2021-09-15  467  #define __rcu_dereference_check(p, local, c, space) \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  468  ({ \
ac59853c06993a Pranith Kumar           2014-11-13  469  	/* Dependency order vs. p above. */ \
24ba53017e188e Chun-Hung Tseng         2021-09-15  470  	typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
f78f5b90c4ffa5 Paul E. McKenney        2015-06-18  471  	RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage"); \
423a86a610cad1 Joel Fernandes (Google  2018-12-12  472) 	rcu_check_sparse(p, space); \
24ba53017e188e Chun-Hung Tseng         2021-09-15  473  	((typeof(*p) __force __kernel *)(local)); \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  474  })
24ba53017e188e Chun-Hung Tseng         2021-09-15  475  #define __rcu_dereference_protected(p, local, c, space) \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  476  ({ \
f78f5b90c4ffa5 Paul E. McKenney        2015-06-18  477  	RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() usage"); \
423a86a610cad1 Joel Fernandes (Google  2018-12-12  478) 	rcu_check_sparse(p, space); \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  479  	((typeof(*p) __force __kernel *)(p)); \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  480  })
24ba53017e188e Chun-Hung Tseng         2021-09-15  481  #define __rcu_dereference_raw(p, local) \
995f1405610bd8 Paul E. McKenney        2016-07-01  482  ({ \
995f1405610bd8 Paul E. McKenney        2016-07-01  483  	/* Dependency order vs. p above. */ \
24ba53017e188e Chun-Hung Tseng         2021-09-15  484  	typeof(p) local = READ_ONCE(p); \
24ba53017e188e Chun-Hung Tseng         2021-09-15  485  	((typeof(*p) __force __kernel *)(local)); \
995f1405610bd8 Paul E. McKenney        2016-07-01  486  })
24ba53017e188e Chun-Hung Tseng         2021-09-15  487  #define rcu_dereference_raw(p) __rcu_dereference_raw(p, __UNIQUE_ID(rcu))
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  488  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
