Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6156E26AE5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Mar 2026 00:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772323872; cv=none; b=BCvVKRffH4pqn+ekm03U7BTIG/NiWndjV0awWWXceHaRDeXvP+MTBYq0yGoq+hkAlgu86kCH17WqvSetj3hMNCFGSgyH16kRqR7A7jcHBfv8s9l+McyD4IIk4k9i4G8VbL5T4UPHokE6uVVyLOYYqO1gwjx0QVzG5UsgTO9PVJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772323872; c=relaxed/simple;
	bh=h9MBR97bnAiGD6kVuMevIQzX0UqaOSo7CTZId4iOmkM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f5ZOPxidemyWNUE6fIzADpoZLHGz16IlXcWFk74JAQ/q5iB4xPnRG96UDVl1MGdyEM/IDFk0BahCOwQ9Isc/m/PHkxbUL0BJ1nErjA6qDXqWcPpG5ZIsXqAGLU6dnJsd6gpuFp4mnms9HKa6y8Gw+gGCRiFwVCL2Z8WjKFvVASc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=agfGLPy9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="agfGLPy9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772323868; x=1803859868;
  h=date:from:to:cc:subject:message-id;
  bh=h9MBR97bnAiGD6kVuMevIQzX0UqaOSo7CTZId4iOmkM=;
  b=agfGLPy95xcWIPHvMRGy9isJC9+KHxayEl3daL2mbw1S4GwMnsimJ7ZD
   5zntHkEqVLWH53aJiLwKvEIf9THltNuQUe49yp1LgwDHbimjmuGwMKQNs
   EnNhEZRjVrvZ58pecFVmEVzYg+mjxOYTJ/0vy1Ql5K4nH6w3VEg01VQ7d
   jtYVKtaiQy2XVfvux9mOkoCq66i3479S+/ny+SJB3ULBfT9dyniAvDvqc
   votjue8NEyF3I5Ljqs1ncrMXDiKtCcECBeLTMc9mbvjqDMSqlZ/lwuzE+
   MT3IToZBwSEUXa9QiH9BMwI6czGJXTN1lp9QYI/7CK5fRaAA0q7QgilI3
   Q==;
X-CSE-ConnectionGUID: FMcXqErPQk6rzTDNrQbhew==
X-CSE-MsgGUID: lkJ3rIA/SOyDq23bakQQQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11715"; a="95991615"
X-IronPort-AV: E=Sophos;i="6.21,317,1763452800"; 
   d="scan'208";a="95991615"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 16:11:08 -0800
X-CSE-ConnectionGUID: U16DGQ3XT1WhdmlxRgzU+Q==
X-CSE-MsgGUID: /lCb398wQRqphPp/biqM0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,317,1763452800"; 
   d="scan'208";a="244465087"
Received: from lkp-server01.sh.intel.com (HELO 59784f1c7b2a) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Feb 2026 16:11:05 -0800
Received: from kbuild by 59784f1c7b2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwUOl-000000000Fh-0usA;
	Sun, 01 Mar 2026 00:11:03 +0000
Date: Sun, 01 Mar 2026 08:10:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jiri Kosina <jikos@kernel.org>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: [linux-next:master 2659/2910] mips-linux-ld:
 drivers/hid/hid-lenovo-go-s.o:(.bss.drvdata+0x0): multiple definition of
 `drvdata'; drivers/hid/hid-lenovo-go.o:(.bss.drvdata+0x0): first defined here
Message-ID: <202603010806.LQ9xMMQ3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3fa5e5702a82d259897bd7e209469bc06368bf31
commit: 4325fdab5dbbfd467df6797e018c9dd0e5c3ae75 [2659/2910] HID: hid-lenovo-go-s: Add Lenovo Legion Go S Series HID Driver
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20260301/202603010806.LQ9xMMQ3-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260301/202603010806.LQ9xMMQ3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603010806.LQ9xMMQ3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mips-linux-ld: drivers/hid/hid-lenovo-go-s.o:(.bss.drvdata+0x0): multiple definition of `drvdata'; drivers/hid/hid-lenovo-go.o:(.bss.drvdata+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
