Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B8A1A3165
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 May 2026 12:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778328122; cv=none; b=gEztDn7kIg92Paup+2XyogF62PZScxFZALouS/HUktQHTUSNTU9pkfQbycm38IOTlo/XcjNIPD7xXqX1rg3QZ2B3+SNnRNif45KUwm2fe1S//TbEdKEgTVrb4FrVH58OIjKbzIhvftPT0ZkB0l1VXDaa9AHMbF0YXh1zJnVPRec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778328122; c=relaxed/simple;
	bh=ySqvEFR1Lfc4boomWan9jztROoCTLFugIluVPa3//OQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=deGgIT4rmqnieDCOx76oN3yXYit9MFYCQ0fkPL7jKqtyYfLCU8hkukm9/OtCuat7j+tFzblLXz5WlTjHWAfkgaosKFnqe9U1dqLyotc5OOH9sOy4QXCX3EF5vIMLutFxQcDwSwjn7OdGiSwLGOD61TkSPZ3yIEspSqAM5NTXMEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AhsNnzNt; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AhsNnzNt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778328120; x=1809864120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ySqvEFR1Lfc4boomWan9jztROoCTLFugIluVPa3//OQ=;
  b=AhsNnzNtk3LZeFVyyiTKG7C8BmCHgKfN3BVcFKp6wre3qjZTqmal0JL7
   1EfooC7mSQMUxwC2+d27cU0YR4ByBQZIuV0PIta4w/0oJdHbC5bxdc8wW
   kta3M+RftHkZCj1MwlWLtpF8Scm9f2ng//x9Icc+qiLCp1oNzlXd0vAyh
   6QUAt9A1+1ncbTSqXVpUxMd7syLwKa4wo/BxOSYVZoUR0RVv11yGvahs7
   1Tp9NwggKTXtEfXVH7m2Wd2P7TbjR9CdRJxTrMonF4+wB7cC2TSnMTfg5
   HPQRgOVkGdQOuefmporDOMBmA+Z/zxAs6Aw1G5VwgN19/Z19MxTXWqdls
   g==;
X-CSE-ConnectionGUID: MA+/md6KQ06/GzbVryNGgQ==
X-CSE-MsgGUID: eWRash/BR8axkXFcdoJeQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="96712263"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="96712263"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 05:02:00 -0700
X-CSE-ConnectionGUID: T+kXOfHBTxu5XcAHgS6fmQ==
X-CSE-MsgGUID: f5T1rXwMQtGn1GFuEyIzlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="232671858"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 May 2026 05:01:57 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLgNW-000000000wL-3SOx;
	Sat, 09 May 2026 12:01:54 +0000
Date: Sat, 09 May 2026 20:01:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Christoph =?utf-8?Q?B=C3=B6hmwalder"?= <christoph.boehmwalder@linbit.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Subject: [axboe:for-7.2/block 2/2]
 drivers/block/drbd/drbd_nl_gen.c:641:42: warning: 'drbd_nl_mcgrps' defined
 but not used
Message-ID: <202605091953.JmtMBXSE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-7.2/block
head:   8098eeb693c4cc4e774c62fbd4875197cb5578ce
commit: 8098eeb693c4cc4e774c62fbd4875197cb5578ce [2/2] drbd: replace genl_magic with explicit netlink serialization
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260509/202605091953.JmtMBXSE-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605091953.JmtMBXSE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605091953.JmtMBXSE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/block/drbd/drbd_nl_gen.c:641:42: warning: 'drbd_nl_mcgrps' defined but not used [-Wunused-const-variable=]
     641 | static const struct genl_multicast_group drbd_nl_mcgrps[] = {
         |                                          ^~~~~~~~~~~~~~


vim +/drbd_nl_mcgrps +641 drivers/block/drbd/drbd_nl_gen.c

   640	
 > 641	static const struct genl_multicast_group drbd_nl_mcgrps[] = {
   642		[DRBD_NLGRP_EVENTS] = { "events", },
   643	};
   644	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
