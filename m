Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657E217E9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 May 2024 02:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714788193; cv=none; b=Zkj/FmnwpLzuzJkGZYzACIb04TXP/BRq264G7YCudTGo0r+SkPR3gPjMrdaoQOKhYK0IKxkpV9MsUf4JGUSfASmrBDpwq7fA/i50Jd4exteiCn+iFvAJ5T92O+V1EGiyOpZA0syn8fmfs4Voe1tfNcUDNQaN4ZC7kuvNUJBi3WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714788193; c=relaxed/simple;
	bh=qACRzEvrd3WoibDA8OniYU4/tufKu6MAXR9cHKye+AI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jRW3fDVnqxwlkScsx0JtUB2e8al0q//j0ngFJxaj7w/h5syFTx+zvcE4jHT9QbhxstY0JfAqDd95yjt+VwdOz5pv6bBdr7+5kEBpEbNFyEV4Jtu5P2ON8JN+EaVWkBrImaVwdtfqZJSw1p8vsX81chK64QNsSX6RP4wRW4ZCSHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SpnCSfUB; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SpnCSfUB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714788191; x=1746324191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qACRzEvrd3WoibDA8OniYU4/tufKu6MAXR9cHKye+AI=;
  b=SpnCSfUBs2KteS+JM8sqYfyJIzal5xDkwBC9T7IMFP3iQhEuixTSOgrp
   OfI92VyAzO+VRx49FreMkc7gA97aqCHJDjrEzu+V2VkgbbU/TjrNMfQ93
   k2ab3ngcUrOz2IkbytQGEPFcrwFYrcj+0OR1+SUtTbdB851MNPEth5Jeh
   5Col9kDSyBjzFuZE0flPTSaUkeoeA7+mNm7fIoVRsVgLaRmMnEQPBXkPz
   fbjlBxkqgJx7V6JGPYvnQiaXRoe3WNrj22wOBWA5lhjHjDm3OnSJWIQZf
   ujllTUF37s6YXCsZm4aLwKP5UcMzzyWJi5K8GVp1s5lGyYO8RVlhtA3uN
   A==;
X-CSE-ConnectionGUID: jcA2em7cRcGQxD5TVnyFPw==
X-CSE-MsgGUID: uu/KLlwhQp6ANx8lwtWeSw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="21761479"
X-IronPort-AV: E=Sophos;i="6.07,252,1708416000"; 
   d="scan'208";a="21761479"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 19:03:11 -0700
X-CSE-ConnectionGUID: +5MkWHlkR5aX8mqzwSFu3w==
X-CSE-MsgGUID: FIR4YSrLTIe39dQTggoBPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,252,1708416000"; 
   d="scan'208";a="28116400"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 May 2024 19:03:11 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s34jz-000CKs-2k;
	Sat, 04 May 2024 02:03:07 +0000
Date: Sat, 4 May 2024 10:02:20 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 208/1143]
 drivers/i3c/master/dw-i3c-master.c:14:10: fatal error: linux/i3c/target.h:
 No such file or directory
Message-ID: <202405040957.zO7IqgbU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: d1e5ebb66f8d1729d5dd7349190b9befb083e5e3 [208/1143] i3c: master: dw: Implement I3C target functions
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240504/202405040957.zO7IqgbU-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405040957.zO7IqgbU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405040957.zO7IqgbU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i3c/master/dw-i3c-master.c:14:10: fatal error: linux/i3c/target.h: No such file or directory
      14 | #include <linux/i3c/target.h>
         |          ^~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +14 drivers/i3c/master/dw-i3c-master.c

  > 14	#include <linux/i3c/target.h>
    15	#include <linux/interrupt.h>
    16	#include <linux/ioport.h>
    17	#include <linux/iopoll.h>
    18	#include <linux/list.h>
    19	#include <linux/module.h>
    20	#include <linux/of.h>
    21	#include <linux/platform_device.h>
    22	#include <linux/reset.h>
    23	#include <linux/slab.h>
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
