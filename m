Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD881DA43
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 19:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/raBvxl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697830589; x=1729366589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wno+XjPIUgK5ZLSF/ZQTbSHPQx6o0CD5UwU+NQ9wkOk=;
  b=f/raBvxl8Px3gCC7shn819j/2B+qW2rqg66BYPMSs4dSPepsX+DstHog
   3jz8YApAY+NgsiPcHqOtYKoPq0uGwLVXYpGZ4U+gNle72HcP2bXikVI6O
   axOsPz1fD7hAG40jmFcSY9Z1/dAk72qT80CSNzE9TI4GRlDEaKqGIbhcV
   5tAmoHHn4EdBPBMrTjwrUk8yJQV5UDns7ml0zqWIY7RQu0BWlHB9hSSiA
   QYDjjht/qtKbw6ImNoh7CR5fBwC/qFZpk/F7Lnm8phFLojzfwlszJQJc6
   oDKCsysuFQK1x/Q+lW5Dx5lNa9F3PFGk4XRUMRSsOsD9BXonnyO8pqVvF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="371629427"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="371629427"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 12:36:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="823357891"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="823357891"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 20 Oct 2023 12:36:27 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtvIG-0003uP-2v;
	Fri, 20 Oct 2023 19:36:24 +0000
Date: Sat, 21 Oct 2023 03:36:12 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <davidhwei@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>
Subject: [isilence:zc/veth2 7/16] exit.c:(.text.io_zc_rx_put_buf+0x3e):
 multiple definition of `io_zc_rx_put_buf';
 kernel/fork.o:fork.c:(.text.io_zc_rx_put_buf+0x3e): first defined here
Message-ID: <202310210322.rJE9zVyV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/veth2
head:   731b7375c43d08e971bcafcd9e90c1c0c8250678
commit: 799c9d0a8571dffc38eedd92abd520bb811b412a [7/16] io_uring: add ZC pool API
config: riscv-randconfig-001-20231021 (https://download.01.org/0day-ci/archive/20231021/202310210322.rJE9zVyV-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231021/202310210322.rJE9zVyV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310210322.rJE9zVyV-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: kernel/exit.o: in function `io_zc_rx_put_buf':
>> exit.c:(.text.io_zc_rx_put_buf+0x3e): multiple definition of `io_zc_rx_put_buf'; kernel/fork.o:fork.c:(.text.io_zc_rx_put_buf+0x3e): first defined here
   riscv64-linux-ld: fs/exec.o: in function `io_zc_rx_put_buf':
   exec.c:(.text.io_zc_rx_put_buf+0x3e): multiple definition of `io_zc_rx_put_buf'; kernel/fork.o:fork.c:(.text.io_zc_rx_put_buf+0x3e): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
