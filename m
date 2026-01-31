Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD60F25F98A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 04:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769834870; cv=none; b=p5i5Wr4hNpVO7sq431gg79+a/2A/zD2PXnaYqzHsm6IjkXayQM4muP/huxB4j6ffN36NHgXDMo8dj9JrVUFgtUxrDq7HZLrVZSFxF64n6b67LUpd+rkw9Mxywev7IXv3+wYI/fYo1hP2fYA8nJQrgXKSbT8CmYL7MKrwXS/TCfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769834870; c=relaxed/simple;
	bh=zyB1uWZSeTRjS2CX0NEk3wztSURTpLAyjPWCp/sY5OE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ENzJ+i21k1CPpMt37iTdQgeATNRgbAPvTRRnHsMesVMJpdRRMyUREfxIUqUTtP3A5ZYPdwNvNiQNzLz8zFX3Jtu+OSSFMdcd4QnCs+LCCIGvsjiRFQm5cOziX04XN6VzjBAnNKPxRt9dv0sClwDDsQlcS6apCaXSBr5EbhMQglA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QraI10NE; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QraI10NE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769834867; x=1801370867;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zyB1uWZSeTRjS2CX0NEk3wztSURTpLAyjPWCp/sY5OE=;
  b=QraI10NEBcqOISjckx/Wwbh7wlxZ9kSrbq/z7ceaHcVmTIUiye9eoGud
   uQjttvpaocFAWPpxWxxJiFbBYPgf3oUA8rrhMGTzzrF1XlkbecaCSkMFl
   f9ci+ANruJGkyirDYrC+f7OpdKDSc8uCTNliBJIdF6vN0pQeUzemXU57W
   YW4cANyQ5IHry5Bh1bqpZYn9vNQ/OqY3KoV8LdYcDKEdtd4FUx22VwWWn
   m4pH04p/3gszEQbYC2vBYnc+Xmyla2A0zoR5bLaw9MAtdqMdh3AY/YmgM
   wzOu4MkkLVJEGCsaYGfxXz0Ec8F4QOCkxSFsrgGluegyLjYaI8RT228pA
   Q==;
X-CSE-ConnectionGUID: Pkdyy9GdSyCs+yOPodykcA==
X-CSE-MsgGUID: jIkmOwebSQCXlVlBa6DRUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="96542537"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="96542537"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 20:47:46 -0800
X-CSE-ConnectionGUID: lvdse+4uQty8TrjAwuPrhA==
X-CSE-MsgGUID: uM4K2/YGTOua46UvJUAL0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="209416631"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Jan 2026 20:47:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm2tb-00000000deC-0YsB;
	Sat, 31 Jan 2026 04:47:43 +0000
Date: Sat, 31 Jan 2026 12:47:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_9 3/12]
 include/linux/bpf.h:1544:51: warning: 'struct bpf_tramp_link' declared inside
 parameter list will not be visible outside of this definition or declaration
Message-ID: <202601311247.COZv5YXK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/=
tracing_multi_9
head:   4a1d38e3df06743886a06b547187aec8023ef27d
commit: 79e86aac9eaf3b5bdb4db339fb6082022ef69eb9 [3/12] bpf: Add struct bpf=
_tramp_node object
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260131=
/202601311247.COZv5YXK-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260131/202601311247.COZv5YXK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601311247.COZv5YXK-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/security.h:35,
                    from include/linux/perf_event.h:53,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:96,
                    from include/linux/syscalls_api.h:1,
                    from kernel/sched/sched.h:61,
                    from kernel/sched/rq-offsets.c:5:
>> include/linux/bpf.h:1544:51: warning: 'struct bpf_tramp_link' declared i=
nside parameter list will not be visible outside of this definition or decl=
aration
    1544 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link=
 *link,
         |                                                   ^~~~~~~~~~~~~~
   include/linux/bpf.h:1550:53: warning: 'struct bpf_tramp_link' declared i=
nside parameter list will not be visible outside of this definition or decl=
aration
    1550 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_li=
nk *link,
         |                                                     ^~~~~~~~~~~~=
~~
--
   In file included from include/linux/security.h:35,
                    from include/linux/perf_event.h:53,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:96,
                    from include/linux/syscalls_api.h:1,
                    from kernel/sched/sched.h:61,
                    from kernel/sched/rq-offsets.c:5:
>> include/linux/bpf.h:1544:51: warning: 'struct bpf_tramp_link' declared i=
nside parameter list will not be visible outside of this definition or decl=
aration
    1544 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link=
 *link,
         |                                                   ^~~~~~~~~~~~~~
   include/linux/bpf.h:1550:53: warning: 'struct bpf_tramp_link' declared i=
nside parameter list will not be visible outside of this definition or decl=
aration
    1550 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_li=
nk *link,
         |                                                     ^~~~~~~~~~~~=
~~


vim +1544 include/linux/bpf.h

