Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CB530AAD8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Sep 2026 23:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789168323; cv=none; b=H6wz+5h6/PyZ3EvjJ3GL6fF3XM7PtR83C0VLxcz1Gu+JRBaABrgNnZjkXsjJlb5wZ2z8sMMOyFwEs8MU2a3Gzh+Fi6A6Nhe3c9ta1eiQDfUTidxpkqeRU1Kl4bSnnBWpFu82HPVq6OUO21pcGioIuvqNoPko9LeTN/OLzcX4Y1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789168323; c=relaxed/simple;
	bh=UdUP/yxGozXiMnACY1CxihVw/vBuPQdm1ETiBLcwdrg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n2YaRJd/4SCFlu6f9Zj01KFsLi4MUiBf2SAAQl2Ci+2g1Wi9PjtfATtkYzkiZ5u9OlnnCFztdAoGw8k359LlyY2EhFJdb33eSQsV41bWHeOPcizcS67do9XFQMGypBR9m51d6LLuSsuR/1maHtcZ1QV6rmMSqlabBW1hkzBhHCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kNazXgj0; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kNazXgj0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789168321; x=1820704321;
  h=date:from:to:cc:subject:message-id;
  bh=UdUP/yxGozXiMnACY1CxihVw/vBuPQdm1ETiBLcwdrg=;
  b=kNazXgj0iBRw2CW1RWA31dnGMtBUOgVfiBJ4PnO48a2LUDhrIeKtwAun
   nfBSsp30ap2dBBE0pRnrrQtZFLPz/Z7WsIUOaSFFktxPzxGobKU2JTPEK
   kcZAZu6LxPcL6RC11Qv2uz0o59W6WH/OaFHm4Qc//AKjLhRYEk+q8byUe
   Ugpi41GmmNbXEVCJ4/3iOXa/fJ1rxmZqSAQXi8ldQb3xVYteUPla3ha0P
   DKLxCsgZQuXF1XNBcxrTEuK7T6NsFBcvnRR/QbSsFQEWH2OqELqd1Ey1w
   aHM42P1Bv7milkWAXKMw2gVTA5z58+Ypl5t7wlr5i3gym6fGz7CzqKHbu
   A==;
X-CSE-ConnectionGUID: 2//+lIOhSAu0puosy12ekg==
X-CSE-MsgGUID: /Stmv/k/TpOvWodw1M9Myg==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="100296964"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="100296964"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 16:12:01 -0700
X-CSE-ConnectionGUID: 4tl5WBquRbKGes5anPmpAA==
X-CSE-MsgGUID: zQkF9HSWTDK8yFm4q46hfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="268768319"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 11 Sep 2026 16:11:58 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5APM-000000002Hl-1ioV;
	Fri, 11 Sep 2026 23:11:50 +0000
Date: Sat, 12 Sep 2026 07:11:38 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Moore <paul@paul-moore.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 1893/5916] .tmp_gl_selinuxfs.o:undefined
 reference to `__udivdi3'
Message-ID: <202609120612.r9YCYjLK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Paul,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c68a982815dcce5464e3bf2a31ac94f5146c04ca
commit: fc68b6a45f1668bbe03264343115d1c97013c7ea [1893/5916] selinux: convert selinuxfs inode numbers from unsigned long to u64
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20260912/202609120612.r9YCYjLK-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609120612.r9YCYjLK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609120612.r9YCYjLK-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: security/selinux/selinuxfs.o: in function `sel_read_class':
>> .tmp_gl_selinuxfs.o:(.text+0x910): undefined reference to `__udivdi3'
   microblaze-linux-ld: security/selinux/selinuxfs.o: in function `sel_read_perm':
>> .tmp_gl_selinuxfs.o:(.text+0x9d0): undefined reference to `__umoddi3'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
