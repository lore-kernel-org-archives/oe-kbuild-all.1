Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA8E3C31
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 12:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678279667; x=1709815667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f6cNZslJUe9AyrXBHDUThLeDc6mgfFdwuGRKRvjk7UM=;
  b=VMJOzkN+fxC8OoBv/EKqu1y66ubY//iXGU7TFh2ba9uKbiNOiPWJFXZw
   6CJa8K8XaXrPUwxB1oof47d3QjiUTrsxLl7I0QnhEvYheZa3uum5GRZFA
   ChuPCTWZV7oqATF8TBSt3cJq7ICN47yGBy6Xxlg485ufqZO5aFBIea48L
   ZmlGeNksRNON1V3OUkHVxlZBJV5shAXQkIA+Jixs4h/qTkC5TLFU7G6RR
   EcXK7q6thQxVSHOKCvFx2F9yvhoEk6U2xhdMuyfS7ADVxwgC8somUIAl+
   3gaHPgWGjiIaGo36hA+vTop+SV1QcpV45wxMQ2I/01oCoeUwRE+ULMeOt
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="334854891"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="334854891"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 04:47:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="851070643"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="851070643"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 08 Mar 2023 04:47:45 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZtCq-00028Q-35;
	Wed, 08 Mar 2023 12:47:44 +0000
Date: Wed, 8 Mar 2023 20:47:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:uprobe_multi_2 1/11] include/linux/trace_events.h:799:5:
 error: no previous prototype for 'bpf_uprobe_multi_link_attach'
Message-ID: <202303082013.ZlsLJZSx-lkp@intel.com>
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
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230308/202303082013.ZlsLJZSx-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=86797164e5e9eb54802e4a3a3d1a5648958a2a0f
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf uprobe_multi_2
        git checkout 86797164e5e9eb54802e4a3a3d1a5648958a2a0f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/kernel/ptrace/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303082013.ZlsLJZSx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:88,
                    from arch/powerpc/kernel/ptrace/ptrace.c:22:
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
