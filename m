Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242AE36075D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Apr 2026 06:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775631468; cv=none; b=cMHOdi5cxuGN5ptLRtctUgE4t6ezJnQ6U5MgG89DUhIJas0n8fn2cyQB7VgFzGBOu3VmPQdWY7GR+twQpTDrX/V9bMq12KHqdHkdw3gQywOyF/UglhN//ID0iVTZrXjzK1PXSDmGQ8wnPKJZdtx/ymyjLSK+ijufpYCixC9p7ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775631468; c=relaxed/simple;
	bh=wGvJfqlaHTxDnLBAW85+VcD7gHZAGT5yx5P1OvHvK04=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UXjXNQItJuRRWKdXWzUzNSQdJJbGNDzFOhr/nsyTHCN1cv70aljOT/yDUctDw78UH3F36AWWamEcAEBvRs91B423OH8CRFdjxQsUURZNtxM4b4ExeQ5q1ljXD/SszehIps8axhKQ9pbkVrq1IzU+5OBovbv/Eaor/DpaEXiWL8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jHydEniy; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jHydEniy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775631466; x=1807167466;
  h=date:from:to:cc:subject:message-id;
  bh=wGvJfqlaHTxDnLBAW85+VcD7gHZAGT5yx5P1OvHvK04=;
  b=jHydEniy4PThZjInXZ35j23lkwz2gy43YZbYnwG2CyHn++vYHfY2xpPG
   vR33GkUMHBkL02Byop0xi87LkRvie9oiAZNf9PuhaUWtnCPUiFOcUDHak
   ukTkKqPKx+ohaIFVbsNOZvF60To0zZnvYWjK13Rhj5HkVk7d96dyt3PJJ
   o+SEe+KABJ8B/uw7rqhOocDUG2i5g9KGti2jTouxxjR2/T4qVIrDmn4XS
   RuEV0j9EtBsV7pIZhgWHuVfAaY14EBcodGo0XdTbD+ZYu1qvfZjNJM1/P
   9JDf4FGuv9M1N9JvlHYTZJ2PWbONPxT65XRDzC2VNInfIhxHumESDjc7V
   A==;
X-CSE-ConnectionGUID: wNnxZSdFTl65ekvKynmv+w==
X-CSE-MsgGUID: B9JZqBXwQ4Cb/ie1pREoGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="87304935"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="87304935"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 23:57:45 -0700
X-CSE-ConnectionGUID: Utyc14xgR6+TXGc8ho+YoA==
X-CSE-MsgGUID: bqfk3W3FTIi+X0J5nlcU6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="228643727"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 07 Apr 2026 23:57:44 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wAMr7-00000000APz-3Z4a;
	Wed, 08 Apr 2026 06:57:41 +0000
Date: Wed, 08 Apr 2026 08:57:25 +0200
From: kernel test robot <lkp@intel.com>
To: Justin Suess <utilityemal77@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: kernel/bpf/verifier.c:2276:40: error:
 'bpf_landlock_ruleset_btf_ids' undeclared; did you mean
 'landlock_ruleset_map_ops'?
Message-ID: <202604080859.u11A21La-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Justin-Suess/landlock-Move-operations-from-syscall-into-ruleset-code/20260408-053705
head:   7423cdaa89895ef6399743cfef9c7bfe1c22b8ad
commit: a0c8fd8936e1475411b42961f95d16772832b543 bpf: verifier: Add Landlock ruleset map support
date:   9 hours ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260408/202604080859.u11A21La-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260408/202604080859.u11A21La-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604080859.u11A21La-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/verifier.c: In function 'mark_ptr_not_null_reg':
>> kernel/bpf/verifier.c:2276:40: error: 'bpf_landlock_ruleset_btf_ids' undeclared (first use in this function); did you mean 'landlock_ruleset_map_ops'?
    2276 |                         reg->btf_id = *bpf_landlock_ruleset_btf_ids;
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                        landlock_ruleset_map_ops
   kernel/bpf/verifier.c:2276:40: note: each undeclared identifier is reported only once for each function it appears in


vim +2276 kernel/bpf/verifier.c

  2252	
  2253	static void mark_ptr_not_null_reg(struct bpf_reg_state *reg)
  2254	{
  2255		if (base_type(reg->type) == PTR_TO_MAP_VALUE) {
  2256			const struct bpf_map *map = reg->map_ptr;
  2257	
  2258			if (map->inner_map_meta) {
  2259				reg->type = CONST_PTR_TO_MAP;
  2260				reg->map_ptr = map->inner_map_meta;
  2261				/* transfer reg's id which is unique for every map_lookup_elem
  2262				 * as UID of the inner map.
  2263				 */
  2264				if (btf_record_has_field(map->inner_map_meta->record,
  2265							 BPF_TIMER | BPF_WORKQUEUE | BPF_TASK_WORK)) {
  2266					reg->map_uid = reg->id;
  2267				}
  2268			} else if (map->map_type == BPF_MAP_TYPE_XSKMAP) {
  2269				reg->type = PTR_TO_XDP_SOCK;
  2270			} else if (map->map_type == BPF_MAP_TYPE_SOCKMAP ||
  2271				   map->map_type == BPF_MAP_TYPE_SOCKHASH) {
  2272				reg->type = PTR_TO_SOCKET;
  2273			} else if (map->map_type == BPF_MAP_TYPE_LANDLOCK_RULESET) {
  2274				reg->type = PTR_TO_BTF_ID | PTR_TRUSTED;
  2275				reg->btf = btf_vmlinux;
> 2276				reg->btf_id = *bpf_landlock_ruleset_btf_ids;
  2277			} else {
  2278				reg->type = PTR_TO_MAP_VALUE;
  2279			}
  2280			return;
  2281		}
  2282	
  2283		reg->type &= ~PTR_MAYBE_NULL;
  2284	}
  2285	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
