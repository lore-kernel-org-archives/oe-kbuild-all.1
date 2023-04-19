Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC6615A8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 02:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681869745; x=1713405745;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IL+ahBP1YPTpd1/mRpZu82kJQru3Z8P8IcDUWW/bj1E=;
  b=jkTIpBZEvUmrugT3xJm0axyTlNOVCWYxW+p6nNAttl5LcFXrbLmD25ns
   ZM5s8TiFTRwykzuI10a4EZaivunDKKkUR3hwGVNerYmNfzVs7KD2zTK2l
   AQ5QdrXWU6ML/Y073MAkZYuVfHkILi8k1vA4V+cb+UNJyIqOjKbKiYMmo
   6yjOp+IkFWvpXxPWcjqAI7y/OklXBJpU3kBNMcrZc0SzA96lCna7fO2kt
   crYK2Pp0nBIuu+Or77Fjy+hBxAoyTJVlApGLu9NNX3GMBn9OO/6UlRaeh
   4iFqEO8svSNR+pdeK0Dk5MiGvf56gBC/i9RkmUJAIwDXavtBaSHt51eTW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="342815765"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="342815765"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 19:02:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="723886404"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="723886404"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 18 Apr 2023 19:02:23 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pox9K-000eMP-0v;
	Wed, 19 Apr 2023 02:02:22 +0000
Date: Wed, 19 Apr 2023 10:01:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:uprobe_multi 1/17] include/linux/trace_events.h:800:
 multiple definition of `bpf_uprobe_multi_link_attach';
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace_points.o:include/linux/trace_events.h:800:
 first defined here
Message-ID: <202304190939.J9N4T9aP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_multi
head:   663cc4c067c5af744475e3a7573e3cd5b4647ef3
commit: fe88ac2cbf6177d5ed19dd8a6f4cf7e066d6aa95 [1/17] bpf: Add multi uprobe link
config: xtensa-buildonly-randconfig-r003-20230418 (https://download.01.org/0day-ci/archive/20230419/202304190939.J9N4T9aP-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=fe88ac2cbf6177d5ed19dd8a6f4cf7e066d6aa95
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf uprobe_multi
        git checkout fe88ac2cbf6177d5ed19dd8a6f4cf7e066d6aa95
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304190939.J9N4T9aP-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o: in function `bpf_uprobe_multi_link_attach':
>> include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; drivers/gpu/drm/amd/amdgpu/amdgpu_trace_points.o:include/linux/trace_events.h:800: first defined here
   xtensa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.o: in function `bpf_uprobe_multi_link_attach':
>> include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; drivers/gpu/drm/amd/amdgpu/amdgpu_trace_points.o:include/linux/trace_events.h:800: first defined here


vim +800 include/linux/trace_events.h

   766	
   767	static inline int
   768	perf_event_query_prog_array(struct perf_event *event, void __user *info)
   769	{
   770		return -EOPNOTSUPP;
   771	}
   772	static inline int bpf_probe_register(struct bpf_raw_event_map *btp, struct bpf_prog *p)
   773	{
   774		return -EOPNOTSUPP;
   775	}
   776	static inline int bpf_probe_unregister(struct bpf_raw_event_map *btp, struct bpf_prog *p)
   777	{
   778		return -EOPNOTSUPP;
   779	}
   780	static inline struct bpf_raw_event_map *bpf_get_raw_tracepoint(const char *name)
   781	{
   782		return NULL;
   783	}
   784	static inline void bpf_put_raw_tracepoint(struct bpf_raw_event_map *btp)
   785	{
   786	}
   787	static inline int bpf_get_perf_event_info(const struct perf_event *event,
   788						  u32 *prog_id, u32 *fd_type,
   789						  const char **buf, u64 *probe_offset,
   790						  u64 *probe_addr)
   791	{
   792		return -EOPNOTSUPP;
   793	}
   794	static inline int
   795	bpf_kprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
   796	{
   797		return -EOPNOTSUPP;
   798	}
   799	int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
 > 800	{
   801		return -EOPNOTSUPP;
   802	}
   803	#endif
   804	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
