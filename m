Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76018830
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 11:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689764721; x=1721300721;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rkC4KxBqyI5mlc22OekhHoqbVP1n+ZPP2VjLfvWZrBc=;
  b=ahbAoLePgl4lUZtSELFUroXxY6AxUsgQzBF/M/mWrTP7rWsUhZviN9UP
   jvT+C6+k5mW6MDIVfPbM30+Om3FjL9miZtyYFapC7wIA0Ig+MlO6+Vlt0
   rrHYbmvpli21zxOveEwbSw8wkwcP1HpJy4mLZ2AmPDdJgoCP1azmmzJLM
   c/GpLCPLStv83WKGt4mZ7+A0+EJEpeecs4AqLD4rFAUaIeC9X51h6wbJa
   GljJWZ3yTnd6FEXYfyYksG17AROkNYOdc1Y2HWNq1FacmOJSCQcLDVQo+
   dW7e7gmJ8NwRS09JKVZ1DGDw7fsZSgHFJ57YtLRHry/oKYK1meo9WJ0Ax
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="366474038"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="366474038"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 04:05:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="753670485"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="753670485"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 19 Jul 2023 04:05:16 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM4za-0004hi-1Z;
	Wed, 19 Jul 2023 11:05:14 +0000
Date: Wed, 19 Jul 2023 19:04:40 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Marchevsky <davemarchevsky@fb.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 bpf-next 3/6] bpf: Add 'owner' field to
 bpf_{list,rb}_node
Message-ID: <202307191825.6GITlrdj-lkp@intel.com>
References: <20230718083813.3416104-4-davemarchevsky@fb.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718083813.3416104-4-davemarchevsky@fb.com>

Hi Dave,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Marchevsky/Revert-bpf-Disable-bpf_refcount_acquire-kfunc-calls-until-race-conditions-are-fixed/20230718-180801
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230718083813.3416104-4-davemarchevsky%40fb.com
patch subject: [PATCH v2 bpf-next 3/6] bpf: Add 'owner' field to bpf_{list,rb}_node
config: sparc64-randconfig-r091-20230717 (https://download.01.org/0day-ci/archive/20230719/202307191825.6GITlrdj-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191825.6GITlrdj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191825.6GITlrdj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/helpers.c: note: in included file (through arch/sparc/include/asm/cmpxchg.h, arch/sparc/include/asm/atomic_64.h, arch/sparc/include/asm/atomic.h, ...):
>> arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (eb9f becomes 9f)
>> arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (eb9f becomes 9f)
   kernel/bpf/helpers.c:2419:18: sparse: sparse: context imbalance in 'bpf_rcu_read_lock' - wrong count at exit
   kernel/bpf/helpers.c:2424:18: sparse: sparse: context imbalance in 'bpf_rcu_read_unlock' - unexpected unlock

vim +161 arch/sparc/include/asm/cmpxchg_64.h

d550bbd40c0e10 David Howells 2012-03-28  155  
d550bbd40c0e10 David Howells 2012-03-28  156  static inline unsigned long
d550bbd40c0e10 David Howells 2012-03-28  157  __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int size)
d550bbd40c0e10 David Howells 2012-03-28  158  {
d550bbd40c0e10 David Howells 2012-03-28  159  	switch (size) {
a12ee2349312d7 Babu Moger    2017-05-24  160  		case 1:
a12ee2349312d7 Babu Moger    2017-05-24 @161  			return __cmpxchg_u8(ptr, old, new);
d550bbd40c0e10 David Howells 2012-03-28  162  		case 4:
d550bbd40c0e10 David Howells 2012-03-28  163  			return __cmpxchg_u32(ptr, old, new);
d550bbd40c0e10 David Howells 2012-03-28  164  		case 8:
d550bbd40c0e10 David Howells 2012-03-28  165  			return __cmpxchg_u64(ptr, old, new);
d550bbd40c0e10 David Howells 2012-03-28  166  	}
d550bbd40c0e10 David Howells 2012-03-28  167  	__cmpxchg_called_with_bad_pointer();
d550bbd40c0e10 David Howells 2012-03-28  168  	return old;
d550bbd40c0e10 David Howells 2012-03-28  169  }
d550bbd40c0e10 David Howells 2012-03-28  170  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
