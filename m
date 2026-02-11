Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB3833E360
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 16:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770826771; cv=none; b=CAYI841H19CikEkjyhHefDsBj158qlydV9ymG+uAsCQhJ2o3B81ZQbwIKI+YhwSD5/P/VL44M0z0xkjGpnmLKUIeyN25VHcQcNMB4zuis2Jup+H6Z0VLWR3uUB7P/RhGJFjDK5yNMiIuZAK8x/SjIPLDBVOHYrPEtXg9+zPp7S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770826771; c=relaxed/simple;
	bh=DknPRhtz6MYdvFyONbNqjnD+s6QkGPUv4e2q6zFUHyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jZg1QNHgcGO3yaiFoQSnZvWrx4OTcsL6I4TVOg/qdLajyYzQCy6KOj3bzmUQHpqHYc8c59t1F6uPae1h9C4aIxsbAySl7Riim0tomELZxhfeJdapjvby4cxMSw5wD43pM/eC65WHSaKGji53n4oHAjMkZsbRNe/YC1nLW2hbE0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tgnwg3Le; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tgnwg3Le"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770826769; x=1802362769;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DknPRhtz6MYdvFyONbNqjnD+s6QkGPUv4e2q6zFUHyQ=;
  b=Tgnwg3LecCMBoT50jifsJ6AeQqfcGNgXHaQNswtgc4pnisdomnUCGQsK
   AES5HayMipC+bbNWVoI/JiaKlEx3vEgMGKWn9+ODdG4oyMpGzKXJC3RAo
   fG1jrnMMcCDN+c4joLagCY0R2r75OXu+g55z9v6/4v1oy/2NNY7GCbev4
   8iHjUPf4nJgAViVX1w3ttFVEO6RJGtPG1AHk6qOJlzNVrZdsnBkX6RYs9
   aOFTueT4OyM+F0lca079IF7HC+DssQbneXB4QRwm9i51stz4NYZFXzd/P
   y3BH9IwizcOVYvSxyYW6WOHZ1MJC/ieBqgBMf4ccTmv5uGgWN3IrZmsLu
   A==;
X-CSE-ConnectionGUID: mdZIGy47SqCFH/fpNU3mcQ==
X-CSE-MsgGUID: CdK2AE9mQV6ntW+FHS8Ckw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71877465"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="71877465"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 08:19:29 -0800
X-CSE-ConnectionGUID: qmNQnyKdTNKmLOZ3qYZTyA==
X-CSE-MsgGUID: DQ7vQezWTVyVr4ud6ztlNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="212387698"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 11 Feb 2026 08:19:27 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqCw1-00000000177-0Ebj;
	Wed, 11 Feb 2026 16:19:25 +0000
Date: Wed, 11 Feb 2026 17:18:45 +0100
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_3 5/14]
 arch/riscv/net/bpf_jit_comp64.c:1151:30: error: assignment to 'int *' from
 'int' makes pointer from integer without a cast
Message-ID: <202602111720.jFVEqVCs-lkp@intel.com>
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
tracing_multi_3
head:   e88de144ad6e264c1df0286d6a975136d7a059c2
commit: 944b7cd2572a6af8fc0f19a1e29c93147e15cdcf [5/14] bpf: Add struct bpf=
_tramp_node object
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/2026=
0211/202602111720.jFVEqVCs-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260211/202602111720.jFVEqVCs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602111720.jFVEqVCs-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   arch/riscv/net/bpf_jit_comp64.c: In function 'invoke_bpf_prog':
   arch/riscv/net/bpf_jit_comp64.c:936:14: error: 'struct bpf_tramp_link' h=
