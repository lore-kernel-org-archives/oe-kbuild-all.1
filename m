Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1F119BBC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jun 2025 01:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750467764; cv=none; b=Zz3NA4zqiUiddDwQO3JlhGb+muehdVGYU9jiKIQhPbkdnXihtx4D4doVx2wzYTusoIhjLv7Qhif5Xw862IOiF1wcy5zWcqHuHxJMLpguWhuPBeyUJusZ2bHrMM0x+KsWBQq7F2z7skeBDtuYgXJaK/LWqwOxODnKF+nMbc/besE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750467764; c=relaxed/simple;
	bh=zyoezQlGclvySyC7qW0S+v6Iq71eaRj/BVIpPDqdi9E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RVFpBkx8SCwuIxocykIAQSrfjW+xCw79k6RqhidWXLvLQRsvN3+TVM4VJOIfgtWjJcZH7jawsEa4uErVlL/hJkN5mI0rJsKT5U3V8L2tcbt1mwfjL28Zc2x5nKvVi9J6RGg9AoeaPXLex5fw+FfepqH0qsiUFZBEQ3KuCkk0z7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QYAYRUcM; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QYAYRUcM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750467762; x=1782003762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zyoezQlGclvySyC7qW0S+v6Iq71eaRj/BVIpPDqdi9E=;
  b=QYAYRUcMPVIKhapLOFpSUKRkqT1051Y69hJ59xjsvmDhMSuKSeriKrxO
   vcsWM/iWO6cHxUBJ6L5a7hMvUDJtQ6s0VLYrfyoRzjwIz1ZroMa5TDWVc
   WqJ6+sHfmOckRJ+SXv9lm6nHF624G4DjH5uYiqBTh/m8RklfCCRczkHgh
   EvtKbkJBqk/PujN5IHEjIIOaOOij18aO7hHQrr+k6kNJy7fNb5paHGayR
   WJWjeun+URZePWmHoXifi8ukpBa3/CN7aj3WhhcRzBTCEwzwRL82Ldved
   e49GQUpm0KGCj79QwwJol2kyx5vAtRf2nqasqLozRvR+LgSZOHCHaX/4F
   Q==;
X-CSE-ConnectionGUID: Yk3Cxtq7SkqnSaRLaWoY6g==
X-CSE-MsgGUID: VGBwZO88TKm54gqlF9MAfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="78149163"
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="78149163"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 18:02:41 -0700
X-CSE-ConnectionGUID: eLNYqb7WQ3qZ4BCy4asboQ==
X-CSE-MsgGUID: OIz8gZ71TJWVUjvUIzR2LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="156860767"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Jun 2025 18:02:41 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSmcv-000MGQ-2d;
	Sat, 21 Jun 2025 01:02:37 +0000
Date: Sat, 21 Jun 2025 09:02:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_1 14/22]
 include/linux/trace_events.h:836:5: warning: no previous prototype for
 'bpf_tracing_multi_attach'
Message-ID: <202506210939.0Fn0s3Tt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_1
head:   28441de17b08aa419e3a354e2940268a9078d418
commit: 89a42c8698525b65373f65deb274eb0e24c5144c [14/22] bpf: Add support to create tracing multi link
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20250621/202506210939.0Fn0s3Tt-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250621/202506210939.0Fn0s3Tt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506210939.0Fn0s3Tt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/security.h:35,
                    from kernel/fork.c:52:
   include/linux/bpf.h:1474:51: warning: 'struct bpf_tramp_link' declared inside parameter list will not be visible outside of this definition or declaration
    1474 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                   ^~~~~~~~~~~~~~
   include/linux/bpf.h:1480:53: warning: 'struct bpf_tramp_link' declared inside parameter list will not be visible outside of this definition or declaration
    1480 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                     ^~~~~~~~~~~~~~
   In file included from include/linux/perf_event.h:43,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:94,
                    from kernel/fork.c:56:
   include/linux/ftrace.h:575:5: warning: no previous prototype for 'register_ftrace_direct_hash' [-Wmissing-prototypes]
     575 | int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h:580:5: warning: no previous prototype for 'unregister_ftrace_direct_hash' [-Wmissing-prototypes]
     580 | int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h:585:5: warning: no previous prototype for 'modify_ftrace_direct_hash' [-Wmissing-prototypes]
     585 | int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/trace_events.h:836:5: warning: no previous prototype for 'bpf_tracing_multi_attach' [-Wmissing-prototypes]
     836 | int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/perf_event.h:43,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:94,
                    from kernel/exec_domain.c:19:
   include/linux/ftrace.h:575:5: warning: no previous prototype for 'register_ftrace_direct_hash' [-Wmissing-prototypes]
     575 | int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h:580:5: warning: no previous prototype for 'unregister_ftrace_direct_hash' [-Wmissing-prototypes]
     580 | int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h:585:5: warning: no previous prototype for 'modify_ftrace_direct_hash' [-Wmissing-prototypes]
     585 | int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/security.h:35,
                    from include/linux/perf_event.h:53:
   include/linux/bpf.h:1474:51: warning: 'struct bpf_tramp_link' declared inside parameter list will not be visible outside of this definition or declaration
    1474 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                   ^~~~~~~~~~~~~~
   include/linux/bpf.h:1480:53: warning: 'struct bpf_tramp_link' declared inside parameter list will not be visible outside of this definition or declaration
    1480 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                     ^~~~~~~~~~~~~~
>> include/linux/trace_events.h:836:5: warning: no previous prototype for 'bpf_tracing_multi_attach' [-Wmissing-prototypes]
     836 | int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_tracing_multi_attach +836 include/linux/trace_events.h

   797	
   798	static inline int
   799	perf_event_query_prog_array(struct perf_event *event, void __user *info)
   800	{
   801		return -EOPNOTSUPP;
   802	}
   803	struct bpf_raw_tp_link;
   804	static inline int bpf_probe_register(struct bpf_raw_event_map *btp, struct bpf_raw_tp_link *link)
   805	{
   806		return -EOPNOTSUPP;
   807	}
   808	static inline int bpf_probe_unregister(struct bpf_raw_event_map *btp, struct bpf_raw_tp_link *link)
   809	{
   810		return -EOPNOTSUPP;
   811	}
   812	static inline struct bpf_raw_event_map *bpf_get_raw_tracepoint(const char *name)
   813	{
   814		return NULL;
   815	}
   816	static inline void bpf_put_raw_tracepoint(struct bpf_raw_event_map *btp)
   817	{
   818	}
   819	static inline int bpf_get_perf_event_info(const struct perf_event *event,
   820						  u32 *prog_id, u32 *fd_type,
   821						  const char **buf, u64 *probe_offset,
   822						  u64 *probe_addr, unsigned long *missed)
   823	{
   824		return -EOPNOTSUPP;
   825	}
   826	static inline int
   827	bpf_kprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
   828	{
   829		return -EOPNOTSUPP;
   830	}
   831	static inline int
   832	bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
   833	{
   834		return -EOPNOTSUPP;
   835	}
 > 836	int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr)
   837	{
   838		return -EOPNOTSUPP;
   839	}
   840	#endif
   841	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
