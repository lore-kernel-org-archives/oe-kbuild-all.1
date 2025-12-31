Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE42C290F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Dec 2025 03:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767150012; cv=none; b=XzvWnPIAUGXtVIbeo0G1vogA/9PwbK/DR7wclco89fbMtLJjg4nPOT6useygoJNymxAPNMDia58qLhnONh9HF2d7LggRDs2Kq+Q4ba9avIU1QZ2+D2R5kkyGcgvrAd5SfjlHc26xP9g6L1C+B93HFclm3Of9RbqMFcknJRzxnIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767150012; c=relaxed/simple;
	bh=50wMGw88/Z+/de03XZ+G4D5h9MBdVHnefsfU8ahFTYM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L3QqQq1mEVLNWi0dFDKkRkWcBzlqzMRz3PoqkgdKwVLKP3KjemTyuazekQ5ckQQoWhNimV0ev5SzDWEZUCU7rPdHaBgo4hVPLyrvPturkngIGOy2CQ+S0nxOnsaL5Sq6WdS7/9XYCSGG/TRtdxJ/eynejznqx129XJ9fAVbG5CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LDv6TeGQ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LDv6TeGQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767150010; x=1798686010;
  h=date:from:to:cc:subject:message-id;
  bh=50wMGw88/Z+/de03XZ+G4D5h9MBdVHnefsfU8ahFTYM=;
  b=LDv6TeGQ/mdhbQZUlnn7LkpBKPiqJ2CzyztjCdndQR9M4oEYF6XyXCX6
   5CWOiS8LE+pzv13YNxHLXxJIzAMHpdUQa1c1uiNa37IR5w92fzNxCUs6y
   Pb+2g/8Dc3jmL4t1TzH61G/QnUeGHb0iZjmZOdGnWoKJwM2EiEFB/3PON
   vnWx32RjihX3v+R+cYVKcF7ZHbDp5O4cjZOn4AjIAOt/qNRnefDBc/Gtb
   KUYueY+CT4gKSCSEq9stFMp6IaZyTDL4F4cnfT/C0muKORhWGVAmwNe5H
   EVtr/jvKa4DqajvPpzi3Rw6Yv3WY9YewWX1AubQWYwIKy5WIH9pblr+6M
   w==;
X-CSE-ConnectionGUID: XorZb3N0SuWmmB2kIoCUpw==
X-CSE-MsgGUID: ErA0vPbIQxqDP4PFXM1s3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="91386693"
X-IronPort-AV: E=Sophos;i="6.21,190,1763452800"; 
   d="scan'208";a="91386693"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 19:00:08 -0800
X-CSE-ConnectionGUID: 33WrOGekTCO4aLqUe5C2pw==
X-CSE-MsgGUID: MYpJDhYCRYupucqLhYjqMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,190,1763452800"; 
   d="scan'208";a="200487041"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 Dec 2025 19:00:06 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vamRP-000000000tx-2m3g;
	Wed, 31 Dec 2025 03:00:03 +0000
Date: Wed, 31 Dec 2025 10:59:02 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3.6 5/16]
 kernel/bpf/bpf_struct_ops.c:1390:8: error: incompatible integer to pointer
 conversion assigning to 'struct cgroup *' from 'int'
