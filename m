Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8E91FBB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Apr 2023 13:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681479213; x=1713015213;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nubuP+W5WL0PCfez4KQ3Is8TzLqhbsIN3g9bMLgFfEI=;
  b=gL+yXU4q6hgtZiakTVrsMQGZ0RLwdoNR1qs80sbIUuOouIBGRdf5k49z
   PR8etoGDdoakWW9l3hQCbqxKR03Mqp8pklSWvJiszgwVVvZZ2sNuTFjLb
   1YHUyJV5ERUNO++k0S6V0/q0Dm+HyZpwb+MSBYttvMe5dVGxl6i+faeNY
   e+q17+cfwCmUKnBqsLWYmepmxmPxJ+BPnYrNuWzk8ZApND6f08TLLm8en
   PZ9Wzc/+nnIiY17zSD/MZu1Jmxhomyao+Sc4sLyvGrtomakoSGLPS9KqC
   qi37MP0wInnHN5raqJer25bu4Ixd9OyRg8Yu/lX9n2DIKu9GEiDVMO63b
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="324815738"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="324815738"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 06:33:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="813873022"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="813873022"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 14 Apr 2023 06:33:31 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnJYQ-000ZZC-1S;
	Fri, 14 Apr 2023 13:33:30 +0000
Date: Fri, 14 Apr 2023 21:33:27 +0800
From: kernel test robot <lkp@intel.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/5] perf: Add fork to the sideband ioctl
Message-ID: <202304142105.MjfwYVLq-lkp@intel.com>
References: <20230414082300.34798-3-adrian.hunter@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230414082300.34798-3-adrian.hunter@intel.com>

Hi Adrian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on acme/perf/core]
[also build test WARNING on tip/perf/core tip/master tip/auto-latest linus/master v6.3-rc6 next-20230413]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Adrian-Hunter/perf-Add-ioctl-to-emit-sideband-events/20230414-162719
base:   https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git perf/core
patch link:    https://lore.kernel.org/r/20230414082300.34798-3-adrian.hunter%40intel.com
patch subject: [PATCH RFC 2/5] perf: Add fork to the sideband ioctl
config: x86_64-randconfig-s023 (https://download.01.org/0day-ci/archive/20230414/202304142105.MjfwYVLq-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/48bf5fef7be6160c89995b4f98ffed4312999e96
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Adrian-Hunter/perf-Add-ioctl-to-emit-sideband-events/20230414-162719
        git checkout 48bf5fef7be6160c89995b4f98ffed4312999e96
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/events/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304142105.MjfwYVLq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/events/core.c:1375:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1375:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:1375:15: sparse:    struct perf_event_context *
   kernel/events/core.c:1388:28: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1388:28: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:1388:28: sparse:    struct perf_event_context *
   kernel/events/core.c:3460:20: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3460:20: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3460:20: sparse:    struct perf_event_context *
   kernel/events/core.c:3464:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3464:18: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3464:18: sparse:    struct perf_event_context *
   kernel/events/core.c:3465:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3465:23: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3465:23: sparse:    struct perf_event_context *
   kernel/events/core.c:3514:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3514:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3514:25: sparse:    struct perf_event_context *
   kernel/events/core.c:3515:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3515:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3515:25: sparse:    struct perf_event_context *
   kernel/events/core.c:3914:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3914:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3914:15: sparse:    struct perf_event_context *
   kernel/events/core.c:4306:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4306:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:4306:15: sparse:    struct perf_event_context *
   kernel/events/core.c:4785:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4785:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:4785:25: sparse:    struct perf_event_context *
   kernel/events/core.c:6170:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6170:9: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6170:9: sparse:    struct perf_buffer *
   kernel/events/core.c:5637:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __poll_t [usertype] events @@     got int @@
   kernel/events/core.c:5882:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:5882:22: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:5882:22: sparse:    struct perf_buffer *
   kernel/events/core.c:6010:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6010:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6010:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6043:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6043:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6043:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6100:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6100:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6100:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6191:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6191:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6191:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6207:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6207:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6207:14: sparse:    struct perf_buffer *
   kernel/events/core.c:7943:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:7943:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:7943:15: sparse:    struct perf_event_context *
>> kernel/events/core.c:7975:6: sparse: sparse: symbol 'perf_output_f_wrapper' was not declared. Should it be static?
   kernel/events/core.c:8078:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8078:13: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:8078:13: sparse:    struct perf_buffer *
   kernel/events/core.c:8181:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/events/core.c:8181:61: sparse:     expected struct task_struct *p
   kernel/events/core.c:8181:61: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/events/core.c:8183:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/events/core.c:8183:61: sparse:     expected struct task_struct *p
   kernel/events/core.c:8183:61: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/events/core.c:8186:79: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/events/core.c:8186:79: sparse:     expected struct task_struct *p
   kernel/events/core.c:8186:79: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/events/core.c:8187:79: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/events/core.c:8187:79: sparse:     expected struct task_struct *p
   kernel/events/core.c:8187:79: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/events/core.c:8889:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8889:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:8889:15: sparse:    struct perf_event_context *
   kernel/events/core.c:9929:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9929:9: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9929:9: sparse:    struct swevent_hlist *
   kernel/events/core.c:9968:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9968:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9968:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:10224:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10224:23: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:10224:23: sparse:    struct perf_event_context *
   kernel/events/core.c:11335:1: sparse: sparse: symbol 'dev_attr_nr_addr_filters' was not declared. Should it be static?
   kernel/events/core.c:13160:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13160:9: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:13160:9: sparse:    struct perf_event_context *
   kernel/events/core.c:13254:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13254:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:13254:15: sparse:    struct perf_event_context *
   kernel/events/core.c:13266:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13266:9: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:13266:9: sparse:    struct perf_event_context *
   kernel/events/core.c:13687:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13687:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:13687:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:162:9: sparse: sparse: context imbalance in 'perf_ctx_lock' - wrong count at exit
   kernel/events/core.c:170:17: sparse: sparse: context imbalance in 'perf_ctx_unlock' - unexpected unlock
   kernel/events/core.c: note: in included file (through include/linux/rculist.h, include/linux/dcache.h, include/linux/fs.h):
   include/linux/rcupdate.h:802:9: sparse: sparse: context imbalance in 'perf_lock_task_context' - different lock contexts for basic block
   kernel/events/core.c:1422:17: sparse: sparse: context imbalance in 'perf_pin_task_context' - unexpected unlock
   kernel/events/core.c:2775:9: sparse: sparse: context imbalance in '__perf_install_in_context' - wrong count at exit
   kernel/events/core.c:4759:17: sparse: sparse: context imbalance in 'find_get_context' - unexpected unlock
   kernel/events/core.c: note: in included file:
   kernel/events/internal.h:209:1: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *buf @@
   kernel/events/core.c:9778:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9778:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9778:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:9798:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9798:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9798:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:9918:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9918:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9918:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:9918:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9918:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9918:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:9918:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9918:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9918:16: sparse:    struct swevent_hlist *

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
