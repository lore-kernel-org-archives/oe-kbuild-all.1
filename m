Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCD8210FB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jun 2025 23:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750462114; cv=none; b=XfKfNHtT01Q1XarVlExksDlVDwIVBpKigNCeMITNtnkCwm8YAAeOFYfmq010d+D5NfeK7awqcHXp/o/a5MMNDP0qwe+6moE9gu6l9hG7j2vQ+a6f3ITaYHwWWYKB90X+/cnDcVD6mPXtEMkbwyz8vnOfOz2FlHIFIZRV/vkZNgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750462114; c=relaxed/simple;
	bh=LEo9Va4Xv1RpxcWw44jcUZtQS9ivJF48GmQoyOwPS+k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sa290IkMsUgzXrWvtOA7kaZVVrw6mMcCQHv+t8fG28ERUAEb/7iGfGj1WJtXSCh9lhU1i/raOAWnyzlxv7IL68eND37reM79Q/lLciOuOSxtJbIk1z/worQAnuHVpwjpGZmP+wpa1hHQMYiqECVI/1dGsqjaEIOwwPM8xOWAO90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jOM9rAWV; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jOM9rAWV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750462113; x=1781998113;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LEo9Va4Xv1RpxcWw44jcUZtQS9ivJF48GmQoyOwPS+k=;
  b=jOM9rAWVP/a8o+SyTf4LwUcqdsrPdQrqpOZgnasyNb+/tWpjWkIGB2Ew
   K6wuJ73cp4N+jOeG4GdOEzgQFl3beUZUbyxhDsWhqIijhGH/cKKcXXuDc
   p2XnAzyGLyjsV1IAHlwMHrf3NH5i6iNykWZfPPjDB9car17jYtJ/p0lbK
   klAwhTUxliTtc44Wg480niHzumYhZnQtHiWgrZTvir25DRiDzreEdQpCB
   hOWt1h/o0tLl1NrrZkLbDnFOVLe47OW/HBHpFQYHCE5QeDdBZ2v2u9Eo3
   cuyKrqNmTG+GHvDb2yD/XfOe5y9S5xswQ7MNQwpLxD5qf+HL/s2i3ynMf
   w==;
X-CSE-ConnectionGUID: secDd80vTEGndqZV/UmcCA==
X-CSE-MsgGUID: O69NIBDkSqyBXNJ8WFEjug==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52879243"
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="52879243"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 16:28:32 -0700
X-CSE-ConnectionGUID: M5xVZKHbQQGeA/ZcpYDlNw==
X-CSE-MsgGUID: Ca9WFqJxT+u7AgWwmnF3xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="155049632"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Jun 2025 16:28:31 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSl9p-000MDi-0H;
	Fri, 20 Jun 2025 23:28:29 +0000
Date: Sat, 21 Jun 2025 07:28:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_1 11/22] include/linux/bpf.h:1468:51:
 warning: 'struct bpf_tramp_link' declared inside parameter list will not be
 visible outside of this definition or declaration
Message-ID: <202506210708.TnHlanSb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_1
head:   28441de17b08aa419e3a354e2940268a9078d418
commit: f8e555ac119698c2ea16bc6a8563d43d8ba2a589 [11/22] bpf: Rename bpf_tramp_link struct to bpf_tramp_node
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20250621/202506210708.TnHlanSb-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250621/202506210708.TnHlanSb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506210708.TnHlanSb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/perf_event.h:43,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:94,
                    from init/main.c:21:
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
>> include/linux/bpf.h:1468:51: warning: 'struct bpf_tramp_link' declared inside parameter list will not be visible outside of this definition or declaration
    1468 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                   ^~~~~~~~~~~~~~
   include/linux/bpf.h:1474:53: warning: 'struct bpf_tramp_link' declared inside parameter list will not be visible outside of this definition or declaration
    1474 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                     ^~~~~~~~~~~~~~
--
   In file included from include/linux/security.h:35,
                    from init/do_mounts.c:9:
>> include/linux/bpf.h:1468:51: warning: 'struct bpf_tramp_link' declared inside parameter list will not be visible outside of this definition or declaration
    1468 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                   ^~~~~~~~~~~~~~
   include/linux/bpf.h:1474:53: warning: 'struct bpf_tramp_link' declared inside parameter list will not be visible outside of this definition or declaration
    1474 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                     ^~~~~~~~~~~~~~
   In file included from include/linux/perf_event.h:43,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:94,
                    from init/do_mounts.h:5,
                    from init/do_mounts.c:29:
   include/linux/ftrace.h:575:5: warning: no previous prototype for 'register_ftrace_direct_hash' [-Wmissing-prototypes]
     575 | int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h:580:5: warning: no previous prototype for 'unregister_ftrace_direct_hash' [-Wmissing-prototypes]
     580 | int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h:585:5: warning: no previous prototype for 'modify_ftrace_direct_hash' [-Wmissing-prototypes]
     585 | int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/security.h:35,
                    from include/linux/fs_context.h:14,
                    from include/linux/pseudo_fs.h:4,
                    from kernel/resource.c:21:
