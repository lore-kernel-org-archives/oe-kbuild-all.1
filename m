Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894DB31E826
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 May 2026 12:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778329529; cv=none; b=YO3X/PXLDSsIHT4g14rsJUFq7Z0GbWwZR9tCaksd/zKRTXQvCY+ucszOHM3v3RBUzf8Dl9KCkFj8mLqIb/TlYdmMmPxreEhRbYIWq7W0qC8ODxi5vtaN6XAMA/Rwxb1iz4R9w7yy3zn2Pc9XGsDQ3QonwyggjAAG2ZR2+lxonYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778329529; c=relaxed/simple;
	bh=mlOTbeu8FhnwgaVgYB5TbHI1R82+biqF63F195gEnp8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rpfxMFfzcGLXJoYsb5J5nHtj77aYdPtZeo6aOVBj7Vqp/igJWpC5YCsWPdZTowmYNcP3CPBPkYAyRHW+lxhvBOMdtfDIrgszxCwR85wTHaFBWzy2V0qJhKSZvyJbhCax2XOxjDJFt4X+IcgrqHJcFaGxw2XYecG8YNEip5x+Puk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ykh1k0AM; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ykh1k0AM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778329527; x=1809865527;
  h=date:from:to:cc:subject:message-id;
  bh=mlOTbeu8FhnwgaVgYB5TbHI1R82+biqF63F195gEnp8=;
  b=Ykh1k0AM+uMjLAlqzKZ/BNX2UJjz54NZw3HvPeouOIXbncqVkX+4g4DM
   nfzBIgZxKfr9IAtrQnEBUYL+WpoBh7pvMXo/uNkee+3+qZFI8rgjWR34J
   PNGpMPdIy8W2ohnChrSOfxLIrs/hANtAHHNdyw/J1IaC3HdHMfD0cHsK/
   9090sjOg1lqZEXv4VPie/IT90Et1oUwgcXk/StZyz8hdlXIgm1zOnXoHY
   kZOGMObmvpnka8QdFAfyBhEYIP4CGr6BPuV7Y0F3DifTjI/aR6T2DD/kR
   1IRFILq2estqVyl6bbcTdesukUBpj8sM1MnAbSjhQTi9qyYBLfEmRuM63
   g==;
X-CSE-ConnectionGUID: k+a7gl1ZSiKETbz5a1nrcQ==
X-CSE-MsgGUID: qvhIb3fKSECgv8xHzPOkOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="89877428"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="89877428"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 05:25:27 -0700
X-CSE-ConnectionGUID: xo0TRpqmTGKT+sQFEA/yZA==
X-CSE-MsgGUID: ST9Hmy5qS1Wzq98GmFFiBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="260467717"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 09 May 2026 05:25:26 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLgkF-000000007Rd-3miL;
	Sat, 09 May 2026 12:25:23 +0000
Date: Sat, 09 May 2026 14:25:15 +0200
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 105/178] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202605091402.OSGkauiq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   4b1d0b029fb1b7f93e72be2d9553a358b8054d7c
commit: 08b82ac83277591161b566d1b1174686feaf2bbf [105/178] drm: apple: Override drm_vblank's page flip event handling [HACK]
reproduce: (https://download.01.org/0day-ci/archive/20260509/202605091402.OSGkauiq-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#69: FILE: drivers/gpu/drm/apple/dcp.c:66:
+	/*
+		* e->event is a user space structure, with hardcoded unsigned

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
