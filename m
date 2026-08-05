Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A083747ACF9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Aug 2026 20:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785962573; cv=none; b=CA90EY/SjrRVgxMSoDFLeLzgp2JfcQtgH69SP79H/E45XIxOBR+WNuem6HrIk15sNPMg6kOVuR5sGD7+xkaMHum9593fGRLXd6TzR2ky+609Qq53Fz2cRAucWicvZ9clOXn9pa0L1byE79AWH5S8Yf7N7IzNRVrdqwVTwzfVwxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785962573; c=relaxed/simple;
	bh=Im22aOT+SUL0m4WSfUIlav/Ex24pREuyn0zUheplPH8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=J1YvYuUaZTXYdYXRzOcczSek1nckl1y0rCw0PokBev6eBWB+XMGrLc2HltKokBLCBYoDdlyHDG/e3r3t6aUWUpARIaUeemzFzSCfQc5y5/XNTdNUlFBS7YzpRlkkem8s2JcpBb1Kd67Y9vg/WGyqQw00K2dp1jNsvsZxD7dgsoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZUVo2m+S; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZUVo2m+S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785962568; x=1817498568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Im22aOT+SUL0m4WSfUIlav/Ex24pREuyn0zUheplPH8=;
  b=ZUVo2m+SOpK5W7OcMdoxbMxetFEAXZiFbD8lPLjq4/np6CpsuqwYPo6I
   7wyBN2h6jm59X0cUNsrkhUzSM70+j9DLKhyrhbtbsW6IgDAtbpeI0PdPW
   nUonCkV8S5iFvujSwyLk+N/dp5mWXmkltWUufgXqIpKV3tCDotNssRxUo
   hNmoUhQGaRaZWXmvwyN6X4bExJ8S2YPH7fi6fsPzS3zw5bl7dJiWa23F4
   oomNDv6jEVS9puMmcVEG+8jsiNcGXJuFV62NkL/rnAdP8wnmc7I1CYLEB
   1kt0XlPGZP1f9hblLZ0L9u3LYKPhrUPdCttXlivn2z+RqEyVaJlyFtP4h
   Q==;
X-CSE-ConnectionGUID: lzW84DYZR5eKNgBeCr7t6w==
X-CSE-MsgGUID: r0yZnYxmRKuNGBTvIlPf8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86490411"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="86490411"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 13:42:47 -0700
X-CSE-ConnectionGUID: Zy/75KbUT/yVFI2ecyw9Aw==
X-CSE-MsgGUID: OU9M/nprTISIWLSflxRmVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="300132427"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Aug 2026 13:42:45 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wriRn-00000000DOz-19Iv;
	Wed, 05 Aug 2026 20:42:43 +0000
Date: Thu, 06 Aug 2026 04:42:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/compat-32bit-time-ifdef 1/2]
 alpha-linux-ld: net/socket.c:3125:undefined reference to `put_old_timespec32'
Message-ID: <202608060440.qRj1bh1P-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/compat-32bit-time-ifdef
head:   7663b4d0ace6aad2eb71ebff8fef8c4bb0469903
commit: dc9f3c20e466c6e813f3cf09ffd5d276db7c3fd4 [1/2] ifdef
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20260806/202608060440.qRj1bh1P-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608060440.qRj1bh1P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608060440.qRj1bh1P-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: net/socket.o: in function `__sys_recvmmsg':
>> net/socket.c:3111:(.text+0x68dc): undefined reference to `get_old_timespec32'
>> alpha-linux-ld: net/socket.c:3111:(.text+0x68e8): undefined reference to `get_old_timespec32'
>> alpha-linux-ld: net/socket.c:3125:(.text+0x6928): undefined reference to `put_old_timespec32'
   alpha-linux-ld: net/socket.c:3125:(.text+0x6938): undefined reference to `put_old_timespec32'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
