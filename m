Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4BA34D3A9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Aug 2026 01:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788141563; cv=none; b=MHPy/7eQxjCF5pp0S1Xmd8FhqdxcKNSwlkkBURG6lW03KUCiyfhsx54uVNuYH5q5KNXozAWbmKkZ2bakiPZxXtOb2/ATUjuayKSal0efxrKovTK0CfFCBmvReVr8tWKNH7LJeActwFRAaeSg8g6/MvKOw9P5T9SduIbiBhupSmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788141563; c=relaxed/simple;
	bh=iz5WKXU7LIWtK4G/zQvsAu3Bxu1/AwpXSy9EeB8V4Wc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JS3BbXWp5KRDDMCmGtV/GZ5zOVNNILfRiQngZXrx8lvoxxjAAmVQs5v4aHJ9IbVnjwnZSI8nd45bo7U897CfPQF6Grimf1+mThso85aj2bxpR2YG0bkT6xCs+J0yLLcLnON2JiVh7olEXB2s9Ee+JWW3DP08AlkGS/GyAh8H1lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a1DbsVbF; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a1DbsVbF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788141561; x=1819677561;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=iz5WKXU7LIWtK4G/zQvsAu3Bxu1/AwpXSy9EeB8V4Wc=;
  b=a1DbsVbFzxPauF/QOlRqasApqAxDeVAiUD6WvO3Kqkmh10Y1j/XhPKQw
   fYlJ/wgjassCgtZNr4s81tmrjmCpqqoUEOxQV9Fp5M0giFu2d9/vq+9KQ
   ZcgTxMPQIy+UXEbYVO2W15mHvD5SID+A5feTiaQmbuCwWmRTe1dXP0+JJ
   V84tWbRsjxR11+wBbkD2Ia3od1y0gHLP0NToLAyx/fjqhUtsbqP9yNUL7
   Up/s7ykGv0sxQn/GkogNkK/Az/ewf/2RMRZac+LgciGVKkC4AwZ7vvu/O
   dcJLDIOIYxREHQk542vVWasTw0bM54zIXdMHJdNwI6oWgk1fP3RqQ8j0M
   w==;
X-CSE-ConnectionGUID: OfMgXScKTTOxcwC8gU4hZw==
X-CSE-MsgGUID: A8Wp2FChROO2efoPvNEhMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88468144"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88468144"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 18:59:17 -0700
X-CSE-ConnectionGUID: XdtK6d/GQ560260uY/nC8A==
X-CSE-MsgGUID: PteCERmHTumXO3lsgqkHKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="265425603"
Received: from igk-lkp-server01.igk.intel.com (HELO 32268bdb9915) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 30 Aug 2026 18:59:15 -0700
Received: from kbuild by 32268bdb9915 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0rIn-000000000Lv-35oO;
	Mon, 31 Aug 2026 01:59:13 +0000
Date: Mon, 31 Aug 2026 03:59:08 +0200
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 84/131] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202608310351.HiPBnnpu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   4132307830800b020a6d29d27cb3fec3cb5fbb90
commit: e09ec7b1b83fca96f573278d1ec7f2abb3401bee [84/131] Add a ZTE RTC dri=
ver
reproduce: (https://download.01.org/0day-ci/archive/20260831/202608310351.H=
iPBnnpu-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#55: FILE: drivers/rtc/rtc-zx23.c:6:
+ * Copyright 2026 Stefan D=C3=B6singer
+*/

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
