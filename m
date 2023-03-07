Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA00BA48
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 18:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678212691; x=1709748691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xCyQ4QLgeYFTakubv9hWGmdhMhgtsnz85E8rJUczl1o=;
  b=g7kwEKkvARZv7gaFhmeulMpuPZ1CizfJqJf2GE4CD+1+zV3NzeWd4ta2
   CIyEAMB6qyCfMJR2+C53DVTxs0vj4UYn0VyWaJ1AdD+8xXB6a/o0CnNzR
   MZdnJPSpi0qjc0IOk1rnQoFAH3EJx8RVLAhru6jry6s4leWZhbCzmZlfu
   ObM9POd+24Zsm+z9TAHY1QLop1/mFiFocUciSxHSnOGV3rbqt/SuDss5K
   zDHd4STKjVa4ugaJQplbQN6mBg+hhOgSTTgan1Z+zLIrxbhhzOb3OJBGc
   9X7gnDc+HwtWjQektyQ3r8hqWWFti58s9eviC0d4/v+0h28e+zJzWix/Q
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="422202115"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="422202115"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 10:11:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="745583051"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="745583051"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Mar 2023 10:11:15 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZbmN-0001WE-12;
	Tue, 07 Mar 2023 18:11:15 +0000
Date: Wed, 8 Mar 2023 02:11:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:uprobe_multi_2 1/11] include/linux/trace_events.h:799:5:
 warning: no previous prototype for 'bpf_uprobe_multi_link_attach'
Message-ID: <202303080225.4hp6VKdd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_multi_2
head:   10c9ee1a8d9260b0588aa9afde019a886ac8a9fe
commit: 86797164e5e9eb54802e4a3a3d1a5648958a2a0f [1/11] bpf: Add multi uprobe link
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230308/202303080225.4hp6VKdd-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=86797164e5e9eb54802e4a3a3d1a5648958a2a0f
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf uprobe_multi_2
        git checkout 86797164e5e9eb54802e4a3a3d1a5648958a2a0f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303080225.4hp6VKdd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:88,
                    from kernel/bpf/syscall.c:11:
>> include/linux/trace_events.h:799:5: warning: no previous prototype for 'bpf_uprobe_multi_link_attach' [-Wmissing-prototypes]
     799 | int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
