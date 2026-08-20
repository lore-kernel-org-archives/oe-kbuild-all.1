Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C4B2E8897
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Aug 2026 06:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787207412; cv=none; b=p8Gg0hjJj+fY9Z13LUqL/yoWd6CJvws99Mv18BXBd/cyAbohPoeVcyusySrHqGjvyY4MR8GY8WW58S31MDIQontqfNl6fH0NHYsvHXUHlco8ZajKnr/JGnaGEC5mspR5cu/0Xa9xu/9lNjuDALYgPhP7TCXvjmYmfB5UvmGfjX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787207412; c=relaxed/simple;
	bh=2qtQZJIF28P1MM9HuJJqlqnsQQYXquPDqqML2akVjXM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g5LYwY/f/MiSePuuGVfFvfyoxjMQl5jWmtAXvql7/h6lA6AYx2EKAg8+U0deSw2eNoadHq5NTfS+/iRa1zoh9JzVW/GBP+z35iSJthin1bcbkkzYDzIvnTBBYYPkQZaQ9fVXVskKwD2aW1hsLzgna6/bG0cdIRmUPxqNixBmAOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M9khEMyF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M9khEMyF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787207412; x=1818743412;
  h=date:from:to:cc:subject:message-id;
  bh=2qtQZJIF28P1MM9HuJJqlqnsQQYXquPDqqML2akVjXM=;
  b=M9khEMyFKZ2XB0IYAT3ZnpnotTl66Az0xsdJ2A/KdtlYGl93PJOXouMK
   dLtP9qYJuIgSno9lBN6D9pkIce2Oo4muXrr+eCY9qNbiMf5UvXzp1+B1Q
   Q3369SItPG76yHQikXr5h//pcEs56uG97uhSdh0/WpADgff/QBKIC36Ri
   VIcEjmyDUvzH5GWKsZc0anXmafY7+JdRSA89kNVG2A9IF4qINDP29igVK
   rvwHbg8bYEPYPXudiJvEMJwJ/ijGq/usdKw6gHkDzOM9Y/Cfo1GunRhGQ
   pU5fKswbWKIErkd1vAm1JsrTW9tgXJ76pyp1Fht6Rz+FOI94NllG3t+1g
   w==;
X-CSE-ConnectionGUID: RFmlV56wQwmzpMzOZQ1kiA==
X-CSE-MsgGUID: VffIdgH8RtSwWsrDjyDVpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="91607397"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="91607397"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 23:30:11 -0700
X-CSE-ConnectionGUID: l7jEvIWKQ9+AS3JlopCAyg==
X-CSE-MsgGUID: VD5OgJSHSB+TPqs/s5vvhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="290677159"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Aug 2026 23:30:09 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwwHu-00000000i6D-46vh;
	Thu, 20 Aug 2026 06:30:06 +0000
Date: Thu, 20 Aug 2026 14:29:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 2/34] .clangd: warning: ignored by one of
 the .gitignore files
Message-ID: <202608201428.Pcj364D3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   4be0d2e24c4413287ddbb60a1da7d8e47e8b59ae
commit: cad1b90ca96bbe440c02068f51aef48ee2b8555a [2/34] clangd
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20260820/202608201428.Pcj364D3-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260820/202608201428.Pcj364D3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608201428.Pcj364D3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> .clangd: warning: ignored by one of the .gitignore files
   Documentation/.renames.txt: warning: ignored by one of the .gitignore files

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
