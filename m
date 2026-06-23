Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A802370AF3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 10:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209633; cv=none; b=kaCkCODhdfed/GGJPZbwRquxsB1FURKSubr+CRwE+6GljoOU4pQSG7P5quvcYUU3MAGiBkLaIxgetk3OTKdnTNB5sAEkHVxtv3Z3O7aYPgJb4wnML778dYKyuGQN9Mik9NibIrvKNtuXaF4Dw+JhCpzSsEFnlzu0FEuuR3ioGXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209633; c=relaxed/simple;
	bh=9yI+vjd1QftvMC+G+mNcABUGAo9X7mwuFZtVJDA6nlM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G/SzqVeRcLNWGRHhdDXPzpuJUTfsFxY6yNGtR2DwKtCr9+DaA1XvFV5jPdJAzGNarmfdf1/z8JnGhyyBaY8tmyI8qQSCanN9j7miy7qjJKknDnZ73jx8eFStOiTDBJ4RVWhHSpC0YuNq1nuv3VHuBxxBL9/lNyK8a6iPjUDjzlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N2kBI2x3; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N2kBI2x3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782209631; x=1813745631;
  h=date:from:to:cc:subject:message-id;
  bh=9yI+vjd1QftvMC+G+mNcABUGAo9X7mwuFZtVJDA6nlM=;
  b=N2kBI2x3FlObwJ79vSRJNCnTlOQOdAz+XXV7e8vjm+4ebuNZxuitiC96
   hcUqMKqOZZtj0Vb0xLG1JTDUanUOltSNbuKFjgT3fuf+iQmsKzbNDiw9L
   nBQUeqvN5V3co/7quaD4ccqojnl7SgrpdmAQG2M8YdxG6et6k6jHsA9CN
   EkGH84gSscD4gVek4abSsThV8zQhVCqWX3t+r16CSh+sepjGzv3jRNNeX
   GTGesGL029PYILgj4ZQtOIysRQl+DyJWU3/ojXm3rGFBgla1T7z1LjIf1
   Bfkqj1Fr06Q00NIujLN+bhkVnCAj8kf7HBaRn+MSKf8lZJTSskHJr/d1y
   A==;
X-CSE-ConnectionGUID: 1ctRqeKARI+KB3kL1PXPeg==
X-CSE-MsgGUID: P5+IKEqKRQyIZQNAXW6gng==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="105741218"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="105741218"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 03:13:51 -0700
X-CSE-ConnectionGUID: R2lGZav4QLyNoZzTxqyw9w==
X-CSE-MsgGUID: ic6NRMxMRq6vZP7UrszkYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="273536571"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 23 Jun 2026 03:13:50 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wby8Z-000000002Pj-08g5;
	Tue, 23 Jun 2026 10:13:47 +0000
Date: Tue, 23 Jun 2026 18:12:52 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:ksmbd-for-next-next 13/49] Warning:
 fs/smb/server/oplock.c:937 function parameter 'inc_epoch' not described in
 'smb2_lease_break_noti'
Message-ID: <202606231829.rbpy2uTp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/smfrench/smb3-kernel.git ksmbd-for-next-next
head:   4f5e97218912f54a09ac326b838a79afc87da990
commit: 11eaaa4fcb260eb02596ead0d9841c575222698b [13/49] ksmbd: honor SMB2 v2 lease epochs
config: x86_64-randconfig-003-20260622 (https://download.01.org/0day-ci/archive/20260623/202606231829.rbpy2uTp-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606231829.rbpy2uTp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606231829.rbpy2uTp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: fs/smb/server/oplock.c:937 function parameter 'wait_ack' not described in 'smb2_lease_break_noti'
>> Warning: fs/smb/server/oplock.c:937 function parameter 'inc_epoch' not described in 'smb2_lease_break_noti'
   Warning: fs/smb/server/oplock.c:1503 function parameter 'send_interim' not described in '__smb_break_all_levII_oplock'
   Warning: fs/smb/server/oplock.c:1503 expecting prototype for smb_break_all_levII_oplock(). Prototype was for __smb_break_all_levII_oplock() instead
   Warning: fs/smb/server/oplock.c:937 function parameter 'wait_ack' not described in 'smb2_lease_break_noti'
>> Warning: fs/smb/server/oplock.c:937 function parameter 'inc_epoch' not described in 'smb2_lease_break_noti'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
