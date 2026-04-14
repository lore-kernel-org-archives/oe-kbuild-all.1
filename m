Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FBF26ED40
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Apr 2026 13:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776174526; cv=none; b=eBhmJWvwyqDb0eAgS3EErs/+mARaQ6gOoW2tpNfrk4++JF0rb5QEQNExsKF4iGAYA+5gPJTTAYx8aI6QoyjQwfsPCkGoLtVeaB85ojKj00RFrF1gsUOgW/g7gWDXOVzQC0w04syCzMfJGK/GrtBRnRgGpExFroiBxNo4AxZQ55Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776174526; c=relaxed/simple;
	bh=MG3wHRUpZnMJHTZTP8jcJ1ooKmu0fbi2vZpybjCf4s0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Vl0SEmI376EWCmqVDjxxCiRb/I7nMX5RvbMPCqFVvJlvjJPKZaz/7BgFAyCh5Mhji5s2oVYVOWOD9JgIBDGZrc5gtn7ydaLhKwlp3ir/KuRxqdIxrsAfDIj/zguh9Fs6zW+hteh2pQp7SnWhk7qbL4B9zfO8kY/I2iqnxOBUu8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kst7PeaH; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kst7PeaH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776174525; x=1807710525;
  h=date:from:to:cc:subject:message-id;
  bh=MG3wHRUpZnMJHTZTP8jcJ1ooKmu0fbi2vZpybjCf4s0=;
  b=kst7PeaHLuqTAJB/Wc5S30/xIskr55Ue7pmF2CvPM7JlrNqNtXzLVBoK
   7VdrqU17g2Oc4TgTiCu/lDvPXzDp7WHfktmFBtzUEbcJS2ypNGYptsbJG
   4IfL3m8yUs6+s14XA26mmxp/xsDkSRAce6Fg/MkEF2h9tnnzSIDNUQEWr
   MzORRGu1n9EFexSzu+yo1UEH5Pq3ljgfTXSaVAkEuRkRLTaiJ/k+zw9Zz
   aHEgQntKqjMMRGs44HJMzff4x8CoStuD6qcMHxmYBFuCtDl3QylrrvcpS
   E83BCwjKMsXqHLJ2/Z1ypr27nPftRcrWQ5xdrIxltyYYFLvcluLDUjL2u
   Q==;
X-CSE-ConnectionGUID: aWEergB9ShOjWqq+vo+X6w==
X-CSE-MsgGUID: UVKJHcnlTQymNdWmWPISaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="81015562"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="81015562"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 06:48:45 -0700
X-CSE-ConnectionGUID: EY5XcxY0TuatBjG7nVZKKg==
X-CSE-MsgGUID: b9tZ9ctSQMaeUKpe6uL1ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="229227735"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Apr 2026 06:48:42 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCe88-000000001Uf-1LhG;
	Tue, 14 Apr 2026 13:48:40 +0000
Date: Tue, 14 Apr 2026 21:47:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:bakeathon 29/31] fs/locks.c:1650:61: warning:
 suggest parentheses around comparison in operand of '&'
Message-ID: <202604142113.N5GwvaSK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git bakeathon
head:   5ff2ff7a45070fa6c7c2e5569cc846435c5595f8
commit: bb79ce8021d8f0575ca2bcf23baffb9ef2ade9b9 [29/31] filelock: ensure that lease type matches when scanning for visible leases
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20260414/202604142113.N5GwvaSK-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604142113.N5GwvaSK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604142113.N5GwvaSK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/locks.c: In function 'lease_type_matches':
>> fs/locks.c:1650:61: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
    1650 |         if ((flags & LEASE_BREAK_LEASE) && (fl->c.flc_flags & LEASE_TYPE_MASK == FL_LEASE))
         |                                                             ^


vim +1650 fs/locks.c

  1646	
  1647	static bool
  1648	lease_type_matches(struct file_lease *fl, unsigned int flags)
  1649	{
> 1650		if ((flags & LEASE_BREAK_LEASE) && (fl->c.flc_flags & LEASE_TYPE_MASK == FL_LEASE))
  1651			return true;
  1652		if ((flags & LEASE_BREAK_DELEG) && (fl->c.flc_flags & FL_DELEG))
  1653			return true;
  1654		if ((flags & LEASE_BREAK_LAYOUT) && (fl->c.flc_flags & FL_LAYOUT))
  1655			return true;
  1656		return false;
  1657	}
  1658	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
