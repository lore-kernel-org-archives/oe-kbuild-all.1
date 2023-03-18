Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF62E7F8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Mar 2023 07:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679125844; x=1710661844;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pnbm/G21Hqao9DIg2CiYNrq3DZkU2FUZ61jG90lEsEI=;
  b=RV3LQrO13GxHNNFgiX4B14gLeE84bqvhRNjDs4i4S4Q3GSseX+BPzZFI
   0sWzpdBEqtgVDN3ychs+/EuA89sujksKaQjk0RtTN87GD4VaIzOCZLNSZ
   Np8QrPAirBGLLVxwCfYqsYaUQ2rADGWt8D91auJMjpDrU1i/C1jfe7saF
   PjrQnm0dvTe2NDkHeIqUXk1Jx/wnfDliImZyLBHrDQt9y99ENBNE1OSGQ
   VWvC5A0rYei9WFXOUrPnOQRVxCCyfQe3mI9am7dZ9IpJeTeW5jtd6dKpd
   DJ36PInK0yEGLfbi1L8s4krIGSHIEqdIXpOCdIAwFLqUGVpyon4SJg4eH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="337121211"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="337121211"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 00:50:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="791011777"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="791011777"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 18 Mar 2023 00:50:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdRKn-0009uc-1X;
	Sat, 18 Mar 2023 07:50:37 +0000
Date: Sat, 18 Mar 2023 15:49:53 +0800
From: kernel test robot <lkp@intel.com>
To: Viktor Malik <vmalik@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>
Subject: [bpf-next:master 1/2] kernel/bpf/verifier.c:18485: undefined
 reference to `find_kallsyms_symbol_value'
Message-ID: <202303181535.RFDCnz3E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   a466a1a8ee79f10f153c3ad608eb1881d62859e1
commit: bd5314f8dd2d41330eecb60f0490c3fcfe1fc99d [1/2] kallsyms, bpf: Move find_kallsyms_symbol_value out of internal header
config: ia64-randconfig-r012-20230312 (https://download.01.org/0day-ci/archive/20230318/202303181535.RFDCnz3E-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?id=bd5314f8dd2d41330eecb60f0490c3fcfe1fc99d
        git remote add bpf-next https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git
        git fetch --no-tags bpf-next master
        git checkout bd5314f8dd2d41330eecb60f0490c3fcfe1fc99d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303181535.RFDCnz3E-lkp@intel.com/

All errors (new ones prefixed by >>):

   ia64-linux-ld: kernel/bpf/verifier.o: in function `bpf_check_attach_target':
