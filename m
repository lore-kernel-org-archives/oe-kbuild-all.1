Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA60B198833
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 11:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732100498; cv=none; b=SEfIeFO+y/ZEcQVmZr2gdS+1Va4wIJ1i3DcInAW3bLtu8n6ulWqvgstDBIz4GS1m1WfI+46lQ+G3kbnYldmwM603ky3iVJon6aK/rJzcxfowKdCfT74xFLJwOOQEJH+Dqaz9dcRYKR1g/KU3zcrgKXUJI/oit4Lz8elgvi7oLmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732100498; c=relaxed/simple;
	bh=NiGNhHj+1AXvQDu5frFIU/bqR3lWafdVZnYx7vkLM1s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jYh6z0WEhgP30LkVsjR0+Tpys+n6eVMYl2hzhLFCgrsdpHtNafp+szpOvdUZa3WdOgxYp/B06m0k2ZAEXh3xyK3sJmvMY+LOVRfzgAIXmvuVrVvLyWY+LwxWp/nIH/LFG1YD7n337AAEumrwBx48Zxm+Y/wbik+GTj0/TGZs7Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sv0IVgwm; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sv0IVgwm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732100497; x=1763636497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NiGNhHj+1AXvQDu5frFIU/bqR3lWafdVZnYx7vkLM1s=;
  b=Sv0IVgwmtaj/AggFnMcCJERmOcyFA5xB0ojE9ZWj5n5BfwBdSC9MOif8
   C5vz+CBz807mYHW8GQrwRQdbYRGTep2zxbg9yergfl+5yKK54+gO39uoJ
   U8GmqWZwzQH2xOt+L0fMjLgPi8RbJkFQbqcGg37QaU/uBuJzjB+u9+Jrp
   lPVr3rf8npqG62gXvAzQLQZgjvQv01FhAmQaLYytYlHw1ZC8MGSkrCQfD
   wFPxyRYg8QVSa4AvnCXEHBZcC2SE2kac4gvvmfq9MI4KbloFPfPbUYvYr
   5pCJhqUC4Ij5Cua/k3Ro2z/PdkplBRYee6BDup9RmDoTtkmkJFv6sBqdM
   g==;
X-CSE-ConnectionGUID: MJcJrCT+TnmlExYRLZwXYw==
X-CSE-MsgGUID: pFzk244wThSWVr02fjQnVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="35006057"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="35006057"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 03:01:36 -0800
X-CSE-ConnectionGUID: 8B9zoBUIRamegF90NdDpLQ==
X-CSE-MsgGUID: QBgMl/OeTYidPSpxTBp1Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="94943987"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Nov 2024 03:01:36 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDiSj-0000mn-0a;
	Wed, 20 Nov 2024 11:01:33 +0000
Date: Wed, 20 Nov 2024 19:01:01 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.12/bbr3 1/1] ERROR: modpost: "__udivdi3"
 [net/ipv4/tcp_bbr.ko] undefined!
Message-ID: <202411201841.nmUBiIxJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Oleksandr,

First bad commit (maybe != root cause):

tree:   https://github.com/zen-kernel/zen-kernel 6.12/bbr3
head:   a1f04ded36fb527bc23efdb969b1893c82e61a6e
commit: a1f04ded36fb527bc23efdb969b1893c82e61a6e [1/1] tcp/bbr3: initial import
config: sh-randconfig-r132-20241119 (https://download.01.org/0day-ci/archive/20241120/202411201841.nmUBiIxJ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241120/202411201841.nmUBiIxJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411201841.nmUBiIxJ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: missing MODULE_LICENSE() in arch/sh/boards/mach-highlander/psw.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/sh/boards/mach-highlander/psw.o
>> ERROR: modpost: "__udivdi3" [net/ipv4/tcp_bbr.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
