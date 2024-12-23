Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06791AF0BA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Dec 2024 18:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734979804; cv=none; b=oAxJjI+cT3fGTLyrNeieEEmrVK07c7mqj3E+Ln2oaOhjLxXLmK/JiiC/9lmwrZfxnB9FuyWxB4zKtcY0308cGT9STURWz63cKZ/kC/pkVe/uhUFyZKGbOztc4lHmDxF///jkpuJUVK3D3V9YecCCV8RJfFrKzPrck0+GqHlAbns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734979804; c=relaxed/simple;
	bh=R1YIsuKsz98P16dNXm7i0LiCyqy/U4xk1iyQmGlShx8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h+7CtQk9dGEiiGNxZlgBadK5qKGMP6vRtsVcEgDthb3I+FjKURJAExHVhHd8IO1OvtF+b0S+UZKuqYpVcJ4KhIyWnV+cymHqYx6yL6yguCbfXixn3uBZHgWw/PZceGiLbJ6Zl5bYnRtewzeyeyVEWj5FJ+be4AZcw7EhjqpbPm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bKl0V9VG; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bKl0V9VG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734979803; x=1766515803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R1YIsuKsz98P16dNXm7i0LiCyqy/U4xk1iyQmGlShx8=;
  b=bKl0V9VGXje2AkhgrL719/a+m50aMIIBS5ayxu/GJR3LAQgfCK6vBIXh
   YLTDiFMBbML//UO03mNc2IG+/pqsbAlb4945Y2xeESDCQ+AsxHJ4ak8bj
   UiQLDf6GY9AljxzNSP6286I3XKuLKV2vyE2n0hNef1WIl7wR0ZKzTMcvv
   RXXCllH+PCgyb4lCorv37MG9Rz3SPKwmgarCK7csHPwjp9vpx5YTdiSTc
   wNGlAFHR+PxXFQ2h4MODy46CK4hWgGB8FFaBMTjJaWCZ958XgSqb2weRU
   NCVSuG94TLAmtbwBHdGor26WOeTwo2Z7An/H1Eo6ZnucorR3tX+T+/Fpq
   Q==;
X-CSE-ConnectionGUID: BHXI9vP7Q/+wd4zPeDiiEw==
X-CSE-MsgGUID: hwcarRQGQ9K/RBWdDyRjwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="34724793"
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; 
   d="scan'208";a="34724793"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 10:50:02 -0800
X-CSE-ConnectionGUID: PLIg1fqxSIugoG8KdGciIw==
X-CSE-MsgGUID: s9dZ1+jfTV6PHm0Ld5R0Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; 
   d="scan'208";a="130124858"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Dec 2024 10:50:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPnV8-0000Z9-30;
	Mon, 23 Dec 2024 18:49:58 +0000
Date: Tue, 24 Dec 2024 02:49:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1343/1343] fs/ext4/mballoc.o: warning:
 objtool: ext4_mb_complex_scan_group()+0x11a4: unreachable instruction
Message-ID: <202412240236.czAsLPLH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   765b132216f73bb52fced28360c98a386ee20152
commit: 41298197ead9e85ee2ec1d52122f03fd1863cff2 [1343/1343] ext4: convert BUG_ON's to WARN_ON's in mballoc.c
config: x86_64-randconfig-101-20241223 (https://download.01.org/0day-ci/archive/20241224/202412240236.czAsLPLH-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241224/202412240236.czAsLPLH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412240236.czAsLPLH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/ext4/mballoc.c:12:
   In file included from fs/ext4/ext4_jbd2.h:16:
   In file included from include/linux/jbd2.h:26:
   In file included from include/linux/buffer_head.h:14:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   fs/ext4/mballoc.c:4734: warning: Function parameter or member 'bh' not described in 'ext4_free_blocks'
>> fs/ext4/mballoc.o: warning: objtool: ext4_mb_complex_scan_group()+0x11a4: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
