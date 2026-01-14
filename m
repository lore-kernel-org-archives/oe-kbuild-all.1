Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93BE389E0C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 10:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768386277; cv=none; b=Xu53fp2e+pmowxlvLzxu0OnVQADeVCF3nH9EonkGPEYt0wseZE/m5ZRD9ZPiIs7Aeoe2DYGCR7QwmfSh6f2cr6SamNZXEry23DCFbxq8oO3LoZH+k+zhFaOg/ggGIuq8w0ZDaOY6d8yrly0j9p9Hgf5xpk9RbOcyIdK5OLl0z8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768386277; c=relaxed/simple;
	bh=7xpfZ8wiWFpz9b1hc0evvhbIMp4jcJA5q61AJXNyO5I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hwD0mRfffZ4rWysOXsPiY4Q3XT6BTVIdkQ9H2fF4zuYca7gYKga/9V4NKZmyGRj27TBRbk8GURgwGp80Hjx6sl4V/aavvUalYoJ0xZJa6HHAmXHwnKDEH39OQ6RLORurHAtY6jxcSZwuDLquAHhVXzfT02gAmg3Lg9du/bl7pVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NVcMeZ+s; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NVcMeZ+s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768386276; x=1799922276;
  h=date:from:to:cc:subject:message-id;
  bh=7xpfZ8wiWFpz9b1hc0evvhbIMp4jcJA5q61AJXNyO5I=;
  b=NVcMeZ+spTn916QgxS5h1S8mubw7ziBLmdmNq0QVXBGTEfz0sVglEq4P
   cMApYhie0UH6mpUWVgGZstL+7TnX9aNNyBetBM1X5SAk03kPa+7R/rfwu
   oK8Y/cLhfQdrg2AYYZMXktSPH3sl6Z5uhcEqt2vb9a6jR1NGNdEVHxO4y
   69frG2ti1mVtX6NXr5H8MD5DHTcUxzzHZ9cFKgT59zrATm8GfUnnP/e7F
   9nfOZmp6Ce26QO7CQDbqMhSu7S3mHWL+UMw4Uo+QljzS+/SBH9++0dIzg
   LjgC0C7DtcKWFzastX2hrn587lesN/JKSn/m2c+fwNz/LekX8WV2kc11t
   w==;
X-CSE-ConnectionGUID: S5CO/+h2S9+PCsTUzQKnow==
X-CSE-MsgGUID: TdC7TPhtQPOAWX6dAI3u1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="73318114"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="73318114"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 02:24:35 -0800
X-CSE-ConnectionGUID: Pj1BOIX7QHq1zufDoiWJ+g==
X-CSE-MsgGUID: 8fI5fSL0QNavpGnjoDt1vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="209691647"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Jan 2026 02:24:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfy3C-00000000GD6-3j6l;
	Wed, 14 Jan 2026 10:24:30 +0000
Date: Wed, 14 Jan 2026 18:24:05 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3.6 5/15]
 kernel/bpf/bpf_struct_ops.c:1390:10: error: implicit declaration of function
 'cgroup_get_from_fd'; did you mean 'cgroup_id_from_mm'?
Message-ID: <202601141839.b17wdpJB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rgushchin/linux.git bpfoom.3.6
head:   0096e4611728d881621b8fa5bf9f6cd849c88d14
commit: 33e73d2bb37ac09966e1f0eb6e82b95e6542c85a [5/15] bpf: allow attaching struct_ops to cgroups
config: riscv-randconfig-002-20260114 (https://download.01.org/0day-ci/archive/20260114/202601141839.b17wdpJB-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601141839.b17wdpJB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601141839.b17wdpJB-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/bpf_struct_ops.c: In function 'bpf_struct_ops_link_create':
>> kernel/bpf/bpf_struct_ops.c:1390:10: error: implicit declaration of function 'cgroup_get_from_fd'; did you mean 'cgroup_id_from_mm'? [-Werror=implicit-function-declaration]
    1390 |   cgrp = cgroup_get_from_fd(attr->link_create.target_fd);
         |          ^~~~~~~~~~~~~~~~~~
         |          cgroup_id_from_mm
   kernel/bpf/bpf_struct_ops.c:1390:8: warning: assignment to 'struct cgroup *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1390 |   cgrp = cgroup_get_from_fd(attr->link_create.target_fd);
         |        ^
   kernel/bpf/bpf_struct_ops.c:1398:4: error: implicit declaration of function 'cgroup_put'; did you mean 'cgroup_init'? [-Werror=implicit-function-declaration]
    1398 |    cgroup_put(cgrp);
         |    ^~~~~~~~~~
         |    cgroup_init
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=y]
   Selected by [y]:
   - CAN [=y] && NET [=y]


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
