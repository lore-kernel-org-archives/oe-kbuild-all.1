Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA05218AAD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 00:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765499337; cv=none; b=u2XgLGsr10DlD8iLA6EU3qTmP0McspG6PQQSTZXlLvkGnSWobTAqZANXOPDftS35cogQewjSfp6TWsh6wEvLUB4rWuCWmXnnP32J9vk165ffjwoMAE5p4yOd7vmSjv03d6mWpa8zKjuRY+gdI+sApLvX9b//zdXA8/ncOq9Lo1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765499337; c=relaxed/simple;
	bh=xVKzXQ9aIssuKsLe1shbmJMTi9AZBEGgJi9WLDOwTeA=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=amOjw3fxt5FZ5dRi/pxxIlzKaV9yfJATL2yrjNkku7tKhTzMDSoj7sd7buxHpQfwulootJkmy0mnAYtmgtWpiTs9x1BjodLfUEbOl07VyLd0JCWk+MZOLNegQq6Cr0ZRRcfjsM0XML29Oj0YMvIbrjW3yKA5Kw3BnsTB8xI5eqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j2rqegXy; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j2rqegXy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765499337; x=1797035337;
  h=date:from:cc:subject:message-id:mime-version;
  bh=xVKzXQ9aIssuKsLe1shbmJMTi9AZBEGgJi9WLDOwTeA=;
  b=j2rqegXyFh77+YuHbOoPNlgB50E///NNgDFWGjVkK30Loq/MnG9of05p
   +9tbXRq52FAfiE4dqiCjM4Ua8txGzsfStdvG7YcTDh8x6Ur/hfgqknmoF
   Auex7atNLRTCFQqkY5wH/rHC9b2WXOzp+w5fQc61EKIq2npGLNIv5ZhWu
   f8Ar1SdpOCippkTo1d0zCSA+Ge0xGPDs21AYlHIKEY6Ihr3x1eQvIKz4W
   PZv6DswkxwIPh5HpA0yp+V+ytzbOA5swwCMmNe+qtOWkwoc5uZu/GyPUv
   w9cSsd3QxANr5uu2Qg0FeIDIbdaWl1aGYea0NXJc6d5BMAvTn/6TUsDf8
   w==;
X-CSE-ConnectionGUID: BFYR5V60Ro2bZ/ZuTbWH+Q==
X-CSE-MsgGUID: YUqHq4G6SP+wekh+8zllDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67447455"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67447455"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 16:28:56 -0800
X-CSE-ConnectionGUID: qUYNFZxHRUyqbJNYCZBwxA==
X-CSE-MsgGUID: dS0VClGtQ9m/ElQQ7iC1pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="201410795"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 11 Dec 2025 16:28:55 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTr1g-000000001Fd-3EVr
	for oe-kbuild-all@lists.linux.dev;
	Fri, 12 Dec 2025 00:28:52 +0000
Date: Fri, 12 Dec 2025 01:28:42 +0100
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.12/emt 9/9] net/netfilter/nft_set_pipapo_avx2.c:1152:
 warning: Excess function parameter 'ext' description in
 'nft_pipapo_avx2_lookup'
Message-ID: <202512120109.maQiLb4y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/emt
head:   aac28a88afc1d68448c7e5672fed4da83e10fe8b
commit: 39ce3db914c4f944529c3fc96161c2d12be398b1 [9/9] netfilter: nft_set: remove one argument from lookup and update functions
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251212/202512120109.maQiLb4y-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120109.maQiLb4y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120109.maQiLb4y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/nft_set_pipapo_avx2.c:1152: warning: Excess function parameter 'ext' description in 'nft_pipapo_avx2_lookup'


vim +1152 net/netfilter/nft_set_pipapo_avx2.c

