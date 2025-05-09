Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4857F221DB5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 May 2025 09:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746784195; cv=none; b=EY4lcQVuUW1ckLNQjNIDCdWMovnWFTvpGSXVMruihRd1THQOdGrSC4ibCNLFWclU9kH2zeNewQ9us/jmT8szvilnvDajkrRiTacM0HjKACFRC8olrfZWTSoXavFZzFxB3ujwhIvwVJMwjhHawLkBatTrpokw2PpwBWTYAjKuJZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746784195; c=relaxed/simple;
	bh=biR9Ra6jqJXbNNQ0eQ9GXAw0SbV+Oy+XPFFDkIZZWHY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uwPX1aaUVYevBJpuAdNrvvhCSB6i+Tkw3FOl+70SVQSW70DKhe9uv1diVjUIpcV06h06a1pF0EAccJZDlhqoCI4k3WZR1dBAc57WbPbKtQ21K3zuozJ53KPuZapFXfmjsdDwusXP7BdLofnBzYAV6bbiPr/01+Ku9BYPVpQ3aTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SQ04sLvw; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SQ04sLvw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746784194; x=1778320194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=biR9Ra6jqJXbNNQ0eQ9GXAw0SbV+Oy+XPFFDkIZZWHY=;
  b=SQ04sLvwEpsIHzLQlsUoUP9mrZulH678FBqoXsOR0ODn6NdnwFBWZyaw
   ZlkHUkCNFZshrGeCSFKvTiTAu+lFvy4sW+nFM/3IB+45+WaBLIPrBWkHK
   zu98pjJx73FycSmmKXbqRx/fJXBnsINdK3icr3PLVzRPoLeWYgB1u642j
   KBq3X80fsxXoK6C8hvEGD9bt5g8uua9TVyKNzHZrzmlUDo4Ddm0fT2kOd
   MCEP2lJ/p+Tbmw/376kbKUr9yKSRFInQS512UgnEpEHg0cM0Dyngng/9n
   EfoFvMaEi+8DoGz89K1JWg0cvcj+R6rrfaIqtOW6G8iljyrbwR9sjuAx8
   Q==;
X-CSE-ConnectionGUID: o19Xdg5GQKSy6gpB6LzWTg==
X-CSE-MsgGUID: j0U0kEueSuibYYTOdB4Nhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="66139820"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="66139820"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 02:49:53 -0700
X-CSE-ConnectionGUID: qGowRK78QaiSXX7MbGUlPg==
X-CSE-MsgGUID: 0+YyMBGrRBypNNo+Jhl8JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="141522963"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 May 2025 02:49:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDKMY-000BtF-1z;
	Fri, 09 May 2025 09:49:50 +0000
Date: Fri, 9 May 2025 17:49:23 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:stream 6/11] core.c:undefined reference to
 `bpf_prog_stream_error_limit'
Message-ID: <202505091721.lZsiZBnZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux stream
head:   212cb4221f6b3eb227a15d2d2dfa16619cb0ff08
commit: 453d961e923807b74b000c1389bf3c72ecda9bc5 [6/11] bpf: Report may_goto timeout to BPF stderr
config: arm-h3600_defconfig (https://download.01.org/0day-ci/archive/20250509/202505091721.lZsiZBnZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505091721.lZsiZBnZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505091721.lZsiZBnZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: kernel/bpf/core.o: in function `bpf_prog_report_may_goto_violation':
>> core.c:(.text+0x50d8): undefined reference to `bpf_prog_stream_error_limit'
>> arm-linux-gnueabi-ld: core.c:(.text+0x5108): undefined reference to `bpf_stream_stage_init'
>> arm-linux-gnueabi-ld: core.c:(.text+0x5114): undefined reference to `bpf_stream_stage_printk'
>> arm-linux-gnueabi-ld: core.c:(.text+0x511c): undefined reference to `bpf_stream_stage_dump_stack'
>> arm-linux-gnueabi-ld: core.c:(.text+0x512c): undefined reference to `bpf_stream_stage_commit'
>> arm-linux-gnueabi-ld: core.c:(.text+0x5134): undefined reference to `bpf_stream_stage_free'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
