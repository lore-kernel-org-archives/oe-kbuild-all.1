Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C29921257E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Dec 2025 13:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767101765; cv=none; b=pol2tZiIuPkP/GsrCSo7c/TOR4qpkCW12i4yPos3x+ynv8+g5CBWv3q/bUwl7ppe795jbKr87Bw93FUgR8lZon93FqY1r0UTcHMezzab/oSjRJSpJ7Dm3Qtayw+JqDDxbOMnJZCpkSswNXfGGr3JydMkdE2G/Y/4zLi5wx5oGrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767101765; c=relaxed/simple;
	bh=9TzvDPLp0KaLZHeSRp3Kbh0NulGPRpg8E1S0zKluHb4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BeF60Fl7BF/5EQ60JkORjJ/TUqCdxNokLXhguFO/qugOnztgZb8QlvK6ssWUxeDad5pNe2s2XoiEZOTlUqyF/N94YJGZ7WTc34ROpRT96WWKmRi4nhgZSoBEygPH3nn4PCXBz5OFsfHgzoaAra8IsbeB6hzYGFS8yAOvz76bPeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S41BXTWq; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S41BXTWq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767101763; x=1798637763;
  h=date:from:to:cc:subject:message-id;
  bh=9TzvDPLp0KaLZHeSRp3Kbh0NulGPRpg8E1S0zKluHb4=;
  b=S41BXTWqUyG5SWb73D6X3hmV9++wOZvVL7gojWupnUsQrPmAdZWF50jf
   c7WZC5sVSlRwaTIN2H3eWwv6lOiq1SDLBJ/j6c/PvcqgrlAtve8mzlpIY
   /7pBvt8lAycAA+QfvX2Ku0dAzYLg7sdt45trKVXpmWloI+znkpooYhJtS
   rMGOPCKFgtFZ8UVg4lyxYqFxjKlKUA7KVGvbYWsKVknBABFH3FRnaJYZO
   uzewKbXdzjT3ZJ062YvI5K6LKVzh8hL5Mb8XqBYhcOLoAraubp+vbMGqJ
   X6zTOBm1lsBfD2wcf6IelmQXLSv8SGaxP5OkUlSlQL6A0p4RRNFHlRKRg
   g==;
X-CSE-ConnectionGUID: kQbUFLjaTAiZ9hNQFbLVJA==
X-CSE-MsgGUID: 2pxVufcGQJSuMKo4aBgFwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="68664421"
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="68664421"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:36:00 -0800
X-CSE-ConnectionGUID: MVr7MOdUTH6BhoUDkOe4dg==
X-CSE-MsgGUID: UZU34X+tTd+Fv32SD8yhzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="200429154"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 Dec 2025 05:35:59 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaZtE-000000000P9-2tSl;
	Tue, 30 Dec 2025 13:35:56 +0000
Date: Tue, 30 Dec 2025 21:35:51 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3.6 5/16]
 kernel/bpf/bpf_struct_ops.c:1390:8: warning: assignment to 'struct cgroup *'
 from 'int' makes pointer from integer without a cast
Message-ID: <202512302125.WqkrUmQw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rgushchin/linux.git bpfoom.3.6
head:   d16fa0113ece3fae58e5105dbed6b0dbe1c28c21
commit: 139148647969dcf54237b1ceb50a89e39b0b5186 [5/16] bpf: Allow attaching struct_ops to cgroups
config: sparc-randconfig-001-20251230 (https://download.01.org/0day-ci/archive/20251230/202512302125.WqkrUmQw-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251230/202512302125.WqkrUmQw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512302125.WqkrUmQw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/bpf_struct_ops.c: In function 'bpf_struct_ops_link_create':
   kernel/bpf/bpf_struct_ops.c:1390:10: error: implicit declaration of function 'cgroup_get_from_fd'; did you mean 'cgroup_id_from_mm'? [-Werror=implicit-function-declaration]
      cgrp = cgroup_get_from_fd(attr->link_create.target_fd);
             ^~~~~~~~~~~~~~~~~~
             cgroup_id_from_mm
>> kernel/bpf/bpf_struct_ops.c:1390:8: warning: assignment to 'struct cgroup *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      cgrp = cgroup_get_from_fd(attr->link_create.target_fd);
           ^
   kernel/bpf/bpf_struct_ops.c:1398:4: error: implicit declaration of function 'cgroup_put'; did you mean 'cgroup_init'? [-Werror=implicit-function-declaration]
       cgroup_put(cgrp);
       ^~~~~~~~~~
       cgroup_init
   cc1: some warnings being treated as errors


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
  1398				cgroup_put(cgrp);
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
