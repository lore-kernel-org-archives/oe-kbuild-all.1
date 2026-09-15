Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D722B4D2EC4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Sep 2026 19:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499946; cv=none; b=Mnid+EfUUA9/SRYZbNpILctOiwKMAnw3RWW7/ohUUdAI2n5DWpnyZ1CfyTfIzdQAxogQlEFZOsRI5d34/DfVW/tNgVo8csW8suLP/lQlnkoI8uA+WI6fCBf+CvpqwBUEV1c6pXLqdCQ2Y9AuDOCL3H5qTwSxDOE4cLy4MoGtxu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499946; c=relaxed/simple;
	bh=nq7YQID2QDxm2VMM8g24/Ax7qspjrR1lnsZKImBRK9o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B4iY1iup4+4CZk0IOLka+VFxO94mO8fgQtSfJmRw53qMwFs+c5nQAV1INPMz+7aPiQ/Lp8Br4IP+z4Gd7Xl9QkdygMeMphethkGtwjEm40c8DeJFbOcwD9j7BSzGr+InCXNj55AdTxfbEkXADTCzv0T4SXAEJ/fawsFVjgG7Bdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ckuvxh2K; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ckuvxh2K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789499945; x=1821035945;
  h=date:from:to:cc:subject:message-id;
  bh=nq7YQID2QDxm2VMM8g24/Ax7qspjrR1lnsZKImBRK9o=;
  b=ckuvxh2KgNdQhw2X3Dog+XNzliqfzEPiF+ULA5T+iOU0Pxf8VUT/cqZR
   cJ1DUQrBAEck+UOeUZNmmN/Syw4y/QRDG08AEtKp7m+GJHT/bwrl9Nev5
   q5NjZPY+agV8VwFBS4lnZ+fBt6GMmoWLy4pv8nKH9rU1CrlZnwrsY9AJa
   jJ4FjcvuSQUqZqG/jXi7GAtlZ3LiITTkViZCLWoyqFtX2cQfNPHWgqet0
   6H2lRFpnEGKvszzEEWkWGHWdmB30L9hTPjhbTksRdnxnLPZq16xeQJBL+
   1DKqhXsMkp2LC/u3QO2rRO7ZfdZkDaLrUWp1r0xks6hJl8wtRGEZzwZF7
   g==;
X-CSE-ConnectionGUID: uIVrOwjBQY6SLiYoj4SvTQ==
X-CSE-MsgGUID: icULP+ikTCmw2HxSnJzDhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89720659"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89720659"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 12:19:03 -0700
X-CSE-ConnectionGUID: X0BhY4DtQvmIYjliscjTNw==
X-CSE-MsgGUID: 1hyNoejXTyejGSdsOCdM6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269421548"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Sep 2026 12:19:00 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6YgE-000000004z9-1SA3;
	Tue, 15 Sep 2026 19:18:58 +0000
Date: Wed, 16 Sep 2026 03:18:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 462/799]
 fs/bcachefs/sb/io.c:582:19: sparse: sparse: cast to restricted __le32
Message-ID: <202609160340.yIOj1vyh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kent,

First bad commit (maybe != root cause):

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 30f7c327a5b2201012ff856bc95040e2ec3fad6b [462/799] bcachefs: move sb code to subdir
config: openrisc-randconfig-r112-20260915 (https://download.01.org/0day-ci/archive/20260916/202609160340.yIOj1vyh-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260916/202609160340.yIOj1vyh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609160340.yIOj1vyh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/sb/io.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
   fs/bcachefs/sb/downgrade_format.h:14:52: sparse: sparse: array of flexible structures
>> fs/bcachefs/sb/io.c:582:19: sparse: sparse: cast to restricted __le32
>> fs/bcachefs/sb/io.c:582:19: sparse: sparse: cast to restricted __le32
>> fs/bcachefs/sb/io.c:582:19: sparse: sparse: cast to restricted __le32
>> fs/bcachefs/sb/io.c:582:19: sparse: sparse: cast to restricted __le32
>> fs/bcachefs/sb/io.c:582:19: sparse: sparse: cast to restricted __le32
>> fs/bcachefs/sb/io.c:582:19: sparse: sparse: cast to restricted __le32
>> fs/bcachefs/sb/io.c:581:19: sparse: sparse: cast to restricted __le64
>> fs/bcachefs/sb/io.c:581:19: sparse: sparse: cast to restricted __le64
>> fs/bcachefs/sb/io.c:581:19: sparse: sparse: cast to restricted __le64
>> fs/bcachefs/sb/io.c:581:19: sparse: sparse: cast to restricted __le64
>> fs/bcachefs/sb/io.c:581:19: sparse: sparse: cast to restricted __le64
>> fs/bcachefs/sb/io.c:581:19: sparse: sparse: cast to restricted __le64
>> fs/bcachefs/sb/io.c:581:19: sparse: sparse: cast to restricted __le64
>> fs/bcachefs/sb/io.c:581:19: sparse: sparse: cast to restricted __le64
>> fs/bcachefs/sb/io.c:581:19: sparse: sparse: cast to restricted __le64
>> fs/bcachefs/sb/io.c:581:19: sparse: sparse: cast to restricted __le64

vim +582 fs/bcachefs/sb/io.c

1c6fdbd8f2465d fs/bcachefs/super-io.c Kent Overstreet 2017-03-16  577  
8b16413cda7c46 fs/bcachefs/super-io.c Kent Overstreet 2023-12-29  578  static unsigned long le_ulong_to_cpu(unsigned long v)
8b16413cda7c46 fs/bcachefs/super-io.c Kent Overstreet 2023-12-29  579  {
8b16413cda7c46 fs/bcachefs/super-io.c Kent Overstreet 2023-12-29  580  	return sizeof(unsigned long) == 8
8b16413cda7c46 fs/bcachefs/super-io.c Kent Overstreet 2023-12-29 @581  		? le64_to_cpu(v)
8b16413cda7c46 fs/bcachefs/super-io.c Kent Overstreet 2023-12-29 @582  		: le32_to_cpu(v);
8b16413cda7c46 fs/bcachefs/super-io.c Kent Overstreet 2023-12-29  583  }
8b16413cda7c46 fs/bcachefs/super-io.c Kent Overstreet 2023-12-29  584  

:::::: The code at line 582 was first introduced by commit
:::::: 8b16413cda7c46d47f8071165b3071f8a9369199 bcachefs: bch_sb.recovery_passes_required

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