>> kernel/bpf/verifier.c:18485: undefined reference to `find_kallsyms_symbol_value'
   pahole: .tmp_vmlinux.btf: Invalid argument
   .btf.vmlinux.bin.o: file not recognized: file format not recognized


vim +18485 kernel/bpf/verifier.c

1e6c62a8821557 Alexei Starovoitov     2020-08-27  18293  
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  18294  int bpf_check_attach_target(struct bpf_verifier_log *log,
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  18295  			    const struct bpf_prog *prog,
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  18296  			    const struct bpf_prog *tgt_prog,
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  18297  			    u32 btf_id,
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  18298  			    struct bpf_attach_target_info *tgt_info)
38207291604401 Martin KaFai Lau       2019-10-24  18299  {
be8704ff07d237 Alexei Starovoitov     2020-01-20  18300  	bool prog_extension = prog->type == BPF_PROG_TYPE_EXT;
f1b9509c2fb0ef Alexei Starovoitov     2019-10-30  18301  	const char prefix[] = "btf_trace_";
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  18302  	int ret = 0, subprog = -1, i;
38207291604401 Martin KaFai Lau       2019-10-24  18303  	const struct btf_type *t;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  18304  	bool conservative = true;
38207291604401 Martin KaFai Lau       2019-10-24  18305  	const char *tname;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  18306  	struct btf *btf;
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  18307  	long addr = 0;
31bf1dbccfb0a9 Viktor Malik           2023-03-10  18308  	struct module *mod = NULL;
38207291604401 Martin KaFai Lau       2019-10-24  18309  
f1b9509c2fb0ef Alexei Starovoitov     2019-10-30  18310  	if (!btf_id) {
efc68158c429f3 Toke Høiland-Jørgensen 2020-09-25  18311  		bpf_log(log, "Tracing programs must provide btf_id\n");
f1b9509c2fb0ef Alexei Starovoitov     2019-10-30  18312  		return -EINVAL;
f1b9509c2fb0ef Alexei Starovoitov     2019-10-30  18313  	}
22dc4a0f5ed11b Andrii Nakryiko        2020-12-03  18314  	btf = tgt_prog ? tgt_prog->aux->btf : prog->aux->attach_btf;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  18315  	if (!btf) {
efc68158c429f3 Toke Høiland-Jørgensen 2020-09-25  18316  		bpf_log(log,
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  18317  			"FENTRY/FEXIT program can only be attached to another program annotated with BTF\n");
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  18318  		return -EINVAL;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  18319  	}
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  18320  	t = btf_type_by_id(btf, btf_id);
38207291604401 Martin KaFai Lau       2019-10-24  18321  	if (!t) {
efc68158c429f3 Toke Høiland-Jørgensen 2020-09-25  18322  		bpf_log(log, "attach_btf_id %u is invalid\n", btf_id);
38207291604401 Martin KaFai Lau       2019-10-24  18323  		return -EINVAL;
38207291604401 Martin KaFai Lau       2019-10-24  18324  	}
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  18325  	tname = btf_name_by_offset(btf, t->name_off);
f1b9509c2fb0ef Alexei Starovoitov     2019-10-30  18326  	if (!tname) {
efc68158c429f3 Toke Høiland-Jørgensen 2020-09-25  18327  		bpf_log(log, "attach_btf_id %u doesn't have a name\n", btf_id);
f1b9509c2fb0ef Alexei Starovoitov     2019-10-30  18328  		return -EINVAL;
f1b9509c2fb0ef Alexei Starovoitov     2019-10-30  18329  	}
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  18330  	if (tgt_prog) {
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  18331  		struct bpf_prog_aux *aux = tgt_prog->aux;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  18332  
fd7c211d687501 Toke Høiland-Jørgensen 2023-01-19  18333  		if (bpf_prog_is_dev_bound(prog->aux) &&
fd7c211d687501 Toke Høiland-Jørgensen 2023-01-19  18334  		    !bpf_prog_dev_bound_match(prog, tgt_prog)) {
fd7c211d687501 Toke Høiland-Jørgensen 2023-01-19  18335  			bpf_log(log, "Target program bound device mismatch");
3d76a4d3d4e591 Stanislav Fomichev     2023-01-19  18336  			return -EINVAL;
3d76a4d3d4e591 Stanislav Fomichev     2023-01-19  18337  		}
3d76a4d3d4e591 Stanislav Fomichev     2023-01-19  18338  
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  18339  		for (i = 0; i < aux->func_info_cnt; i++)
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  18340  			if (aux->func_info[i].type_id == btf_id) {
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  18341  				subprog = i;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  18342  				break;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  18343  			}
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  18344  		if (subprog == -1) {
efc68158c429f3 Toke Høiland-Jørgensen 2020-09-25  18345  			bpf_log(log, "Subprog %s doesn't exist\n", tname);
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  18346  			return -EINVAL;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  18347  		}
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  18348  		conservative = aux->func_info_aux[subprog].unreliable;
be8704ff07d237 Alexei Starovoitov     2020-01-20  18349  		if (prog_extension) {
be8704ff07d237 Alexei Starovoitov     2020-01-20  18350  			if (conservative) {
efc68158c429f3 Toke Høiland-Jørgensen 2020-09-25  18351  				bpf_log(log,
be8704ff07d237 Alexei Starovoitov     2020-01-20  18352  					"Cannot replace static functions\n");
be8704ff07d237 Alexei Starovoitov     2020-01-20  18353  				return -EINVAL;
be8704ff07d237 Alexei Starovoitov     2020-01-20  18354  			}
be8704ff07d237 Alexei Starovoitov     2020-01-20  18355  			if (!prog->jit_requested) {
efc68158c429f3 Toke Høiland-Jørgensen 2020-09-25  18356  				bpf_log(log,
be8704ff07d237 Alexei Starovoitov     2020-01-20  18357  					"Extension programs should be JITed\n");
be8704ff07d237 Alexei Starovoitov     2020-01-20  18358  				return -EINVAL;
be8704ff07d237 Alexei Starovoitov     2020-01-20  18359  			}
be8704ff07d237 Alexei Starovoitov     2020-01-20  18360  		}
be8704ff07d237 Alexei Starovoitov     2020-01-20  18361  		if (!tgt_prog->jited) {
efc68158c429f3 Toke Høiland-Jørgensen 2020-09-25  18362  			bpf_log(log, "Can attach to only JITed progs\n");
be8704ff07d237 Alexei Starovoitov     2020-01-20  18363  			return -EINVAL;
be8704ff07d237 Alexei Starovoitov     2020-01-20  18364  		}
be8704ff07d237 Alexei Starovoitov     2020-01-20  18365  		if (tgt_prog->type == prog->type) {
be8704ff07d237 Alexei Starovoitov     2020-01-20  18366  			/* Cannot fentry/fexit another fentry/fexit program.
be8704ff07d237 Alexei Starovoitov     2020-01-20  18367  			 * Cannot attach program extension to another extension.
be8704ff07d237 Alexei Starovoitov     2020-01-20  18368  			 * It's ok to attach fentry/fexit to extension program.
be8704ff07d237 Alexei Starovoitov     2020-01-20  18369  			 */
efc68158c429f3 Toke Høiland-Jørgensen 2020-09-25  18370  			bpf_log(log, "Cannot recursively attach\n");
be8704ff07d237 Alexei Starovoitov     2020-01-20  18371  			return -EINVAL;
be8704ff07d237 Alexei Starovoitov     2020-01-20  18372  		}
be8704ff07d237 Alexei Starovoitov     2020-01-20  18373  		if (tgt_prog->type == BPF_PROG_TYPE_TRACING &&
be8704ff07d237 Alexei Starovoitov     2020-01-20  18374  		    prog_extension &&
be8704ff07d237 Alexei Starovoitov     2020-01-20  18375  		    (tgt_prog->expected_attach_type == BPF_TRACE_FENTRY ||
be8704ff07d237 Alexei Starovoitov     2020-01-20  18376  		     tgt_prog->expected_attach_type == BPF_TRACE_FEXIT)) {
be8704ff07d237 Alexei Starovoitov     2020-01-20  18377  			/* Program extensions can extend all program types
be8704ff07d237 Alexei Starovoitov     2020-01-20  18378  			 * except fentry/fexit. The reason is the following.
be8704ff07d237 Alexei Starovoitov     2020-01-20  18379  			 * The fentry/fexit programs are used for performance
be8704ff07d237 Alexei Starovoitov     2020-01-20  18380  			 * analysis, stats and can be attached to any program
be8704ff07d237 Alexei Starovoitov     2020-01-20  18381  			 * type except themselves. When extension program is
be8704ff07d237 Alexei Starovoitov     2020-01-20  18382  			 * replacing XDP function it is necessary to allow
be8704ff07d237 Alexei Starovoitov     2020-01-20  18383  			 * performance analysis of all functions. Both original
be8704ff07d237 Alexei Starovoitov     2020-01-20  18384  			 * XDP program and its program extension. Hence
be8704ff07d237 Alexei Starovoitov     2020-01-20  18385  			 * attaching fentry/fexit to BPF_PROG_TYPE_EXT is
be8704ff07d237 Alexei Starovoitov     2020-01-20  18386  			 * allowed. If extending of fentry/fexit was allowed it
be8704ff07d237 Alexei Starovoitov     2020-01-20  18387  			 * would be possible to create long call chain
be8704ff07d237 Alexei Starovoitov     2020-01-20  18388  			 * fentry->extension->fentry->extension beyond
be8704ff07d237 Alexei Starovoitov     2020-01-20  18389  			 * reasonable stack size. Hence extending fentry is not
be8704ff07d237 Alexei Starovoitov     2020-01-20  18390  			 * allowed.
be8704ff07d237 Alexei Starovoitov     2020-01-20  18391  			 */
efc68158c429f3 Toke Høiland-Jørgensen 2020-09-25  18392  			bpf_log(log, "Cannot extend fentry/fexit\n");
be8704ff07d237 Alexei Starovoitov     2020-01-20  18393  			return -EINVAL;
be8704ff07d237 Alexei Starovoitov     2020-01-20  18394  		}
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  18395  	} else {
be8704ff07d237 Alexei Starovoitov     2020-01-20  18396  		if (prog_extension) {
efc68158c429f3 Toke Høiland-Jørgensen 2020-09-25  18397  			bpf_log(log, "Cannot replace kernel functions\n");
be8704ff07d237 Alexei Starovoitov     2020-01-20  18398  			return -EINVAL;
be8704ff07d237 Alexei Starovoitov     2020-01-20  18399  		}
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  18400  	}
f1b9509c2fb0ef Alexei Starovoitov     2019-10-30  18401  
f1b9509c2fb0ef Alexei Starovoitov     2019-10-30  18402  	switch (prog->expected_attach_type) {
f1b9509c2fb0ef Alexei Starovoitov     2019-10-30  18403  	case BPF_TRACE_RAW_TP:
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  18404  		if (tgt_prog) {
efc68158c429f3 Toke Høiland-Jørgensen 2020-09-25  18405  			bpf_log(log,
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  18406  				"Only FENTRY/FEXIT progs are attachable to another BPF prog\n");
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  18407  			return -EINVAL;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  18408  		}
38207291604401 Martin KaFai Lau       2019-10-24  18409  		if (!btf_type_is_typedef(t)) {
efc68158c429f3 Toke Høiland-Jørgensen 2020-09-25  18410  			bpf_log(log, "attach_btf_id %u is not a typedef\n",
38207291604401 Martin KaFai Lau       2019-10-24  18411  				btf_id);
38207291604401 Martin KaFai Lau       2019-10-24  18412  			return -EINVAL;
38207291604401 Martin KaFai Lau       2019-10-24  18413  		}
f1b9509c2fb0ef Alexei Starovoitov     2019-10-30  18414  		if (strncmp(prefix, tname, sizeof(prefix) - 1)) {
efc68158c429f3 Toke Høiland-Jørgensen 2020-09-25  18415  			bpf_log(log, "attach_btf_id %u points to wrong type name %s\n",
38207291604401 Martin KaFai Lau       2019-10-24  18416  				btf_id, tname);
38207291604401 Martin KaFai Lau       2019-10-24  18417  			return -EINVAL;
38207291604401 Martin KaFai Lau       2019-10-24  18418  		}
38207291604401 Martin KaFai Lau       2019-10-24  18419  		tname += sizeof(prefix) - 1;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  18420  		t = btf_type_by_id(btf, t->type);
38207291604401 Martin KaFai Lau       2019-10-24  18421  		if (!btf_type_is_ptr(t))
38207291604401 Martin KaFai Lau       2019-10-24  18422  			/* should never happen in valid vmlinux build */
38207291604401 Martin KaFai Lau       2019-10-24  18423  			return -EINVAL;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  18424  		t = btf_type_by_id(btf, t->type);
38207291604401 Martin KaFai Lau       2019-10-24  18425  		if (!btf_type_is_func_proto(t))
38207291604401 Martin KaFai Lau       2019-10-24  18426  			/* should never happen in valid vmlinux build */
38207291604401 Martin KaFai Lau       2019-10-24  18427  			return -EINVAL;
38207291604401 Martin KaFai Lau       2019-10-24  18428  
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  18429  		break;
15d83c4d7cef5c Yonghong Song          2020-05-09  18430  	case BPF_TRACE_ITER:
15d83c4d7cef5c Yonghong Song          2020-05-09  18431  		if (!btf_type_is_func(t)) {
efc68158c429f3 Toke Høiland-Jørgensen 2020-09-25  18432  			bpf_log(log, "attach_btf_id %u is not a function\n",
15d83c4d7cef5c Yonghong Song          2020-05-09  18433  				btf_id);
15d83c4d7cef5c Yonghong Song          2020-05-09  18434  			return -EINVAL;
15d83c4d7cef5c Yonghong Song          2020-05-09  18435  		}
15d83c4d7cef5c Yonghong Song          2020-05-09  18436  		t = btf_type_by_id(btf, t->type);
15d83c4d7cef5c Yonghong Song          2020-05-09  18437  		if (!btf_type_is_func_proto(t))
15d83c4d7cef5c Yonghong Song          2020-05-09  18438  			return -EINVAL;
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  18439  		ret = btf_distill_func_proto(log, btf, t, tname, &tgt_info->fmodel);
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  18440  		if (ret)
15d83c4d7cef5c Yonghong Song          2020-05-09  18441  			return ret;
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  18442  		break;
be8704ff07d237 Alexei Starovoitov     2020-01-20  18443  	default:
be8704ff07d237 Alexei Starovoitov     2020-01-20  18444  		if (!prog_extension)
be8704ff07d237 Alexei Starovoitov     2020-01-20  18445  			return -EINVAL;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  18446  		fallthrough;
ae24082331d9bb KP Singh               2020-03-04  18447  	case BPF_MODIFY_RETURN:
9e4e01dfd3254c KP Singh               2020-03-29  18448  	case BPF_LSM_MAC:
69fd337a975c7e Stanislav Fomichev     2022-06-28  18449  	case BPF_LSM_CGROUP:
fec56f5890d93f Alexei Starovoitov     2019-11-14  18450  	case BPF_TRACE_FENTRY:
fec56f5890d93f Alexei Starovoitov     2019-11-14  18451  	case BPF_TRACE_FEXIT:
fec56f5890d93f Alexei Starovoitov     2019-11-14  18452  		if (!btf_type_is_func(t)) {
efc68158c429f3 Toke Høiland-Jørgensen 2020-09-25  18453  			bpf_log(log, "attach_btf_id %u is not a function\n",
fec56f5890d93f Alexei Starovoitov     2019-11-14  18454  				btf_id);
fec56f5890d93f Alexei Starovoitov     2019-11-14  18455  			return -EINVAL;
fec56f5890d93f Alexei Starovoitov     2019-11-14  18456  		}
be8704ff07d237 Alexei Starovoitov     2020-01-20  18457  		if (prog_extension &&
efc68158c429f3 Toke Høiland-Jørgensen 2020-09-25  18458  		    btf_check_type_match(log, prog, btf, t))
be8704ff07d237 Alexei Starovoitov     2020-01-20  18459  			return -EINVAL;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  18460  		t = btf_type_by_id(btf, t->type);
fec56f5890d93f Alexei Starovoitov     2019-11-14  18461  		if (!btf_type_is_func_proto(t))
fec56f5890d93f Alexei Starovoitov     2019-11-14  18462  			return -EINVAL;
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  18463  
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  18464  		if ((prog->aux->saved_dst_prog_type || prog->aux->saved_dst_attach_type) &&
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  18465  		    (!tgt_prog || prog->aux->saved_dst_prog_type != tgt_prog->type ||
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  18466  		     prog->aux->saved_dst_attach_type != tgt_prog->expected_attach_type))
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  18467  			return -EINVAL;
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  18468  
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  18469  		if (tgt_prog && conservative)
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  18470  			t = NULL;
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  18471  
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  18472  		ret = btf_distill_func_proto(log, btf, t, tname, &tgt_info->fmodel);
fec56f5890d93f Alexei Starovoitov     2019-11-14  18473  		if (ret < 0)
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  18474  			return ret;
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  18475  
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  18476  		if (tgt_prog) {
e9eeec58c992c4 Yonghong Song          2019-12-04  18477  			if (subprog == 0)
e9eeec58c992c4 Yonghong Song          2019-12-04  18478  				addr = (long) tgt_prog->bpf_func;
e9eeec58c992c4 Yonghong Song          2019-12-04  18479  			else
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  18480  				addr = (long) tgt_prog->aux->func[subprog]->bpf_func;
31bf1dbccfb0a9 Viktor Malik           2023-03-10  18481  		} else {
31bf1dbccfb0a9 Viktor Malik           2023-03-10  18482  			if (btf_is_module(btf)) {
31bf1dbccfb0a9 Viktor Malik           2023-03-10  18483  				mod = btf_try_get_module(btf);
31bf1dbccfb0a9 Viktor Malik           2023-03-10  18484  				if (mod)
31bf1dbccfb0a9 Viktor Malik           2023-03-10 @18485  					addr = find_kallsyms_symbol_value(mod, tname);
31bf1dbccfb0a9 Viktor Malik           2023-03-10  18486  				else
31bf1dbccfb0a9 Viktor Malik           2023-03-10  18487  					addr = 0;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  18488  			} else {
fec56f5890d93f Alexei Starovoitov     2019-11-14  18489  				addr = kallsyms_lookup_name(tname);
31bf1dbccfb0a9 Viktor Malik           2023-03-10  18490  			}
fec56f5890d93f Alexei Starovoitov     2019-11-14  18491  			if (!addr) {
31bf1dbccfb0a9 Viktor Malik           2023-03-10  18492  				module_put(mod);
efc68158c429f3 Toke Høiland-Jørgensen 2020-09-25  18493  				bpf_log(log,
fec56f5890d93f Alexei Starovoitov     2019-11-14  18494  					"The address of function %s cannot be found\n",
fec56f5890d93f Alexei Starovoitov     2019-11-14  18495  					tname);
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  18496  				return -ENOENT;
fec56f5890d93f Alexei Starovoitov     2019-11-14  18497  			}
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  18498  		}
18644cec714aab Alexei Starovoitov     2020-05-28  18499  
1e6c62a8821557 Alexei Starovoitov     2020-08-27  18500  		if (prog->aux->sleepable) {
1e6c62a8821557 Alexei Starovoitov     2020-08-27  18501  			ret = -EINVAL;
1e6c62a8821557 Alexei Starovoitov     2020-08-27  18502  			switch (prog->type) {
1e6c62a8821557 Alexei Starovoitov     2020-08-27  18503  			case BPF_PROG_TYPE_TRACING:
5b481acab4ce01 Benjamin Tissoires     2022-12-06  18504  
5b481acab4ce01 Benjamin Tissoires     2022-12-06  18505  				/* fentry/fexit/fmod_ret progs can be sleepable if they are
1e6c62a8821557 Alexei Starovoitov     2020-08-27  18506  				 * attached to ALLOW_ERROR_INJECTION and are not in denylist.
1e6c62a8821557 Alexei Starovoitov     2020-08-27  18507  				 */
1e6c62a8821557 Alexei Starovoitov     2020-08-27  18508  				if (!check_non_sleepable_error_inject(btf_id) &&
1e6c62a8821557 Alexei Starovoitov     2020-08-27  18509  				    within_error_injection_list(addr))
1e6c62a8821557 Alexei Starovoitov     2020-08-27  18510  					ret = 0;
5b481acab4ce01 Benjamin Tissoires     2022-12-06  18511  				/* fentry/fexit/fmod_ret progs can also be sleepable if they are
5b481acab4ce01 Benjamin Tissoires     2022-12-06  18512  				 * in the fmodret id set with the KF_SLEEPABLE flag.
5b481acab4ce01 Benjamin Tissoires     2022-12-06  18513  				 */
5b481acab4ce01 Benjamin Tissoires     2022-12-06  18514  				else {
5b481acab4ce01 Benjamin Tissoires     2022-12-06  18515  					u32 *flags = btf_kfunc_is_modify_return(btf, btf_id);
5b481acab4ce01 Benjamin Tissoires     2022-12-06  18516  
5b481acab4ce01 Benjamin Tissoires     2022-12-06  18517  					if (flags && (*flags & KF_SLEEPABLE))
5b481acab4ce01 Benjamin Tissoires     2022-12-06  18518  						ret = 0;
5b481acab4ce01 Benjamin Tissoires     2022-12-06  18519  				}
1e6c62a8821557 Alexei Starovoitov     2020-08-27  18520  				break;
1e6c62a8821557 Alexei Starovoitov     2020-08-27  18521  			case BPF_PROG_TYPE_LSM:
1e6c62a8821557 Alexei Starovoitov     2020-08-27  18522  				/* LSM progs check that they are attached to bpf_lsm_*() funcs.
1e6c62a8821557 Alexei Starovoitov     2020-08-27  18523  				 * Only some of them are sleepable.
1e6c62a8821557 Alexei Starovoitov     2020-08-27  18524  				 */
423f16108c9d83 KP Singh               2020-11-13  18525  				if (bpf_lsm_is_sleepable_hook(btf_id))
1e6c62a8821557 Alexei Starovoitov     2020-08-27  18526  					ret = 0;
1e6c62a8821557 Alexei Starovoitov     2020-08-27  18527  				break;
1e6c62a8821557 Alexei Starovoitov     2020-08-27  18528  			default:
1e6c62a8821557 Alexei Starovoitov     2020-08-27  18529  				break;
1e6c62a8821557 Alexei Starovoitov     2020-08-27  18530  			}
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  18531  			if (ret) {
31bf1dbccfb0a9 Viktor Malik           2023-03-10  18532  				module_put(mod);
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  18533  				bpf_log(log, "%s is not sleepable\n", tname);
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  18534  				return ret;
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  18535  			}
1e6c62a8821557 Alexei Starovoitov     2020-08-27  18536  		} else if (prog->expected_attach_type == BPF_MODIFY_RETURN) {
1af9270e908cd5 Toke Høiland-Jørgensen 2020-09-25  18537  			if (tgt_prog) {
31bf1dbccfb0a9 Viktor Malik           2023-03-10  18538  				module_put(mod);
efc68158c429f3 Toke Høiland-Jørgensen 2020-09-25  18539  				bpf_log(log, "can't modify return codes of BPF programs\n");
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  18540  				return -EINVAL;
1af9270e908cd5 Toke Høiland-Jørgensen 2020-09-25  18541  			}
5b481acab4ce01 Benjamin Tissoires     2022-12-06  18542  			ret = -EINVAL;
5b481acab4ce01 Benjamin Tissoires     2022-12-06  18543  			if (btf_kfunc_is_modify_return(btf, btf_id) ||
5b481acab4ce01 Benjamin Tissoires     2022-12-06  18544  			    !check_attach_modify_return(addr, tname))
5b481acab4ce01 Benjamin Tissoires     2022-12-06  18545  				ret = 0;
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  18546  			if (ret) {
31bf1dbccfb0a9 Viktor Malik           2023-03-10  18547  				module_put(mod);
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  18548  				bpf_log(log, "%s() is not modifiable\n", tname);
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  18549  				return ret;
18644cec714aab Alexei Starovoitov     2020-05-28  18550  			}
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  18551  		}
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  18552  
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  18553  		break;
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  18554  	}
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  18555  	tgt_info->tgt_addr = addr;
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  18556  	tgt_info->tgt_name = tname;
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  18557  	tgt_info->tgt_type = t;
31bf1dbccfb0a9 Viktor Malik           2023-03-10  18558  	tgt_info->tgt_mod = mod;
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  18559  	return 0;
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  18560  }
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  18561  

:::::: The code at line 18485 was first introduced by commit
:::::: 31bf1dbccfb0a9861d4846755096b3fff5687f8a bpf: Fix attaching fentry/fexit/fmod_ret/lsm to modules

:::::: TO: Viktor Malik <vmalik@redhat.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
