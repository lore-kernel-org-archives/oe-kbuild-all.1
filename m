Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BBA3191C2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jan 2026 11:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768043452; cv=none; b=fW8FZxirwEHu2t50chd8fqGlfErJiv615OfE2i0oh6m/ZqxUwPIJXjRfyrFw+kjPtfwsRASmRiHXWdI0zxNHQIqS8Qo4m9rc7wVEufI0OINqdyTc0TslJFjGpltnxR6i5JEFObQB87214l84rxCugQXlZvAs77XuDcvvn1NtvCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768043452; c=relaxed/simple;
	bh=AIJ8cjtawc0xVRVVRNdpoTdAnWI/ykG4oFUDHODushk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L07cl8xOp+PnqQghTLr+VnItasx7n2HbqgUgrfOF8syg0CibJ6aQSDlHb3aZ0WrgaAz3IcXv18hgfMnFzpCK+dsrjkodDpfBtfcLKtTpDLSx0oaRVR46M4FMpU0ATjRkOSvYnEfGqdm2wtcxp/8cG6U0b38cO+Ui5BtxujOZzUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R0ZzNFqY; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R0ZzNFqY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768043451; x=1799579451;
  h=date:from:to:cc:subject:message-id;
  bh=AIJ8cjtawc0xVRVVRNdpoTdAnWI/ykG4oFUDHODushk=;
  b=R0ZzNFqYaVeKU4xKkRQazXzZnU69qevWW9kJZs2OLm0CZfJN6oYjhB3q
   0QgX5x61NlpAUu8HodH0ws3ZlifmjBLXZmdWamsQS6IRiodkQyc7c4Eph
   4VYAvhw/moOq9GizZ0OcriDCFNrvo7kzNseECsXS5kW+347K3ohQxACZq
   RdBkDe2JE+Atr66RIyDI/sHRcGslyQy5k+ECc0sSln3aS6gUpvmaUB3ZR
   iWxpffBF3TY+VdemE37MNQvD/mP/Bzz29Zl553/Zyifl3jzLLsuIOyqI+
   MEevYSfircomqBqClEub+Tdi5LpXArPeKBtJ/5su/HqedZPkWDMf8v134
   w==;
X-CSE-ConnectionGUID: way9r/eISYSqkd56yKSQlw==
X-CSE-MsgGUID: fPhlqj94RCWobm866+rtjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69474405"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="69474405"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 03:10:50 -0800
X-CSE-ConnectionGUID: 2dVXL6pRSEmjPf6uIpgIaA==
X-CSE-MsgGUID: pJ+egwIGSsu2RN9D/h52/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="241188989"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Jan 2026 03:10:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veWrn-000000008a4-10Wv;
	Sat, 10 Jan 2026 11:10:47 +0000
Date: Sat, 10 Jan 2026 19:10:46 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chao:bugfix/common 7/7] fs/f2fs/data.c:2647:29: error:
 'next_pgofs' undeclared
Message-ID: <202601101924.SAYVUGQa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   261bd0007c481171f11979ad38d62af7725d56df
commit: 261bd0007c481171f11979ad38d62af7725d56df [7/7] f2fs: avoid f2fs_map_blocks() for hole in readpages
config: i386-randconfig-012-20260110 (https://download.01.org/0day-ci/archive/20260110/202601101924.SAYVUGQa-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601101924.SAYVUGQa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601101924.SAYVUGQa-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/f2fs/data.c: In function 'f2fs_get_read_data_folio':
   fs/f2fs/data.c:1274:31: warning: unused variable 'mapping' [-Wunused-variable]
    1274 |         struct address_space *mapping = inode->i_mapping;
         |                               ^~~~~~~
   fs/f2fs/data.c: In function 'f2fs_mpage_readpages':
>> fs/f2fs/data.c:2647:29: error: 'next_pgofs' undeclared (first use in this function)
    2647 |         map.m_next_pgofs = &next_pgofs;
         |                             ^~~~~~~~~~
   fs/f2fs/data.c:2647:29: note: each undeclared identifier is reported only once for each function it appears in


vim +/next_pgofs +2647 fs/f2fs/data.c

  2642	
  2643		map.m_pblk = 0;
  2644		map.m_lblk = 0;
  2645		map.m_len = 0;
  2646		map.m_flags = 0;
> 2647		map.m_next_pgofs = &next_pgofs;
  2648		map.m_next_extent = NULL;
  2649		map.m_seg_type = NO_CHECK_TYPE;
  2650		map.m_may_create = false;
  2651	
  2652		for (; nr_pages; nr_pages--) {
  2653			if (rac) {
  2654				folio = readahead_folio(rac);
  2655				prefetchw(&folio->flags);
  2656			}
  2657	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
