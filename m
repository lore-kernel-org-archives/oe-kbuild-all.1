Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420052749DF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 04:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772772417; cv=none; b=eRvqR+t/m1LaC1ARVkA07yXVSQaFjGNgIFv5YozRLO3u5VUUfa/HDQ/DRCUbvPChE5M41IEI+ega+L1yMf0FiplH8PWREMHpzzD27uB4IDeU3thUvkUIakAzdobMIiJm8Meby7Bqr8j1Ug44Tx+MReeL1FcVIC6aTz0PRqLnRg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772772417; c=relaxed/simple;
	bh=wyOicfROhb0ZJyRAtwk6KcTverQGyhH/ugCUQetKJzo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ktrAoEx/trmCO8UksbevzoOcT8O3OuA2LS9ukWk7dpHj2SLJUqbugXAD/RkGpYCTAOa9L/N2CuFGCbRzGNJ/5bfIVU8QV+5w+25YOHd8ylP0izAotppk4d7o8gLCZZWFQNLIv9V78gHVknHWPQx74UsyUM13N/D9Izt5dbD55Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VV9d5/m9; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VV9d5/m9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772772415; x=1804308415;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wyOicfROhb0ZJyRAtwk6KcTverQGyhH/ugCUQetKJzo=;
  b=VV9d5/m92wgAJQGUVswZ2AkqR6ZQXVCuSRrmDDhkOiMCKNRq4rU6yXVl
   S8erEAv4sTS6w0BZYBBcJWOpdRaKU6BOwgxDfjKkC2HczJtGcjrSMVxb9
   W+2DZKj+5MmWr9X1y0uzwn7OV5pXFNFURHMucjwX89tyX2C5NLPolKSC7
   E1FWq/FW1tzlJTClO2i1P6+hMTevHkaaMKBw5/yMaizshEcKrQScFcLGt
   VkRr+B9Y0abZbr1aR5Iv9kwYpVKRdywIbx2Ng1NFs9FkyYxefowE5/WIk
   ZhWgpqN2HD3hpYLyFjErvGjS7kwW6FIVD7qmxgJiDNIDBRcVUxVDghNJQ
   g==;
X-CSE-ConnectionGUID: g7dwc/OUQUCg+ggovgSatQ==
X-CSE-MsgGUID: SG+18L5vShCNsHjqScTBSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="84204516"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="84204516"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 20:46:54 -0800
X-CSE-ConnectionGUID: UNzGtVlBTL2cL74NnyGSeQ==
X-CSE-MsgGUID: OWwN2hVCQ7azU9Z4bUIWOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="215622895"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Mar 2026 20:46:53 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyN5O-000000000Mt-37rk;
	Fri, 06 Mar 2026 04:46:50 +0000
Date: Fri, 06 Mar 2026 12:46:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_6 5/24]
 include/linux/bpf.h:1543:51: warning: 'struct bpf_tramp_link' declared inside
 parameter list will not be visible outside of this definition or declaration
