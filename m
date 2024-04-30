Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC26FDDA6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 03:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714448951; cv=none; b=i1vEKJe9hO7ZFrxOiCe3d5Um/mFYobr8DtG3idestnqfTWwqNClkAn8JD6vI2FGuszckqJt9b5K7/EOb/8WdxUfUmAnn3MVZG3eCyse4szVYkzWxR0IYMNmFTic3OkFg3oa2yB9DpRcGPfie/oCreUshWL7mhmZ7RgJ6x1K8FyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714448951; c=relaxed/simple;
	bh=VJ+jc9B2cR6U0PAqZic8f6AfAq4ZEUjpIxYFGEQFrMU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B4IYhn73lRAAACM5yFFVJxq938exrtN6o7NFQw6UHnCS2+fyYaFBKD4gRPSzeSyCn2MmXvDdfi7hX+igqBG3h8orP6I4QbjgBFDSB2KhGHBZrOzQBGbGmez0YbNoesIHnQaVffMoHSQwOTujkVplLDU0yaKkCMMma46hKa35KGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TjNjllnh; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TjNjllnh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714448950; x=1745984950;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VJ+jc9B2cR6U0PAqZic8f6AfAq4ZEUjpIxYFGEQFrMU=;
  b=TjNjllnhqIM0nD0NbhBTT3zJyFoGGp/jQPSUOhm4NnujWvpZ3mU6AKre
   86+3gfvG4M/nKwt3SVf39mNdNVQt2lIKCRZzzW9WblEUOcjm9KlGbT9qj
   9XgrBfz2I7BPzI9tGqtpnwJFSdr/sbliJTJfzNSh4uIWXJ/CTTCn/N3dv
   LN96VYcSOltven6ud2s9bsBMByJ3vxrkseS6iCZ6W65Zo1rzJG2E8n3pG
   /jB/miGtwk3aLiNreFQaGJ4DtgrQK5tQxqJ1WXq1uso7TRfjfi7yyDrAQ
   EdCp+s69BKZlqdpPL+2xkMI/dZ11J8BeOJ0pc4c3EHtaBCGctiQpeTFhi
   g==;
X-CSE-ConnectionGUID: 7ggMKv1SS0CLP48cgTEPVQ==
X-CSE-MsgGUID: +Lc1Q710TqOmByaNyAgYPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9966303"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="9966303"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 20:49:10 -0700
X-CSE-ConnectionGUID: IM7sxPQPSMWeMqwVSqYb5w==
X-CSE-MsgGUID: y8rXy6MBQH+Lpf4ebKz3IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="26250930"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Apr 2024 20:49:08 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1eUM-0007hM-0k;
	Tue, 30 Apr 2024 03:49:06 +0000
Date: Tue, 30 Apr 2024 11:48:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 6/11]
 drivers/net/ethernet/renesas/ravb_main.o: warning: objtool: ravb_probe()
 falls through to next function ravb_remove()
Message-ID: <202404301119.RjfLqAAf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   280193753c4460c6cb7464dcd4026ab681b0cd20
commit: c2985e13ddc87258e98fad13e435129a210092b6 [6/11] UPSTREAM: ubsan: enable for all*config builds
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240430/202404301119.RjfLqAAf-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404301119.RjfLqAAf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404301119.RjfLqAAf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/renesas/ravb_main.o: warning: objtool: ravb_probe() falls through to next function ravb_remove()
   drivers/net/ethernet/renesas/ravb_main.o: warning: objtool: ravb_resume() falls through to next function ravb_runtime_nop()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
