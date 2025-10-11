Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD74F347B4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Oct 2025 03:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760154009; cv=none; b=QfCEomU6VYlOy2nsDUzvYHh2mYgppTkS05ssMO7ePi4b9P6GU4pCtbs5qHOGx0ugZNLYXoiQwdeZJk81QIe/89vNZrxJYRCvqivAIqepG3L+sC+mbwzx3JvUY79fGRWGFSj+qRHGZf4ZnEUp4xzutylRMEhgsAg3tESBRi8XKbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760154009; c=relaxed/simple;
	bh=mr3F+tEmsrBpHzi6aK/Ga2A487lQzNjJkC3jGDhVNZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WRgVZ+CsrteUiUtm+a7H+dUyIKVT2cAqowD81EhS5BeMsjocnhABWE6/uy45MkdZV+JtSvm2dvpS0L2lUsbAjrNrS2bIkT9wxq+DlX9HcjI4PaUUfkTpt5DgC3NJF8GnwQDmwp19HeFTPxteI2d6ropw9uIL3he4MY3uc0LwRuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DP51UEyX; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DP51UEyX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760154008; x=1791690008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mr3F+tEmsrBpHzi6aK/Ga2A487lQzNjJkC3jGDhVNZs=;
  b=DP51UEyXcoKu49imBRGxvZzSHHerI2vGFNau03Ai/o51qtSh1IWJrxoN
   PgWzu44gDdu+D1GGnJ/xPyaasUjWciqvcRdXx3AUuDfdnj/1kjIwCGacu
   XuRX6/FxQ2+czKGGQhM81BohoyZDY+Ade5P0squtsqhce5QhDojiSbHeq
   58I4qMCTQpWl2rmxGfWtvB7OqheWiEUj4U5+xsFeI2X0WzhCvPgFk0oTi
   EIy1ZugsaxnAA4nsRwv68N9zTgUBG58Py7xLQ5vlFFu2hmgE+XxZCtTqP
   B0rH490cZEORBj6VVMtyFN6zjOinn6dWh8QmOZ72l2tfaBrMwiUNQ/RPW
   A==;
X-CSE-ConnectionGUID: LtlDZY37TBiz13dmPgdSug==
X-CSE-MsgGUID: FNqFvVVtSVCrlf/9rF42HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="73476862"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="73476862"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 20:40:08 -0700
X-CSE-ConnectionGUID: K4lHsFXYSvaeIbIi+kENsg==
X-CSE-MsgGUID: vDlLouiPQ3efES1EoGT0dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="180236751"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Oct 2025 20:40:06 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7QSh-0003Ue-27;
	Sat, 11 Oct 2025 03:40:03 +0000
Date: Sat, 11 Oct 2025 11:39:39 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.2.2 3/19] kernel/bpf/bpf_struct_ops.c:1364:24:
 error: implicit declaration of function 'cgroup_get_from_fd'; did you mean
 'cgroup_id_from_mm'?
Message-ID: <202510111104.10lKdou5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.2.2
head:   5a340f010fe5e9a9807ff0f23ff40b57b184948a
commit: 8f8c3dceea96e584918c6141d0d2e954e13391cb [3/19] bpf: struct ops: allow passing cgroup_id
config: arm-randconfig-002-20251011 (https://download.01.org/0day-ci/archive/20251011/202510111104.10lKdou5-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510111104.10lKdou5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510111104.10lKdou5-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   kernel/bpf/bpf_struct_ops.c: In function 'bpf_struct_ops_link_create':
>> kernel/bpf/bpf_struct_ops.c:1364:24: error: implicit declaration of function 'cgroup_get_from_fd'; did you mean 'cgroup_id_from_mm'? [-Werror=implicit-function-declaration]
    1364 |                 cgrp = cgroup_get_from_fd(attr->link_create.cgroup.relative_fd);
         |                        ^~~~~~~~~~~~~~~~~~
         |                        cgroup_id_from_mm
>> kernel/bpf/bpf_struct_ops.c:1364:22: warning: assignment to 'struct cgroup *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1364 |                 cgrp = cgroup_get_from_fd(attr->link_create.cgroup.relative_fd);
         |                      ^
>> kernel/bpf/bpf_struct_ops.c:1369:17: error: implicit declaration of function 'cgroup_put'; did you mean 'cgroup_init'? [-Werror=implicit-function-declaration]
    1369 |                 cgroup_put(cgrp);
         |                 ^~~~~~~~~~
         |                 cgroup_init
   cc1: some warnings being treated as errors


vim +1364 kernel/bpf/bpf_struct_ops.c

  1335	
  1336	int bpf_struct_ops_link_create(union bpf_attr *attr)
  1337	{
  1338		struct bpf_struct_ops_link *link = NULL;
  1339		struct bpf_link_primer link_primer;
  1340		struct bpf_struct_ops_map *st_map;
  1341		struct bpf_map *map;
  1342		struct cgroup *cgrp;
  1343		int err;
  1344	
  1345		map = bpf_map_get(attr->link_create.map_fd);
  1346		if (IS_ERR(map))
  1347			return PTR_ERR(map);
  1348	
  1349		st_map = (struct bpf_struct_ops_map *)map;
  1350	
  1351		if (!bpf_struct_ops_valid_to_reg(map)) {
  1352			err = -EINVAL;
  1353			goto err_out;
  1354		}
  1355	
  1356		link = kzalloc(sizeof(*link), GFP_USER);
  1357		if (!link) {
  1358			err = -ENOMEM;
  1359			goto err_out;
  1360		}
  1361		bpf_link_init(&link->link, BPF_LINK_TYPE_STRUCT_OPS, &bpf_struct_ops_map_lops, NULL,
  1362			      attr->link_create.attach_type);
  1363		if (attr->link_create.cgroup.relative_fd) {
> 1364			cgrp = cgroup_get_from_fd(attr->link_create.cgroup.relative_fd);
  1365			if (IS_ERR(cgrp))
  1366				return PTR_ERR(cgrp);
  1367	
  1368			link->cgroup_id = cgroup_id(cgrp);
> 1369			cgroup_put(cgrp);
  1370		}
  1371	
  1372		err = bpf_link_prime(&link->link, &link_primer);
  1373		if (err)
  1374			goto err_out;
  1375	
  1376		init_waitqueue_head(&link->wait_hup);
  1377	
  1378		/* Hold the update_mutex such that the subsystem cannot
  1379		 * do link->ops->detach() before the link is fully initialized.
  1380		 */
  1381		mutex_lock(&update_mutex);
  1382		err = st_map->st_ops_desc->st_ops->reg(st_map->kvalue.data, &link->link);
  1383		if (err) {
  1384			mutex_unlock(&update_mutex);
  1385			bpf_link_cleanup(&link_primer);
  1386			link = NULL;
  1387			goto err_out;
  1388		}
  1389		RCU_INIT_POINTER(link->map, map);
  1390		mutex_unlock(&update_mutex);
  1391	
  1392		return bpf_link_settle(&link_primer);
  1393	
  1394	err_out:
  1395		bpf_map_put(map);
  1396		kfree(link);
  1397		return err;
  1398	}
  1399	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