Message-ID: <202512311046.WsU9VT6g-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rgushchin/linux.git bpfoom.3.6
head:   d16fa0113ece3fae58e5105dbed6b0dbe1c28c21
commit: 139148647969dcf54237b1ceb50a89e39b0b5186 [5/16] bpf: Allow attaching struct_ops to cgroups
config: s390-randconfig-r113-20251231 (https://download.01.org/0day-ci/archive/20251231/202512311046.WsU9VT6g-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 86b9f90b9574b3a7d15d28a91f6316459dcfa046)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251231/202512311046.WsU9VT6g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512311046.WsU9VT6g-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/bpf_struct_ops.c:1390:10: error: call to undeclared function 'cgroup_get_from_fd'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1390 |                 cgrp = cgroup_get_from_fd(attr->link_create.target_fd);
         |                        ^
   kernel/bpf/bpf_struct_ops.c:1390:10: note: did you mean 'cgroup_id_from_mm'?
   include/linux/memcontrol.h:1454:19: note: 'cgroup_id_from_mm' declared here
    1454 | static inline u64 cgroup_id_from_mm(struct mm_struct *mm)
         |                   ^
>> kernel/bpf/bpf_struct_ops.c:1390:8: error: incompatible integer to pointer conversion assigning to 'struct cgroup *' from 'int' [-Wint-conversion]
    1390 |                 cgrp = cgroup_get_from_fd(attr->link_create.target_fd);
         |                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/bpf_struct_ops.c:1398:4: error: call to undeclared function 'cgroup_put'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1398 |                         cgroup_put(cgrp);
         |                         ^
   3 errors generated.


vim +1390 kernel/bpf/bpf_struct_ops.c

  1357	
  1358	int bpf_struct_ops_link_create(union bpf_attr *attr)
  1359	{
  1360		struct bpf_struct_ops_link *link = NULL;
  1361		struct bpf_link_primer link_primer;
  1362		struct bpf_struct_ops_map *st_map;
  1363		struct bpf_map *map;
  1364		struct cgroup *cgrp;
  1365		int err;
  1366	
  1367		if (attr->link_create.flags & ~BPF_F_CGROUP_FD)
  1368			return -EINVAL;
  1369	
  1370		map = bpf_map_get(attr->link_create.map_fd);
  1371		if (IS_ERR(map))
  1372			return PTR_ERR(map);
  1373	
  1374		st_map = (struct bpf_struct_ops_map *)map;
  1375	
  1376		if (!bpf_struct_ops_valid_to_reg(map)) {
  1377			err = -EINVAL;
  1378			goto err_out;
  1379		}
  1380	
  1381		link = kzalloc(sizeof(*link), GFP_USER);
  1382		if (!link) {
  1383			err = -ENOMEM;
  1384			goto err_out;
  1385		}
  1386		bpf_link_init(&link->link, BPF_LINK_TYPE_STRUCT_OPS, &bpf_struct_ops_map_lops, NULL,
  1387			      attr->link_create.attach_type);
  1388	
  1389		if (attr->link_create.flags & BPF_F_CGROUP_FD) {
> 1390			cgrp = cgroup_get_from_fd(attr->link_create.target_fd);
  1391			if (IS_ERR(cgrp)) {
  1392				err = PTR_ERR(cgrp);
  1393				goto err_out;
  1394			}
  1395			link->cgroup = cgrp;
  1396			err = cgroup_bpf_attach_struct_ops(cgrp, link);
  1397			if (err) {
> 1398				cgroup_put(cgrp);
  1399				link->cgroup = NULL;
  1400				goto err_out;
  1401			}
  1402		}
  1403	
  1404		err = bpf_link_prime(&link->link, &link_primer);
  1405		if (err)
  1406			goto err_put_cgroup;
  1407	
  1408		init_waitqueue_head(&link->wait_hup);
  1409	
  1410		/* Hold the update_mutex such that the subsystem cannot
  1411		 * do link->ops->detach() before the link is fully initialized.
  1412		 */
  1413		mutex_lock(&update_mutex);
  1414		err = st_map->st_ops_desc->st_ops->reg(st_map->kvalue.data, &link->link);
  1415		if (err) {
  1416			mutex_unlock(&update_mutex);
  1417			bpf_link_cleanup(&link_primer);
  1418			link = NULL;
  1419			goto err_out;
  1420		}
  1421		RCU_INIT_POINTER(link->map, map);
  1422		mutex_unlock(&update_mutex);
  1423	
  1424		return bpf_link_settle(&link_primer);
  1425	
  1426	err_put_cgroup:
  1427		if (link->cgroup)
  1428			cgroup_bpf_detach_struct_ops(link->cgroup, link);
  1429	err_out:
  1430		bpf_map_put(map);
  1431		kfree(link);
  1432		return err;
  1433	}
  1434	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
