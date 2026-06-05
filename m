Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120C93B0AFE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jun 2026 06:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780639279; cv=none; b=ah8rGYDO+MBW8BAn7JZkyFB1lokvyV0rm+I2qUWFCjXDYKqmqCQt+NjwaYUbiEtwT1jeoL4mZRj7B0lapbeAfnIZL80aCVSUKVsF3uFyNWYS36PDwMdYKNr2XAU6Hn8yEriyFj/6B/NjOFgRHHeBusSUi0iuDvfoPZdY9iyEgvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780639279; c=relaxed/simple;
	bh=pwf0wZycWIB74FEdk6ZWRdAr2lkOkJJ4eHWOmuTLt90=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fCUgmSd5OM+vsse7kuhYQjCXFmHfAS5hDSTsgiKZk7CCiqcJxUSg9q/MFCukCPlbcWeo54ENtNOtHkwnP2wAYK5fu45OhHOR6oco2ol4GDYHQc3SV8PjjEnULr3tKjf8h1i2eUkmjQ7RDaLvBaoIhB5mxJ6UVwL4SeTYycyRXU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jeCFhNRL; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jeCFhNRL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780639278; x=1812175278;
  h=date:from:to:cc:subject:message-id;
  bh=pwf0wZycWIB74FEdk6ZWRdAr2lkOkJJ4eHWOmuTLt90=;
  b=jeCFhNRLPs3CZvlmDAiM6w1oqIqj8/ujK5y5Rh4ldwsOYGwRZ9xWL6Fd
   VaPzIitpF2gKml/Fujw5xYRbw/MhLBvp0m/kht98Z5bW9aG+Fmg5CtiEC
   PkBHZDuJFkrLOVMII3He96pS9eEs6gBBQ4gWSEVlB81uCNf/+ApyMwXRi
   1Cd7kH3EJTB9v4iLXrpCKw76u1CwE2TCfsXcNEqTvW2lzALlqkkVuwNI2
   KtGuebpNW3nHTIYOPcGUAYaSawCitsKmJG9Jn768QnL2OGfM4iD/TnJDK
   uog/9lW8YXlx199XUzQUSdt1SmwVkUKEXlPqCGSTucSUmdBDXMTABKXaK
   g==;
X-CSE-ConnectionGUID: 2TDJSZxrQ8uxyrfd5TywhQ==
X-CSE-MsgGUID: QeodKjifRYCvdmPKArK1og==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="80508285"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="80508285"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 23:01:18 -0700
X-CSE-ConnectionGUID: FH3mjjDCQb6yF94GuzbviA==
X-CSE-MsgGUID: 3X7qmvnbQ8qRqa0ddK/Tuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="238401965"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Jun 2026 23:01:16 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVNcH-00000000Faw-293F;
	Fri, 05 Jun 2026 06:01:13 +0000
Date: Fri, 05 Jun 2026 14:00:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Subject: [mst-vhost:balloon 12/38] page_alloc.c:undefined reference
 to `folio_zero_user'
Message-ID: <202606051337.Pac8xsTQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Michael,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git balloon
head:   b145636d693114d343a0a47a4400f5b31e211fec
commit: c4af912c65bc897b31264a3403f18b0cf52fa10c [12/38] mm: use folio_zero_user for user pages in post_alloc_hook
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20260605/202606051337.Pac8xsTQ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606051337.Pac8xsTQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606051337.Pac8xsTQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: mm/page_alloc.o: in function `post_alloc_hook':
>> page_alloc.c:(.text+0x3b42): undefined reference to `folio_zero_user'
   m68k-linux-ld: mm/page_alloc.o: in function `get_page_from_freelist':
   page_alloc.c:(.text+0x546a): undefined reference to `folio_zero_user'
>> m68k-linux-ld: page_alloc.c:(.text+0x550c): undefined reference to `folio_zero_user'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