Message-ID: <202603061400.hRF6sVyz-lkp@intel.com>
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
tracing_multi_6
head:   af446b2f2e0f478bc501b1791673d2aa5994101b
commit: 3b32c0175ca684f984fc605e911b80c0d0b6149b [5/24] bpf: Add struct bpf=
_tramp_node object
config: sparc-randconfig-001-20260306 (https://download.01.org/0day-ci/arch=
ive/20260306/202603061400.hRF6sVyz-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260306/202603061400.hRF6sVyz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603061400.hRF6sVyz-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/security.h:35,
                    from include/linux/perf_event.h:53,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:95,
                    from include/linux/syscalls_api.h:1,
                    from kernel/sched/sched.h:64,
                    from kernel/sched/rq-offsets.c:5:
>> include/linux/bpf.h:1543:51: warning: 'struct bpf_tramp_link' declared i=
nside parameter list will not be visible outside of this definition or decl=
aration
    1543 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link=
 *link,
         |                                                   ^~~~~~~~~~~~~~
   include/linux/bpf.h:1549:53: warning: 'struct bpf_tramp_link' declared i=
nside parameter list will not be visible outside of this definition or decl=
aration
    1549 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_li=
nk *link,
         |                                                     ^~~~~~~~~~~~=
~~
--
   In file included from include/linux/hid_bpf.h:6,
                    from include/linux/hid.h:29,
                    from drivers/hid/wacom_wac.h:7,
                    from drivers/hid/wacom_sys.c:6:
>> include/linux/bpf.h:1543:51: warning: 'struct bpf_tramp_link' declared i=
nside parameter list will not be visible outside of this definition or decl=
aration
    1543 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link=
 *link,
         |                                                   ^~~~~~~~~~~~~~
   include/linux/bpf.h:1549:53: warning: 'struct bpf_tramp_link' declared i=
nside parameter list will not be visible outside of this definition or decl=
aration
    1549 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_li=
nk *link,
         |                                                     ^~~~~~~~~~~~=
~~
   drivers/hid/wacom_sys.c: In function 'wacom_update_name':
   drivers/hid/wacom_sys.c:2291:61: warning: '%s' directive output may be t=
runcated writing up to 127 bytes into a region of size 38 [-Wformat-truncat=
ion=3D]
    2291 |                         snprintf(name, sizeof(name), "Wacom %s",=
 product_name);
         |                                                             ^~
   drivers/hid/wacom_sys.c:2291:25: note: 'snprintf' output between 7 and 1=
34 bytes into a destination of size 44
    2291 |                         snprintf(name, sizeof(name), "Wacom %s",=
 product_name);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
--
   In file included from include/linux/hid_bpf.h:6,
                    from include/linux/hid.h:29,
                    from include/linux/hid-sensor-hub.h:9,
                    from drivers/hid/hid-sensor-custom.c:19:
>> include/linux/bpf.h:1543:51: warning: 'struct bpf_tramp_link' declared i=
nside parameter list will not be visible outside of this definition or decl=
aration
    1543 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link=
 *link,
         |                                                   ^~~~~~~~~~~~~~
   include/linux/bpf.h:1549:53: warning: 'struct bpf_tramp_link' declared i=
nside parameter list will not be visible outside of this definition or decl=
aration
    1549 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_li=
nk *link,
         |                                                     ^~~~~~~~~~~~=
~~
   drivers/hid/hid-sensor-custom.c: In function 'hid_sensor_custom_add_attr=
ibutes':
   drivers/hid/hid-sensor-custom.c:590:64: warning: 'snprintf' output may b=
e truncated before the last format character [-Wformat-truncation=3D]
     590 |                                  HID_CUSTOM_NAME_LENGTH, "%s-%s",
         |                                                                ^
   drivers/hid/hid-sensor-custom.c:589:25: note: 'snprintf' output 2 or mor=
e bytes (assuming 65) into a destination of size 64
     589 |                         snprintf((char *)&sensor_inst->fields[i]=
.attr_name[j],
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
     590 |                                  HID_CUSTOM_NAME_LENGTH, "%s-%s",
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     591 |                                  sensor_inst->fields[i].group_na=
me,
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
     592 |                                  hid_custom_attrs[j].name);
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/security.h:35,
                    from include/linux/perf_event.h:53,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:95,
                    from include/linux/syscalls_api.h:1,
                    from kernel/sched/sched.h:64,
                    from kernel/sched/rq-offsets.c:5:
>> include/linux/bpf.h:1543:51: warning: 'struct bpf_tramp_link' declared i=
nside parameter list will not be visible outside of this definition or decl=
aration
    1543 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link=
 *link,
         |                                                   ^~~~~~~~~~~~~~
   include/linux/bpf.h:1549:53: warning: 'struct bpf_tramp_link' declared i=
nside parameter list will not be visible outside of this definition or decl=
aration
    1549 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_li=
nk *link,
         |                                                     ^~~~~~~~~~~~=
~~


vim +1543 include/linux/bpf.h

75ccbef6369e94e Bj=C3=B6rn T=C3=B6pel            2019-12-13  1507 =20
75ccbef6369e94e Bj=C3=B6rn T=C3=B6pel            2019-12-13  1508  #define =
DEFINE_BPF_DISPATCHER(name)					\
c86df29d11dfba2 Peter Zijlstra         2022-11-03  1509  	__BPF_DISPATCHER_=
SC(name);					\
4f9087f16651aca Peter Zijlstra         2023-12-15  1510  	noinline __bpfcal=
l unsigned int bpf_dispatcher_##name##_func(	\
75ccbef6369e94e Bj=C3=B6rn T=C3=B6pel            2019-12-13  1511  		const =
void *ctx,					\
75ccbef6369e94e Bj=C3=B6rn T=C3=B6pel            2019-12-13  1512  		const =
struct bpf_insn *insnsi,				\
af3f4134006bf3b Stanislav Fomichev     2022-06-28  1513  		bpf_func_t bpf_f=
unc)					\
75ccbef6369e94e Bj=C3=B6rn T=C3=B6pel            2019-12-13  1514  	{						=
		\
c86df29d11dfba2 Peter Zijlstra         2022-11-03  1515  		return __BPF_DIS=
PATCHER_CALL(name);			\
75ccbef6369e94e Bj=C3=B6rn T=C3=B6pel            2019-12-13  1516  	}						=
		\
