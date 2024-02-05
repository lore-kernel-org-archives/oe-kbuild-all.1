Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1BC1DFEC
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 20:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707165165; cv=none; b=s+NKv9DhOa1XuUvvivvJSCJIyvNEKgB7xgRM7P4srqIBlbaxQyf7PrTCc13+036+VhtmE5mgaA7JkvXmagZg0Q1jrIKU6mUU9AJgcloQOUUrM5y3VeS2CnSDJB5ij7OeE5C4thFpKu6S+JINjZoRlD38VQAAcikrEZLDIC9LNCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707165165; c=relaxed/simple;
	bh=SExtUcTM0zutAiCd+qS2VMhsVcuRhx0x11jysanfI88=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mwQlGIPeIL+4NPK/hd0ePbyAZ02NZM6cd2DI/nxIJtByXLMoI7hC8/KWJZ+zVX/R9qbXFqH+ncAzIHWelDXTUlhe0NReGAwSWMEU6d/zVcr6YGgpmTSsLXKORQKxsHMx/1EI/sZiPB/8+c40WsXY1E/WF7zKjq/MvtjDFPAoAbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fHslLxf7; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fHslLxf7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707165163; x=1738701163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SExtUcTM0zutAiCd+qS2VMhsVcuRhx0x11jysanfI88=;
  b=fHslLxf7sfSHJ/kD9Ciai1HSwvR/cMOu2rOez9HgoK4URZaB2oW9W2Zh
   i4VlmiUsaGXZ+iNiVAuFc3TY0aafpKQvrWSzm+GMJVO3D8Hf8otTorjOY
   /I9pGD4ynNMma/dabQZ+j6Je9T7c/KofDyhB7IQR5EWU2K/pAHvWuAo4D
   Xa2RSiCmwJk6dP9o+UvCBgwQyZ8NPlfePbDuHkScaZm4jcTiu58iSZzHu
   glVqsPujc8bY2FtbxTGd32se/o85oZLjvWFITBy89Svy3yVD1iWvWNsup
   +LIkQKDz9PE3r+sFaWUJDmZ9bnkglVz0BM7NSXb4R7KHvOUo/n0aHbn1z
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="18128637"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="18128637"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 12:32:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="5571290"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Feb 2024 12:32:41 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rX5du-0000nQ-06;
	Mon, 05 Feb 2024 20:32:38 +0000
Date: Tue, 6 Feb 2024 04:32:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 17239/21616]
 drivers/nvme/host/core.c:1163:27: error: 'compat_uptr_t' undeclared; did you
 mean 'compat_time_t'?
Message-ID: <202402060457.wJwwpnC8-lkp@intel.com>
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
head:   3a28772f4b29bdda924e9a5d2e3ff1ff1b23fd14
commit: b8ba22a604e4d0a3ad8e23af22f432e12b6f1a65 [17239/21616] nvme: fix compat address handling in several ioctls
config: arm64-randconfig-002-20240125 (https://download.01.org/0day-ci/archive/20240206/202402060457.wJwwpnC8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240206/202402060457.wJwwpnC8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402060457.wJwwpnC8-lkp@intel.com/

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
