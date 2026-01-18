Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172E3246778
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 04:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768710545; cv=none; b=BGN62U1EzzlT4NWq9i13OIzns7EKaimbl/+owoj5gf6gUJ7w5hzbhevbXg4tDTra349fUSfLgt9gLqVe/ELmkR3atqFTS7iIduS/dJtl49PKauxGvELc6Uh/MmWQEjBaiIIEtkMC5wKBJ2aN2utC6xA17/z3ThzsS97X0yRtRUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768710545; c=relaxed/simple;
	bh=ya1bXrJ06rykvomtEwDbXCpNt0ApesHENsFDK6iq8Fc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I7VxyHhIAWyHl3ixa+6JAxDLcgaJHFb1LgqhatzjmS2NSQIQKPmC6csNPAf4BWqtyEmOihQfcbQ1EGQbM810jJgRtRDSh3vg7CNtaak7/g9ky9HTEcwpVNifG+YX/fQAKsX9sfvm2FzGed6riApzdVa0PfGrQ8qQ6JnGvHhIuYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HiF4PLQm; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HiF4PLQm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768710544; x=1800246544;
  h=date:from:to:cc:subject:message-id;
  bh=ya1bXrJ06rykvomtEwDbXCpNt0ApesHENsFDK6iq8Fc=;
  b=HiF4PLQmGI5rWdOYmQyIEKnY1eGoyR3OX+NaxjCsbPikNR4kFS1IoaA4
   iwgyF0YKB4EHF285kmrTw3oX54yqfI0AVtOIeGdC8Lln8PHUvXeAkPONu
   2vYQJxZLXWEeuFFD4ZSw0RGvn2RAd/+LR7M6fA1V1UMot+UvjPG13QoAE
   ZP+NbLTT+SY1FMzANqJMCC5S6fhrrZwsfVmsLtmeVHRkDAS5MvxeDjX24
   MHAZIQhzMKu1bfc4lX7c+eyWO2K+R7q4bwIVpvZ9BBGE9WvtKeocAGQC9
   QjMpDtT/lsJrv0Scz60IEbrK5qKAI7OmDhgX0tkcyZeN4Bys36hxYymSx
   Q==;
X-CSE-ConnectionGUID: AeiWxh7hToKTQw5KNWv/+A==
X-CSE-MsgGUID: CiTQ9E5TS1+m3BJ0OpwpNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="87381955"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="87381955"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 20:29:04 -0800
X-CSE-ConnectionGUID: qduDIQPlQruvNfLiWCTwLw==
X-CSE-MsgGUID: IwPW/CHBTcqEnRFxKm/0FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="210438127"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Jan 2026 20:29:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhKPL-00000000Mem-3Nj9;
	Sun, 18 Jan 2026 04:28:59 +0000
Date: Sun, 18 Jan 2026 12:28:41 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:xfs_defer_unlinked 4/6] fs/xfs/xfs_trans.h:245:45:
 warning: 'enum xfs_blft' declared inside parameter list will not be visible
 outside of this definition or declaration
Message-ID: <202601181254.NPI4Mcj3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/amir73il/linux xfs_defer_unlinked
head:   253cf31b448c0fbe81f61e6daec136a5ea576af7
commit: 6ee10cc8ff2ac949791cf8be928774c96b6ad833 [4/6] xfs: factor out unlinked inode list processing helpers
config: sparc-randconfig-r073-20260118 (https://download.01.org/0day-ci/archive/20260118/202601181254.NPI4Mcj3-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.5.0
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601181254.NPI4Mcj3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601181254.NPI4Mcj3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/xfs/xfs_iunlink.c:19:
>> fs/xfs/xfs_trans.h:245:45: warning: 'enum xfs_blft' declared inside parameter list will not be visible outside of this definition or declaration
     245 |                                        enum xfs_blft);
         |                                             ^~~~~~~~


vim +245 fs/xfs/xfs_trans.h

^1da177e4c3f41 Linus Torvalds 2005-04-16  243  
a4fbe6ab1e7abe Dave Chinner   2013-10-23  244  void		xfs_trans_buf_set_type(struct xfs_trans *, struct xfs_buf *,
a4fbe6ab1e7abe Dave Chinner   2013-10-23 @245  				       enum xfs_blft);
a4fbe6ab1e7abe Dave Chinner   2013-10-23  246  void		xfs_trans_buf_copy_type(struct xfs_buf *dst_bp,
a4fbe6ab1e7abe Dave Chinner   2013-10-23  247  					struct xfs_buf *src_bp);
a4fbe6ab1e7abe Dave Chinner   2013-10-23  248  

:::::: The code at line 245 was first introduced by commit
:::::: a4fbe6ab1e7abecf42b75e9c73701ed33b4ab03b xfs: decouple inode and bmap btree header files

:::::: TO: Dave Chinner <dchinner@redhat.com>
:::::: CC: Ben Myers <bpm@sgi.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
