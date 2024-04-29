Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED5F5F861
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 15:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714405367; cv=none; b=YRQWy8vRrewGZbd4I6+JtNUNWyZ5Uddr/btrDef+wNV8iP/8wGvdFkbPLHKs/rxxrddLVHA3P+C55O2cvuwjLKrNKDLy9EDCQidgFf5wStxbsZPRbyHwpfySbzAWmo5sQrrttK8c/u584mlECG9PgYUduXb7mZp3ynpIs/apFCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714405367; c=relaxed/simple;
	bh=6rHq6wbJaHYYcu1qBvRj0T+v7ClScTVT66YQKhFVKgY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dvGF0LPs7zHb7FD26rqoINSJItSjHhH870AXyR8KT/Brmr+oeoGveVNibCbZKJPGtY/2D9dF5fMp5yFeCGTW3GWoJ4X3/3u8fKTe4rEdL/bQWFaYBhDezy6s1thcRqT1ftQsK2c6mZBp4px98qXFPuHR6FCZwCOygsu3gWRTdnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CgOZqRxY; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CgOZqRxY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714405366; x=1745941366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6rHq6wbJaHYYcu1qBvRj0T+v7ClScTVT66YQKhFVKgY=;
  b=CgOZqRxYUPwWFVJsch3CLpf+XRWv264oRwx/DdhaqdOgShWYxQhbUtLu
   rUNCGDKj3cGvLFCIC1nkqf45YtXMxyS3R9pqONe99oD8ASwaaWNGtssGz
   XLBficvNkm33tMAn/a+g3xWueFykRnkGbbQY47ESNVluo+4TRUxr+MYQ+
   qdtt4mrrWXugB0QGTV4UPIXUk920gttPaY1X95ek9XMBvI66QprN1jXLJ
   s+gUaPMeC57qsnCztIIXKxNidwlIhlX2FB7Z0kEw5UwFatxcNY5dsapG6
   ezXtc3jItg97uFhk0oyd2YtbP+q8wy0U3GFjDe0YUBBOCRJ9jwWyzpFAe
   w==;
X-CSE-ConnectionGUID: JmD2n0+6RVqp2L1NhGH9Sg==
X-CSE-MsgGUID: AHrbFwZ7QWCSCCSRssEzpw==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9905325"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9905325"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 08:42:45 -0700
X-CSE-ConnectionGUID: yIQflIXfQYakTG45xD23iw==
X-CSE-MsgGUID: KnD3n+wAS4OIAE1Mpsr+TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26547738"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Apr 2024 08:42:44 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1T9N-0007GZ-0r;
	Mon, 29 Apr 2024 15:42:41 +0000
Date: Mon, 29 Apr 2024 23:42:39 +0800
From: kernel test robot <lkp@intel.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Chintan Vankar <c-vankar@ti.com>,
	MD Danish Anwar <danishanwar@ti.com>
Subject: [linux-next:master 7661/9390] make[4]: *** No rule to make target
 'arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtb', needed by
 'arch/arm64/boot/dts/ti/dtbs-list'.
Message-ID: <202404292317.uK7gvrSc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b0a2c79c6f3590b74742cbbc76687014d47972d8
commit: 385afb85589e354853234ed68a0600276dcd77ad [7661/9390] arm64: dts: ti: k3-j784s4: Add overlay for dual port USXGMII mode
config: arm64-randconfig-r131-20230824 (https://download.01.org/0day-ci/archive/20240429/202404292317.uK7gvrSc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404292317.uK7gvrSc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404292317.uK7gvrSc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtb', needed by 'arch/arm64/boot/dts/ti/dtbs-list'.
   make[4]: Target 'arch/arm64/boot/dts/ti/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
