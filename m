Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FAE1C5496
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Oct 2025 04:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760501284; cv=none; b=Z/eQ8M+GyfXHEDv55seUApwYoqtiU0LE+JrOCRt4IKRVyMhsww3ryUcFJg8iDVv0WajBZyoPu+7ZMhK2kMksRaj7Hi2bIm8T0f0njlZr/+/DJtTP2tgTcW1o4rLU/he6nXvZ66Qkj8RMn3hrrvKggsqZp1jNTRHsril6H8M3Tyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760501284; c=relaxed/simple;
	bh=j7A8VwEWMY1I84tYYamp/utJ86cjgkE0YoQ/CF4cwWk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qnr40pj11zFs/G482bYIIwJb8CUaN7vYcR6mGEuyDN2bAD/0Kl+3CsiwUH1iuoISnoHU+Bd0teV2hA0QgdCxuO+sjahqnLpt5UGWdFtGAY6ceK9vu8Bbp+t6qiKzMxWeQLlAtWUiSz7bfatU/AbM+iK4vqLZNBAIHWqtRtWzQqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FA8Hz4nc; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FA8Hz4nc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760501282; x=1792037282;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j7A8VwEWMY1I84tYYamp/utJ86cjgkE0YoQ/CF4cwWk=;
  b=FA8Hz4ncZNCjcb0aqS1HoanufhIe7mkgiDCXf4U5XV1hMX32brONLWlq
   HP97o75bwJUb6MAFiqIUbk0cjdaRwcOD+DNE4eZi0acDdxz6nsXnTI873
   SS261VqPA0nbGI1gVjL3CeFEHGokeiogHlPgUpMAm0bl3XEsWTARwvaTe
   1HQz+SX3pneP28g1EXd4RAWhKd7PjhF2PSv2tsQfqDRxesCayoLPnoxlG
   URnz0OqXn2szhm57D01FDBOoOZiIdFYa/X8nnMW/4P/8hTmvuCWHOXMgd
   VFg8Af1ZKeTKVZjcUpVS7t1hjNpIRni0z67P8ouXImk1FadZh8ZLQF3J4
   g==;
X-CSE-ConnectionGUID: yttOQJhLTbWGfM0ois/HcA==
X-CSE-MsgGUID: PnWKK+N2TkqGrrMVK2yf0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="80301222"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; 
   d="scan'208";a="80301222"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 21:08:00 -0700
X-CSE-ConnectionGUID: ayhWTj4rRkWTIe8E10iDyw==
X-CSE-MsgGUID: s2ULxX1bTyGrTxC9FqatrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; 
   d="scan'208";a="182530172"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 14 Oct 2025 21:08:00 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8snJ-0003Qr-29;
	Wed, 15 Oct 2025 04:07:34 +0000
Date: Wed, 15 Oct 2025 12:04:49 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.2.3 3/19] kernel/bpf/bpf_struct_ops.c:1365:10:
 error: call to undeclared function 'cgroup_get_from_fd'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202510151220.7q9Cjc93-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.2.3
head:   eedeb93246702e6ad8403579ea42891a18144b5f
commit: a6921e48177a6c0c9a1c5d55d7bb9b2787564093 [3/19] bpf: struct ops: allow passing cgroup_id
config: arm-randconfig-004-20251015 (https://download.01.org/0day-ci/archive/20251015/202510151220.7q9Cjc93-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251015/202510151220.7q9Cjc93-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510151220.7q9Cjc93-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/bpf_struct_ops.c:1365:10: error: call to undeclared function 'cgroup_get_from_fd'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1365 |                 cgrp = cgroup_get_from_fd(attr->link_create.cgroup.relative_fd);
         |                        ^
   kernel/bpf/bpf_struct_ops.c:1365:10: note: did you mean 'cgroup_id_from_mm'?
   include/linux/memcontrol.h:1479:19: note: 'cgroup_id_from_mm' declared here
    1479 | static inline u64 cgroup_id_from_mm(struct mm_struct *mm)
         |                   ^
>> kernel/bpf/bpf_struct_ops.c:1365:8: error: incompatible integer to pointer conversion assigning to 'struct cgroup *' from 'int' [-Wint-conversion]
    1365 |                 cgrp = cgroup_get_from_fd(attr->link_create.cgroup.relative_fd);
         |                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/bpf_struct_ops.c:1370:3: error: call to undeclared function 'cgroup_put'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1370 |                 cgroup_put(cgrp);
         |                 ^
   3 errors generated.


vim +/cgroup_get_from_fd +1365 kernel/bpf/bpf_struct_ops.c

  1336	
  1337	int bpf_struct_ops_link_create(union bpf_attr *attr)
  1338	{
  1339		struct bpf_struct_ops_link *link = NULL;
  1340		struct bpf_link_primer link_primer;
  1341		struct bpf_struct_ops_map *st_map;
  1342		struct bpf_map *map;
  1343		struct cgroup *cgrp;
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
  1364		if (attr->link_create.cgroup.relative_fd) {
> 1365			cgrp = cgroup_get_from_fd(attr->link_create.cgroup.relative_fd);
  1366			if (IS_ERR(cgrp))
  1367				return PTR_ERR(cgrp);
  1368	
  1369			link->cgroup_id = cgroup_id(cgrp);
> 1370			cgroup_put(cgrp);
  1371		}
  1372	
  1373		err = bpf_link_prime(&link->link, &link_primer);
  1374		if (err)
  1375			goto err_out;
  1376	
  1377		init_waitqueue_head(&link->wait_hup);
  1378	
  1379		/* Hold the update_mutex such that the subsystem cannot
  1380		 * do link->ops->detach() before the link is fully initialized.
  1381		 */
  1382		mutex_lock(&update_mutex);
  1383		err = st_map->st_ops_desc->st_ops->reg(st_map->kvalue.data, &link->link);
  1384		if (err) {
  1385			mutex_unlock(&update_mutex);
  1386			bpf_link_cleanup(&link_primer);
  1387			link = NULL;
  1388			goto err_out;
  1389		}
  1390		RCU_INIT_POINTER(link->map, map);
  1391		mutex_unlock(&update_mutex);
  1392	
  1393		return bpf_link_settle(&link_primer);
  1394	
  1395	err_out:
  1396		bpf_map_put(map);
  1397		kfree(link);
  1398		return err;
  1399	}
  1400	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
