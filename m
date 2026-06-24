Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2024C2AE7A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 22:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782338914; cv=none; b=pZMumBUft1vJxewVlJGFUz+i8E1km5iUEzvQb2EJ8fULam5Xf7CbrTSG/ECkvC5D8I1+nJFWduyEnlcxx9+l72x38H3kVJY1gqRxwJ45dqFAjYGAz8tF2yIo+zFVfdLPfMTynPLNkNA+QupdXJW5jJ/Xr0Lx+ZvfAGiifuUWQdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782338914; c=relaxed/simple;
	bh=Qt+C4NAClnmIZGRDf31/taKDzZazy+drtgNXAWHZARs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JgQzWniXIXk6SfWMUKQV6QnszHSEe9jRKBfvXwY3tC+bEYlLP/28o+lGa/VP/N66rByRKy9GJhCpjG8qAkXOe0QeiQ3f8dg05LzP6OHViAlEUWxd2iFF52OdO485pJU4UPDxLn7qb1CbcVwph82ld8mv+Qj5mlHNHqL6sawOK9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fx0sKekC; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fx0sKekC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782338913; x=1813874913;
  h=date:from:to:cc:subject:message-id;
  bh=Qt+C4NAClnmIZGRDf31/taKDzZazy+drtgNXAWHZARs=;
  b=Fx0sKekCdLUxujpjvqLxzSpoeHKfe0FKZ/882Z+2F3n5EGNTtB+wDMMd
   bnHYkOr0Cz4zG8PxHtd59bHaGKEp7mlXahT0owR66CUlKKZl6JcoyRsR/
   RaHePAxamKr2f85vnoq0uFtkPeqjM7P3U4JDMulG5l5UcQokLi6HLSyaW
   3DIx/M9CMo2CmpbSgNSbmPirdR9w3JJGkgocAQqfusiBlmBBXOsZdn7f/
   1HIbo79x0jvX4k0DWygtus+OztdhiQ+Ru3k6USO6AhyEoGXkAm7CQeH77
   XAjhbKkJePtefrP6vMAWkZzjcZOLjSxH0/yL9khYvaNanhwwieGY10MYW
   A==;
X-CSE-ConnectionGUID: RcFAJCEcRSKq/XqdcBzHtw==
X-CSE-MsgGUID: AFOAkpSXR9aP91f+Oisb3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="83303536"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="83303536"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 15:08:32 -0700
X-CSE-ConnectionGUID: xFNT45bFRgq//sExxVd2rw==
X-CSE-MsgGUID: woOApNCQQVKTD3IcuEEkMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="254972876"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 24 Jun 2026 15:08:30 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcVli-000000003hR-34aR;
	Wed, 24 Jun 2026 22:08:26 +0000
Date: Thu, 25 Jun 2026 06:08:09 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/managed_nodes/rfc5 34/75]
 mm/mempolicy.c:1193:47: error: expected ')' before 'return'
Message-ID: <202606250538.3NrF12S7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/rfc5
head:   46a97233124f2cd0a55d11f159f5c975529ebb03
commit: 5a2689d32ea3ed6497b47864893666699f4bb999 [34/75] mm/mempolicy: add in-kernel MPOL_BIND interfaces for drivers/services
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260625/202606250538.3NrF12S7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260625/202606250538.3NrF12S7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606250538.3NrF12S7-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   mm/mempolicy.c: In function 'mpol_private_bind':
>> mm/mempolicy.c:1193:47: error: expected ')' before 'return'
    1193 |         if (!node_state(nid, N_MEMORY_PRIVATE)
         |            ~                                  ^
         |                                               )
    1194 |                 return ERR_PTR(-EINVAL);
         |                 ~~~~~~                         
>> mm/mempolicy.c:1196:1: error: expected expression before '}' token
    1196 | }
         | ^
>> mm/mempolicy.c:1196:1: warning: control reaches end of non-void function [-Wreturn-type]
    1196 | }
         | ^


vim +1193 mm/mempolicy.c

  1172	
  1173	/**
  1174	 * mpol_private_bind - build an MPOL_BIND policy pinned to a private node
  1175	 * @nid: an N_MEMORY_PRIVATE node
  1176	 *
  1177	 * Returns a refcounted mempolicy that binds allocations to @nid with the
  1178	 * private-placement intent (MPOL_F_PRIVATE).  This binds to @nid regardless
  1179	 * of the node's CAP_USER_NUMA, providing a privileged way for node-owners
  1180	 * to bind driver/service owned VMAs to the node.
  1181	 *
  1182	 * Like any MPOL_BIND it is relaxable: an unsatisfiable request falls back
  1183	 * rather than failing.
  1184	 *
  1185	 * Must be called while @nid is N_MEMORY_PRIVATE.
  1186	 *
  1187	 * The caller owns the reference and frees it with mpol_put().
  1188	 *
  1189	 * Return: the policy, or an ERR_PTR on failure.
  1190	 */
  1191	struct mempolicy *mpol_private_bind(int nid)
  1192	{
> 1193		if (!node_state(nid, N_MEMORY_PRIVATE)
  1194			return ERR_PTR(-EINVAL);
  1195		return __mpol_bind_node(nid, MPOL_F_PRIVATE);
> 1196	}
  1197	EXPORT_SYMBOL_FOR_MODULES(mpol_private_bind, "kmem");
  1198	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
