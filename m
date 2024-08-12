Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C3B2F2C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Aug 2024 20:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723493051; cv=none; b=iUZN6cu0LeCPYsslxZzxGGlhuPs+Uw3faw40kDlPFPnDN3v+/LXj5o10J9y0w2FrWkHRvWcbPw0Rnr426k0MsAh6VzXrLXADwvwlhnJ+URvAgG7bEpczaZ3tgFMDvumuXoCv1zrCFHHxIRbXpyQXH5eOAsX0FNGouutMqDTC2QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723493051; c=relaxed/simple;
	bh=njTHlY8+47Uka0uHwInjgyTxyfwnfmjDp2XwEB+14ZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KIcc7Hjspl2Bxes/jNPD8QMBaLZ5qZeLv97sjGfRVUyPcOMwmYqoGFJHrZPcv2hWbDeJdBzF2xWOSWTreWa+90ZTIKO9PWKiJdysIuoT0JHLU0OlUyOCEgIoEjjp9s6HtWeNumrbA9Ob37YO2ga4W4PbAjiu4I/RW7cNKKiaomY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z1uaSUK7; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z1uaSUK7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723493050; x=1755029050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=njTHlY8+47Uka0uHwInjgyTxyfwnfmjDp2XwEB+14ZA=;
  b=Z1uaSUK7zWDvBJVJ+5GX+djqyOpYRjkxzqcynF+hON3GuPAg5pCApMBw
   B+FNNO2Emg/SX3vJpB9bx5ieNveQkeEITE13ub9uwSUD+4c6iNyfyiPBr
   yGqKvTuayXm6kICEtSDommtpyXlnlimNGGKcROlXM+HEVYtiLXWPF3yMh
   fvYGNDvcJf4bSMqa+R2KWaBpEGkcsJ7kHDAQmoRs9v8RjLaGglialSbzO
   6WQIlwE67vRiVUgU55ET/PXJB/H9nvh9FB9CI42wCftH+oZozahbSBX3s
   hMlVjWSCkDpQR90KltJjFdL2ao9hjYkKlugRoGywHgEuVpZgH4OPL5yh1
   w==;
X-CSE-ConnectionGUID: LMY6prcTT1SGbERWeDKBxg==
X-CSE-MsgGUID: yRZCvlcoQyeYeBB7WVubkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="39073002"
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; 
   d="scan'208";a="39073002"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 13:04:09 -0700
X-CSE-ConnectionGUID: vS3UjdJcRL+plvdL/KlM6w==
X-CSE-MsgGUID: pled6vZdRkerhZEkyi+sdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; 
   d="scan'208";a="58320298"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 12 Aug 2024 13:04:06 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdbGt-000C8J-1q;
	Mon, 12 Aug 2024 20:04:03 +0000
Date: Tue, 13 Aug 2024 04:03:47 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Harmstone <maharmstone@fb.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>
Subject: [kdave-btrfs-devel:misc-next 77/82] fs/btrfs/ioctl.c:4701:51:
 warning: cast to pointer from integer of different size
Message-ID: <202408130343.m7kHb7lC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kdave/btrfs-devel.git misc-next
head:   4829b6d1a23840dd9f1819d41f8ca49b2b38c5bb
commit: b6077834544fe4ed3d1e87f25271442ca26a319a [77/82] btrfs: add io_uring interface for encoded reads
config: i386-buildonly-randconfig-002-20240813 (https://download.01.org/0day-ci/archive/20240813/202408130343.m7kHb7lC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240813/202408130343.m7kHb7lC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408130343.m7kHb7lC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/ioctl.c: In function 'btrfs_uring_encoded_read_cb':
>> fs/btrfs/ioctl.c:4701:51: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    4701 |         ret = btrfs_ioctl_encoded_read(cmd->file, (void __user *)cmd->sqe->addr,
         |                                                   ^
   fs/btrfs/ioctl.c: In function 'btrfs_uring_encoded_read_compat_cb':
   fs/btrfs/ioctl.c:4712:51: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    4712 |         ret = btrfs_ioctl_encoded_read(cmd->file, (void __user *)cmd->sqe->addr,
         |                                                   ^


vim +4701 fs/btrfs/ioctl.c

  4695	
  4696	static void btrfs_uring_encoded_read_cb(struct io_uring_cmd *cmd,
  4697						unsigned int issue_flags)
  4698	{
  4699		int ret;
  4700	
> 4701		ret = btrfs_ioctl_encoded_read(cmd->file, (void __user *)cmd->sqe->addr,
  4702					       false);
  4703	
  4704		io_uring_cmd_done(cmd, ret, 0, issue_flags);
  4705	}
  4706	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
