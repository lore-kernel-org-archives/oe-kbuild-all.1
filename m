Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957CF1095A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Dec 2023 06:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HmSOHi1+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702623041; x=1734159041;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jFqIUBJQd5vLm25vP60RNmCzOC2bcdEcev/yVE6gTtI=;
  b=HmSOHi1+ytn006IedOPqkt5fl4kEmPcc6ELiX3mTjlvgHLC77BPw6i1H
   zYXdXm3wqP3h1ig/LUYzId0h9SOQz5O8WxqVM5j/lYtZUUxsgeh5xbRWZ
   PP3fc/oEuBPXS9ZhyT42BxKjVU2ODxz1UHwDcum2fN1FwINETc1mGeOa0
   etD7eQhQ6YKSSqbUPm7WUDU3d+H+TiwkbiobOronsWj3xJsbzObJHxz0o
   vaC8ARIXxI/hbErXBH1gjOM3UWfqJCll5qeWZ/vBvvvjb5aRqpWX6IAAm
   h5BErWfoKsSma2bHrw3chWaSQT7e5tNs0IlKS9pCyDMnKgTUmvPHagelA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="392414459"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="392414459"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 22:50:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="22722523"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 14 Dec 2023 22:50:40 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rE210-000NCn-0O;
	Fri, 15 Dec 2023 06:49:48 +0000
Date: Fri, 15 Dec 2023 14:48:36 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie 25/35] net/core/filter.c:4427:64: sparse:
 sparse: incorrect type in argument 3 (different modifiers)
