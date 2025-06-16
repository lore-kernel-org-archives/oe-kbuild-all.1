Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AE1289E3C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jun 2025 18:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750100389; cv=none; b=iizOJo4OkrTGqjBuskRE8/6babI8FZju/N2ctw5/owKBRYUS7T0a1LUWj5FITwVJLkUeXh7pLGb+Zi3q5cFZliTCuhvEFl+PDPznNua2gGCf8dBDuicE98QouTAjEvU7lRRHEH0962CkfyIUCqijuHxHZhkjkiyOL3RQdT/qbTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750100389; c=relaxed/simple;
	bh=uKYOpAI2jXyCu6urtiQtvFq09DW7VkuHlno1YUhsrLg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b77Ur2g0xuayo4/rrqamxMG6NdQ/FhFYto3nmwXcvk/Db5mNzePssRuKwer4O+0LuKMWu31Mm7RZW95Vmxx8ZSW/kqaS7iaCPMcz6oeJaxZv1EDJ0qveLI2hE6qQWvxsuy6YdEpfHdpVmeVpAbvaCgLtaBT9v2tAqEzcI9wwhl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J6b0hu15; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J6b0hu15"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750100388; x=1781636388;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uKYOpAI2jXyCu6urtiQtvFq09DW7VkuHlno1YUhsrLg=;
  b=J6b0hu15WsdrdgqRAfoa1d8zkn1tMV+shlXqgoVa1KlJ4JZ1J8w21dsm
   8sKg5kv7rGlIn8g1kaS1VZOf59VLlszApuyTyOYTG0aKwgfwWSBUcSupa
   kiCtBSuVQ2j3+hsxgFJ8kQrJ6CD/fN/tCvT8jTx+GJ0ngVVIRmr6as3Fg
   K2fsgQtPkalTFvuIGomDcFEWgyWb+Fsm9m9RRNexWcCqnyQip4Vc34J+4
   Q/V4rHG5p9OfU7Qwg/X0dHgwURrwXb/6nH2LXfx6cGSoWWrutDC4rXJbg
   t/D8ePfnpN2yBjdokzsF0SuUIUPeFNZiUyMe6IehZ0pI2jFIwekwmkEmV
   g==;
X-CSE-ConnectionGUID: NcscBIu4Rc2urbL7uhktIw==
X-CSE-MsgGUID: 2XuGMbGCQciyBMNgKxYlxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52122229"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="52122229"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 11:59:46 -0700
X-CSE-ConnectionGUID: pXVtbCAFRvy/DD4NKHSapQ==
X-CSE-MsgGUID: js9yODG6TTSClpQ31csS2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="152388797"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 Jun 2025 11:59:45 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRF3X-000FHA-1i;
	Mon, 16 Jun 2025 18:59:43 +0000
Date: Tue, 17 Jun 2025 02:58:51 +0800
From: kernel test robot <lkp@intel.com>
To: stephen.smalley.work@gmail.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ssmalley-selinuxns:working-selinuxns 44/46]
 include/linux/rcupdate.h:532:9: error: dereferencing pointer to incomplete
 type 'struct selinux_policy'
Message-ID: <202506170231.XPJ4jn89-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/stephensmalley/selinux-kernel working-selinuxns
head:   32bf472b1e62da0bd0ca392a257430db55e75f70
commit: 66c448df995fb8d6c5c9a4875efc0ab56a5dd21d [44/46] selinux: fix incorrect __rcu annotation for selinux_policy_free()
config: xtensa-randconfig-002-20250616 (https://download.01.org/0day-ci/archive/20250617/202506170231.XPJ4jn89-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506170231.XPJ4jn89-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506170231.XPJ4jn89-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/rculist.h:11,
                    from include/linux/sched/signal.h:5,
                    from security/selinux/hooks.c:29:
   security/selinux/hooks.c: In function 'selinux_state_free':
>> include/linux/rcupdate.h:532:9: error: dereferencing pointer to incomplete type 'struct selinux_policy'
     typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
            ^
   include/linux/rcupdate.h:680:2: note: in expansion of macro '__rcu_dereference_check'
     __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
     ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:752:28: note: in expansion of macro 'rcu_dereference_check'
    #define rcu_dereference(p) rcu_dereference_check(p, 0)
                               ^~~~~~~~~~~~~~~~~~~~~
   security/selinux/hooks.c:7888:23: note: in expansion of macro 'rcu_dereference'
      selinux_policy_free(rcu_dereference(state->policy));
                          ^~~~~~~~~~~~~~~


vim +532 include/linux/rcupdate.h

76c8eaafe4f061 Paul E. McKenney        2021-04-21  522  
24ba53017e188e Chun-Hung Tseng         2021-09-15  523  #define __rcu_access_pointer(p, local, space) \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  524  ({ \
24ba53017e188e Chun-Hung Tseng         2021-09-15  525  	typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
423a86a610cad1 Joel Fernandes (Google  2018-12-12  526) 	rcu_check_sparse(p, space); \
24ba53017e188e Chun-Hung Tseng         2021-09-15  527  	((typeof(*p) __force __kernel *)(local)); \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  528  })
24ba53017e188e Chun-Hung Tseng         2021-09-15  529  #define __rcu_dereference_check(p, local, c, space) \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  530  ({ \
ac59853c06993a Pranith Kumar           2014-11-13  531  	/* Dependency order vs. p above. */ \
24ba53017e188e Chun-Hung Tseng         2021-09-15 @532  	typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
f78f5b90c4ffa5 Paul E. McKenney        2015-06-18  533  	RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage"); \
423a86a610cad1 Joel Fernandes (Google  2018-12-12  534) 	rcu_check_sparse(p, space); \
24ba53017e188e Chun-Hung Tseng         2021-09-15  535  	((typeof(*p) __force __kernel *)(local)); \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  536  })
24ba53017e188e Chun-Hung Tseng         2021-09-15  537  #define __rcu_dereference_protected(p, local, c, space) \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  538  ({ \
f78f5b90c4ffa5 Paul E. McKenney        2015-06-18  539  	RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() usage"); \
423a86a610cad1 Joel Fernandes (Google  2018-12-12  540) 	rcu_check_sparse(p, space); \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  541  	((typeof(*p) __force __kernel *)(p)); \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  542  })
24ba53017e188e Chun-Hung Tseng         2021-09-15  543  #define __rcu_dereference_raw(p, local) \
995f1405610bd8 Paul E. McKenney        2016-07-01  544  ({ \
995f1405610bd8 Paul E. McKenney        2016-07-01  545  	/* Dependency order vs. p above. */ \
24ba53017e188e Chun-Hung Tseng         2021-09-15  546  	typeof(p) local = READ_ONCE(p); \
24ba53017e188e Chun-Hung Tseng         2021-09-15  547  	((typeof(*p) __force __kernel *)(local)); \
995f1405610bd8 Paul E. McKenney        2016-07-01  548  })
24ba53017e188e Chun-Hung Tseng         2021-09-15  549  #define rcu_dereference_raw(p) __rcu_dereference_raw(p, __UNIQUE_ID(rcu))
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  550  

:::::: The code at line 532 was first introduced by commit
:::::: 24ba53017e188e031f9cb8b290286fad52d2af00 rcu: Replace ________p1 and _________p1 with __UNIQUE_ID(rcu)

:::::: TO: Chun-Hung Tseng <henrybear327@gmail.com>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
