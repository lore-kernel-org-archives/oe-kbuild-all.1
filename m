Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3603672BF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Sep 2026 18:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788545275; cv=none; b=qghIKmYu595cuzv2aVBEa/bSP63aPUDRNsimuZzmeKx/i++qA+xT+lxfQ7u7uiWzKlBvCrxGrgRv6hilcK35Vv8UCcUlnOyb+gSlGhMUyI7a5/vu2HWMAdS6Fx8094YpD34Xqb2JQXiCB96WKw6RTckDkfcn+dkHc8vphWswDn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788545275; c=relaxed/simple;
	bh=Er4FairCBTc+TmToRbAog2DPW5Y3cV/diPBUgfVzGqE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Nu9ynaVQtX0V/sPQm0O/z43NEdr2ys7iwwMWioYbCatEtF8YlcjwbGITBwmq1FHfTtjJqDGh4J6z0QaNxWWLdSvyKggiZmJ6LbfYMqEYdN+LsJwsuCuy+T2CwKCXhtoWY0FRNuwhdmBy/jFU3s2fr9EpJnrsGHEeQaZClWAcW/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZOlpvPTX; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZOlpvPTX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788545275; x=1820081275;
  h=date:from:to:cc:subject:message-id;
  bh=Er4FairCBTc+TmToRbAog2DPW5Y3cV/diPBUgfVzGqE=;
  b=ZOlpvPTX9EGQs54C7lL9pnF3PGdm3NypFTnrHLwQbJDuBkhPsWdhSSLE
   pvJIrB1QqzyivUAt2iJWmuAkOM5uMjFblri5osdihqQu9pcgiDHNfbe69
   vDLkDh8J84uMnFCbAQoGzAdURkI3lji3kz9m95xSx5upL+qlTJpTNCnBR
   t2eaRg+pbEgjWWN/qsThqhbHH3eZPALdGsdFO3nrM324Oa7EIc0GKlvby
   s8O+zZpE+zcsrBGFLMCyEsZaSAhAGZsK0cW8XutKTTXR+5YckDV9GSSrD
   HrATbUTj9w4vX4QAzAFCBEAatnD3ZoSGryf0BqOXDUfvNRrP3SQ/O3Qj+
   A==;
X-CSE-ConnectionGUID: DGuWLFuKShW25rBbkecIYg==
X-CSE-MsgGUID: 0BuNx5w1SvycYqB+Onjr8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="92871295"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="92871295"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 11:07:54 -0700
X-CSE-ConnectionGUID: OiN95vMERUC5YttOUAkUgA==
X-CSE-MsgGUID: QQfd4BRjSPicte88LZyFDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="266845520"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 Sep 2026 11:07:52 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2YKL-00000000A4C-2R0q;
	Fri, 04 Sep 2026 18:07:49 +0000
Date: Sat, 05 Sep 2026 02:07:39 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, Carlos Maiolino <cem@kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>
Subject: [xfs:xfs-7.4-merge 38/42] fs/xfs/xfs_ioctl32.c:74:33:
 warning: variable 'in' set but not used
Message-ID: <202609050143.6VQfT7oG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.kernel.org:/pub/scm/fs/xfs/xfs-linux xfs-7.4-merge
head:   c44f3db4f4c00c5250ddb290bb7cbd2a5ed40155
commit: 1e4c3089ab63d3afee702243630d9c3c919a046b [38/42] xfs: split out the handlers for XFS_IOC_FSGROWFS_*_32
config: x86_64-randconfig-012-20251225 (https://download.01.org/0day-ci/archive/20260905/202609050143.6VQfT7oG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609050143.6VQfT7oG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609050143.6VQfT7oG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/xfs/xfs_ioctl32.c: In function 'xfs_compat_ioc_growfs_rt':
>> fs/xfs/xfs_ioctl32.c:74:33: warning: variable 'in' set but not used [-Wunused-but-set-variable]
      74 |         struct xfs_growfs_rt    in = {};
         |                                 ^~


vim +/in +74 fs/xfs/xfs_ioctl32.c

    67	
    68	static int
    69	xfs_compat_ioc_growfs_rt(
    70		struct file		*file,
    71		struct xfs_mount	*mp,
    72		struct compat_xfs_growfs_rt __user *arg32)
    73	{
  > 74		struct xfs_growfs_rt	in = {};
    75		int			error;
    76	
    77		if (get_user(in.newblocks, &arg32->newblocks) ||
    78		    get_user(in.extsize, &arg32->extsize))
    79			return -EFAULT;
    80	
    81		error = mnt_want_write_file(file);
    82		if (error)
    83			return error;
    84		error = xfs_growfs_rt(mp, &in);
    85		mnt_drop_write_file(file);
    86		return error;
    87	}
    88	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
