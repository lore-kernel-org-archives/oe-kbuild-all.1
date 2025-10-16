Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0102E5B27
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Oct 2025 22:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760655600; cv=none; b=CdzleZDdphH1F2sF9W+fOYHj7IOJY3XNYZYWOjJuLJ0wNzcVfYYeadeWW95/JTzpJlXe3DjX/N3CeGb/UOtb2KqaWU8Ipzfj+ceFp0zFC0POgC3AXKnxeOnq8f3N++gSxiTErr3eUrASmDV6VzJ+jAxSERmOtwUMRTtDWrxA/0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760655600; c=relaxed/simple;
	bh=/3vBcWZTGQ502sv3LuLFNMyn+0OfZnc7ktgvNGiyztg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LC0Z+nNC9mtokq4UDkEUz2JvymKRCQqq0t8wcNo5/CgPFPUzRoQMMKQdjLskPEdQ+ZKWxcnb1ieSfjYRR31ULnCF9jz++XU9GL76+Gtmwd1PUvEf3t95I1/QpPBkhUxDhmMUnHxn8x6kstu1OyvJ+zVm3/hKCh2m+D1RIvO2DiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lZByOsF0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lZByOsF0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760655598; x=1792191598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/3vBcWZTGQ502sv3LuLFNMyn+0OfZnc7ktgvNGiyztg=;
  b=lZByOsF0nzEkcZdQ4WWXyAnrkRwNj7qs+52h4UE/76c8rVqeUP0jktX1
   BVB4KDalfI4khb9XzQp6eoFYjB4BH4CZwSM9jdDZ4cxojFjuTqfxRmgDB
   ZJ+6wbL9QFir1KaIth8BIA2qhdIMCxki3n0oBKPLGmevbWX3zlZavZ0RC
   n0q2ang0a5Z21J4rGJzQBkdmizQ4EYXW8m8//hNMoaeTSPDEfYWS26U1p
   +mpZKXhuJUiSMUo7V0skMW9P7qBmpkzk5e1LbBXE93SLbTCymFYlCOZSw
   FWlpzRRL/+FlDE6p6Cr5lociO9jKz/p60kAdZQpKvUDxyDLNjfSLO6RvB
   w==;
X-CSE-ConnectionGUID: x7UbmgMLQ1OT75JzvFzvAQ==
X-CSE-MsgGUID: kKH2lBNCQ7C6Uc6+Arcaaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="61893239"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="61893239"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 15:59:57 -0700
X-CSE-ConnectionGUID: pirMVGt+QTiMYhFOqEI3Gw==
X-CSE-MsgGUID: EeEjnxDkQjaosvippZQ2zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="182567279"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 16 Oct 2025 15:59:56 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9Wwr-0005JT-2C;
	Thu, 16 Oct 2025 22:59:53 +0000
Date: Fri, 17 Oct 2025 06:59:12 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.2.4 3/19] kernel/bpf/bpf_struct_ops.c:1343:17:
 warning: unused variable 'cgrp'
Message-ID: <202510170955.Q2AEZegr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.2.4
head:   d4efeeee845fdb340b65652519df59d436429e0b
commit: 180247a1be7e7d6d8110d21c187d675da129fe65 [3/19] bpf: struct ops: allow passing cgroup_id
config: x86_64-buildonly-randconfig-005-20251017 (https://download.01.org/0day-ci/archive/20251017/202510170955.Q2AEZegr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510170955.Q2AEZegr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510170955.Q2AEZegr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/bpf_struct_ops.c:1343:17: warning: unused variable 'cgrp' [-Wunused-variable]
    1343 |         struct cgroup *cgrp;
         |                        ^~~~
   1 warning generated.


vim +/cgrp +1343 kernel/bpf/bpf_struct_ops.c

  1336	
  1337	int bpf_struct_ops_link_create(union bpf_attr *attr)
  1338	{
  1339		struct bpf_struct_ops_link *link = NULL;
  1340		struct bpf_link_primer link_primer;
  1341		struct bpf_struct_ops_map *st_map;
  1342		struct bpf_map *map;
> 1343		struct cgroup *cgrp;
  1344		int err;
  1345	
  1346		map = bpf_map_get(attr->link_create.map_fd);
  1347		if (IS_ERR(map))
  1348			return PTR_ERR(map);
  1349	
  1350		st_map = (struct bpf_struct_ops_map *)map;
  1351	
  1352		if (!bpf_struct_ops_valid_to_reg(map)) {
  1353			err = -EINVAL;
  1354			goto err_out;
  1355		}
  1356	
  1357		link = kzalloc(sizeof(*link), GFP_USER);
  1358		if (!link) {
  1359			err = -ENOMEM;
  1360			goto err_out;
  1361		}
  1362		bpf_link_init(&link->link, BPF_LINK_TYPE_STRUCT_OPS, &bpf_struct_ops_map_lops, NULL,
  1363			      attr->link_create.attach_type);
  1364	#ifdef CONFIG_CGROUPS
  1365		if (attr->link_create.cgroup.relative_fd) {
  1366			cgrp = cgroup_get_from_fd(attr->link_create.cgroup.relative_fd);
  1367			if (IS_ERR(cgrp))
  1368				return PTR_ERR(cgrp);
  1369	
  1370			link->cgroup_id = cgroup_id(cgrp);
  1371			cgroup_put(cgrp);
  1372		}
  1373	#endif /* CONFIG_CGROUPS */
  1374	
  1375		err = bpf_link_prime(&link->link, &link_primer);
  1376		if (err)
  1377			goto err_out;
  1378	
  1379		init_waitqueue_head(&link->wait_hup);
  1380	
  1381		/* Hold the update_mutex such that the subsystem cannot
  1382		 * do link->ops->detach() before the link is fully initialized.
  1383		 */
  1384		mutex_lock(&update_mutex);
  1385		err = st_map->st_ops_desc->st_ops->reg(st_map->kvalue.data, &link->link);
  1386		if (err) {
  1387			mutex_unlock(&update_mutex);
  1388			bpf_link_cleanup(&link_primer);
  1389			link = NULL;
  1390			goto err_out;
  1391		}
  1392		RCU_INIT_POINTER(link->map, map);
  1393		mutex_unlock(&update_mutex);
  1394	
  1395		return bpf_link_settle(&link_primer);
  1396	
  1397	err_out:
  1398		bpf_map_put(map);
  1399		kfree(link);
  1400		return err;
  1401	}
  1402	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