Message-ID: <202312151411.qNB7cwpD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/alobakin/linux idpf-libie
head:   3bd358daafd19b00cfd2caa30d72f6ae1bb1b611
commit: 46518a96f2c22f5deefe002f7c67990712b9c229 [25/35] bpf, xdp: constify some bpf_prog * function arguments
config: x86_64-randconfig-122-20231215 (https://download.01.org/0day-ci/archive/20231215/202312151411.qNB7cwpD-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312151411.qNB7cwpD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312151411.qNB7cwpD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/core/filter.c:1418:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sock_filter const *filter @@     got struct sock_filter [noderef] __user *filter @@
   net/core/filter.c:1418:39: sparse:     expected struct sock_filter const *filter
   net/core/filter.c:1418:39: sparse:     got struct sock_filter [noderef] __user *filter
   net/core/filter.c:1496:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sock_filter const *filter @@     got struct sock_filter [noderef] __user *filter @@
   net/core/filter.c:1496:39: sparse:     expected struct sock_filter const *filter
   net/core/filter.c:1496:39: sparse:     got struct sock_filter [noderef] __user *filter
   net/core/filter.c:2322:45: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __be32 [usertype] daddr @@     got unsigned int [usertype] ipv4_nh @@
   net/core/filter.c:2322:45: sparse:     expected restricted __be32 [usertype] daddr
   net/core/filter.c:2322:45: sparse:     got unsigned int [usertype] ipv4_nh
>> net/core/filter.c:4427:64: sparse: sparse: incorrect type in argument 3 (different modifiers) @@     expected struct bpf_prog *xdp_prog @@     got struct bpf_prog const *xdp_prog @@
   net/core/filter.c:4427:64: sparse:     expected struct bpf_prog *xdp_prog
   net/core/filter.c:4427:64: sparse:     got struct bpf_prog const *xdp_prog
   net/core/filter.c:4430:66: sparse: sparse: incorrect type in argument 3 (different modifiers) @@     expected struct bpf_prog *xdp_prog @@     got struct bpf_prog const *xdp_prog @@
   net/core/filter.c:4430:66: sparse:     expected struct bpf_prog *xdp_prog
   net/core/filter.c:4430:66: sparse:     got struct bpf_prog const *xdp_prog
   net/core/filter.c:10893:31: sparse: sparse: symbol 'sk_filter_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:10900:27: sparse: sparse: symbol 'sk_filter_prog_ops' was not declared. Should it be static?
   net/core/filter.c:10904:31: sparse: sparse: symbol 'tc_cls_act_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:10913:27: sparse: sparse: symbol 'tc_cls_act_prog_ops' was not declared. Should it be static?
   net/core/filter.c:10917:31: sparse: sparse: symbol 'xdp_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:10929:31: sparse: sparse: symbol 'cg_skb_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:10935:27: sparse: sparse: symbol 'cg_skb_prog_ops' was not declared. Should it be static?
   net/core/filter.c:10939:31: sparse: sparse: symbol 'lwt_in_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:10945:27: sparse: sparse: symbol 'lwt_in_prog_ops' was not declared. Should it be static?
   net/core/filter.c:10949:31: sparse: sparse: symbol 'lwt_out_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:10955:27: sparse: sparse: symbol 'lwt_out_prog_ops' was not declared. Should it be static?
   net/core/filter.c:10959:31: sparse: sparse: symbol 'lwt_xmit_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:10966:27: sparse: sparse: symbol 'lwt_xmit_prog_ops' was not declared. Should it be static?
   net/core/filter.c:10970:31: sparse: sparse: symbol 'lwt_seg6local_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:10976:27: sparse: sparse: symbol 'lwt_seg6local_prog_ops' was not declared. Should it be static?
   net/core/filter.c:10980:31: sparse: sparse: symbol 'cg_sock_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:10986:27: sparse: sparse: symbol 'cg_sock_prog_ops' was not declared. Should it be static?
   net/core/filter.c:10989:31: sparse: sparse: symbol 'cg_sock_addr_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:10995:27: sparse: sparse: symbol 'cg_sock_addr_prog_ops' was not declared. Should it be static?
   net/core/filter.c:10998:31: sparse: sparse: symbol 'sock_ops_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11004:27: sparse: sparse: symbol 'sock_ops_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11007:31: sparse: sparse: symbol 'sk_skb_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11014:27: sparse: sparse: symbol 'sk_skb_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11017:31: sparse: sparse: symbol 'sk_msg_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11024:27: sparse: sparse: symbol 'sk_msg_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11027:31: sparse: sparse: symbol 'flow_dissector_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11033:27: sparse: sparse: symbol 'flow_dissector_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11361:31: sparse: sparse: symbol 'sk_reuseport_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11367:27: sparse: sparse: symbol 'sk_reuseport_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11569:27: sparse: sparse: symbol 'sk_lookup_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11573:31: sparse: sparse: symbol 'sk_lookup_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:1928:43: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __wsum [usertype] diff @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1928:43: sparse:     expected restricted __wsum [usertype] diff
   net/core/filter.c:1928:43: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:1931:36: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __be16 [usertype] old @@     got unsigned long long [usertype] from @@
   net/core/filter.c:1931:36: sparse:     expected restricted __be16 [usertype] old
   net/core/filter.c:1931:36: sparse:     got unsigned long long [usertype] from
   net/core/filter.c:1931:42: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __be16 [usertype] new @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1931:42: sparse:     expected restricted __be16 [usertype] new
   net/core/filter.c:1931:42: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:1934:36: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __be32 [usertype] from @@     got unsigned long long [usertype] from @@
   net/core/filter.c:1934:36: sparse:     expected restricted __be32 [usertype] from
   net/core/filter.c:1934:36: sparse:     got unsigned long long [usertype] from
   net/core/filter.c:1934:42: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __be32 [usertype] to @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1934:42: sparse:     expected restricted __be32 [usertype] to
   net/core/filter.c:1934:42: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:1979:59: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __wsum [usertype] diff @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1979:59: sparse:     expected restricted __wsum [usertype] diff
   net/core/filter.c:1979:59: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:1982:52: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __be16 [usertype] from @@     got unsigned long long [usertype] from @@
   net/core/filter.c:1982:52: sparse:     expected restricted __be16 [usertype] from
   net/core/filter.c:1982:52: sparse:     got unsigned long long [usertype] from
   net/core/filter.c:1982:58: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __be16 [usertype] to @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1982:58: sparse:     expected restricted __be16 [usertype] to
   net/core/filter.c:1982:58: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:1985:52: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __be32 [usertype] from @@     got unsigned long long [usertype] from @@
   net/core/filter.c:1985:52: sparse:     expected restricted __be32 [usertype] from
   net/core/filter.c:1985:52: sparse:     got unsigned long long [usertype] from
   net/core/filter.c:1985:58: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __be32 [usertype] to @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1985:58: sparse:     expected restricted __be32 [usertype] to
   net/core/filter.c:1985:58: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:2031:28: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned long long @@     got restricted __wsum @@
   net/core/filter.c:2031:28: sparse:     expected unsigned long long
   net/core/filter.c:2031:28: sparse:     got restricted __wsum
   net/core/filter.c:2053:35: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned long long @@     got restricted __wsum [usertype] csum @@
   net/core/filter.c:2053:35: sparse:     expected unsigned long long
   net/core/filter.c:2053:35: sparse:     got restricted __wsum [usertype] csum

vim +4427 net/core/filter.c

1372d34ccf6dd4 Toke Høiland-Jørgensen  2022-01-03  4408  
c060bc6115b6a2 Xiongwei Song           2017-12-19  4409  static int xdp_do_generic_redirect_map(struct net_device *dev,
c060bc6115b6a2 Xiongwei Song           2017-12-19  4410  				       struct sk_buff *skb,
02671e23e7b383 Björn Töpel             2018-05-02  4411  				       struct xdp_buff *xdp,
46518a96f2c22f Alexander Lobakin       2023-12-11  4412  				       const struct bpf_prog *xdp_prog,
ee75aef23afe6e Björn Töpel             2021-03-08  4413  				       void *fwd,
ee75aef23afe6e Björn Töpel             2021-03-08  4414  				       enum bpf_map_type map_type, u32 map_id)
6103aa96ec077c John Fastabend          2017-07-17  4415  {
0b19cc0a8694d4 Toshiaki Makita         2018-08-03  4416  	struct bpf_redirect_info *ri = this_cpu_ptr(&bpf_redirect_info);
e624d4ed4aa8cc Hangbin Liu             2021-05-19  4417  	struct bpf_map *map;
ee75aef23afe6e Björn Töpel             2021-03-08  4418  	int err;
6d5fc195798926 Toshiaki Makita         2018-06-14  4419  
ee75aef23afe6e Björn Töpel             2021-03-08  4420  	switch (map_type) {
ee75aef23afe6e Björn Töpel             2021-03-08  4421  	case BPF_MAP_TYPE_DEVMAP:
ee75aef23afe6e Björn Töpel             2021-03-08  4422  		fallthrough;
ee75aef23afe6e Björn Töpel             2021-03-08  4423  	case BPF_MAP_TYPE_DEVMAP_HASH:
e624d4ed4aa8cc Hangbin Liu             2021-05-19  4424  		map = READ_ONCE(ri->map);
e624d4ed4aa8cc Hangbin Liu             2021-05-19  4425  		if (unlikely(map)) {
e624d4ed4aa8cc Hangbin Liu             2021-05-19  4426  			WRITE_ONCE(ri->map, NULL);
e624d4ed4aa8cc Hangbin Liu             2021-05-19 @4427  			err = dev_map_redirect_multi(dev, skb, xdp_prog, map,
e624d4ed4aa8cc Hangbin Liu             2021-05-19  4428  						     ri->flags & BPF_F_EXCLUDE_INGRESS);
e624d4ed4aa8cc Hangbin Liu             2021-05-19  4429  		} else {
ee75aef23afe6e Björn Töpel             2021-03-08  4430  			err = dev_map_generic_redirect(fwd, skb, xdp_prog);
e624d4ed4aa8cc Hangbin Liu             2021-05-19  4431  		}
6d5fc195798926 Toshiaki Makita         2018-06-14  4432  		if (unlikely(err))
9c270af37bb62e Jesper Dangaard Brouer  2017-10-16  4433  			goto err;
ee75aef23afe6e Björn Töpel             2021-03-08  4434  		break;
ee75aef23afe6e Björn Töpel             2021-03-08  4435  	case BPF_MAP_TYPE_XSKMAP:
ee75aef23afe6e Björn Töpel             2021-03-08  4436  		err = xsk_generic_rcv(fwd, xdp);
02671e23e7b383 Björn Töpel             2018-05-02  4437  		if (err)
02671e23e7b383 Björn Töpel             2018-05-02  4438  			goto err;
02671e23e7b383 Björn Töpel             2018-05-02  4439  		consume_skb(skb);
ee75aef23afe6e Björn Töpel             2021-03-08  4440  		break;
11941f8a85362f Kumar Kartikeya Dwivedi 2021-07-02  4441  	case BPF_MAP_TYPE_CPUMAP:
11941f8a85362f Kumar Kartikeya Dwivedi 2021-07-02  4442  		err = cpu_map_generic_redirect(fwd, skb);
11941f8a85362f Kumar Kartikeya Dwivedi 2021-07-02  4443  		if (unlikely(err))
11941f8a85362f Kumar Kartikeya Dwivedi 2021-07-02  4444  			goto err;
11941f8a85362f Kumar Kartikeya Dwivedi 2021-07-02  4445  		break;
ee75aef23afe6e Björn Töpel             2021-03-08  4446  	default:
9c270af37bb62e Jesper Dangaard Brouer  2017-10-16  4447  		err = -EBADRQC;
f5836ca5e9867f Jesper Dangaard Brouer  2017-08-29  4448  		goto err;
2facaad6000f23 Jesper Dangaard Brouer  2017-08-24  4449  	}
6103aa96ec077c John Fastabend          2017-07-17  4450  
ee75aef23afe6e Björn Töpel             2021-03-08  4451  	_trace_xdp_redirect_map(dev, xdp_prog, fwd, map_type, map_id, ri->tgt_index);
9c270af37bb62e Jesper Dangaard Brouer  2017-10-16  4452  	return 0;
9c270af37bb62e Jesper Dangaard Brouer  2017-10-16  4453  err:
ee75aef23afe6e Björn Töpel             2021-03-08  4454  	_trace_xdp_redirect_map_err(dev, xdp_prog, fwd, map_type, map_id, ri->tgt_index, err);
9c270af37bb62e Jesper Dangaard Brouer  2017-10-16  4455  	return err;
9c270af37bb62e Jesper Dangaard Brouer  2017-10-16  4456  }
9c270af37bb62e Jesper Dangaard Brouer  2017-10-16  4457  

:::::: The code at line 4427 was first introduced by commit
:::::: e624d4ed4aa8cc3c69d1359b0aaea539203ed266 xdp: Extend xdp_redirect_map with broadcast support

:::::: TO: Hangbin Liu <liuhangbin@gmail.com>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
