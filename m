Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17381198A30
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jun 2024 15:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719501982; cv=none; b=EM2HjBUEwjG+m/ARgthRt4Lfev6t1lZZrOIduMCB4Ltt7HDAT5znUNYms6Fz1a3qDHB+rhF8kVERKCGgQ4UlcD4sVvi/TnUU97dqz7YUkvjfwEDqx20mW6bcEWDFE+3vJoF9Zd/5OmJBTkpPVx+tGuRPL3fRGMAUs0Yvwcci6iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719501982; c=relaxed/simple;
	bh=XxqfVm6GjIYcFB81Di5Mo0Xc5KRa8/foKxvs2eXq5Yg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vAQ8ql4DID1CBqVYjRRisYBV7hZoJsJUAgw1/nnIqf5JLTfk+hOK72hfeYCDeN9GAXnCOF1irvEl9e5+9vWKIBBXw8glaY06fIg/hMMlxBU5WqmM6F4ZUpIyByYFcAMne90HqtLGp1xdVd8/8+0etN5XafSW3v+kBsXUySJ+8sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kw8cSikg; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kw8cSikg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719501981; x=1751037981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XxqfVm6GjIYcFB81Di5Mo0Xc5KRa8/foKxvs2eXq5Yg=;
  b=Kw8cSikgMGRhH/XexibvJPd+VqKgFX40O0nCrX27pQ24VSt5x+cSy6/E
   6w1E1vR2RIXHhM3DiRtIT99b46PQndtRPSzpRMqka75TmMv4KoM1mX9OU
   2ms2FKZJFUeClV5yZnXy1OYMc53o3cYxWdBVfX+lW7z465BUQmvCjk3x8
   bvGN68d3oRF9vo71DtDZceYtgvJLo9lvW8qGTBTXgsPqpqBrmlJHrv/U9
   M8wEzw8ynIGB7TAcfm3gseW1AaGGicSCd1IAALkWAZtzzb5/K5auxKR4a
   0uOYtbd3AclAwV++oHcCFjV3bYsa2fG+k6TPxzBEcGOVZDlQ7L3a2X+qC
   Q==;
X-CSE-ConnectionGUID: 5noRhoAJSJ+IKQRCn1Ao0Q==
X-CSE-MsgGUID: GkPM3bBSRG+7mzBpCqhbIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16598987"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="16598987"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 08:26:18 -0700
X-CSE-ConnectionGUID: xkQjCgeySLSkuQcFXw/X5Q==
X-CSE-MsgGUID: yuEThF/MQAWSTcgPhf7SLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="49340329"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Jun 2024 08:26:18 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMr0p-000GII-1X;
	Thu, 27 Jun 2024 15:26:15 +0000
Date: Thu, 27 Jun 2024 23:26:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:timestats-hoist 76/288] fs/xfs/scrub/parent.c:888:34:
 warning: unused variable 'mp'
Message-ID: <202406272348.QOvGDpKk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git timestats-hoist
head:   e3e4404524bd888e2a2aeb263d7da67fb5efe653
commit: 1a199bda60315ba06071b9e9f44899b7a2b5f823 [76/288] xfs: refactor directory tree root predicates
config: arc-randconfig-002-20240627 (https://download.01.org/0day-ci/archive/20240627/202406272348.QOvGDpKk-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406272348.QOvGDpKk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406272348.QOvGDpKk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/xfs/scrub/parent.c: In function 'xchk_pptr_looks_zapped':
>> fs/xfs/scrub/parent.c:888:34: warning: unused variable 'mp' [-Wunused-variable]
     888 |         struct xfs_mount        *mp = ip->i_mount;
         |                                  ^~


vim +/mp +888 fs/xfs/scrub/parent.c

77ede5f44b0d86c Darrick J. Wong 2024-04-22  877  
77ede5f44b0d86c Darrick J. Wong 2024-04-22  878  /*
77ede5f44b0d86c Darrick J. Wong 2024-04-22  879   * Decide if this file's extended attributes (and therefore its parent
77ede5f44b0d86c Darrick J. Wong 2024-04-22  880   * pointers) have been zapped to satisfy the inode and ifork verifiers.
77ede5f44b0d86c Darrick J. Wong 2024-04-22  881   * Checking and repairing should be postponed until the extended attribute
77ede5f44b0d86c Darrick J. Wong 2024-04-22  882   * structure is fixed.
77ede5f44b0d86c Darrick J. Wong 2024-04-22  883   */
77ede5f44b0d86c Darrick J. Wong 2024-04-22  884  bool
77ede5f44b0d86c Darrick J. Wong 2024-04-22  885  xchk_pptr_looks_zapped(
77ede5f44b0d86c Darrick J. Wong 2024-04-22  886  	struct xfs_inode	*ip)
77ede5f44b0d86c Darrick J. Wong 2024-04-22  887  {
77ede5f44b0d86c Darrick J. Wong 2024-04-22 @888  	struct xfs_mount	*mp = ip->i_mount;

:::::: The code at line 888 was first introduced by commit
:::::: 77ede5f44b0d86c2ec812442846f512884009766 xfs: walk directory parent pointers to determine backref count

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
