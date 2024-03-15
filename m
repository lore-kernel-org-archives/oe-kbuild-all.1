Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4822D175A6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 06:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710485283; cv=none; b=LTSpclRuV7Ki5lGVz6sgYqpMVK36RvPxwH9SbN4SYevDDnJ1JZ/MRQZHasTd6RMgMt9l3E5du5M63BXYhZaDWQPo+5nZ9M+LlZDjHY5Y6CagecJDqkbjLw+rTFzgQB4myQ8WB5sQhj75XDLGdncmKG9Swdd9jFmDUky2can+UEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710485283; c=relaxed/simple;
	bh=SAiGnVAaH4Cu0Iy0ZIvrAwpvTgaGlNEHs4lIygH+Ftg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LwK59W/w43puMPM6vWpGlDam7zfNWfo+JJJVEBvdNjGzcX7BuE5dTE4gscb7W9x4YGbYDA4eeXkWTiXP6pP1uTHa/Z1JigQHe9xybI4qf/1/G7iRmRTUEQi9AD3McdfNNSd4qDlaRULMyh2P3uW7/P7xojj+PwRy/PsNkN+YjGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jxhpbi9b; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jxhpbi9b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710485281; x=1742021281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SAiGnVAaH4Cu0Iy0ZIvrAwpvTgaGlNEHs4lIygH+Ftg=;
  b=jxhpbi9bxDCvADb43enm1aVupYpGChxV6LWxbr2BSqJob22FOeFnLVKL
   8Bn/Db+miHihT6mOMwShkLx6SBt4viHQyujWJvMGfY9oTMuWib+iXfMUQ
   VOUucqrcgVnvs90dWI0KrJCdPp3aB2cLolC3/L8JbruYKPhxdHipM2eqK
   8JIdjE/9ylzhx+1li1xwhBwmi0233BrdxwFHedEh+gNuXDzc4hlP4QRu6
   8B4kvaJlEbdtzNMWO4bYYIz5YbS4JKkAEWWObFCc537Y1i/CxAWxCtphn
   SoQDZ1u/7DGr/P3XND8Bd8ZqAOUk717SYSsWd5fPnU2M8W5v3QNMtO1p6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="16066760"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="16066760"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 23:48:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="17259387"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Mar 2024 23:48:00 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rl1MC-000ED7-32;
	Fri, 15 Mar 2024 06:47:56 +0000
Date: Fri, 15 Mar 2024 14:47:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 25/26] fs/nfs/dir.c:1665:1: warning:
 'nfs_lookup_revalidate_delegated_parent' defined but not used
Message-ID: <202403151422.0SlkW4Gz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   aa4219855bab5496651ccff3d62d8fecd4493d60
commit: 5bafff89b5e61c52ab5279f2c41ababfa2fa2b79 [25/26] nfs: skip dentry revalidation when parent dir has a delegation
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20240315/202403151422.0SlkW4Gz-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403151422.0SlkW4Gz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403151422.0SlkW4Gz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfs/dir.c:1665:1: warning: 'nfs_lookup_revalidate_delegated_parent' defined but not used [-Wunused-function]
    1665 | nfs_lookup_revalidate_delegated_parent(struct inode *dir, struct dentry *dentry,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/nfs_lookup_revalidate_delegated_parent +1665 fs/nfs/dir.c

  1663	
  1664	static int
> 1665	nfs_lookup_revalidate_delegated_parent(struct inode *dir, struct dentry *dentry,
  1666					       struct inode *inode)
  1667	{
  1668		return nfs_lookup_revalidate_done(dir, dentry, inode,
  1669						  nfs_verify_change_attribute(dir, dentry->d_time) ?
  1670						  1 : 0);
  1671	}
  1672	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
