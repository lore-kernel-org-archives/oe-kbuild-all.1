Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE63033E358
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 03:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774843113; cv=none; b=psCIGfBykj4JLs1kj47AjBeNvIxv22/PNoyigd+K030hwTVVUtret+mUT6mqTcTEbr3dnSvSUujPn7scCvqsl5RnIq03O4fqjqJU4nFvZCp3nUnVpsjKeIQZJ3nOytfZwV71Q9oxbEUjyCyyxqMGaQg2t+BtxYcd9AfP7pqX/gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774843113; c=relaxed/simple;
	bh=oHQm8xDFyqKMImXTtVa8WM8IHhmWI0UpKFYyYRqiEUw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V4XEbywGgil367axQbqFtBqhcxx859IRmXy355MfRAEmYDD1oWWoloh0JO3WANn8MGR3fuA8EUuJ1q7AbPP1akm/ONeou5SvaFq1Xt4fpIgUAC/cNXd4Gf9PhxQw5azyGBwX86soVRAJswHh8cfsj9Jbvr27Fu+tR15jN2P2tBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LOWKVCK1; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LOWKVCK1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774843111; x=1806379111;
  h=date:from:to:cc:subject:message-id;
  bh=oHQm8xDFyqKMImXTtVa8WM8IHhmWI0UpKFYyYRqiEUw=;
  b=LOWKVCK1N0gGdey8QZX7MLFOfG684G3Yl6iCU1n6f9d0uZXv+l5mnnhR
   JTkn5fwv67/bampEy2gZlBJz2cGjXLwDk755/LMuZnL8j32FZjE1f8LZ6
   qsROAA4E0paj/fQszFQ6OAvy0Lly9h+fXKa4s0bJ50cE2e7nhPwyLzj5R
   yzj8RTgkVeBT6X0i8tm4WKQgs+K8DoedGBtchpXQVcwXAsPgxVFgbSOXu
   +uwqqTX4CSMdd3X1iRJG5IJPIKaabczeXOBJpRipjvJzv8vNYtPI1aLsU
   sMKaRE1B5Fk8taO0d6Z+XjZNW0O+VvkVo7anVPxbBKwJb8+HuMMklD5YA
   w==;
X-CSE-ConnectionGUID: hQJWBVcSRIiPpWWj9QEvRg==
X-CSE-MsgGUID: 5pMZ1XZWQVew7Hc/2wV+1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75715712"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="75715712"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 20:58:26 -0700
X-CSE-ConnectionGUID: 7bfWjngxRDqdcc44k1gXFA==
X-CSE-MsgGUID: e/ZUFcGFRZqwf8djZOwOEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="221530630"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Mar 2026 20:58:24 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w73ld-000000000dL-2xbo;
	Mon, 30 Mar 2026 03:58:21 +0000
Date: Mon, 30 Mar 2026 11:58:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-malibu-staging 0/4]
 net/netfilter/nft_set_pipapo_avx2.c:1152: warning: Excess function parameter
 'ext' description in 'nft_pipapo_avx2_lookup'
Message-ID: <202603301127.lxhuY96o-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Florian,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-malibu-staging
head:   5de4567efb4a2a85c5768504b0f45f278e9b13a2
commit: 39ce3db914c4f944529c3fc96161c2d12be398b1 [0/4] netfilter: nft_set: remove one argument from lookup and update functions
config: x86_64-randconfig-002-20260330 (https://download.01.org/0day-ci/archive/20260330/202603301127.lxhuY96o-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603301127.lxhuY96o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603301127.lxhuY96o-lkp@intel.com/

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
