Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B513F8F6C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Jul 2025 02:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752978989; cv=none; b=XrGCk5/e2HXMVk+QyC/v/xY7QgN2cI/dJbqHd2Z03FUeDeDeOrYl9iGqmnqS7URxxfFwEhlCmgrUQbdrMQzXkVnXyS9jpoc4L0QbrrIrJn6uURjTvA2+tSuCdveeKv5FuXZrQjgQYn6Kb0t6KjpE+2d/gTNrLPABsa3znpsJfm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752978989; c=relaxed/simple;
	bh=DELwbmajKEYUmmmocUexyPSvdUVOKkqtZF2JKMOWFfw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EZgHvJbdh3ARktca1eUraBY/EI6Uclc8O9whk3oW5+nzPsRIj/VXAslPdg5vFaAVbr99RnvCrzPZqE1pI75DJT2GLZ7WhkL0e3JKshmX2Bwd51HcFmyGvJO+y4Nbq5cc0T3Me+hlHrJa/2oR9Xvp50vc6PzqTgcTm2O3eLBFWu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HnU+a0ke; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HnU+a0ke"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752978987; x=1784514987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DELwbmajKEYUmmmocUexyPSvdUVOKkqtZF2JKMOWFfw=;
  b=HnU+a0keSNx8paIQV3o/As/fjt6AFdAF7s0WfR+oNw/YfuafrNRomiPQ
   PkrU34tQBAjI9SlJuDjEATqPVPusqxRyFzqhe0dJmv+PU+XOklMSxPlFG
   b95DNwLHje9UnH9XLPV9ShWxQQ7PCQwdp8/i8i4mIcKA9nuIRPdu1hEjf
   d8t0VNf1CcRdq7/t6i1bp0pmidCvh2oYqQnog91U1WsT6ltNZahiIlUFu
   iPp5yxjzz1Z5tFVeb0YIOd9xIhmmuHCgBlt1S6UBc3TCQzzEvUDCot75u
   l8IUQj5HuFIoZh8m81NBy8w/fEi79sSOjJUozJvBmt9tign7ELpNiCCui
   Q==;
X-CSE-ConnectionGUID: GzuGIls/SyKbVzOp05ezZw==
X-CSE-MsgGUID: i6jJMmAJTyCH5HbH/mf0jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11497"; a="55383513"
X-IronPort-AV: E=Sophos;i="6.16,325,1744095600"; 
   d="scan'208";a="55383513"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2025 19:36:27 -0700
X-CSE-ConnectionGUID: 03kiZsSVRPGSP4D9Q9tPPQ==
X-CSE-MsgGUID: 9mc7uw/GSJKY56eVizwO2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,325,1744095600"; 
   d="scan'208";a="159230132"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Jul 2025 19:36:26 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udJua-000Fu1-0C;
	Sun, 20 Jul 2025 02:36:24 +0000
Date: Sun, 20 Jul 2025 10:35:57 +0800
From: kernel test robot <lkp@intel.com>
To: Yonghong Song <yonghong.song@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, Andrii Nakryiko <andrii@kernel.org>
Subject: [linux-next:master 1023/11307] kernel/bpf/cgroup.c:710:10-17:
 WARNING: ERR_CAST can be used with anchor_link
Message-ID: <202507201048.bceHy8zX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
commit: 1209339844601ec1766f4ff430673fbcfe42bb51 [1023/11307] bpf: Implement mprog API on top of existing cgroup progs
config: alpha-randconfig-r054-20250720 (https://download.01.org/0day-ci/archive/20250720/202507201048.bceHy8zX-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507201048.bceHy8zX-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/bpf/cgroup.c:710:10-17: WARNING: ERR_CAST can be used with anchor_link
>> kernel/bpf/cgroup.c:714:10-17: WARNING: ERR_CAST can be used with anchor_prog

vim +710 kernel/bpf/cgroup.c

   682	
   683	static struct bpf_prog_list *get_prog_list(struct hlist_head *progs, struct bpf_prog *prog,
   684						   struct bpf_cgroup_link *link, u32 flags, u32 id_or_fd)
   685	{
   686		bool is_link = flags & BPF_F_LINK, is_id = flags & BPF_F_ID;
   687		struct bpf_prog_list *pltmp, *pl = ERR_PTR(-EINVAL);
   688		bool preorder = flags & BPF_F_PREORDER;
   689		struct bpf_link *anchor_link = NULL;
   690		struct bpf_prog *anchor_prog = NULL;
   691		bool is_before, is_after;
   692	
   693		is_before = flags & BPF_F_BEFORE;
   694		is_after = flags & BPF_F_AFTER;
   695		if (is_link || is_id || id_or_fd) {
   696			/* flags must have either BPF_F_BEFORE or BPF_F_AFTER */
   697			if (is_before == is_after)
   698				return ERR_PTR(-EINVAL);
   699			if ((is_link && !link) || (!is_link && !prog))
   700				return ERR_PTR(-EINVAL);
   701		} else if (!hlist_empty(progs)) {
   702			/* flags cannot have both BPF_F_BEFORE and BPF_F_AFTER */
   703			if (is_before && is_after)
   704				return ERR_PTR(-EINVAL);
   705		}
   706	
   707		if (is_link) {
   708			anchor_link = bpf_get_anchor_link(flags, id_or_fd);
   709			if (IS_ERR(anchor_link))
 > 710				return ERR_PTR(PTR_ERR(anchor_link));
   711		} else if (is_id || id_or_fd) {
   712			anchor_prog = bpf_get_anchor_prog(flags, id_or_fd);
   713			if (IS_ERR(anchor_prog))
 > 714				return ERR_PTR(PTR_ERR(anchor_prog));
   715		}
   716	
   717		if (!anchor_prog && !anchor_link) {
   718			/* if there is no anchor_prog/anchor_link, then BPF_F_PREORDER
   719			 * doesn't matter since either prepend or append to a combined
   720			 * list of progs will end up with correct result.
   721			 */
   722			hlist_for_each_entry(pltmp, progs, node) {
   723				if (is_before)
   724					return pltmp;
   725				if (pltmp->node.next)
   726					continue;
   727				return pltmp;
   728			}
   729			return NULL;
   730		}
   731	
   732		hlist_for_each_entry(pltmp, progs, node) {
   733			if ((anchor_prog && anchor_prog == pltmp->prog) ||
   734			    (anchor_link && anchor_link == &pltmp->link->link)) {
   735				if (!!(pltmp->flags & BPF_F_PREORDER) != preorder)
   736					goto out;
   737				pl = pltmp;
   738				goto out;
   739			}
   740		}
   741	
   742		pl = ERR_PTR(-ENOENT);
   743	out:
   744		if (anchor_link)
   745			bpf_link_put(anchor_link);
   746		else
   747			bpf_prog_put(anchor_prog);
   748		return pl;
   749	}
   750	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
