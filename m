Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0731B4779A3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 May 2026 15:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779463460; cv=none; b=YrjlopeQ4naIPs6EjFtkFenLZ0pQf65Nz/lT8Ws3sUxTcDlnfT5v10nz8Jr2Qs8qmk81KWaM4V3vCGH7lX4cezfetui+Ggr2dmjkSN4UgVDA1N9m9vlqxNV186opRjag1SrEBqhAvvzxH82I9eXs1kdRx8dkutbCDmsLL7PwQd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779463460; c=relaxed/simple;
	bh=BPiojG532MnyH7GJLyBjXg+nmfyxcBpczcr4XduJ4Bw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dqpZBAoekCtuaIu+YUmOMTq4dKk4CY9AWMPvIp0t2tH+1PRPLU0tQ7SNsTjQ2Lqeyg8TlqGPkm/Ko25jzALUZ5xPAa8fBSnHLFQZhA/HInFs0AHdDzAWkL/pKykH6khbLhmbC8n+c/wKRlXh9I3dO9rn/zvwVvFQakSlZyhSWRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VD7XEK8l; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VD7XEK8l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779463457; x=1810999457;
  h=date:from:to:cc:subject:message-id;
  bh=BPiojG532MnyH7GJLyBjXg+nmfyxcBpczcr4XduJ4Bw=;
  b=VD7XEK8l3h5WIWGIxW4kh4mF5dbkn3/ipOgfuD0hMCRA8tV4YP/Fl9hq
   YxTdXBcuu8PGE6hC/QV7u9FGdUAuCWeUuTu7genbpG0oqkWZHmrzFG3Gy
   cXwH/FFYRD+zZWQLZJitdATwA+WenFaQIFK9HRbHJvfQSWbP5X7/doxvH
   e21OSe8q0ipuDJoP3IyHDDaVpk8h/gZimK87KEAJu1xn5G9VWPfHyNNN8
   DR2d1tT/qiwp15xw0CxGMgobFmGYpn8xpcYPqP9FX/otegyVyDqKoylRq
   +qignmPy2+e3cYG6in3SCgvZdUJH4kYAKXeuFtmVcZBnSBeAyUvkzgf+H
   w==;
X-CSE-ConnectionGUID: un1c7d/4Q6G7eyMlciCm0A==
X-CSE-MsgGUID: 3Qc+cFS3RpK3glCPj+WboA==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80299231"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="80299231"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 08:24:13 -0700
X-CSE-ConnectionGUID: iUDbs7ePRkSbr+/et0vbTg==
X-CSE-MsgGUID: rNk1oLyBSKuR9aWcRR6ZUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="240809069"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 May 2026 08:24:12 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQRjN-000000002bR-41J0;
	Fri, 22 May 2026 15:24:09 +0000
Date: Fri, 22 May 2026 23:23:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot/v7.0 16/1197]
 ./usr/include/linux/netfilter/xt_nfacct.h:13:17: error: unknown type name
 '__ulptr'
Message-ID: <202605222329.bBJuFqUh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot/v7.0
head:   af9683ebfd23308f714cc478321fb01e5c4a7104
commit: ced52b51dede8d086b3920847f5b8364b2722b81 [16/1197] cheri: UAPI: Fix use of kernel pointer in UAPI netfilter UAPI structs
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260522/202605222329.bBJuFqUh-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605222329.bBJuFqUh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605222329.bBJuFqUh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/netfilter/xt_nfacct.h:13:17: error: unknown type name '__ulptr'
      13 |                 __ulptr __nfacct;
         |                 ^~~~~~~
   ./usr/include/linux/netfilter/xt_nfacct.h:21:17: error: unknown type name '__ulptr'
      21 |                 __ulptr __nfacct;
         |                 ^~~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
