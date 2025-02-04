Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951BF1EEA29
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Feb 2025 17:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738689998; cv=none; b=KIsmWuQKfARPo+MzssmBVvMl97vAJh6XeCe+HeGAI4d0gw0nbcDH/Sa7z4ZI/5y7UBdsSTAM/JpUVjWOISrCioVyhxbiaPNa30rlJZzBi+GEZi5vL5JoPxaC3B3uXQe+ug8RIvIAVS6VrYudWuQikAV/7QUq8KcCioY3dO9ZlZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738689998; c=relaxed/simple;
	bh=SXRYn8dpFpXA4fm7Kq0jOR2sT4BoRCO52nyVduokoDw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZR1m+P4y0LMf+pdg7miFQu5Y3gQP0gggu4u8pdDE6kxNXo9gzIQwQgS1lh7J0p9/8FAfRFqcSoWTF3S6DBAqpffuo4e8DbZzSQkAt6RWyNskuKcrc7QHY0e+kP4UHK3rJM/cFq1Z+SEnL8g8N5oWfU51WO0co8W1C8zlfupzYI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LTvAtd5C; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LTvAtd5C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738689996; x=1770225996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SXRYn8dpFpXA4fm7Kq0jOR2sT4BoRCO52nyVduokoDw=;
  b=LTvAtd5CPjmkE6hwHm3luRzhN67q9cs8SuU4S3drN0rSeYWZcrc6aR4S
   o2eYZXITNU2Q3zRP/GO00u6FSMzseOFzbBZDp3Px0EvjSemeGceIQKyhR
   DyvvxVcjvigDFwgCj9rlOXCz5hXBNuLa5HeMG6AyxI6z3GvZGqAOgBrAj
   tnvgOz8ztCNR/a9hzfFCnV823SMO1VS/lIQIHRJKL9vZbO1ChGojKt+GM
   KdakW6+VWnMaHj1f6EiHivE7mWEqHcztKnGw1GsV7gZtR4cFlBQY0cRb7
   Otzw4EanMh6T0k0hnDRuY8rzt/V4r9/cuB/T4z0PnwhtUJTCTX/VER1+r
   w==;
X-CSE-ConnectionGUID: CIQgc75yRiq8eBkJMuOTVQ==
X-CSE-MsgGUID: TknY5VUuTTuRpLshUYyTig==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="26829496"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="26829496"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:26:35 -0800
X-CSE-ConnectionGUID: Rvnd+XTOTiqw1HifXeO0Ow==
X-CSE-MsgGUID: A80AJE6hSz+5OC5E08KmOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111513444"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Feb 2025 09:26:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfMgx-000snT-0H;
	Tue, 04 Feb 2025 17:26:31 +0000
Date: Wed, 5 Feb 2025 01:26:16 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1343/1343] fs/ext4/mballoc.o: warning:
 objtool: ext4_mb_complex_scan_group()+0x11a4: unreachable instruction
Message-ID: <202502050119.jyApN4Fx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Theodore,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   da51139d17e9d53d61a9877d9042e43b85d71ee1
commit: 41298197ead9e85ee2ec1d52122f03fd1863cff2 [1343/1343] ext4: convert BUG_ON's to WARN_ON's in mballoc.c
config: x86_64-randconfig-101-20241223 (https://download.01.org/0day-ci/archive/20250205/202502050119.jyApN4Fx-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502050119.jyApN4Fx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502050119.jyApN4Fx-lkp@intel.com/

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
