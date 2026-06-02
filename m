Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27EA342501
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jun 2026 02:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780366158; cv=none; b=t+ucClSUR/xCWG3cH4ISdesUxrvQPQcgEUkHWb81g8v0kZThAkKNMAHaPkxmExfXJo0mXeL+cmxdMmfjSWID/9coZ3/GmSpjODLqY5K4aza0wepWlYg5VpZtahN2Xo57HpV0E4oYMpUKnZw2QbpB12k7KImQU+0mB+S7YUtzV4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780366158; c=relaxed/simple;
	bh=2CGQeitG8MF52OBnjopAmcSlSdYbcjoYd/eIMzglXNA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tV2QDMCECRQeJFOSyZE1gGRGK+vrG42QAJkRHuNYGUuz/q2Hnvc235AqPv52Pddla6xqEksN+7gcine4t7AJUZJt7t6qBpzNCEvoxJS6Gi+KzaYwrMRGfTcp8TkSfiQQudsAhMPPWWnBZuU4ulcQIgIZxI+Snq5Jc/c2jxRPzAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Borm5YEK; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Borm5YEK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780366157; x=1811902157;
  h=date:from:to:cc:subject:message-id;
  bh=2CGQeitG8MF52OBnjopAmcSlSdYbcjoYd/eIMzglXNA=;
  b=Borm5YEKfUL2/IqDFDRA2EqrZELrb5W+ITvPQdLDNOYYE8HMbWpM7NcA
   cj2tEJguauyvf10Pnu0XKCybe4+NEEADlx8S95qlEhZaQUkmwIkuLdjiO
   1XzhFvyTGGngV3fOAEmnewkZ4thk9YfhobWFYZcEsGyNQQ+oNhz47gqWV
   RhLkIBQuCV+xpEjWjanv1o/HTVuKBnIwh49ofEkVLICMysDrD43/Xs4dv
   XrB6lwywsMIVHZCp46U31XJlTSIz9OZj3onaZAw5Nr2XZnFDakH2G/Ygr
   Pob40DfvwTCCXqY5Mdz5UbxSvdc9n5bxmsswd4w3p332eZtq6sk4KX5zT
   g==;
X-CSE-ConnectionGUID: /Tkh16RLQFeLR+9xH8HH6g==
X-CSE-MsgGUID: 84EKzrhyRO2VBDT+clpOTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81317675"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="81317675"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 19:09:17 -0700
X-CSE-ConnectionGUID: foTiEtXSR8ahO2oBn+3/ig==
X-CSE-MsgGUID: wA2GHkeRSZaF4vKNgKWFkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="243858556"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Jun 2026 19:09:15 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUEZ6-00000000BMT-0uWl;
	Tue, 02 Jun 2026 02:09:12 +0000
Date: Tue, 02 Jun 2026 10:09:06 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: fs/afs/server.c:375:5-24: WARNING: atomic_dec_and_test
 variation before object free at line 383.
Message-ID: <202606021010.6QMyYfim-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e43ffb69e0438cddd72aaa30898b4dc446f664f8
commit: 4882ba78574e2d8c579658f65f6784b0d139d173 afs: Fix afs_server ref accounting
date:   1 year, 3 months ago
config: hexagon-randconfig-r064-20260601 (https://download.01.org/0day-ci/archive/20260602/202606021010.6QMyYfim-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9409c07de6378507397ecdb6f05f628f58110112)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4882ba78574e ("afs: Fix afs_server ref accounting")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606021010.6QMyYfim-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/afs/server.c:375:5-24: WARNING: atomic_dec_and_test variation before object free at line 383.
   fs/afs/server.c:357:5-24: WARNING: atomic_dec_and_test variation before object free at line 360.

vim +375 fs/afs/server.c

   365	
   366	/*
   367	 * Drop an active count on a server object.
   368	 */
   369	void afs_unuse_server(struct afs_net *net, struct afs_server *server,
   370			      enum afs_server_trace reason)
   371	{
   372		if (!server)
   373			return;
   374	
 > 375		if (atomic_dec_and_test(&server->active)) {
   376			if (!test_bit(AFS_SERVER_FL_EXPIRED, &server->flags) &&
   377			    READ_ONCE(server->cell->state) < AFS_CELL_FAILED) {
   378				time64_t unuse_time = ktime_get_real_seconds();
   379	
   380				server->unuse_time = unuse_time;
   381				afs_set_server_timer(server, afs_server_gc_delay);
   382			} else {
 > 383				schedule_work(&server->destroyer);
   384			}
   385		}
   386	
   387		afs_put_server(net, server, reason);
   388	}
   389	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
