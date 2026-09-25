Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525EA4078C7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 21:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790371598; cv=none; b=Zvje+FbVwLT4oFWiILCqIeoDj7ZcV8JpJC6A8hW5NuM/J6U6zL6xmNeU1ViekQuHZ8y3xKC/n6ThTlxOcYcVj5WFkkyilHuoNP6K/UxF3etFPHXM84H8qry1be6Qg1WW6fVWYpUTtSkAvuZWlolUqi7nwnBKfgfMl5YezMljKEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790371598; c=relaxed/simple;
	bh=NybjhqcBb3PgbU0+a0pb2ji7URsyLfEhascU6JbA3sc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CqHFU526yAxR3IgwjOf2XKLSuPNaxSUDDJ4w+FhREzvNyBxq2dUwYr/3WVB3AmtKgyHks2GaqAgrqmkICTidlIZ1el5SORZL8hBfpKuBuuE4TGV4F2aYpXs/S3YY5h52AKaakG8/8xYmXfV9dvZ/E+B0pVIfWMATKRL0W1JaHWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UkxLooK9; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UkxLooK9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790371596; x=1821907596;
  h=date:from:to:cc:subject:message-id;
  bh=NybjhqcBb3PgbU0+a0pb2ji7URsyLfEhascU6JbA3sc=;
  b=UkxLooK9WsCD4sPMGisZg0MJfxHRPgQT33bIpDqxmDV9+r40oJV6lRN3
   gZ96U9ShZ/MKc5kbIPPcAUjmTiGDvJJuOZuzZIp7uRZvV+x4F1wZbCgm5
   kHvI8iU1pNyQ486tkyguuIPN0G0RTG+lv8efE/ddSpM86dO6epPzt94Ds
   B3Ab4sryL+r76iJm15Oychq2jXjLJhJgS/T6rplJVq/L1BGClSdJ7qXvW
   rN3EECWHnLKQztMfmOsDWsiubNFVjbFNHWmne21GytNIhbfxshOGfBozJ
   YS7R072ZVNXWHlPOK7GzBf/fjj1ar6j3z7JCIBBfHLQXPMaNGTfjRfBeh
   A==;
X-CSE-ConnectionGUID: Efi9myLfTyiY/NH97W9XlA==
X-CSE-MsgGUID: 1uAJ4LM6SPWuhXAWyh8/WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="93658237"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="93658237"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 14:26:35 -0700
X-CSE-ConnectionGUID: c7FZGBC7QUaQcGEVdoHI8g==
X-CSE-MsgGUID: rKHG5rw5SF2WofXr46gxpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="273654434"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 25 Sep 2026 14:26:34 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xADRA-000000000uA-2IfF;
	Fri, 25 Sep 2026 21:26:32 +0000
Date: Fri, 25 Sep 2026 23:25:40 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-main 214/214] Warning:
 drivers/net/phy/mxl-gpy.c:588 This comment starts with '/**', but isn't a
 kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
Message-ID: <202609252318.nLQdRgZR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-main
head:   27e8d41a42f73cb2b271df0e897e25224889f6d0
commit: de02265a2154e5f9a30e8162a283b6ee65ab5214 [214/214] net: ethtool: report PHY firmware version in PHY_GET
config: s390-randconfig-2000-20260925 (https://download.01.org/0day-ci/archive/20260925/202609252318.nLQdRgZR-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609252318.nLQdRgZR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609252318.nLQdRgZR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/phy/mxl-gpy.c:588 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * in some cases the GPY211 will link up but not RX packets

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