>> include/linux/bpf.h:1468:51: warning: 'struct bpf_tramp_link' declared inside parameter list will not be visible outside of this definition or declaration
    1468 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                   ^~~~~~~~~~~~~~
   include/linux/bpf.h:1474:53: warning: 'struct bpf_tramp_link' declared inside parameter list will not be visible outside of this definition or declaration
    1474 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                     ^~~~~~~~~~~~~~


vim +1468 include/linux/bpf.h

75ccbef6369e94 Björn Töpel            2019-12-13  1433  
75ccbef6369e94 Björn Töpel            2019-12-13  1434  #define DEFINE_BPF_DISPATCHER(name)					\
c86df29d11dfba Peter Zijlstra         2022-11-03  1435  	__BPF_DISPATCHER_SC(name);					\
4f9087f16651ac Peter Zijlstra         2023-12-15  1436  	noinline __bpfcall unsigned int bpf_dispatcher_##name##_func(	\
75ccbef6369e94 Björn Töpel            2019-12-13  1437  		const void *ctx,					\
75ccbef6369e94 Björn Töpel            2019-12-13  1438  		const struct bpf_insn *insnsi,				\
af3f4134006bf3 Stanislav Fomichev     2022-06-28  1439  		bpf_func_t bpf_func)					\
75ccbef6369e94 Björn Töpel            2019-12-13  1440  	{								\
c86df29d11dfba Peter Zijlstra         2022-11-03  1441  		return __BPF_DISPATCHER_CALL(name);			\
75ccbef6369e94 Björn Töpel            2019-12-13  1442  	}								\
6a64037d4bf252 Björn Töpel            2020-03-12  1443  	EXPORT_SYMBOL(bpf_dispatcher_##name##_func);			\
6a64037d4bf252 Björn Töpel            2020-03-12  1444  	struct bpf_dispatcher bpf_dispatcher_##name =			\
18acb7fac22ff7 Peter Zijlstra         2022-11-03  1445  		BPF_DISPATCHER_INIT(bpf_dispatcher_##name);
dbe69b29988465 Jiri Olsa              2022-10-18  1446  
75ccbef6369e94 Björn Töpel            2019-12-13  1447  #define DECLARE_BPF_DISPATCHER(name)					\
6a64037d4bf252 Björn Töpel            2020-03-12  1448  	unsigned int bpf_dispatcher_##name##_func(			\
75ccbef6369e94 Björn Töpel            2019-12-13  1449  		const void *ctx,					\
75ccbef6369e94 Björn Töpel            2019-12-13  1450  		const struct bpf_insn *insnsi,				\
af3f4134006bf3 Stanislav Fomichev     2022-06-28  1451  		bpf_func_t bpf_func);					\
6a64037d4bf252 Björn Töpel            2020-03-12  1452  	extern struct bpf_dispatcher bpf_dispatcher_##name;
c86df29d11dfba Peter Zijlstra         2022-11-03  1453  
6a64037d4bf252 Björn Töpel            2020-03-12  1454  #define BPF_DISPATCHER_FUNC(name) bpf_dispatcher_##name##_func
6a64037d4bf252 Björn Töpel            2020-03-12  1455  #define BPF_DISPATCHER_PTR(name) (&bpf_dispatcher_##name)
75ccbef6369e94 Björn Töpel            2019-12-13  1456  void bpf_dispatcher_change_prog(struct bpf_dispatcher *d, struct bpf_prog *from,
75ccbef6369e94 Björn Töpel            2019-12-13  1457  				struct bpf_prog *to);
dba122fb5e122e Jiri Olsa              2020-03-12  1458  /* Called only from JIT-enabled code, so there's no need for stubs. */
7c8ce4ffb68467 Xu Kuohai              2024-11-12  1459  void bpf_image_ksym_init(void *data, unsigned int size, struct bpf_ksym *ksym);
7c8ce4ffb68467 Xu Kuohai              2024-11-12  1460  void bpf_image_ksym_add(struct bpf_ksym *ksym);
a108f7dcfa010e Jiri Olsa              2020-03-12  1461  void bpf_image_ksym_del(struct bpf_ksym *ksym);
dba122fb5e122e Jiri Olsa              2020-03-12  1462  void bpf_ksym_add(struct bpf_ksym *ksym);
dba122fb5e122e Jiri Olsa              2020-03-12  1463  void bpf_ksym_del(struct bpf_ksym *ksym);
3486bedd99196e Song Liu               2022-02-04  1464  int bpf_jit_charge_modmem(u32 size);
3486bedd99196e Song Liu               2022-02-04  1465  void bpf_jit_uncharge_modmem(u32 size);
f92c1e183604c2 Jiri Olsa              2021-12-08  1466  bool bpf_prog_has_trampoline(const struct bpf_prog *prog);
fec56f5890d93f Alexei Starovoitov     2019-11-14  1467  #else
f7e0beaf39d386 Kui-Feng Lee           2022-05-10 @1468  static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
d6083f040d5d8f Leon Hwang             2024-10-15  1469  					   struct bpf_trampoline *tr,
d6083f040d5d8f Leon Hwang             2024-10-15  1470  					   struct bpf_prog *tgt_prog)
fec56f5890d93f Alexei Starovoitov     2019-11-14  1471  {
fec56f5890d93f Alexei Starovoitov     2019-11-14  1472  	return -ENOTSUPP;
fec56f5890d93f Alexei Starovoitov     2019-11-14  1473  }
f7e0beaf39d386 Kui-Feng Lee           2022-05-10  1474  static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
d6083f040d5d8f Leon Hwang             2024-10-15  1475  					     struct bpf_trampoline *tr,
d6083f040d5d8f Leon Hwang             2024-10-15  1476  					     struct bpf_prog *tgt_prog)
fec56f5890d93f Alexei Starovoitov     2019-11-14  1477  {
fec56f5890d93f Alexei Starovoitov     2019-11-14  1478  	return -ENOTSUPP;
fec56f5890d93f Alexei Starovoitov     2019-11-14  1479  }
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  1480  static inline struct bpf_trampoline *bpf_trampoline_get(u64 key,
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  1481  							struct bpf_attach_target_info *tgt_info)
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  1482  {
b724a6418f1f85 Leon Hwang             2023-09-17  1483  	return NULL;
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  1484  }
fec56f5890d93f Alexei Starovoitov     2019-11-14  1485  static inline void bpf_trampoline_put(struct bpf_trampoline *tr) {}
75ccbef6369e94 Björn Töpel            2019-12-13  1486  #define DEFINE_BPF_DISPATCHER(name)
75ccbef6369e94 Björn Töpel            2019-12-13  1487  #define DECLARE_BPF_DISPATCHER(name)
6a64037d4bf252 Björn Töpel            2020-03-12  1488  #define BPF_DISPATCHER_FUNC(name) bpf_dispatcher_nop_func
75ccbef6369e94 Björn Töpel            2019-12-13  1489  #define BPF_DISPATCHER_PTR(name) NULL
75ccbef6369e94 Björn Töpel            2019-12-13  1490  static inline void bpf_dispatcher_change_prog(struct bpf_dispatcher *d,
75ccbef6369e94 Björn Töpel            2019-12-13  1491  					      struct bpf_prog *from,
75ccbef6369e94 Björn Töpel            2019-12-13  1492  					      struct bpf_prog *to) {}
e9b4e606c2289d Jiri Olsa              2020-01-23  1493  static inline bool is_bpf_image_address(unsigned long address)
e9b4e606c2289d Jiri Olsa              2020-01-23  1494  {
e9b4e606c2289d Jiri Olsa              2020-01-23  1495  	return false;
e9b4e606c2289d Jiri Olsa              2020-01-23  1496  }
f92c1e183604c2 Jiri Olsa              2021-12-08  1497  static inline bool bpf_prog_has_trampoline(const struct bpf_prog *prog)
f92c1e183604c2 Jiri Olsa              2021-12-08  1498  {
f92c1e183604c2 Jiri Olsa              2021-12-08  1499  	return false;
f92c1e183604c2 Jiri Olsa              2021-12-08  1500  }
fec56f5890d93f Alexei Starovoitov     2019-11-14  1501  #endif
fec56f5890d93f Alexei Starovoitov     2019-11-14  1502  

:::::: The code at line 1468 was first introduced by commit
:::::: f7e0beaf39d3868dc700d4954b26cf8443c5d423 bpf, x86: Generate trampolines from bpf_tramp_links

:::::: TO: Kui-Feng Lee <kuifeng@fb.com>
:::::: CC: Andrii Nakryiko <andrii@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
