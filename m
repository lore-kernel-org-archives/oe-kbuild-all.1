Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242BB3176F0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Aug 2025 06:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755325193; cv=none; b=PgfEVEyvZ3oDvPvaFodzfbdhhvB6Z0LBaTpuCU+y0jSkEngFsAxYJ5K5o9shHKtxLn2w2AwRMII1KCyHe31N9F0OwOrBFyy4gSrtFo4J4KW0viqg9CHmS72wiKieDUS1a/YAofGIVa0EPq5GMFXmoGyYwyXdyui6IHYOJDns1vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755325193; c=relaxed/simple;
	bh=XAImJRbLuDCZBLdVKc7PTLA/GoDmdvD0v1Jy4ERuqt8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ahySTkK423wsIhxS17/63uaYrnOZ/JShSDLVvjwYGchJdhwRRWq7YPrOmSihDYyEHzxo286SKbbUP4LB8CMaoGdMzBZt4Vudak/0XNvJgwfBkBXwwrEhDkb9UAP3B9ncuSNwrd3gfj98QUROS3CFSWYpzX9KCiIVXzyeFYhBmvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V7wl8tlN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V7wl8tlN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755325192; x=1786861192;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XAImJRbLuDCZBLdVKc7PTLA/GoDmdvD0v1Jy4ERuqt8=;
  b=V7wl8tlNm0wuWOsRKSQ1aL5LMpUVxku4pIqpQ42stAsO8HlMLwsCWMun
   /SfRXg0bfqJOdcCVTIvlCokE0uNrS4ofUw0XKAONlazugnRHWRsKqr8KD
   iMgstikEmAqaZoCoSQEXoJXEgNRt+/AfsIJ5aCCNoBIYu009+Z6Gk7rJj
   4tKhK2aTJs+cBbqAIsRJZE1na7JSN1htqDb1mmf2s26dBGbm4q3s9utlh
   gjiB7RwQAH/Q79pfuxXiqdEUF69TDd7Z9PxTre1ZOfHKpYuv5ur96ocyv
   5eDualCJ/9wbw6zP1Ndyg/B2d/oEO0biWu0LDulp3RXvRMKrKGh/nNl78
   Q==;
X-CSE-ConnectionGUID: 59rBJlmeTT2e+RqduqsT5g==
X-CSE-MsgGUID: QwCxmlvMQPGLz3JRu+x5sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="68237644"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="68237644"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 23:19:51 -0700
X-CSE-ConnectionGUID: UK6rxyrpTvmix/YKQ7n8tQ==
X-CSE-MsgGUID: lKNL3a1cSaC/rrvM3391ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="204336557"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 15 Aug 2025 23:19:51 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unAGZ-000CdY-2a;
	Sat, 16 Aug 2025 06:19:47 +0000
Date: Sat, 16 Aug 2025 14:18:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>
Subject: [linux-next:master 1828/2770] ld:
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.o:undefined reference to
 `stmmac_simple_pm_ops'
Message-ID: <202508161406.RwQuZBkA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1357b2649c026b51353c84ddd32bc963e8999603
commit: 062b428017332adf8cee09612db2ae0495b4eb4e [1828/2770] net: stmmac: intel: convert to suspend()/resume() methods
config: x86_64-randconfig-006-20250712 (https://download.01.org/0day-ci/archive/20250816/202508161406.RwQuZBkA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508161406.RwQuZBkA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508161406.RwQuZBkA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: drivers/net/ethernet/stmicro/stmmac/dwmac-intel.o:(.data+0x320): undefined reference to `stmmac_simple_pm_ops'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
