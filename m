Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C593A48D7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 May 2026 14:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779546029; cv=none; b=d7C3O4lZLfYTAwb6gfHUnJnL4CbGGUQrnmomm1I8atkzA8EJaZ34e3R2U+rnUCXDmGmJkZaLU/gSf4LOVNuNuv3D+rn8kJPnZbFUNRdV2jn8nxAWbaCo91zJ5baO9wk4MEXiO2Qm9NhJU0cfOFKzo11w9GBOiY5CH3SW1UwtPAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779546029; c=relaxed/simple;
	bh=ZA2Id/Yt4Jy50xvhJ7EHhr8GP/UFeZGGnuHZ/xv55Wo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rEMxkjKje0TDIWwJ9iz4tcub/6am5yViMB9KOvzGiGQmUV+tn/XUxV9Q0QTwqn0boQ5SUwNFjpZ+Er6wCGesUO7nOzEo+k3ZeOcXBmP4vNQA+krR0ZILw4/D8L/srmVn3E5l2hwuXSS5vM6S1QOkkYc+8ZjCT02Fxz08X3cpqyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=awL+eNhj; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="awL+eNhj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779546027; x=1811082027;
  h=date:from:to:cc:subject:message-id;
  bh=ZA2Id/Yt4Jy50xvhJ7EHhr8GP/UFeZGGnuHZ/xv55Wo=;
  b=awL+eNhj9E68nw70wFxV6HF1LEhv9MBElXjWgE1lOn5aQIqa3rbdCCNC
   RzWQorVciTnHRqlgNCEk4sgrWjDkcCRRYIDAWGom/bqQF53fNPuxnReXG
   hO7MlXg9wdC6r6YiwSToJV0hkPDrZFp1yGXiYdYEef32Hkeykvh2zWBVq
   2IfIZROUOfJrHC8RgezW3disiRPM2MdGdBbzZE01or+6laWYt6ayHvwkC
   52Nq9iWxYLZkzllQZgDqfLGYFzm9oiKmF8rr/pNEB7flaTByQXkGI0zG4
   gXBMBtQACXXs4Xtl7Yfn/M3Rwar4lldVnCrGaNYpIX694BhZSCun+JGDc
   g==;
X-CSE-ConnectionGUID: AqieVnBvSr+WvaevrPc9Ow==
X-CSE-MsgGUID: 86rE9FjEQj+ydwUcbTvY0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="67972285"
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="67972285"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 07:20:25 -0700
X-CSE-ConnectionGUID: F42AaWi3QQSkVt72Pi8Iag==
X-CSE-MsgGUID: FVRRDfjHRcCQgScjuK2GEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="245457094"
Received: from lkp-server01.sh.intel.com (HELO cef7325a8999) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 May 2026 07:20:24 -0700
Received: from kbuild by cef7325a8999 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQnDA-0000000008P-1HuG;
	Sat, 23 May 2026 14:20:20 +0000
Date: Sat, 23 May 2026 22:19:57 +0800
From: kernel test robot <lkp@intel.com>
To: Tiwei Bie <tiwei.btw@antgroup.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Johannes Berg <johannes.berg@intel.com>
Subject: drivers/rpmsg/qcom_glink_smem.c:108:48: sparse: sparse:
 incorrect type in argument 2 (different address spaces)
Message-ID: <202605232211.rTPARBaB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Tiwei,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   79bd2dded182b1d458b18e62684b7f82ffc682e5
commit: a0e2cb6a90634f3dc80f16e882a683ee5761b0b0 um: Add VFIO-based virtual PCI driver
date:   1 year, 1 month ago
config: um-randconfig-r132-20260523 (https://download.01.org/0day-ci/archive/20260523/202605232211.rTPARBaB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260523/202605232211.rTPARBaB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a0e2cb6a9063 ("um: Add VFIO-based virtual PCI driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605232211.rTPARBaB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/rpmsg/qcom_glink_smem.c:108:48: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/rpmsg/qcom_glink_smem.c:108:48: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/rpmsg/qcom_glink_smem.c:108:48: sparse:     got void *
>> drivers/rpmsg/qcom_glink_smem.c:111:47: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *fifo @@
   drivers/rpmsg/qcom_glink_smem.c:111:47: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/rpmsg/qcom_glink_smem.c:111:47: sparse:     got void *fifo

vim +108 drivers/rpmsg/qcom_glink_smem.c

caf989c350e8e0b Bjorn Andersson        2017-08-24   93  
a8f500c68673d38 Bjorn Andersson        2023-02-14   94  static void glink_smem_rx_peek(struct qcom_glink_pipe *np,
b88eee975a26b15 Bjorn Andersson        2017-08-24   95  			       void *data, unsigned int offset, size_t count)
caf989c350e8e0b Bjorn Andersson        2017-08-24   96  {
caf989c350e8e0b Bjorn Andersson        2017-08-24   97  	struct glink_smem_pipe *pipe = to_smem_pipe(np);
caf989c350e8e0b Bjorn Andersson        2017-08-24   98  	size_t len;
caf989c350e8e0b Bjorn Andersson        2017-08-24   99  	u32 tail;
caf989c350e8e0b Bjorn Andersson        2017-08-24  100  
caf989c350e8e0b Bjorn Andersson        2017-08-24  101  	tail = le32_to_cpu(*pipe->tail);
b88eee975a26b15 Bjorn Andersson        2017-08-24  102  	tail += offset;
b88eee975a26b15 Bjorn Andersson        2017-08-24  103  	if (tail >= pipe->native.length)
b88eee975a26b15 Bjorn Andersson        2017-08-24  104  		tail -= pipe->native.length;
caf989c350e8e0b Bjorn Andersson        2017-08-24  105  
caf989c350e8e0b Bjorn Andersson        2017-08-24  106  	len = min_t(size_t, count, pipe->native.length - tail);
928002a5e9dab2d Arun Kumar Neelakantam 2018-10-03  107  	if (len)
928002a5e9dab2d Arun Kumar Neelakantam 2018-10-03 @108  		memcpy_fromio(data, pipe->fifo + tail, len);
caf989c350e8e0b Bjorn Andersson        2017-08-24  109  
928002a5e9dab2d Arun Kumar Neelakantam 2018-10-03  110  	if (len != count)
928002a5e9dab2d Arun Kumar Neelakantam 2018-10-03 @111  		memcpy_fromio(data + len, pipe->fifo, (count - len));
caf989c350e8e0b Bjorn Andersson        2017-08-24  112  }
caf989c350e8e0b Bjorn Andersson        2017-08-24  113  

:::::: The code at line 108 was first introduced by commit
:::::: 928002a5e9dab2ddc1a0fe3e00739e89be30dc6b rpmsg: glink: smem: Support rx peak for size less than 4 bytes

:::::: TO: Arun Kumar Neelakantam <aneela@codeaurora.org>
:::::: CC: Bjorn Andersson <bjorn.andersson@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