75ccbef6369e94 Bj=C3=B6rn T=C3=B6pel            2019-12-13  1508 =20
75ccbef6369e94 Bj=C3=B6rn T=C3=B6pel            2019-12-13  1509  #define D=
EFINE_BPF_DISPATCHER(name)					\
c86df29d11dfba Peter Zijlstra         2022-11-03  1510  	__BPF_DISPATCHER_S=
C(name);					\
4f9087f16651ac Peter Zijlstra         2023-12-15  1511  	noinline __bpfcall=
 unsigned int bpf_dispatcher_##name##_func(	\
75ccbef6369e94 Bj=C3=B6rn T=C3=B6pel            2019-12-13  1512  		const v=
oid *ctx,					\
75ccbef6369e94 Bj=C3=B6rn T=C3=B6pel            2019-12-13  1513  		const s=
truct bpf_insn *insnsi,				\
af3f4134006bf3 Stanislav Fomichev     2022-06-28  1514  		bpf_func_t bpf_fu=
nc)					\
75ccbef6369e94 Bj=C3=B6rn T=C3=B6pel            2019-12-13  1515  	{							=
	\
c86df29d11dfba Peter Zijlstra         2022-11-03  1516  		return __BPF_DISP=
ATCHER_CALL(name);			\
75ccbef6369e94 Bj=C3=B6rn T=C3=B6pel            2019-12-13  1517  	}							=
	\
