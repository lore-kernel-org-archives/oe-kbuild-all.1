Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9272868A9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jan 2026 21:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769202686; cv=none; b=TgeC6ERiEcvDJNMhYmWd1l1iFK4SkhBnxKPyAPbuaqMggZD4Z52lRK3KCyC++rk5jhytDAffBZUTQm98XnW3LQSzFjFY92WCA4wU2d4HrR0RqBg9YD27FrSlCcjtp+UizUl/JhtjLvzVymyxh5F8PqQmzuqCSEZ9/q/7lZdrP6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769202686; c=relaxed/simple;
	bh=meTRHdJkm/kIDwPOgWlCBs0A4T3kdKy01f2RIb5xaks=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Dc9dN8Oi7BTkdXiDJGSZKuP6/M4M6U/misMRbtJuPklldpzWlrtJtiXh9FUF/zgkRmgh9KcMNMxcgGIXJpozznhHJtrmzNpjNPYCgKXhxtOBgF99jyBYkkNAaqPwgv/aox4PEeyaxN7yOUQZWEbYfhO6V+g10hiN4By5IImeESU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N8+WkREL; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N8+WkREL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769202685; x=1800738685;
  h=date:from:to:cc:subject:message-id;
  bh=meTRHdJkm/kIDwPOgWlCBs0A4T3kdKy01f2RIb5xaks=;
  b=N8+WkRELVT9SmM06jYEKH1AiMJJodRBFzp6JlJZrLy+a6tMdy7j39vcE
   FpxC4lzpmSSaMRZADWBcqi+2qI+ns7gzcTQQL9lNZaXLfV/NZEe3u1nTM
   P9kGnb1xzYz8vlb/bDc7QDnNLGG4tqPdW6KsYVYo/IrPhwO3/UOECzD42
   K24+7ARYsFdqmMFoYNNAEVUHsyg/q0UWoVGaCjtjRUOKONQBPuAfEyvoh
   DaKdZvITD0SaDbr1ofkDQV6VoZ6HsWlAmOmgcBDS8OXX/b61n/ruffczq
   l/+bOHEt3ljiod9J8oy+QEnK+yEb00oBcGsOU5GQ43oVvouQQW/sVlpAO
   Q==;
X-CSE-ConnectionGUID: 3xrQwGoxTiKLclNpfQwPGQ==
X-CSE-MsgGUID: F6PRa52UQb660vEk/Cpwcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70367744"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="70367744"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 13:11:25 -0800
X-CSE-ConnectionGUID: 9mCzx05PSxSTuz0iQ78R1Q==
X-CSE-MsgGUID: fdbzUiW5SjK7R0wh22vStg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="207542979"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Jan 2026 13:11:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjOR6-00000000USw-3qpF;
	Fri, 23 Jan 2026 21:11:20 +0000
Date: Sat, 24 Jan 2026 05:11:12 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3.9 3/17]
 kernel/bpf/bpf_struct_ops.c:1417:10: error: implicit declaration of function
 'cgroup_get_from_fd'; did you mean 'cgroup_id_from_mm'?
