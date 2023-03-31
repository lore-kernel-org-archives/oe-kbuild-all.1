Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F38F79DE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Mar 2023 15:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680277186; x=1711813186;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C49tjHltEhYIEz4rdtKcbgjT4NPDeyK2QA1Ce4aIyng=;
  b=QIn95Jfd9YCnupr6A5ITgjN08gyihVsWavz5zPgyWzDtDjAwZbnLJw3a
   HZBlo8eOrQZGwLw+GsK0erykLhfCOnFd5Xg8coG9P5y6lBZ0U9x+AmlnI
   d8ZuYnjZkJd4x/pbond25u6qrZ2u/4WKq9i6CNN8BXMfa3Wmf/AsN13j1
   /yrG93SWCDnChEDd38G+1B8z5B37IKpQ9oeGKENClyNECMpZn4W7tszg5
   Rb8rZXS8SO6KmBnLgKwoTNg/yPqaCL133Dn138VMhFj0NVgbw83YvTexE
   mHfhQIrZaZCPJwxKRG2fyGAtt/M8mM24O7MxpWe8fDK09nQ3YHStwfCOE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="343146120"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="343146120"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 08:39:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="809089579"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="809089579"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 31 Mar 2023 08:39:44 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piGqt-000Luv-2X;
	Fri, 31 Mar 2023 15:39:43 +0000
Date: Fri, 31 Mar 2023 23:39:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:uprobe_multi 1/17] include/linux/trace_events.h:799:5:
 error: no previous prototype for 'bpf_uprobe_multi_link_attach'
Message-ID: <202303312324.YJqEtSvG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_multi
head:   a4cefc920ce5e8842528972431afe5da5d3050e4
commit: b2b3dad619677bba7de423e51dc4c297a4410c06 [1/17] bpf: Add multi uprobe link
config: sparc-defconfig (https://download.01.org/0day-ci/archive/20230331/202303312324.YJqEtSvG-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=b2b3dad619677bba7de423e51dc4c297a4410c06
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf uprobe_multi
        git checkout b2b3dad619677bba7de423e51dc4c297a4410c06
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303312324.YJqEtSvG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:88,
                    from arch/sparc/kernel/setup_32.c:24:
>> include/linux/trace_events.h:799:5: error: no previous prototype for 'bpf_uprobe_multi_link_attach' [-Werror=missing-prototypes]
     799 | int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/bpf_uprobe_multi_link_attach +799 include/linux/trace_events.h

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
 > 799	int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
   800	{
   801		return -EOPNOTSUPP;
   802	}
   803	#endif
   804	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