as no member named 'cookie'
     936 |         if (l->cookie) {
         |              ^~
   arch/riscv/net/bpf_jit_comp64.c:937:38: error: 'struct bpf_tramp_link' h=
as no member named 'cookie'
     937 |                 emit_imm(RV_REG_T1, l->cookie, ctx);
         |                                      ^~
   arch/riscv/net/bpf_jit_comp64.c: At top level:
   arch/riscv/net/bpf_jit_comp64.c:995:49: warning: 'struct bpf_tramp_links=
' declared inside parameter list will not be visible outside of this defini=
tion or declaration
     995 |                                          struct bpf_tramp_links =
*tlinks,
         |                                                 ^~~~~~~~~~~~~~~
   arch/riscv/net/bpf_jit_comp64.c: In function '__arch_prepare_bpf_trampol=
ine':
   arch/riscv/net/bpf_jit_comp64.c:1003:49: error: invalid use of undefined=
 type 'struct bpf_tramp_links'
    1003 |         struct bpf_tramp_links *fentry =3D &tlinks[BPF_TRAMP_FEN=
TRY];
         |                                                 ^
   arch/riscv/net/bpf_jit_comp64.c:1004:48: error: invalid use of undefined=
 type 'struct bpf_tramp_links'
    1004 |         struct bpf_tramp_links *fexit =3D &tlinks[BPF_TRAMP_FEXI=
T];
         |                                                ^
   arch/riscv/net/bpf_jit_comp64.c:1005:51: error: invalid use of undefined=
 type 'struct bpf_tramp_links'
    1005 |         struct bpf_tramp_links *fmod_ret =3D &tlinks[BPF_TRAMP_M=
ODIFY_RETURN];
         |                                                   ^
   arch/riscv/net/bpf_jit_comp64.c:1143:31: error: invalid use of undefined=
 type 'struct bpf_tramp_links'
    1143 |         for (i =3D 0; i < fentry->nr_links; i++) {
         |                               ^~
   arch/riscv/net/bpf_jit_comp64.c:1144:45: error: invalid use of undefined=
 type 'struct bpf_tramp_links'
    1144 |                 ret =3D invoke_bpf_prog(fentry->links[i], args_o=
ff, retval_off, run_ctx_off,
         |                                             ^~
   arch/riscv/net/bpf_jit_comp64.c:1150:21: error: invalid use of undefined=
 type 'struct bpf_tramp_links'
    1150 |         if (fmod_ret->nr_links) {
         |                     ^~
   In file included from ./include/linux/workqueue.h:9,
                    from ./include/linux/bpf.h:11,
                    from arch/riscv/net/bpf_jit_comp64.c:9:
   arch/riscv/net/bpf_jit_comp64.c:1151:48: error: invalid use of undefined=
 type 'struct bpf_tramp_links'
    1151 |                 branches_off =3D kcalloc(fmod_ret->nr_links, siz=
eof(int), GFP_KERNEL);
         |                                                ^~
   ./include/linux/alloc_tag.h:251:16: note: in definition of macro 'alloc_=
hooks_tag'
     251 |         typeof(_do_alloc) _res;                                 =
        \
         |                ^~~~~~~~~
   ./include/linux/slab.h:1005:49: note: in expansion of macro 'alloc_hooks'
    1005 | #define kmalloc_array(...)                      alloc_hooks(kmal=
loc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   ./include/linux/slab.h:1044:41: note: in expansion of macro 'kmalloc_arr=
ay'
    1044 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (=
flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   arch/riscv/net/bpf_jit_comp64.c:1151:32: note: in expansion of macro 'kc=
alloc'
    1151 |                 branches_off =3D kcalloc(fmod_ret->nr_links, siz=
eof(int), GFP_KERNEL);
         |                                ^~~~~~~
   arch/riscv/net/bpf_jit_comp64.c:1151:48: error: invalid use of undefined=
 type 'struct bpf_tramp_links'
    1151 |                 branches_off =3D kcalloc(fmod_ret->nr_links, siz=
eof(int), GFP_KERNEL);
         |                                                ^~
   ./include/linux/alloc_tag.h:255:24: note: in definition of macro 'alloc_=
hooks_tag'
     255 |                 _res =3D _do_alloc;                             =
          \
         |                        ^~~~~~~~~
   ./include/linux/slab.h:1005:49: note: in expansion of macro 'alloc_hooks'
    1005 | #define kmalloc_array(...)                      alloc_hooks(kmal=
loc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   ./include/linux/slab.h:1044:41: note: in expansion of macro 'kmalloc_arr=
ay'
    1044 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (=
flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   arch/riscv/net/bpf_jit_comp64.c:1151:32: note: in expansion of macro 'kc=
alloc'
    1151 |                 branches_off =3D kcalloc(fmod_ret->nr_links, siz=
eof(int), GFP_KERNEL);
         |                                ^~~~~~~
   arch/riscv/net/bpf_jit_comp64.c:1151:48: error: invalid use of undefined=
 type 'struct bpf_tramp_links'
    1151 |                 branches_off =3D kcalloc(fmod_ret->nr_links, siz=
eof(int), GFP_KERNEL);
         |                                                ^~
   ./include/linux/alloc_tag.h:258:24: note: in definition of macro 'alloc_=
hooks_tag'
     258 |                 _res =3D _do_alloc;                             =
          \
         |                        ^~~~~~~~~
   ./include/linux/slab.h:1005:49: note: in expansion of macro 'alloc_hooks'
    1005 | #define kmalloc_array(...)                      alloc_hooks(kmal=
loc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   ./include/linux/slab.h:1044:41: note: in expansion of macro 'kmalloc_arr=
ay'
    1044 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (=
flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   arch/riscv/net/bpf_jit_comp64.c:1151:32: note: in expansion of macro 'kc=
alloc'
    1151 |                 branches_off =3D kcalloc(fmod_ret->nr_links, siz=
eof(int), GFP_KERNEL);
         |                                ^~~~~~~
>> arch/riscv/net/bpf_jit_comp64.c:1151:30: error: assignment to 'int *' fr=
om 'int' makes pointer from integer without a cast [-Wint-conversion]
    1151 |                 branches_off =3D kcalloc(fmod_ret->nr_links, siz=
eof(int), GFP_KERNEL);
         |                              ^
   arch/riscv/net/bpf_jit_comp64.c:1157:41: error: invalid use of undefined=
 type 'struct bpf_tramp_links'
    1157 |                 for (i =3D 0; i < fmod_ret->nr_links; i++) {
         |                                         ^~
   arch/riscv/net/bpf_jit_comp64.c:1158:55: error: invalid use of undefined=
 type 'struct bpf_tramp_links'
    1158 |                         ret =3D invoke_bpf_prog(fmod_ret->links[=
i], args_off, retval_off,
         |                                                       ^~
   arch/riscv/net/bpf_jit_comp64.c:1186:47: error: invalid use of undefined=
 type 'struct bpf_tramp_links'
    1186 |         for (i =3D 0; ctx->insns && i < fmod_ret->nr_links; i++)=
 {
         |                                               ^~
   arch/riscv/net/bpf_jit_comp64.c:1192:30: error: invalid use of undefined=
 type 'struct bpf_tramp_links'
    1192 |         for (i =3D 0; i < fexit->nr_links; i++) {
         |                              ^~
   arch/riscv/net/bpf_jit_comp64.c:1193:44: error: invalid use of undefined=
 type 'struct bpf_tramp_links'
    1193 |                 ret =3D invoke_bpf_prog(fexit->links[i], args_of=
f, retval_off,
         |                                            ^~
   arch/riscv/net/bpf_jit_comp64.c: At top level:
   arch/riscv/net/bpf_jit_comp64.c:1256:37: warning: 'struct bpf_tramp_link=
s' declared inside parameter list will not be visible outside of this defin=
ition or declaration
    1256 |                              struct bpf_tramp_links *tlinks, voi=
d *func_addr)
         |                                     ^~~~~~~~~~~~~~~
   arch/riscv/net/bpf_jit_comp64.c:1255:5: error: conflicting types for 'ar=
ch_bpf_trampoline_size'; have 'int(const struct btf_func_model *, u32,  str=
uct bpf_tramp_links *, void *)' {aka 'int(const struct btf_func_model *, un=
signed int,  struct bpf_tramp_links *, void *)'}
    1255 | int arch_bpf_trampoline_size(const struct btf_func_model *m, u32=
 flags,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/bpf.h:1271:5: note: previous declaration of 'arch_bpf_tr=
ampoline_size' with type 'int(const struct btf_func_model *, u32,  struct b=
pf_tramp_nodes *, void *)' {aka 'int(const struct btf_func_model *, unsigne=
d int,  struct bpf_tramp_nodes *, void *)'}
    1271 | int arch_bpf_trampoline_size(const struct btf_func_model *m, u32=
 flags,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/net/bpf_jit_comp64.c: In function 'arch_bpf_trampoline_size':
   arch/riscv/net/bpf_jit_comp64.c:1265:53: error: passing argument 3 of '_=
_arch_prepare_bpf_trampoline' from incompatible pointer type [-Wincompatibl=
e-pointer-types]
    1265 |         ret =3D __arch_prepare_bpf_trampoline(&im, m, tlinks, fu=
nc_addr, flags, &ctx);
         |                                                     ^~~~~~
         |                                                     |
         |                                                     struct bpf_t=
ramp_links *
   arch/riscv/net/bpf_jit_comp64.c:995:66: note: expected 'struct bpf_tramp=
_links *' but argument is of type 'struct bpf_tramp_links *'
     995 |                                          struct bpf_tramp_links =
*tlinks,
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~=
~^~~~~~
   arch/riscv/net/bpf_jit_comp64.c: At top level:
   arch/riscv/net/bpf_jit_comp64.c:1282:51: warning: 'struct bpf_tramp_link=
s' declared inside parameter list will not be visible outside of this defin=
ition or declaration
    1282 |                                 u32 flags, struct bpf_tramp_link=
s *tlinks,
         |                                                   ^~~~~~~~~~~~~~~
   arch/riscv/net/bpf_jit_comp64.c:1280:5: error: conflicting types for 'ar=
ch_prepare_bpf_trampoline'; have 'int(struct bpf_tramp_image *, void *, voi=
d *, const struct btf_func_model *, u32,  struct bpf_tramp_links *, void *)=
' {aka 'int(struct bpf_tramp_image *, void *, void *, const struct btf_func=
_model *, unsigned int,  struct bpf_tramp_links *, void *)'}
    1280 | int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void=
 *ro_image,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/bpf.h:1264:5: note: previous declaration of 'arch_prepar=
e_bpf_trampoline' with type 'int(struct bpf_tramp_image *, void *, void *, =
const struct btf_func_model *, u32,  struct bpf_tramp_nodes *, void *)' {ak=
a 'int(struct bpf_tramp_image *, void *, void *, const struct btf_func_mode=
l *, unsigned int,  struct bpf_tramp_nodes *, void *)'}
    1264 | int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void=
 *image, void *image_end,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/net/bpf_jit_comp64.c: In function 'arch_prepare_bpf_trampolin=
e':
   arch/riscv/net/bpf_jit_comp64.c:1297:52: error: passing argument 3 of '_=
_arch_prepare_bpf_trampoline' from incompatible pointer type [-Wincompatibl=
e-pointer-types]
    1297 |         ret =3D __arch_prepare_bpf_trampoline(im, m, tlinks, fun=
c_addr, flags, &ctx);
         |                                                    ^~~~~~
         |                                                    |
         |                                                    struct bpf_tr=
amp_links *
   arch/riscv/net/bpf_jit_comp64.c:995:66: note: expected 'struct bpf_tramp=
_links *' but argument is of type 'struct bpf_tramp_links *'
     995 |                                          struct bpf_tramp_links =
*tlinks,
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~=
~^~~~~~


vim +1151 arch/riscv/net/bpf_jit_comp64.c

49b5e77ae3e214 Pu Lehui       2023-02-15   992 =20
49b5e77ae3e214 Pu Lehui       2023-02-15   993  static int __arch_prepare_b=
pf_trampoline(struct bpf_tramp_image *im,
49b5e77ae3e214 Pu Lehui       2023-02-15   994  					 const struct btf_func=
_model *m,
49b5e77ae3e214 Pu Lehui       2023-02-15   995  					 struct bpf_tramp_link=
s *tlinks,
49b5e77ae3e214 Pu Lehui       2023-02-15   996  					 void *func_addr, u32 =
flags,
49b5e77ae3e214 Pu Lehui       2023-02-15   997  					 struct rv_jit_context=
 *ctx)
49b5e77ae3e214 Pu Lehui       2023-02-15   998  {
49b5e77ae3e214 Pu Lehui       2023-02-15   999  	int i, ret, offset;
49b5e77ae3e214 Pu Lehui       2023-02-15  1000  	int *branches_off =3D NULL;
6801b0aef79db4 Pu Lehui       2024-07-02  1001  	int stack_size =3D 0, nr_a=
rg_slots =3D 0;
6801b0aef79db4 Pu Lehui       2024-07-02  1002  	int retval_off, args_off, =
nregs_off, ip_off, run_ctx_off, sreg_off, stk_arg_off;
49b5e77ae3e214 Pu Lehui       2023-02-15  1003  	struct bpf_tramp_links *fe=
ntry =3D &tlinks[BPF_TRAMP_FENTRY];
49b5e77ae3e214 Pu Lehui       2023-02-15  1004  	struct bpf_tramp_links *fe=
xit =3D &tlinks[BPF_TRAMP_FEXIT];
49b5e77ae3e214 Pu Lehui       2023-02-15  1005  	struct bpf_tramp_links *fm=
od_ret =3D &tlinks[BPF_TRAMP_MODIFY_RETURN];
1732ebc4a26181 Pu Lehui       2024-01-23  1006  	bool is_struct_ops =3D fla=
gs & BPF_TRAMP_F_INDIRECT;
49b5e77ae3e214 Pu Lehui       2023-02-15  1007  	void *orig_call =3D func_a=
ddr;
49b5e77ae3e214 Pu Lehui       2023-02-15  1008  	bool save_ret;
49b5e77ae3e214 Pu Lehui       2023-02-15  1009  	u32 insn;
49b5e77ae3e214 Pu Lehui       2023-02-15  1010 =20
25ad10658dc106 Pu Lehui       2023-07-21  1011  	/* Two types of generated =
trampoline stack layout:
25ad10658dc106 Pu Lehui       2023-07-21  1012  	 *
25ad10658dc106 Pu Lehui       2023-07-21  1013  	 * 1. trampoline called fr=
om function entry
25ad10658dc106 Pu Lehui       2023-07-21  1014  	 * -----------------------=
---------------
25ad10658dc106 Pu Lehui       2023-07-21  1015  	 * FP + 8	    [ RA to pare=
nt func	] return address to parent
25ad10658dc106 Pu Lehui       2023-07-21  1016  	 *					  function
25ad10658dc106 Pu Lehui       2023-07-21  1017  	 * FP + 0	    [ FP of pare=
nt func ] frame pointer of parent
25ad10658dc106 Pu Lehui       2023-07-21  1018  	 *					  function
25ad10658dc106 Pu Lehui       2023-07-21  1019  	 * FP - 8           [ T0 t=
o traced func ] return address of traced
25ad10658dc106 Pu Lehui       2023-07-21  1020  	 *					  function
25ad10658dc106 Pu Lehui       2023-07-21  1021  	 * FP - 16	    [ FP of tra=
ced func ] frame pointer of traced
25ad10658dc106 Pu Lehui       2023-07-21  1022  	 *					  function
25ad10658dc106 Pu Lehui       2023-07-21  1023  	 * -----------------------=
---------------
49b5e77ae3e214 Pu Lehui       2023-02-15  1024  	 *
25ad10658dc106 Pu Lehui       2023-07-21  1025  	 * 2. trampoline called di=
rectly
25ad10658dc106 Pu Lehui       2023-07-21  1026  	 * -----------------------=
---------------
25ad10658dc106 Pu Lehui       2023-07-21  1027  	 * FP - 8	    [ RA to call=
er func ] return address to caller
49b5e77ae3e214 Pu Lehui       2023-02-15  1028  	 *					  function
25ad10658dc106 Pu Lehui       2023-07-21  1029  	 * FP - 16	    [ FP of cal=
ler func	] frame pointer of caller
49b5e77ae3e214 Pu Lehui       2023-02-15  1030  	 *					  function
25ad10658dc106 Pu Lehui       2023-07-21  1031  	 * -----------------------=
---------------
49b5e77ae3e214 Pu Lehui       2023-02-15  1032  	 *
49b5e77ae3e214 Pu Lehui       2023-02-15  1033  	 * FP - retval_off  [ retu=
rn value      ] BPF_TRAMP_F_CALL_ORIG or
49b5e77ae3e214 Pu Lehui       2023-02-15  1034  	 *					  BPF_TRAMP_F_RET_F=
ENTRY_RET
49b5e77ae3e214 Pu Lehui       2023-02-15  1035  	 *                  [ argN=
              ]
49b5e77ae3e214 Pu Lehui       2023-02-15  1036  	 *                  [ ... =
              ]
49b5e77ae3e214 Pu Lehui       2023-02-15  1037  	 * FP - args_off    [ arg1=
              ]
49b5e77ae3e214 Pu Lehui       2023-02-15  1038  	 *
49b5e77ae3e214 Pu Lehui       2023-02-15  1039  	 * FP - nregs_off   [ regs=
 count        ]
49b5e77ae3e214 Pu Lehui       2023-02-15  1040  	 *
49b5e77ae3e214 Pu Lehui       2023-02-15  1041  	 * FP - ip_off      [ trac=
ed func	] BPF_TRAMP_F_IP_ARG
49b5e77ae3e214 Pu Lehui       2023-02-15  1042  	 *
49b5e77ae3e214 Pu Lehui       2023-02-15  1043  	 * FP - run_ctx_off [ bpf_=
tramp_run_ctx ]
49b5e77ae3e214 Pu Lehui       2023-02-15  1044  	 *
49b5e77ae3e214 Pu Lehui       2023-02-15  1045  	 * FP - sreg_off    [ call=
ee saved reg	]
49b5e77ae3e214 Pu Lehui       2023-02-15  1046  	 *
49b5e77ae3e214 Pu Lehui       2023-02-15  1047  	 *		    [ pads            =
  ] pads for 16 bytes alignment
6801b0aef79db4 Pu Lehui       2024-07-02  1048  	 *
6801b0aef79db4 Pu Lehui       2024-07-02  1049  	 *		    [ stack_argN      =
  ]
6801b0aef79db4 Pu Lehui       2024-07-02  1050  	 *		    [ ...             =
  ]
6801b0aef79db4 Pu Lehui       2024-07-02  1051  	 * FP - stk_arg_off [ stac=
k_arg1        ] BPF_TRAMP_F_CALL_ORIG
49b5e77ae3e214 Pu Lehui       2023-02-15  1052  	 */
49b5e77ae3e214 Pu Lehui       2023-02-15  1053 =20
49b5e77ae3e214 Pu Lehui       2023-02-15  1054  	if (flags & (BPF_TRAMP_F_O=
RIG_STACK | BPF_TRAMP_F_SHARE_IPMODIFY))
49b5e77ae3e214 Pu Lehui       2023-02-15  1055  		return -ENOTSUPP;
49b5e77ae3e214 Pu Lehui       2023-02-15  1056 =20
6801b0aef79db4 Pu Lehui       2024-07-02  1057  	if (m->nr_args > MAX_BPF_F=
UNC_ARGS)
49b5e77ae3e214 Pu Lehui       2023-02-15  1058  		return -ENOTSUPP;
49b5e77ae3e214 Pu Lehui       2023-02-15  1059 =20
6801b0aef79db4 Pu Lehui       2024-07-02  1060  	for (i =3D 0; i < m->nr_ar=
gs; i++)
6801b0aef79db4 Pu Lehui       2024-07-02  1061  		nr_arg_slots +=3D round_u=
p(m->arg_size[i], 8) / 8;
6801b0aef79db4 Pu Lehui       2024-07-02  1062 =20
25ad10658dc106 Pu Lehui       2023-07-21  1063  	/* room of trampoline fram=
e to store return address and frame pointer */
25ad10658dc106 Pu Lehui       2023-07-21  1064  	stack_size +=3D 16;
49b5e77ae3e214 Pu Lehui       2023-02-15  1065 =20
49b5e77ae3e214 Pu Lehui       2023-02-15  1066  	save_ret =3D flags & (BPF_=
TRAMP_F_CALL_ORIG | BPF_TRAMP_F_RET_FENTRY_RET);
d0bf7cd5df1846 Chenghao Duan  2025-09-22  1067  	if (save_ret)
7112cd26e606c7 Bj=C3=B6rn T=C3=B6pel    2023-10-04  1068  		stack_size +=3D =
16; /* Save both A5 (BPF R0) and A0 */
49b5e77ae3e214 Pu Lehui       2023-02-15  1069  	retval_off =3D stack_size;
49b5e77ae3e214 Pu Lehui       2023-02-15  1070 =20
6801b0aef79db4 Pu Lehui       2024-07-02  1071  	stack_size +=3D nr_arg_slo=
ts * 8;
49b5e77ae3e214 Pu Lehui       2023-02-15  1072  	args_off =3D stack_size;
49b5e77ae3e214 Pu Lehui       2023-02-15  1073 =20
49b5e77ae3e214 Pu Lehui       2023-02-15  1074  	stack_size +=3D 8;
49b5e77ae3e214 Pu Lehui       2023-02-15  1075  	nregs_off =3D stack_size;
49b5e77ae3e214 Pu Lehui       2023-02-15  1076 =20
49b5e77ae3e214 Pu Lehui       2023-02-15  1077  	if (flags & BPF_TRAMP_F_IP=
_ARG) {
49b5e77ae3e214 Pu Lehui       2023-02-15  1078  		stack_size +=3D 8;
49b5e77ae3e214 Pu Lehui       2023-02-15  1079  		ip_off =3D stack_size;
49b5e77ae3e214 Pu Lehui       2023-02-15  1080  	}
49b5e77ae3e214 Pu Lehui       2023-02-15  1081 =20
49b5e77ae3e214 Pu Lehui       2023-02-15  1082  	stack_size +=3D round_up(s=
izeof(struct bpf_tramp_run_ctx), 8);
49b5e77ae3e214 Pu Lehui       2023-02-15  1083  	run_ctx_off =3D stack_size;
49b5e77ae3e214 Pu Lehui       2023-02-15  1084 =20
49b5e77ae3e214 Pu Lehui       2023-02-15  1085  	stack_size +=3D 8;
49b5e77ae3e214 Pu Lehui       2023-02-15  1086  	sreg_off =3D stack_size;
49b5e77ae3e214 Pu Lehui       2023-02-15  1087 =20
a5912c37faf723 Puranjay Mohan 2024-07-08  1088  	if ((flags & BPF_TRAMP_F_C=
ALL_ORIG) && (nr_arg_slots - RV_MAX_REG_ARGS > 0))
6801b0aef79db4 Pu Lehui       2024-07-02  1089  		stack_size +=3D (nr_arg_s=
lots - RV_MAX_REG_ARGS) * 8;
6801b0aef79db4 Pu Lehui       2024-07-02  1090 =20
e944fc8152744a Xiao Wang      2024-05-23  1091  	stack_size =3D round_up(st=
ack_size, STACK_ALIGN);
49b5e77ae3e214 Pu Lehui       2023-02-15  1092 =20
6801b0aef79db4 Pu Lehui       2024-07-02  1093  	/* room for args on stack =
must be at the top of stack */
6801b0aef79db4 Pu Lehui       2024-07-02  1094  	stk_arg_off =3D stack_size;
6801b0aef79db4 Pu Lehui       2024-07-02  1095 =20
1732ebc4a26181 Pu Lehui       2024-01-23  1096  	if (!is_struct_ops) {
25ad10658dc106 Pu Lehui       2023-07-21  1097  		/* For the trampoline cal=
led from function entry,
25ad10658dc106 Pu Lehui       2023-07-21  1098  		 * the frame of traced fu=
nction and the frame of
25ad10658dc106 Pu Lehui       2023-07-21  1099  		 * trampoline need to be =
considered.
25ad10658dc106 Pu Lehui       2023-07-21  1100  		 */
25ad10658dc106 Pu Lehui       2023-07-21  1101  		emit_addi(RV_REG_SP, RV_R=
EG_SP, -16, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1102  		emit_sd(RV_REG_SP, 8, RV_=
REG_RA, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1103  		emit_sd(RV_REG_SP, 0, RV_=
REG_FP, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1104  		emit_addi(RV_REG_FP, RV_R=
EG_SP, 16, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1105 =20
25ad10658dc106 Pu Lehui       2023-07-21  1106  		emit_addi(RV_REG_SP, RV_R=
EG_SP, -stack_size, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1107  		emit_sd(RV_REG_SP, stack_=
size - 8, RV_REG_T0, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1108  		emit_sd(RV_REG_SP, stack_=
size - 16, RV_REG_FP, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1109  		emit_addi(RV_REG_FP, RV_R=
EG_SP, stack_size, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1110  	} else {
e63985ecd22681 Puranjay Mohan 2024-03-03  1111  		/* emit kcfi hash */
e63985ecd22681 Puranjay Mohan 2024-03-03  1112  		emit_kcfi(cfi_get_func_ha=
sh(func_addr), ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1113  		/* For the trampoline cal=
led directly, just handle
25ad10658dc106 Pu Lehui       2023-07-21  1114  		 * the frame of trampolin=
e.
25ad10658dc106 Pu Lehui       2023-07-21  1115  		 */
25ad10658dc106 Pu Lehui       2023-07-21  1116  		emit_addi(RV_REG_SP, RV_R=
EG_SP, -stack_size, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1117  		emit_sd(RV_REG_SP, stack_=
size - 8, RV_REG_RA, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1118  		emit_sd(RV_REG_SP, stack_=
size - 16, RV_REG_FP, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1119  		emit_addi(RV_REG_FP, RV_R=
EG_SP, stack_size, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1120  	}
49b5e77ae3e214 Pu Lehui       2023-02-15  1121 =20
49b5e77ae3e214 Pu Lehui       2023-02-15  1122  	/* callee saved register S=
1 to pass start time */
49b5e77ae3e214 Pu Lehui       2023-02-15  1123  	emit_sd(RV_REG_FP, -sreg_o=
ff, RV_REG_S1, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1124 =20
49b5e77ae3e214 Pu Lehui       2023-02-15  1125  	/* store ip address of the=
 traced function */
49b5e77ae3e214 Pu Lehui       2023-02-15  1126  	if (flags & BPF_TRAMP_F_IP=
_ARG) {
49b5e77ae3e214 Pu Lehui       2023-02-15  1127  		emit_imm(RV_REG_T1, (cons=
t s64)func_addr, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1128  		emit_sd(RV_REG_FP, -ip_of=
f, RV_REG_T1, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1129  	}
49b5e77ae3e214 Pu Lehui       2023-02-15  1130 =20
6801b0aef79db4 Pu Lehui       2024-07-02  1131  	emit_li(RV_REG_T1, nr_arg_=
slots, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1132  	emit_sd(RV_REG_FP, -nregs_=
off, RV_REG_T1, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1133 =20
6801b0aef79db4 Pu Lehui       2024-07-02  1134  	store_args(nr_arg_slots, a=
rgs_off, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1135 =20
49b5e77ae3e214 Pu Lehui       2023-02-15  1136  	if (flags & BPF_TRAMP_F_CA=
LL_ORIG) {
9f1e16fb1fc982 Pu Lehui       2024-06-22  1137  		emit_imm(RV_REG_A0, ctx->=
insns ? (const s64)im : RV_MAX_COUNT_IMM, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1138  		ret =3D emit_call((const =
u64)__bpf_tramp_enter, true, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1139  		if (ret)
49b5e77ae3e214 Pu Lehui       2023-02-15  1140  			return ret;
49b5e77ae3e214 Pu Lehui       2023-02-15  1141  	}
49b5e77ae3e214 Pu Lehui       2023-02-15  1142 =20
49b5e77ae3e214 Pu Lehui       2023-02-15  1143  	for (i =3D 0; i < fentry->=
nr_links; i++) {
49b5e77ae3e214 Pu Lehui       2023-02-15  1144  		ret =3D invoke_bpf_prog(f=
entry->links[i], args_off, retval_off, run_ctx_off,
49b5e77ae3e214 Pu Lehui       2023-02-15  1145  				      flags & BPF_TRAMP=
_F_RET_FENTRY_RET, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1146  		if (ret)
49b5e77ae3e214 Pu Lehui       2023-02-15  1147  			return ret;
49b5e77ae3e214 Pu Lehui       2023-02-15  1148  	}
49b5e77ae3e214 Pu Lehui       2023-02-15  1149 =20
49b5e77ae3e214 Pu Lehui       2023-02-15  1150  	if (fmod_ret->nr_links) {
49b5e77ae3e214 Pu Lehui       2023-02-15 @1151  		branches_off =3D kcalloc(=
fmod_ret->nr_links, sizeof(int), GFP_KERNEL);
49b5e77ae3e214 Pu Lehui       2023-02-15  1152  		if (!branches_off)
49b5e77ae3e214 Pu Lehui       2023-02-15  1153  			return -ENOMEM;
49b5e77ae3e214 Pu Lehui       2023-02-15  1154 =20
49b5e77ae3e214 Pu Lehui       2023-02-15  1155  		/* cleanup to avoid garba=
ge return value confusion */
49b5e77ae3e214 Pu Lehui       2023-02-15  1156  		emit_sd(RV_REG_FP, -retva=
l_off, RV_REG_ZERO, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1157  		for (i =3D 0; i < fmod_re=
t->nr_links; i++) {
49b5e77ae3e214 Pu Lehui       2023-02-15  1158  			ret =3D invoke_bpf_prog(=
fmod_ret->links[i], args_off, retval_off,
49b5e77ae3e214 Pu Lehui       2023-02-15  1159  					      run_ctx_off, tru=
e, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1160  			if (ret)
49b5e77ae3e214 Pu Lehui       2023-02-15  1161  				goto out;
49b5e77ae3e214 Pu Lehui       2023-02-15  1162  			emit_ld(RV_REG_T1, -retv=
al_off, RV_REG_FP, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1163  			branches_off[i] =3D ctx-=
>ninsns;
49b5e77ae3e214 Pu Lehui       2023-02-15  1164  			/* nop reserved for cond=
itional jump */
49b5e77ae3e214 Pu Lehui       2023-02-15  1165  			emit(rv_nop(), ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1166  		}
49b5e77ae3e214 Pu Lehui       2023-02-15  1167  	}
49b5e77ae3e214 Pu Lehui       2023-02-15  1168 =20
49b5e77ae3e214 Pu Lehui       2023-02-15  1169  	if (flags & BPF_TRAMP_F_CA=
LL_ORIG) {
8f3e00af8e52c0 Menglong Dong  2025-12-19  1170  		/* skip to actual body of=
 traced function */
8f3e00af8e52c0 Menglong Dong  2025-12-19  1171  		orig_call +=3D RV_FENTRY_=
NINSNS * 4;
6801b0aef79db4 Pu Lehui       2024-07-02  1172  		restore_args(min_t(int, n=
r_arg_slots, RV_MAX_REG_ARGS), args_off, ctx);
6801b0aef79db4 Pu Lehui       2024-07-02  1173  		restore_stack_args(nr_arg=
_slots - RV_MAX_REG_ARGS, args_off, stk_arg_off, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1174  		ret =3D emit_call((const =
u64)orig_call, true, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1175  		if (ret)
49b5e77ae3e214 Pu Lehui       2023-02-15  1176  			goto out;
49b5e77ae3e214 Pu Lehui       2023-02-15  1177  		emit_sd(RV_REG_FP, -retva=
l_off, RV_REG_A0, ctx);
7112cd26e606c7 Bj=C3=B6rn T=C3=B6pel    2023-10-04  1178  		emit_sd(RV_REG_=
FP, -(retval_off - 8), regmap[BPF_REG_0], ctx);
2382a405c581ae Pu Lehui       2024-06-22  1179  		im->ip_after_call =3D ctx=
->ro_insns + ctx->ninsns;
49b5e77ae3e214 Pu Lehui       2023-02-15  1180  		/* 2 nops reserved for au=
ipc+jalr pair */
49b5e77ae3e214 Pu Lehui       2023-02-15  1181  		emit(rv_nop(), ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1182  		emit(rv_nop(), ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1183  	}
49b5e77ae3e214 Pu Lehui       2023-02-15  1184 =20
49b5e77ae3e214 Pu Lehui       2023-02-15  1185  	/* update branches saved i=
n invoke_bpf_mod_ret with bnez */
49b5e77ae3e214 Pu Lehui       2023-02-15  1186  	for (i =3D 0; ctx->insns &=
& i < fmod_ret->nr_links; i++) {
49b5e77ae3e214 Pu Lehui       2023-02-15  1187  		offset =3D ninsns_rvoff(c=
tx->ninsns - branches_off[i]);
49b5e77ae3e214 Pu Lehui       2023-02-15  1188  		insn =3D rv_bne(RV_REG_T1=
, RV_REG_ZERO, offset >> 1);
49b5e77ae3e214 Pu Lehui       2023-02-15  1189  		*(u32 *)(ctx->insns + bra=
nches_off[i]) =3D insn;
49b5e77ae3e214 Pu Lehui       2023-02-15  1190  	}
49b5e77ae3e214 Pu Lehui       2023-02-15  1191 =20
49b5e77ae3e214 Pu Lehui       2023-02-15  1192  	for (i =3D 0; i < fexit->n=
r_links; i++) {
49b5e77ae3e214 Pu Lehui       2023-02-15  1193  		ret =3D invoke_bpf_prog(f=
exit->links[i], args_off, retval_off,
49b5e77ae3e214 Pu Lehui       2023-02-15  1194  				      run_ctx_off, fals=
e, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1195  		if (ret)
49b5e77ae3e214 Pu Lehui       2023-02-15  1196  			goto out;
49b5e77ae3e214 Pu Lehui       2023-02-15  1197  	}
49b5e77ae3e214 Pu Lehui       2023-02-15  1198 =20
49b5e77ae3e214 Pu Lehui       2023-02-15  1199  	if (flags & BPF_TRAMP_F_CA=
LL_ORIG) {
2382a405c581ae Pu Lehui       2024-06-22  1200  		im->ip_epilogue =3D ctx->=
ro_insns + ctx->ninsns;
9f1e16fb1fc982 Pu Lehui       2024-06-22  1201  		emit_imm(RV_REG_A0, ctx->=
insns ? (const s64)im : RV_MAX_COUNT_IMM, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1202  		ret =3D emit_call((const =
u64)__bpf_tramp_exit, true, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1203  		if (ret)
49b5e77ae3e214 Pu Lehui       2023-02-15  1204  			goto out;
49b5e77ae3e214 Pu Lehui       2023-02-15  1205  	}
49b5e77ae3e214 Pu Lehui       2023-02-15  1206 =20
49b5e77ae3e214 Pu Lehui       2023-02-15  1207  	if (flags & BPF_TRAMP_F_RE=
STORE_REGS)
6801b0aef79db4 Pu Lehui       2024-07-02  1208  		restore_args(min_t(int, n=
r_arg_slots, RV_MAX_REG_ARGS), args_off, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1209 =20
7112cd26e606c7 Bj=C3=B6rn T=C3=B6pel    2023-10-04  1210  	if (save_ret) {
7112cd26e606c7 Bj=C3=B6rn T=C3=B6pel    2023-10-04  1211  		emit_ld(regmap[=
BPF_REG_0], -(retval_off - 8), RV_REG_FP, ctx);
fd2e08128944a7 Hengqi Chen    2025-09-08  1212  		if (is_struct_ops) {
fd2e08128944a7 Hengqi Chen    2025-09-08  1213  			ret =3D sign_extend(RV_R=
EG_A0, regmap[BPF_REG_0], m->ret_size,
fd2e08128944a7 Hengqi Chen    2025-09-08  1214  					  m->ret_flags & BTF_F=
MODEL_SIGNED_ARG, ctx);
fd2e08128944a7 Hengqi Chen    2025-09-08  1215  			if (ret)
fd2e08128944a7 Hengqi Chen    2025-09-08  1216  				goto out;
fd2e08128944a7 Hengqi Chen    2025-09-08  1217  		} else {
fd2e08128944a7 Hengqi Chen    2025-09-08  1218  			emit_ld(RV_REG_A0, -retv=
al_off, RV_REG_FP, ctx);
fd2e08128944a7 Hengqi Chen    2025-09-08  1219  		}
7112cd26e606c7 Bj=C3=B6rn T=C3=B6pel    2023-10-04  1220  	}
49b5e77ae3e214 Pu Lehui       2023-02-15  1221 =20
49b5e77ae3e214 Pu Lehui       2023-02-15  1222  	emit_ld(RV_REG_S1, -sreg_o=
ff, RV_REG_FP, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1223 =20
1732ebc4a26181 Pu Lehui       2024-01-23  1224  	if (!is_struct_ops) {
25ad10658dc106 Pu Lehui       2023-07-21  1225  		/* trampoline called from=
 function entry */
25ad10658dc106 Pu Lehui       2023-07-21  1226  		emit_ld(RV_REG_T0, stack_=
size - 8, RV_REG_SP, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1227  		emit_ld(RV_REG_FP, stack_=
size - 16, RV_REG_SP, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1228  		emit_addi(RV_REG_SP, RV_R=
EG_SP, stack_size, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1229 =20
25ad10658dc106 Pu Lehui       2023-07-21  1230  		emit_ld(RV_REG_RA, 8, RV_=
REG_SP, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1231  		emit_ld(RV_REG_FP, 0, RV_=
REG_SP, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1232  		emit_addi(RV_REG_SP, RV_R=
EG_SP, 16, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1233 =20
49b5e77ae3e214 Pu Lehui       2023-02-15  1234  		if (flags & BPF_TRAMP_F_S=
KIP_FRAME)
25ad10658dc106 Pu Lehui       2023-07-21  1235  			/* return to parent func=
tion */
25ad10658dc106 Pu Lehui       2023-07-21  1236  			emit_jalr(RV_REG_ZERO, R=
V_REG_RA, 0, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1237  		else
25ad10658dc106 Pu Lehui       2023-07-21  1238  			/* return to traced func=
tion */
25ad10658dc106 Pu Lehui       2023-07-21  1239  			emit_jalr(RV_REG_ZERO, R=
V_REG_T0, 0, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1240  	} else {
25ad10658dc106 Pu Lehui       2023-07-21  1241  		/* trampoline called dire=
ctly */
25ad10658dc106 Pu Lehui       2023-07-21  1242  		emit_ld(RV_REG_RA, stack_=
size - 8, RV_REG_SP, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1243  		emit_ld(RV_REG_FP, stack_=
size - 16, RV_REG_SP, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1244  		emit_addi(RV_REG_SP, RV_R=
EG_SP, stack_size, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1245 =20
49b5e77ae3e214 Pu Lehui       2023-02-15  1246  		emit_jalr(RV_REG_ZERO, RV=
_REG_RA, 0, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1247  	}
49b5e77ae3e214 Pu Lehui       2023-02-15  1248 =20
49b5e77ae3e214 Pu Lehui       2023-02-15  1249  	ret =3D ctx->ninsns;
49b5e77ae3e214 Pu Lehui       2023-02-15  1250  out:
49b5e77ae3e214 Pu Lehui       2023-02-15  1251  	kfree(branches_off);
49b5e77ae3e214 Pu Lehui       2023-02-15  1252  	return ret;
49b5e77ae3e214 Pu Lehui       2023-02-15  1253  }
49b5e77ae3e214 Pu Lehui       2023-02-15  1254 =20

:::::: The code at line 1151 was first introduced by commit
:::::: 49b5e77ae3e214acff4728595b4ac7bf776693ca riscv, bpf: Add bpf trampol=
ine support for RV64

:::::: TO: Pu Lehui <pulehui@huawei.com>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
