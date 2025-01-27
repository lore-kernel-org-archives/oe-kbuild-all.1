Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB83433CB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jan 2025 16:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737996928; cv=none; b=jaSanSdjhW0Hl3Ora8EiVEYEBAM/Ra/fpR1iTOegjyaSq+m3V3CBefVuxpo6VrKV1Z5BORUlY305i3FjkB+kYIbX6w+gq9yk2m892iQWGLKrYhSKMXv8AFDznEaaEqTJz+QUpD4AhRZmD1N1jTLt4fSe5ZS83TGoUxg8uRbkvJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737996928; c=relaxed/simple;
	bh=8cZpp6u4SnPX9aqJkmdueTv0Wu8ORZacB7CqEnJZeqU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dZSvHWbisaHaRaHxT6JTIUEOGKllOaPtvj87byJm+mtywsAV3v8vLOnvsxwm0N9T/WcMa14qfpAkBeM3mocK1ziXIJ3oFQR1L+pm1gezyFYWHuvAQz9UDhZgLx2YuijymTwzA8ZQuvk2r0OFKp5Enmq79YIj9XEYb60yUC2XP9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T4G7QaPV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T4G7QaPV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737996927; x=1769532927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8cZpp6u4SnPX9aqJkmdueTv0Wu8ORZacB7CqEnJZeqU=;
  b=T4G7QaPVHLrM+4QyJK9l0i9oNpqsSr4Gg4kC+p5df6OLtjpieOfGd5We
   RlpoQqg3diCCEsaPRQNsG4dy/hoprl9cD94NVWslJpCYB7oh9NxHuSGuR
   HfFNDolL8JPRjQK95FyN2DQh1NpBina2XbvdrtAD+7ZFcCeJLzXlXtuux
   JKzKxzcbDBqJ8RKQPSQjEUyygaiUEaVkXW2jbw/Gj7WZ1FJ8fj3nRfIDM
   pvItNxDM1YQp9Nucrtv+AK5Ni3V0Gv58zk6BYIDa8vAW31VB1LD4O4zEz
   prJ+QDzkxa4EzKPe87ScSrp7kfEqOx1dx4PcDPKIHXiF199yoA8nN0qqF
   Q==;
X-CSE-ConnectionGUID: EXkG6RUwRKSVxgSoq0D98g==
X-CSE-MsgGUID: c81Gg8TVSuahDwUYHuu+Uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="42222659"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="42222659"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 08:55:26 -0800
X-CSE-ConnectionGUID: W37FhnuJQ6SeR3g4PPnj9g==
X-CSE-MsgGUID: wdxzOOWITeKYJRehILCTlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="131783005"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Jan 2025 08:55:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcSOQ-000gzG-1D;
	Mon, 27 Jan 2025 16:55:22 +0000
Date: Tue, 28 Jan 2025 00:55:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1343/1343] fs/ext4/mballoc.o: warning:
 objtool: ext4_mb_complex_scan_group()+0x11a4: unreachable instruction
Message-ID: <202501280034.3ctUnk1s-lkp@intel.com>
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
config: x86_64-randconfig-101-20241223 (https://download.01.org/0day-ci/archive/20250128/202501280034.3ctUnk1s-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250128/202501280034.3ctUnk1s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501280034.3ctUnk1s-lkp@intel.com/

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
