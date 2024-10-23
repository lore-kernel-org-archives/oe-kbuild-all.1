Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166AB1A08DF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 23:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729726707; cv=none; b=FpyU5J01RWrwUiLgWEZSyz3O0deaKChSbeAmnhsUSp8KWm/XKuMWiN1vsGbk15PG9C7pnfLJLSij9So1J49Tj8n1w5369d+yAx6u66qMbbOCan/R7kl9Bg9+koSlutlNCtU97ceaEqAasgCP89sdcqkqouSI0osWNDknsRmuOz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729726707; c=relaxed/simple;
	bh=0NX/LsekiD5RiKrawiXDtWHzKp/PwoEnuKN2spNC8/k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p4Dnf3VH1noNl5ro7XBWktiVKDzRriymGIW3cgfGBoyQVojGsGKlvL97VaKbwhu7PnbzYwqrZNg0PKaJ9i2oQtq0P9NeGyR6Tj8pmVFm1V6bjxkSV0e6kyuzqyIjaTkJXa7hNJGtpSJg0ZZcGB9ZevPPcDVBMt7xmGcyG0OdDAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bYORa3XW; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bYORa3XW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729726705; x=1761262705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0NX/LsekiD5RiKrawiXDtWHzKp/PwoEnuKN2spNC8/k=;
  b=bYORa3XWQkvxM+Tvgt7B2zihl4lAqPDo4HqNLa4vNbPv06REtPd5/45C
   BTteCBx4feE0ltvD5HPJTlRLCde6euMkzfcGopX1RgfibXEt1AfzJEGHc
   d9ELaVdy9UEnZdRUKXCjdi21O8huZQH/KQe8t8R4vu5Rz0C6murYXF6vo
   vt6bc4frG1b47ZLUhrNT/4snvV804fSgblmrejsOAngmygWjxK/HRYPW4
   Z+rpx+57A0p2epnsDJkAihqgqoWD00J+5pEKsd+dNLKanW9EmIwZi5N9x
   4JVprdbYYTGvSvYPdYBnVDT12Ho8j9ulNUfBzM8HYZYb3oq9fBPsV48r7
   A==;
X-CSE-ConnectionGUID: YHkITYv6RFqMF0KmaqsYgg==
X-CSE-MsgGUID: U4qlQ3rdSESrrfhRaX8MvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="29236636"
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="29236636"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 16:38:24 -0700
X-CSE-ConnectionGUID: d9kOWzZVShqVEPTvJxG9fA==
X-CSE-MsgGUID: 5MCWud5ITtOeBVG2KGdMYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="111274550"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Oct 2024 16:38:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3kvk-000Vi8-1R;
	Wed, 23 Oct 2024 23:38:20 +0000
Date: Thu, 24 Oct 2024 07:37:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 17239/23855]
 drivers/nvme/host/core.c:1163:27: error: 'compat_uptr_t' undeclared; did you
 mean 'compat_time_t'?
Message-ID: <202410240741.LLyNQDLf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nick,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3c02090eb0ad149880a8c798014249ad2d642617
commit: b8ba22a604e4d0a3ad8e23af22f432e12b6f1a65 [17239/23855] nvme: fix compat address handling in several ioctls
config: arm64-randconfig-003-20241024 (https://download.01.org/0day-ci/archive/20241024/202410240741.LLyNQDLf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410240741.LLyNQDLf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410240741.LLyNQDLf-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvme/host/core.c: In function 'nvme_to_user_ptr':
>> drivers/nvme/host/core.c:1163:27: error: 'compat_uptr_t' undeclared (first use in this function); did you mean 'compat_time_t'?
    1163 |                 ptrval = (compat_uptr_t)ptrval;
         |                           ^~~~~~~~~~~~~
         |                           compat_time_t
   drivers/nvme/host/core.c:1163:27: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/nvme/host/core.c:1163:41: error: expected ';' before 'ptrval'
    1163 |                 ptrval = (compat_uptr_t)ptrval;
         |                                         ^~~~~~
         |                                         ;


vim +1163 drivers/nvme/host/core.c

  1154	
  1155	/*
  1156	 * Convert integer values from ioctl structures to user pointers, silently
  1157	 * ignoring the upper bits in the compat case to match behaviour of 32-bit
  1158	 * kernels.
  1159	 */
  1160	static void __user *nvme_to_user_ptr(uintptr_t ptrval)
  1161	{
  1162		if (in_compat_syscall())
> 1163			ptrval = (compat_uptr_t)ptrval;
  1164		return (void __user *)ptrval;
  1165	}
  1166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