Message-ID: <202601240548.Y30ROSs6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rgushchin/linux.git bpfoom.3.9
head:   4d25d8446dbd73d9adfdbc35c139e6b4fb16f158
commit: 549fc9aaf5c8051e33cecc2faeb4033f267298e6 [3/17] bpf: allow attaching struct_ops to cgroups
config: sparc64-randconfig-r132-20260123 (https://download.01.org/0day-ci/archive/20260124/202601240548.Y30ROSs6-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601240548.Y30ROSs6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601240548.Y30ROSs6-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/bpf_struct_ops.c: In function 'bpf_struct_ops_link_create':
>> kernel/bpf/bpf_struct_ops.c:1417:10: error: implicit declaration of function 'cgroup_get_from_fd'; did you mean 'cgroup_id_from_mm'? [-Werror=implicit-function-declaration]
      cgrp = cgroup_get_from_fd(attr->link_create.target_fd);
             ^~~~~~~~~~~~~~~~~~
             cgroup_id_from_mm
   kernel/bpf/bpf_struct_ops.c:1417:8: warning: assignment to 'struct cgroup *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      cgrp = cgroup_get_from_fd(attr->link_create.target_fd);
           ^
>> kernel/bpf/bpf_struct_ops.c:1425:4: error: implicit declaration of function 'cgroup_put'; did you mean 'cgroup_init'? [-Werror=implicit-function-declaration]
       cgroup_put(cgrp);
       ^~~~~~~~~~
       cgroup_init
   cc1: some warnings being treated as errors


vim +1417 kernel/bpf/bpf_struct_ops.c

  1382	
  1383	int bpf_struct_ops_link_create(union bpf_attr *attr)
  1384	{
  1385		struct bpf_struct_ops_link *link = NULL;
  1386		struct bpf_link_primer link_primer;
  1387		struct bpf_struct_ops_map *st_map;
  1388		struct bpf_map *map;
  1389		struct cgroup *cgrp;
  1390		int err;
  1391	
  1392		if (attr->link_create.flags & ~BPF_F_CGROUP_FD)
  1393			return -EINVAL;
  1394	
  1395		map = bpf_map_get(attr->link_create.map_fd);
  1396		if (IS_ERR(map))
  1397			return PTR_ERR(map);
  1398	
  1399		st_map = (struct bpf_struct_ops_map *)map;
  1400	
  1401		if (!bpf_struct_ops_valid_to_reg(map)) {
  1402			err = -EINVAL;
  1403			goto err_out;
  1404		}
  1405	
  1406		link = kzalloc(sizeof(*link), GFP_USER);
  1407		if (!link) {
  1408			err = -ENOMEM;
  1409			goto err_out;
  1410		}
  1411		bpf_link_init(&link->link, BPF_LINK_TYPE_STRUCT_OPS, &bpf_struct_ops_map_lops, NULL,
  1412			      attr->link_create.attach_type);
  1413	
  1414		init_waitqueue_head(&link->wait_hup);
  1415	
  1416		if (attr->link_create.flags & BPF_F_CGROUP_FD) {
> 1417			cgrp = cgroup_get_from_fd(attr->link_create.target_fd);
  1418			if (IS_ERR(cgrp)) {
  1419				err = PTR_ERR(cgrp);
  1420				goto err_out;
  1421			}
  1422			link->cgroup = cgrp;
  1423			err = cgroup_bpf_attach_struct_ops(cgrp, link);
  1424			if (err) {
> 1425				cgroup_put(cgrp);
  1426				link->cgroup = NULL;
  1427				goto err_out;
  1428			}
  1429		}
  1430	
  1431		err = bpf_link_prime(&link->link, &link_primer);
  1432		if (err)
  1433			goto err_put_cgroup;
  1434	
  1435		/* Hold the update_mutex such that the subsystem cannot
  1436		 * do link->ops->detach() before the link is fully initialized.
  1437		 */
  1438		mutex_lock(&update_mutex);
  1439		err = st_map->st_ops_desc->st_ops->reg(st_map->kvalue.data, &link->link);
  1440		if (err) {
  1441			mutex_unlock(&update_mutex);
  1442			bpf_link_cleanup(&link_primer);
  1443			link = NULL;
  1444			goto err_put_cgroup;
  1445		}
  1446		RCU_INIT_POINTER(link->map, map);
  1447		mutex_unlock(&update_mutex);
  1448	
  1449		return bpf_link_settle(&link_primer);
  1450	
  1451	err_put_cgroup:
  1452		if (link && link->cgroup)
  1453			cgroup_bpf_detach_struct_ops(link->cgroup, link);
  1454	err_out:
  1455		bpf_map_put(map);
  1456		kfree(link);
  1457		return err;
  1458	}
  1459	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