251496ce1728c9 Florian Westphal 2025-05-23  1134  
7400b063969bdc Stefano Brivio   2020-03-07  1135  /**
7400b063969bdc Stefano Brivio   2020-03-07  1136   * nft_pipapo_avx2_lookup() - Lookup function for AVX2 implementation
7400b063969bdc Stefano Brivio   2020-03-07  1137   * @net:	Network namespace
7400b063969bdc Stefano Brivio   2020-03-07  1138   * @set:	nftables API set representation
89258f8e414863 Florian Westphal 2021-05-29  1139   * @key:	nftables API element representation containing key data
7400b063969bdc Stefano Brivio   2020-03-07  1140   * @ext:	nftables API extension pointer, filled with matching reference
7400b063969bdc Stefano Brivio   2020-03-07  1141   *
7400b063969bdc Stefano Brivio   2020-03-07  1142   * For more details, see DOC: Theory of Operation in nft_set_pipapo.c.
7400b063969bdc Stefano Brivio   2020-03-07  1143   *
7400b063969bdc Stefano Brivio   2020-03-07  1144   * This implementation exploits the repetitive characteristic of the algorithm
7400b063969bdc Stefano Brivio   2020-03-07  1145   * to provide a fast, vectorised version using the AVX2 SIMD instruction set.
7400b063969bdc Stefano Brivio   2020-03-07  1146   *
7400b063969bdc Stefano Brivio   2020-03-07  1147   * Return: true on match, false otherwise.
7400b063969bdc Stefano Brivio   2020-03-07  1148   */
39ce3db914c4f9 Florian Westphal 2025-07-09  1149  const struct nft_set_ext *
39ce3db914c4f9 Florian Westphal 2025-07-09  1150  nft_pipapo_avx2_lookup(const struct net *net, const struct nft_set *set,
39ce3db914c4f9 Florian Westphal 2025-07-09  1151  		       const u32 *key)
7400b063969bdc Stefano Brivio   2020-03-07 @1152  {
7400b063969bdc Stefano Brivio   2020-03-07  1153  	struct nft_pipapo *priv = nft_set_priv(set);
76313d1a4aa9e3 Florian Westphal 2024-02-07  1154  	struct nft_pipapo_scratch *scratch;
7400b063969bdc Stefano Brivio   2020-03-07  1155  	u8 genmask = nft_genmask_cur(net);
f04df573faf90b Florian Westphal 2024-02-13  1156  	const struct nft_pipapo_match *m;
f04df573faf90b Florian Westphal 2024-02-13  1157  	const struct nft_pipapo_field *f;
7400b063969bdc Stefano Brivio   2020-03-07  1158  	const u8 *rp = (const u8 *)key;
39ce3db914c4f9 Florian Westphal 2025-07-09  1159  	const struct nft_set_ext *ext;
76313d1a4aa9e3 Florian Westphal 2024-02-07  1160  	unsigned long *res, *fill;
7400b063969bdc Stefano Brivio   2020-03-07  1161  	bool map_index;
39ce3db914c4f9 Florian Westphal 2025-07-09  1162  	int i;
7400b063969bdc Stefano Brivio   2020-03-07  1163  
a16909ae9982e9 Florian Westphal 2024-07-19  1164  	local_bh_disable();
a16909ae9982e9 Florian Westphal 2024-07-19  1165  
a16909ae9982e9 Florian Westphal 2024-07-19  1166  	if (unlikely(!irq_fpu_usable())) {
39ce3db914c4f9 Florian Westphal 2025-07-09  1167  		ext = nft_pipapo_lookup(net, set, key);
a16909ae9982e9 Florian Westphal 2024-07-19  1168  
a16909ae9982e9 Florian Westphal 2024-07-19  1169  		local_bh_enable();
39ce3db914c4f9 Florian Westphal 2025-07-09  1170  		return ext;
a16909ae9982e9 Florian Westphal 2024-07-19  1171  	}
f0b3d338064e1f Stefano Brivio   2021-05-10  1172  
7400b063969bdc Stefano Brivio   2020-03-07  1173  	m = rcu_dereference(priv->match);
7400b063969bdc Stefano Brivio   2020-03-07  1174  
a58db7ad80e89d Stefano Brivio   2021-05-10  1175  	/* This also protects access to all data related to scratch maps.
a58db7ad80e89d Stefano Brivio   2021-05-10  1176  	 *
a58db7ad80e89d Stefano Brivio   2021-05-10  1177  	 * Note that we don't need a valid MXCSR state for any of the
a58db7ad80e89d Stefano Brivio   2021-05-10  1178  	 * operations we use here, so pass 0 as mask and spare a LDMXCSR
a58db7ad80e89d Stefano Brivio   2021-05-10  1179  	 * instruction.
a58db7ad80e89d Stefano Brivio   2021-05-10  1180  	 */
a58db7ad80e89d Stefano Brivio   2021-05-10  1181  	kernel_fpu_begin_mask(0);
7400b063969bdc Stefano Brivio   2020-03-07  1182  
5a8cdf6fd860ac Florian Westphal 2024-02-08  1183  	scratch = *raw_cpu_ptr(m->scratch);
7400b063969bdc Stefano Brivio   2020-03-07  1184  	if (unlikely(!scratch)) {
7400b063969bdc Stefano Brivio   2020-03-07  1185  		kernel_fpu_end();
a16909ae9982e9 Florian Westphal 2024-07-19  1186  		local_bh_enable();
39ce3db914c4f9 Florian Westphal 2025-07-09  1187  		return NULL;
7400b063969bdc Stefano Brivio   2020-03-07  1188  	}
7400b063969bdc Stefano Brivio   2020-03-07  1189  
76313d1a4aa9e3 Florian Westphal 2024-02-07  1190  	map_index = scratch->map_index;
76313d1a4aa9e3 Florian Westphal 2024-02-07  1191  
76313d1a4aa9e3 Florian Westphal 2024-02-07  1192  	res  = scratch->map + (map_index ? m->bsize_max : 0);
76313d1a4aa9e3 Florian Westphal 2024-02-07  1193  	fill = scratch->map + (map_index ? 0 : m->bsize_max);
7400b063969bdc Stefano Brivio   2020-03-07  1194  
251496ce1728c9 Florian Westphal 2025-05-23  1195  	pipapo_resmap_init_avx2(m, res);
7400b063969bdc Stefano Brivio   2020-03-07  1196  
7400b063969bdc Stefano Brivio   2020-03-07  1197  	nft_pipapo_avx2_prepare();
7400b063969bdc Stefano Brivio   2020-03-07  1198  
7400b063969bdc Stefano Brivio   2020-03-07  1199  next_match:
7400b063969bdc Stefano Brivio   2020-03-07  1200  	nft_pipapo_for_each_field(f, i, m) {
7400b063969bdc Stefano Brivio   2020-03-07  1201  		bool last = i == m->field_count - 1, first = !i;
39ce3db914c4f9 Florian Westphal 2025-07-09  1202  		int ret = 0;
7400b063969bdc Stefano Brivio   2020-03-07  1203  

:::::: The code at line 1152 was first introduced by commit
:::::: 7400b063969bdca4a06cd97f1294d765c8eecbe1 nft_set_pipapo: Introduce AVX2-based lookup implementation

:::::: TO: Stefano Brivio <sbrivio@redhat.com>
:::::: CC: Pablo Neira Ayuso <pablo@netfilter.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
