Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A2746A5F2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Oct 2026 07:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048881; cv=none; b=rY/kpJ3pE4zaM/B5ZlViukLjB449kQNKkUOoYGPuhKqW5yNUvcRd7cGH7rry9Ge2tXBNkgGwbSRklI+8fD53o7AJm/NS4VF0xSDgfUXPaSq892bJ7yOIqwn+BIZFIRkQfbxBvRcZbjGMg65IrNdIKwTzrHYPal4br3Y+PoKbY/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048881; c=relaxed/simple;
	bh=WJtnxyeS5TZimFhYOj/c2P63Op+I+CKtYVBQeG2ITiY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SJ4Y0n65mL2KC+sZTFrhmou2Px229FS9v6f4UABJPAGygEvKU5nn91M0RKTUFfBuoBfDkQMobJEWz8gB6RgsMNNwM/OP4YeJNDO1PV0rlSo36Co7kynwV/Z95bLu2Yu+M93FigbuUpkCEJnWNhWBitjP4K6wvSl2aE1+WhH/bdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=baBLiRld; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="baBLiRld"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792048872; x=1823584872;
  h=date:from:to:cc:subject:message-id;
  bh=WJtnxyeS5TZimFhYOj/c2P63Op+I+CKtYVBQeG2ITiY=;
  b=baBLiRldWzKKB8D38Wto8z+BNcWaM2oHgmHuMfSj/dQd+mtH9fGZluUc
   Hdca7ZxaI3F73xY9L9/wV029+Uaw0K3TtJuW1DsCKEPe8M+NEw9l/bUru
   4WdkvAqFX4pCtlFBKXktoVLVvwpmIprXUMXwoX5VC9Y53bbPR5ojK6X53
   qf5bzw/CMpqoelFiso7ETvMU5su8GiUpRQazq0CSN77E3MSSzl1CcvBVN
   tF7CbG6MYMp6HMFDD+tKth/kn6nptVshiL3viYaku29MQj6h6ktoy+cBj
   4uMzLX+qKwSATKC9qKQDBsL3ZhDAyuC+VVoIoruU+Flu66OTl/IwVoB14
   g==;
X-CSE-ConnectionGUID: stE7b5MZSxOaHWSfeKfUiQ==
X-CSE-MsgGUID: Hqw71JrkSLOsNL6gD+KO2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="841254"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="841254"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 00:21:04 -0700
X-CSE-ConnectionGUID: //sFBegiSZCfi7xQvoGmMQ==
X-CSE-MsgGUID: saTMv0M8RRaPw2nxGoEQCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1708856"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Oct 2026 00:21:02 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHFls-00000000G0j-1D7j;
	Thu, 15 Oct 2026 07:21:00 +0000
Date: Thu, 15 Oct 2026 15:20:14 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:spinpark-will 36/40] WARNING: modpost: vmlinux:
 section mismatch in reference: arch_cpu_preserved_adopt+0x54 (section:
 .text.cpu_preserved) -> trace_hardirqs_off (section: .text)
Message-ID: <202610151437.zH9KpJKA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux spinpark-will
head:   b105e7721006184fc170416343bb6676af249265
commit: 8967e35cc33f19e724baea9ffbc408be238f370c [36/40] arm64: liveupdate: reclaim preserved CPUs without firmware
config: arm64-randconfig-1001-20261013 (https://download.01.org/0day-ci/archive/20261015/202610151437.zH9KpJKA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610151437.zH9KpJKA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610151437.zH9KpJKA-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: arch_cpu_preserved_adopt+0x54 (section: .text.cpu_preserved) -> trace_hardirqs_off (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: arch_cpu_preserved_park_init+0x4c (section: .text.cpu_preserved) -> trace_hardirqs_off (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: arch_cpu_preserved_park_finish+0x38 (section: .text.cpu_preserved) -> trace_hardirqs_off (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cpu_preserved_stack_va+0x58 (section: .text.cpu_preserved) -> memstart_addr (section: .data..ro_after_init)
WARNING: modpost: vmlinux: section mismatch in reference: cpu_preserved_stack_va+0x60 (section: .text.cpu_preserved) -> memstart_addr (section: .data..ro_after_init)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
