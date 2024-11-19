Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D3D12CDAE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Nov 2024 06:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731998975; cv=none; b=e3knUOPJu3Rpg2GwE4fGhuBvJ+VExJdCOwTiUzSf/Yjau1dbl6Ap6TJE+if7iePqn0wgAF5dt6ufwN2b8rrAc2uNkGeym9EUehydubjpHk9FRDVOT3Cyv5o+8aHDJHvh8pw4P+5cifHgvgiX875vQfS6/+KD1LU71fOFj8ghLeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731998975; c=relaxed/simple;
	bh=Abyn/uCYI2l+hj8CQnq3ZSRx0a/cE4WWkjRDtfjFDg0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P4XN/sBGF+desKMSX6SZRRoCl4meENbWpa8SIRE0Szk14qkaOfX5YLx8hX/qolvN+tzcHPAn3DSUOBLTffGRowcFvPIpZ8/kfep3W3gByIWGq1BtMrZjaKv6wkXUTvxvTo2BYS+xzIkxQe46v/qacR0dBJgwL5IjzVH8beGcj/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dtZ2+bdo; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dtZ2+bdo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731998974; x=1763534974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Abyn/uCYI2l+hj8CQnq3ZSRx0a/cE4WWkjRDtfjFDg0=;
  b=dtZ2+bdoLw6UhNFDH5+lA4d8XPh9o1TVucqRuH1fPFHyynmkDPYan+x4
   FUqwtaTa215sHdNx918ZFkPAdgcZn6ogdKLdg6dNfc/lOKqt5+BUPrDdX
   Boru/M8QDFtsxiw3TY7j6ywWWNCTkBmSDFzy6fe+yL0ztLM3HxG70LMwi
   0MQ2WQAaCXfce0Q4k3Pn7OPw632zgkuYtvkHdY18lcD6WLfuwNDfZ5WC9
   0CUiObgASJhrQ9PimgQDxVKfnTDSBud041wCKducpD2AEzcb2NE4vePGQ
   MuRwE0Fx1UmLk+GvOm1sl+7ybcqBNdtAzCTAWttA6KMyexVnSqG5M0ysE
   g==;
X-CSE-ConnectionGUID: VE3VWPDmQDqqskX4HQghkQ==
X-CSE-MsgGUID: kDxABR8zSZygbw2W7AYR1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="42618393"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="42618393"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 22:49:33 -0800
X-CSE-ConnectionGUID: kHu9KniMQp+YffjlyYdQFw==
X-CSE-MsgGUID: CPfT01ezSbyR5WqElGLQeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="89382926"
Received: from lkp-server02.sh.intel.com (HELO 2cc4542d09d4) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 18 Nov 2024 22:49:33 -0800
Received: from kbuild by 2cc4542d09d4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDI3F-000096-13;
	Tue, 19 Nov 2024 06:49:29 +0000
Date: Tue, 19 Nov 2024 14:46:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Long Li <leo.lilong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474] fs/xfs/libxfs/xfs_alloc.c:102:1:
 sparse: sparse: symbol 'xfs_ag_fixup_aside' was not declared. Should it be
 static?
Message-ID: <202411191408.XqYzs7Ck-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   3813640a1336726a6c72428c2f66c8824486e915
commit: 8c6e9756375dff2e96d3b598992b2f0e8b3682ee [1474/1474] xfs: fix xfs shutdown since we reserve more blocks in agfl fixup
config: x86_64-randconfig-121-20241118 (https://download.01.org/0day-ci/archive/20241119/202411191408.XqYzs7Ck-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411191408.XqYzs7Ck-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411191408.XqYzs7Ck-lkp@intel.com/

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
