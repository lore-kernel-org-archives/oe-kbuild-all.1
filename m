Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1FF3346B2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 02:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768530999; cv=none; b=HmQ7ZO3rEBiMwD0Q1i02pF6DcTK+Tm4CFvXRdUxqXzXLOpsmfMOjl+cwyPNN3/JuuO7GJ0iYVHNXZ/1A7YrOMMWFJpNHmhjT557ZjbHD1Q9PFda0L2m4WSLocgUmcuGxgRql9PpRKX4g1Ip47XFuB5Kia6hFrclf2VUUQPs1V2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768530999; c=relaxed/simple;
	bh=zBlKNzmGWsfMT7YIMc8gLLEkzkSoM6RN949+HiV66RI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=itvy6kBA8yT+bX0QstgRugKWNvQJ+R7I3O6i6UWtacMr3VA0HBfOtNJyvn91XJqI/pDr55w3P9v7O81lzINHXNfa+NgTcJ7UGFSgxUne5ZnjAlpdbTkcyzhfAsj1HDiutB769OPWqgmUNF1x5bNv7bZk6TL+NUpgc8RdEvPn0Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c9bLiJNX; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c9bLiJNX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768530998; x=1800066998;
  h=date:from:to:cc:subject:message-id;
  bh=zBlKNzmGWsfMT7YIMc8gLLEkzkSoM6RN949+HiV66RI=;
  b=c9bLiJNXV4t7AgaewkIswoAKvjT0baFK1QEA+ih5+l3wl3t4XRBvUPGj
   0xSjVsahY6VcQWYLjhaFdC1dCt9jZ9owj3bl04oIM6ZwkkyyfnyuN3axC
   FjiUYSWuYC9ppNmwK3Mt4LMOWNZfJaIqL/SC7xcrEGjA7NBFttDbczx8b
   tTbtyIjypA/A+HJUfHUIe+8bU79IohuVGgaIvo6EtQkDBegDVmhwUNCXo
   it+veRnLWE7AqqxiFle3GN/ht1HLim+krjZiFZMg2X0vP4u7k0Qsa3Ln7
   WIzOmtd/2UnN8ZKAqL/x6xa3oaJOQIHdQoI9LD+Rj4j0rxv5y2VZuWT6N
   Q==;
X-CSE-ConnectionGUID: poW2mYphSsCq4RCsA7BRcg==
X-CSE-MsgGUID: PTly0mq/TjG3M1Wx/50Ijw==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80490131"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="80490131"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 18:36:37 -0800
X-CSE-ConnectionGUID: PR/MsXCOTDKOLiyHSyUoDQ==
X-CSE-MsgGUID: LRz5/wosS0uIv7+ZuQElrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="210153144"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Jan 2026 18:36:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgZhN-00000000KGi-0JJ0;
	Fri, 16 Jan 2026 02:36:29 +0000
Date: Fri, 16 Jan 2026 10:36:26 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3.9 3/16]
 kernel/bpf/bpf_struct_ops.c:1396:10: error: call to undeclared function
 'cgroup_get_from_fd'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202601161053.E2k58yu2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rgushchin/linux.git bpfoom.3.9
