Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9054433981
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Apr 2024 08:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714120123; cv=none; b=qUxzhgbXMK1/nRJfe2z0cEW/MKjkTPp30sCkPdxkR4EJZZnJ2i1/uxUCN7aF+Hd/skYwZ6kbI3rXeeLu9KOX0pGFpQO3Qvk1WyshISztodGdIn8oGlxl3Gb26ZhaOD8i9iXq1PjabOZZCiqXFHXPbyq5mF2RnTLZOumYfZqEn8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714120123; c=relaxed/simple;
	bh=EVVeHial6erU03lVax+d0+Bsv8+PvBypQRtbegZbVnA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eJ96GRXWKEz06FfbFPWmT7awePF9RwBQC3rCJHEB+8bJ2r6/SfNS0KeeTrCOCL2OqjVbqzE7ipt0gQx0XsRkXhhqWC41QXT0wzuPdNWb40XsYggZOsrrICE0pQuGo0Vee7rrUrbxGIB6jzu+/GolCL7o2HDCfit0rNqoCdyv8xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d/SCO7uN; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d/SCO7uN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714120122; x=1745656122;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EVVeHial6erU03lVax+d0+Bsv8+PvBypQRtbegZbVnA=;
  b=d/SCO7uNISKs5gfzg+hsjJiM5zJ3TTY+kC1RwxKoWYwzAqZKlbROQI4z
   ZDiHyiNIeEb0pU0JCpJHXdVXUm9psc+JSNVNfJCZOurxjcIbC1HgvR4/X
   wgH5Uk0dWNuz6QSV8m6XgN3fKt+zZ/jkZH5oDXAaQNvfPGPKonHHlkHOk
   lTx2lvDziV5Txkui8VpEr4cPJN0ytseZGzkKtSQvhDNK4bjIO+HUeZRyW
   wdM6ZBXTWJvJrPhkMEs8zPuuBt0/L+JlA7AEEt+tud4K0XqSs3LD1/TMT
   b966KgzbdTjJKhIu4OneIlBECZhB05SljvmZanFSRbFd0dPfDiQxyr77W
   g==;
X-CSE-ConnectionGUID: ESHn8cDWQDiuAm51RO0YJg==
X-CSE-MsgGUID: Q9IQBV7ERGaDe4K0yTfu/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20534853"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="20534853"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:28:41 -0700
X-CSE-ConnectionGUID: pdc2dUGLQ4+PRX6fvZgmiw==
X-CSE-MsgGUID: nwrD6RvISC602VJ8MsQWAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="25360988"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Apr 2024 01:28:40 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0Gwf-0003TO-2S;
	Fri, 26 Apr 2024 08:28:37 +0000
Date: Fri, 26 Apr 2024 16:27:58 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:arena_lock 11/11] helpers.c:undefined reference to
 `wrong_size_cmpxchg'
Message-ID: <202404261610.aksb0uaQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git arena_lock
head:   6b295d8fc61bf05eff00e6a833de6cdfc917ceba
commit: 6b295d8fc61bf05eff00e6a833de6cdfc917ceba [11/11] bpf: Remove spin in bpf_lock_release.
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20240426/202404261610.aksb0uaQ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240426/202404261610.aksb0uaQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404261610.aksb0uaQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: kernel/bpf/helpers.o: in function `bpf_lock_acquire_impl':
>> helpers.c:(.text+0x2714): undefined reference to `wrong_size_cmpxchg'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