6a64037d4bf252b Bj=C3=B6rn T=C3=B6pel            2020-03-12  1517  	EXPORT_=
SYMBOL(bpf_dispatcher_##name##_func);			\
6a64037d4bf252b Bj=C3=B6rn T=C3=B6pel            2020-03-12  1518  	struct =
bpf_dispatcher bpf_dispatcher_##name =3D			\
18acb7fac22ff7b Peter Zijlstra         2022-11-03  1519  		BPF_DISPATCHER_I=
NIT(bpf_dispatcher_##name);
dbe69b29988465b Jiri Olsa              2022-10-18  1520 =20
75ccbef6369e94e Bj=C3=B6rn T=C3=B6pel            2019-12-13  1521  #define =
DECLARE_BPF_DISPATCHER(name)					\
6a64037d4bf252b Bj=C3=B6rn T=C3=B6pel            2020-03-12  1522  	unsigne=
d int bpf_dispatcher_##name##_func(			\
75ccbef6369e94e Bj=C3=B6rn T=C3=B6pel            2019-12-13  1523  		const =
void *ctx,					\
75ccbef6369e94e Bj=C3=B6rn T=C3=B6pel            2019-12-13  1524  		const =
struct bpf_insn *insnsi,				\
af3f4134006bf3b Stanislav Fomichev     2022-06-28  1525  		bpf_func_t bpf_f=
unc);					\
6a64037d4bf252b Bj=C3=B6rn T=C3=B6pel            2020-03-12  1526  	extern =
struct bpf_dispatcher bpf_dispatcher_##name;
c86df29d11dfba2 Peter Zijlstra         2022-11-03  1527 =20
6a64037d4bf252b Bj=C3=B6rn T=C3=B6pel            2020-03-12  1528  #define =
BPF_DISPATCHER_FUNC(name) bpf_dispatcher_##name##_func
6a64037d4bf252b Bj=C3=B6rn T=C3=B6pel            2020-03-12  1529  #define =
BPF_DISPATCHER_PTR(name) (&bpf_dispatcher_##name)
75ccbef6369e94e Bj=C3=B6rn T=C3=B6pel            2019-12-13  1530  void bpf=
_dispatcher_change_prog(struct bpf_dispatcher *d, struct bpf_prog *from,
75ccbef6369e94e Bj=C3=B6rn T=C3=B6pel            2019-12-13  1531  				stru=
ct bpf_prog *to);
dba122fb5e122e8 Jiri Olsa              2020-03-12  1532  /* Called only fro=
m JIT-enabled code, so there's no need for stubs. */
7c8ce4ffb684676 Xu Kuohai              2024-11-12  1533  void bpf_image_ksy=
m_init(void *data, unsigned int size, struct bpf_ksym *ksym);
7c8ce4ffb684676 Xu Kuohai              2024-11-12  1534  void bpf_image_ksy=
m_add(struct bpf_ksym *ksym);
a108f7dcfa010e3 Jiri Olsa              2020-03-12  1535  void bpf_image_ksy=
m_del(struct bpf_ksym *ksym);
dba122fb5e122e8 Jiri Olsa              2020-03-12  1536  void bpf_ksym_add(=
struct bpf_ksym *ksym);
dba122fb5e122e8 Jiri Olsa              2020-03-12  1537  void bpf_ksym_del(=
struct bpf_ksym *ksym);
ca45c84afb8c91a Josh Poimboeuf         2025-12-03  1538  bool bpf_has_frame=
_pointer(unsigned long ip);
3486bedd99196ec Song Liu               2022-02-04  1539  int bpf_jit_charge=
_modmem(u32 size);
3486bedd99196ec Song Liu               2022-02-04  1540  void bpf_jit_uncha=
rge_modmem(u32 size);
f92c1e183604c20 Jiri Olsa              2021-12-08  1541  bool bpf_prog_has_=
trampoline(const struct bpf_prog *prog);
fec56f5890d93fc Alexei Starovoitov     2019-11-14  1542  #else
f7e0beaf39d3868 Kui-Feng Lee           2022-05-10 @1543  static inline int =
bpf_trampoline_link_prog(struct bpf_tramp_link *link,
d6083f040d5d8f8 Leon Hwang             2024-10-15  1544  					   struct bpf=
_trampoline *tr,
d6083f040d5d8f8 Leon Hwang             2024-10-15  1545  					   struct bpf=
_prog *tgt_prog)
fec56f5890d93fc Alexei Starovoitov     2019-11-14  1546  {
fec56f5890d93fc Alexei Starovoitov     2019-11-14  1547  	return -ENOTSUPP;
fec56f5890d93fc Alexei Starovoitov     2019-11-14  1548  }
f7e0beaf39d3868 Kui-Feng Lee           2022-05-10  1549  static inline int =
bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
d6083f040d5d8f8 Leon Hwang             2024-10-15  1550  					     struct b=
pf_trampoline *tr,
d6083f040d5d8f8 Leon Hwang             2024-10-15  1551  					     struct b=
pf_prog *tgt_prog)
fec56f5890d93fc Alexei Starovoitov     2019-11-14  1552  {
fec56f5890d93fc Alexei Starovoitov     2019-11-14  1553  	return -ENOTSUPP;
fec56f5890d93fc Alexei Starovoitov     2019-11-14  1554  }
f7b12b6fea00988 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-25  1555  static i=
nline struct bpf_trampoline *bpf_trampoline_get(u64 key,
f7b12b6fea00988 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-25  1556  							s=
truct bpf_attach_target_info *tgt_info)
f7b12b6fea00988 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-25  1557  {
b724a6418f1f853 Leon Hwang             2023-09-17  1558  	return NULL;
f7b12b6fea00988 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-25  1559  }
fec56f5890d93fc Alexei Starovoitov     2019-11-14  1560  static inline void=
 bpf_trampoline_put(struct bpf_trampoline *tr) {}
75ccbef6369e94e Bj=C3=B6rn T=C3=B6pel            2019-12-13  1561  #define =
DEFINE_BPF_DISPATCHER(name)
75ccbef6369e94e Bj=C3=B6rn T=C3=B6pel            2019-12-13  1562  #define =
DECLARE_BPF_DISPATCHER(name)
6a64037d4bf252b Bj=C3=B6rn T=C3=B6pel            2020-03-12  1563  #define =
BPF_DISPATCHER_FUNC(name) bpf_dispatcher_nop_func
75ccbef6369e94e Bj=C3=B6rn T=C3=B6pel            2019-12-13  1564  #define =
BPF_DISPATCHER_PTR(name) NULL
75ccbef6369e94e Bj=C3=B6rn T=C3=B6pel            2019-12-13  1565  static i=
nline void bpf_dispatcher_change_prog(struct bpf_dispatcher *d,
75ccbef6369e94e Bj=C3=B6rn T=C3=B6pel            2019-12-13  1566  					   =
   struct bpf_prog *from,
75ccbef6369e94e Bj=C3=B6rn T=C3=B6pel            2019-12-13  1567  					   =
   struct bpf_prog *to) {}
e9b4e606c2289d6 Jiri Olsa              2020-01-23  1568  static inline bool=
 is_bpf_image_address(unsigned long address)
e9b4e606c2289d6 Jiri Olsa              2020-01-23  1569  {
e9b4e606c2289d6 Jiri Olsa              2020-01-23  1570  	return false;
e9b4e606c2289d6 Jiri Olsa              2020-01-23  1571  }
f92c1e183604c20 Jiri Olsa              2021-12-08  1572  static inline bool=
 bpf_prog_has_trampoline(const struct bpf_prog *prog)
f92c1e183604c20 Jiri Olsa              2021-12-08  1573  {
f92c1e183604c20 Jiri Olsa              2021-12-08  1574  	return false;
f92c1e183604c20 Jiri Olsa              2021-12-08  1575  }
fec56f5890d93fc Alexei Starovoitov     2019-11-14  1576  #endif
fec56f5890d93fc Alexei Starovoitov     2019-11-14  1577 =20

:::::: The code at line 1543 was first introduced by commit
:::::: f7e0beaf39d3868dc700d4954b26cf8443c5d423 bpf, x86: Generate trampoli=
nes from bpf_tramp_links

:::::: TO: Kui-Feng Lee <kuifeng@fb.com>
:::::: CC: Andrii Nakryiko <andrii@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