head:   229a98cb5fcb4645483860ad1ddf0d47eaa7534c
commit: 9ad4f0cbda7d220092eaf945142e6ed1e0cd9f7e [3/16] bpf: allow attaching struct_ops to cgroups
config: sparc64-randconfig-r073-20260116 (https://download.01.org/0day-ci/archive/20260116/202601161053.E2k58yu2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161053.E2k58yu2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601161053.E2k58yu2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/bpf_struct_ops.c:1396:10: error: call to undeclared function 'cgroup_get_from_fd'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1396 |                 cgrp = cgroup_get_from_fd(attr->link_create.target_fd);
         |                        ^
   kernel/bpf/bpf_struct_ops.c:1396:10: note: did you mean 'cgroup_id_from_mm'?
   include/linux/memcontrol.h:1453:19: note: 'cgroup_id_from_mm' declared here
    1453 | static inline u64 cgroup_id_from_mm(struct mm_struct *mm)
         |                   ^
   kernel/bpf/bpf_struct_ops.c:1396:8: error: incompatible integer to pointer conversion assigning to 'struct cgroup *' from 'int' [-Wint-conversion]
    1396 |                 cgrp = cgroup_get_from_fd(attr->link_create.target_fd);
         |                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/bpf_struct_ops.c:1404:4: error: call to undeclared function 'cgroup_put'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1404 |                         cgroup_put(cgrp);
         |                         ^
   3 errors generated.


vim +/cgroup_get_from_fd +1396 kernel/bpf/bpf_struct_ops.c

  1361	
  1362	int bpf_struct_ops_link_create(union bpf_attr *attr)
  1363	{
  1364		struct bpf_struct_ops_link *link = NULL;
  1365		struct bpf_link_primer link_primer;
  1366		struct bpf_struct_ops_map *st_map;
  1367		struct bpf_map *map;
  1368		struct cgroup *cgrp;
  1369		int err;
  1370	
  1371		if (attr->link_create.flags & ~BPF_F_CGROUP_FD)
  1372			return -EINVAL;
  1373	
  1374		map = bpf_map_get(attr->link_create.map_fd);
  1375		if (IS_ERR(map))
  1376			return PTR_ERR(map);
  1377	
  1378		st_map = (struct bpf_struct_ops_map *)map;
  1379	
  1380		if (!bpf_struct_ops_valid_to_reg(map)) {
  1381			err = -EINVAL;
  1382			goto err_out;
  1383		}
  1384	
  1385		link = kzalloc(sizeof(*link), GFP_USER);
  1386		if (!link) {
  1387			err = -ENOMEM;
  1388			goto err_out;
  1389		}
  1390		bpf_link_init(&link->link, BPF_LINK_TYPE_STRUCT_OPS, &bpf_struct_ops_map_lops, NULL,
  1391			      attr->link_create.attach_type);
  1392	
  1393		init_waitqueue_head(&link->wait_hup);
  1394	
  1395		if (attr->link_create.flags & BPF_F_CGROUP_FD) {
> 1396			cgrp = cgroup_get_from_fd(attr->link_create.target_fd);
  1397			if (IS_ERR(cgrp)) {
  1398				err = PTR_ERR(cgrp);
  1399				goto err_out;
  1400			}
  1401			link->cgroup = cgrp;
  1402			err = cgroup_bpf_attach_struct_ops(cgrp, link);
  1403			if (err) {
  1404				cgroup_put(cgrp);
  1405				link->cgroup = NULL;
  1406				goto err_out;
  1407			}
  1408		}
  1409	
  1410		err = bpf_link_prime(&link->link, &link_primer);
  1411		if (err)
  1412			goto err_put_cgroup;
  1413	
  1414		/* Hold the update_mutex such that the subsystem cannot
  1415		 * do link->ops->detach() before the link is fully initialized.
  1416		 */
  1417		mutex_lock(&update_mutex);
  1418		err = st_map->st_ops_desc->st_ops->reg(st_map->kvalue.data, &link->link);
  1419		if (err) {
  1420			mutex_unlock(&update_mutex);
  1421			bpf_link_cleanup(&link_primer);
  1422			link = NULL;
  1423			goto err_put_cgroup;
  1424		}
  1425		RCU_INIT_POINTER(link->map, map);
  1426		mutex_unlock(&update_mutex);
  1427	
  1428		return bpf_link_settle(&link_primer);
  1429	
  1430	err_put_cgroup:
  1431		if (link && link->cgroup)
  1432			cgroup_bpf_detach_struct_ops(link->cgroup, link);
  1433	err_out:
  1434		bpf_map_put(map);
  1435		kfree(link);
  1436		return err;
  1437	}
  1438	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
