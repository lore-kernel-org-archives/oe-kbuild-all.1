Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A15C41C64
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 19:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733082715; cv=none; b=iHeylGDBx39f1cHN/XP9UZvp7XVioVQe63cgQZAjlgFPCh5U1PGZUxeg5LE+Oul/PWgYzngA2PoxzZfygBSmX2KyMGPhQIx7C57SGEJo2G04JrsO6Z9dKd1DkMYXcFPB2DYrj6xuPrEG1zsxZgWGGDlEI9zfxe+HfW50KsH8EYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733082715; c=relaxed/simple;
	bh=OqU3TEaEdwC8Opio63yfEkEPbdLTclz0DviFfFQ+YvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KThc8Nd6L4Ineu5a6JEN30yOSycZJcnGZxLW/SLyx5/+94m0qTRwwaowJGq9pIHsGbGGRRPd+l0b6PQaNtdpJaetv/1AZxB4lkGohLQlvw8jcLKJO5IKzQmzCs7G4zHmBhfvJg/iWtu35+UF8YbtXQxUywW/5N906wpYsUnvk6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YoTAzF7o; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YoTAzF7o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733082713; x=1764618713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OqU3TEaEdwC8Opio63yfEkEPbdLTclz0DviFfFQ+YvI=;
  b=YoTAzF7oG0t8TWiR9eswx8X3Wqct7v3O4xS7Vshu0fW/nQ7o8olJ4w42
   YW9KQ7hY6+CnGhUYwFKAVHCJ2tSAQez0AgrHc1CfoUE8dwjlIMRc0z8Fy
   Qy+sXsSF8zUMV/rZ9JMiKawRB1z9MlqZHYJEaaqho6xgaPur2SXsnZ1Ar
   lkNpiLpGqgAMW/ixw5jlO0ziBxjhKQNHsdQ76suNcZDOEcGVk4j68lTLq
   MlVMDMfCJqUNrFiSKJECA1CcMNg7D0QQj716/l4lBy7QMgm59mEL44M+V
   2sE32qd6gdBVryxo49x0DIAb71q2mD7pvRE2QEpaXnDBntd2dv6V207CB
   Q==;
X-CSE-ConnectionGUID: u7EU25tnRPWVQQqhBYDDWg==
X-CSE-MsgGUID: ruUDE7yOQ2e+FdskxNWfzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="44626194"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="44626194"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 11:51:52 -0800
X-CSE-ConnectionGUID: rsWNtKHlQACQmJ+0dHwmmA==
X-CSE-MsgGUID: Rzu9vA1jQRunRpFVfTkOaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="93392886"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 01 Dec 2024 11:51:51 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHpyu-0001oN-39;
	Sun, 01 Dec 2024 19:51:48 +0000
Date: Mon, 2 Dec 2024 03:51:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Long Li <leo.lilong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474] fs/xfs/libxfs/xfs_alloc.c:102:1:
 sparse: sparse: symbol 'xfs_ag_fixup_aside' was not declared. Should it be
 static?
Message-ID: <202412020323.jAdcem7b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   df4c334beecb4cf58e4e8d63b491aa5ac0a84f46
commit: 8c6e9756375dff2e96d3b598992b2f0e8b3682ee [1474/1474] xfs: fix xfs shutdown since we reserve more blocks in agfl fixup
config: x86_64-randconfig-121-20241118 (https://download.01.org/0day-ci/archive/20241202/202412020323.jAdcem7b-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412020323.jAdcem7b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412020323.jAdcem7b-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/xfs/libxfs/xfs_alloc.c:102:1: sparse: sparse: symbol 'xfs_ag_fixup_aside' was not declared. Should it be static?

vim +/xfs_ag_fixup_aside +102 fs/xfs/libxfs/xfs_alloc.c

    94	
    95	/*
    96	 * Twice fixup for the same ag may happen within exact one tp, and the consume
    97	 * of agfl after first fixup may trigger second fixup's failure, then xfs will
    98	 * shutdown. To avoid that, we reserve blocks which can satisfy the second
    99	 * fixup.
   100	 */
   101	xfs_extlen_t
 > 102	xfs_ag_fixup_aside(
   103			struct xfs_mount	*mp)
   104	{
   105		xfs_extlen_t ret;
   106	
   107		ret = 2 * mp->m_alloc_maxlevels;
   108		if (xfs_has_rmapbt(mp))
   109			ret += mp->m_rmap_maxlevels;
   110	
   111		return ret;
   112	}
   113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
