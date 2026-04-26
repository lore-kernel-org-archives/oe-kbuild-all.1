Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E17D2556E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Apr 2026 06:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777185854; cv=none; b=Ro5aNlN85GGYbpvmN4yxQrR1oSohcIYrNlwi08x9zHz9aluhf0OExy5idysf0+f1JiLrcOzFmWshtRPA6zw8XT3Vk/BDFyWbYCVSBWDPnFm/IP0MuFpRCuPQyGAqZ+HvG0CHcMk8oZpl8c+AEF+Cv1ExptRzl7e6v/sQAWmMrV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777185854; c=relaxed/simple;
	bh=B7zExwCoBfKJjVJu58Vzwq7s/hTiCPsoioDuAo1Kexo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fFRE66oUWU29Y4m0vchqvAliqRfHdrWNMxoAvzC4MCV20aNlltMzA9ICKeEsQyNg/9/pa6EP7eD3rmLv3MxTFv/cVpbstVhEduNr/7UtEneQ9i8jmsfLYxW55rHgmQeWa754tRwgrZoC5As79GPc22yln6Odgv0CjKRY7jvM8rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NB8Av0Et; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NB8Av0Et"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777185852; x=1808721852;
  h=date:from:to:cc:subject:message-id;
  bh=B7zExwCoBfKJjVJu58Vzwq7s/hTiCPsoioDuAo1Kexo=;
  b=NB8Av0EtwPx4adQo1raRgcbv+K4225fdHKM7Ppz4lozYzolcEhOR5eTp
   spAp33qXMqyte7acn292pw72vKJwALhyjrzoQqwP2wgalJrpaiqKjcu4A
   lkIfTFj1gQyhOBYxYmLAX4S+YQJYTJA4rP4N0lhnMrED9CfmWZoqRfFYJ
   56LGL5QBb0dC3kpepK8Ke58tP0oHFF0ishzN9R9a5RzCOoytYb9VusVtg
   PasgkpVVEQrWZCabX3buH7eZJFJc/v7Sw7ckG5Fcdy0HeGBFU944O5QIx
   1AZIVUJmu9BuHOxJPOwfzScUedSgRmJhfxKBXHQKXwafLFp/uhMuJCdVs
   w==;
X-CSE-ConnectionGUID: cJooReX1T6yvW6tvJ3Mahw==
X-CSE-MsgGUID: 52MM1sCjTde2W0667AgJag==
X-IronPort-AV: E=McAfee;i="6800,10657,11767"; a="89486921"
X-IronPort-AV: E=Sophos;i="6.23,199,1770624000"; 
   d="scan'208";a="89486921"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2026 23:44:12 -0700
X-CSE-ConnectionGUID: dMX3iww1TQaxVyZn0jq9Ug==
X-CSE-MsgGUID: /ftjbBWrS4iCsy1cumnXGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,199,1770624000"; 
   d="scan'208";a="235126920"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Apr 2026 23:44:10 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGtDr-000000007Yn-3HHo;
	Sun, 26 Apr 2026 06:44:07 +0000
Date: Sun, 26 Apr 2026 14:43:42 +0800
From: kernel test robot <lkp@intel.com>
To: chenmiao <chenmiao.ku@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Stafford Horne <shorne@gmail.com>
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 __set_fixmap+0x84 (section: .text.unlikely) -> map_page.isra.0 (section:
 .init.text)
Message-ID: <202604261438.r8Vd264p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi chenmiao,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   897d54018cc9aa97fd1529ca08a53b429d05a566
commit: 4735037b5d9b0f809c51976c87d737fa2c48fdea openrisc: Add text patching API support
date:   8 months ago
config: openrisc-randconfig-r111-20260426 (https://download.01.org/0day-ci/archive/20260426/202604261438.r8Vd264p-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260426/202604261438.r8Vd264p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4735037b5d9b ("openrisc: Add text patching API support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604261438.r8Vd264p-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: __set_fixmap+0x84 (section: .text.unlikely) -> map_page.isra.0 (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