6a64037d4bf252 Bj=C3=B6rn T=C3=B6pel            2020-03-12  1518  	EXPORT_S=
YMBOL(bpf_dispatcher_##name##_func);			\
6a64037d4bf252 Bj=C3=B6rn T=C3=B6pel            2020-03-12  1519  	struct b=
pf_dispatcher bpf_dispatcher_##name =3D			\
18acb7fac22ff7 Peter Zijlstra         2022-11-03  1520  		BPF_DISPATCHER_IN=
IT(bpf_dispatcher_##name);
dbe69b29988465 Jiri Olsa              2022-10-18  1521 =20
75ccbef6369e94 Bj=C3=B6rn T=C3=B6pel            2019-12-13  1522  #define D=
ECLARE_BPF_DISPATCHER(name)					\
6a64037d4bf252 Bj=C3=B6rn T=C3=B6pel            2020-03-12  1523  	unsigned=
 int bpf_dispatcher_##name##_func(			\
75ccbef6369e94 Bj=C3=B6rn T=C3=B6pel            2019-12-13  1524  		const v=
oid *ctx,					\
75ccbef6369e94 Bj=C3=B6rn T=C3=B6pel            2019-12-13  1525  		const s=
truct bpf_insn *insnsi,				\
af3f4134006bf3 Stanislav Fomichev     2022-06-28  1526  		bpf_func_t bpf_fu=
nc);					\
6a64037d4bf252 Bj=C3=B6rn T=C3=B6pel            2020-03-12  1527  	extern s=
truct bpf_dispatcher bpf_dispatcher_##name;
c86df29d11dfba Peter Zijlstra         2022-11-03  1528 =20
6a64037d4bf252 Bj=C3=B6rn T=C3=B6pel            2020-03-12  1529  #define B=
PF_DISPATCHER_FUNC(name) bpf_dispatcher_##name##_func
6a64037d4bf252 Bj=C3=B6rn T=C3=B6pel            2020-03-12  1530  #define B=
PF_DISPATCHER_PTR(name) (&bpf_dispatcher_##name)
75ccbef6369e94 Bj=C3=B6rn T=C3=B6pel            2019-12-13  1531  void bpf_=
dispatcher_change_prog(struct bpf_dispatcher *d, struct bpf_prog *from,
75ccbef6369e94 Bj=C3=B6rn T=C3=B6pel            2019-12-13  1532  				struc=
t bpf_prog *to);
dba122fb5e122e Jiri Olsa              2020-03-12  1533  /* Called only from=
 JIT-enabled code, so there's no need for stubs. */
7c8ce4ffb68467 Xu Kuohai              2024-11-12  1534  void bpf_image_ksym=
_init(void *data, unsigned int size, struct bpf_ksym *ksym);
7c8ce4ffb68467 Xu Kuohai              2024-11-12  1535  void bpf_image_ksym=
_add(struct bpf_ksym *ksym);
a108f7dcfa010e Jiri Olsa              2020-03-12  1536  void bpf_image_ksym=
_del(struct bpf_ksym *ksym);
dba122fb5e122e Jiri Olsa              2020-03-12  1537  void bpf_ksym_add(s=
truct bpf_ksym *ksym);
dba122fb5e122e Jiri Olsa              2020-03-12  1538  void bpf_ksym_del(s=
truct bpf_ksym *ksym);
ca45c84afb8c91 Josh Poimboeuf         2025-12-03  1539  bool bpf_has_frame_=
pointer(unsigned long ip);
3486bedd99196e Song Liu               2022-02-04  1540  int bpf_jit_charge_=
modmem(u32 size);
3486bedd99196e Song Liu               2022-02-04  1541  void bpf_jit_unchar=
ge_modmem(u32 size);
f92c1e183604c2 Jiri Olsa              2021-12-08  1542  bool bpf_prog_has_t=
rampoline(const struct bpf_prog *prog);
fec56f5890d93f Alexei Starovoitov     2019-11-14  1543  #else
f7e0beaf39d386 Kui-Feng Lee           2022-05-10 @1544  static inline int b=
pf_trampoline_link_prog(struct bpf_tramp_link *link,
d6083f040d5d8f Leon Hwang             2024-10-15  1545  					   struct bpf_=
trampoline *tr,
d6083f040d5d8f Leon Hwang             2024-10-15  1546  					   struct bpf_=
prog *tgt_prog)
fec56f5890d93f Alexei Starovoitov     2019-11-14  1547  {
fec56f5890d93f Alexei Starovoitov     2019-11-14  1548  	return -ENOTSUPP;
fec56f5890d93f Alexei Starovoitov     2019-11-14  1549  }
f7e0beaf39d386 Kui-Feng Lee           2022-05-10  1550  static inline int b=
pf_trampoline_unlink_prog(struct bpf_tramp_link *link,
d6083f040d5d8f Leon Hwang             2024-10-15  1551  					     struct bp=
f_trampoline *tr,
d6083f040d5d8f Leon Hwang             2024-10-15  1552  					     struct bp=
f_prog *tgt_prog)
fec56f5890d93f Alexei Starovoitov     2019-11-14  1553  {
fec56f5890d93f Alexei Starovoitov     2019-11-14  1554  	return -ENOTSUPP;
fec56f5890d93f Alexei Starovoitov     2019-11-14  1555  }
f7b12b6fea0098 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-25  1556  static in=
line struct bpf_trampoline *bpf_trampoline_get(u64 key,
f7b12b6fea0098 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-25  1557  							st=
ruct bpf_attach_target_info *tgt_info)
f7b12b6fea0098 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-25  1558  {
b724a6418f1f85 Leon Hwang             2023-09-17  1559  	return NULL;
f7b12b6fea0098 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-25  1560  }
fec56f5890d93f Alexei Starovoitov     2019-11-14  1561  static inline void =
bpf_trampoline_put(struct bpf_trampoline *tr) {}
75ccbef6369e94 Bj=C3=B6rn T=C3=B6pel            2019-12-13  1562  #define D=
EFINE_BPF_DISPATCHER(name)
75ccbef6369e94 Bj=C3=B6rn T=C3=B6pel            2019-12-13  1563  #define D=
ECLARE_BPF_DISPATCHER(name)
6a64037d4bf252 Bj=C3=B6rn T=C3=B6pel            2020-03-12  1564  #define B=
PF_DISPATCHER_FUNC(name) bpf_dispatcher_nop_func
75ccbef6369e94 Bj=C3=B6rn T=C3=B6pel            2019-12-13  1565  #define B=
PF_DISPATCHER_PTR(name) NULL
75ccbef6369e94 Bj=C3=B6rn T=C3=B6pel            2019-12-13  1566  static in=
line void bpf_dispatcher_change_prog(struct bpf_dispatcher *d,
75ccbef6369e94 Bj=C3=B6rn T=C3=B6pel            2019-12-13  1567  					    =
  struct bpf_prog *from,
75ccbef6369e94 Bj=C3=B6rn T=C3=B6pel            2019-12-13  1568  					    =
  struct bpf_prog *to) {}
e9b4e606c2289d Jiri Olsa              2020-01-23  1569  static inline bool =
is_bpf_image_address(unsigned long address)
e9b4e606c2289d Jiri Olsa              2020-01-23  1570  {
e9b4e606c2289d Jiri Olsa              2020-01-23  1571  	return false;
e9b4e606c2289d Jiri Olsa              2020-01-23  1572  }
f92c1e183604c2 Jiri Olsa              2021-12-08  1573  static inline bool =
bpf_prog_has_trampoline(const struct bpf_prog *prog)
f92c1e183604c2 Jiri Olsa              2021-12-08  1574  {
f92c1e183604c2 Jiri Olsa              2021-12-08  1575  	return false;
f92c1e183604c2 Jiri Olsa              2021-12-08  1576  }
fec56f5890d93f Alexei Starovoitov     2019-11-14  1577  #endif
fec56f5890d93f Alexei Starovoitov     2019-11-14  1578 =20

:::::: The code at line 1544 was first introduced by commit
:::::: f7e0beaf39d3868dc700d4954b26cf8443c5d423 bpf, x86: Generate trampoli=
nes from bpf_tramp_links

:::::: TO: Kui-Feng Lee <kuifeng@fb.com>
:::::: CC: Andrii Nakryiko <andrii@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
