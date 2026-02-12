Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0ADD2DE6FF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Feb 2026 22:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770935126; cv=none; b=r3YgGxz0hROxlSNZboRJ5PvqjORxaE+EcKEhSoNncnBrr8AyowvX2eeq7t6ZiZhd2mai8t6GdodDtZAgmEWpnN95UYlzI3qZgVS/Bl0436qcK6fGIi+h3KecavpiCnFMwIv4T7FFtmycmwNQnTHw5tdgQqhmwe6G1CRgqWwI74Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770935126; c=relaxed/simple;
	bh=yFmMH6NvUTMWoLKXjMA21/IvcD7jRuXg8lL8lnkC32A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A3kzW+maXBN2up7/MhfenEeQdLt6CpbGcdE/ek1g3ofy8V2ZmKGPRojZ8S4gF1YIu51WlzIrKp6X2WNJwgOpzXxTnIAapKTgyuTwRrb6/LKLyRiPHoUtEc6+gkWCSCuT6hIi68feGRFQsH/q9orDzK+3X6clgJMUdw3Z3groLBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YSOCgI17; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YSOCgI17"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770935124; x=1802471124;
  h=date:from:to:cc:subject:message-id;
  bh=yFmMH6NvUTMWoLKXjMA21/IvcD7jRuXg8lL8lnkC32A=;
  b=YSOCgI17oMJH/VcnoDj0av88rV5IKxoB1o4HMJJuHbZWghxgQuBaUisQ
   S24Y9oPitgv82dGDDH7hhtE+1MNFoL2Eg4uI/PLRQyEcQBj2ZWUALU+Uu
   WGenkmMGZX5kGr545kGY8/X7TdFb/nOn/lqzo5sZsvtnhUxvoy4UCIbwi
   /touY8aBoD2r+eREMSRelFQj3Faz5rg1YMOj0ObRfVW6f7sZwF74j/k6a
   G45+jVZT0hEYWLqQNcNAeCpGglXCbNqcG0CbWMVQHdBVdsqsPyH2yerSU
   qGJfUw0iDDD8bZAb5/9dw7W8nv2FqEXGIgGD8LcZC1gTozQP/8GA7qtwt
   A==;
X-CSE-ConnectionGUID: ESlmj8fyTPuDO/vwuM4XZA==
X-CSE-MsgGUID: QMfJUVKER36NkkGq+b+UPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="83216153"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="83216153"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 14:25:23 -0800
X-CSE-ConnectionGUID: oOB0sGB+Qia9SgNwCv+SXg==
X-CSE-MsgGUID: sYE2UDa1SAaOmRhgAo2BaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="212577164"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Feb 2026 14:25:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqf7f-00000000toN-3N0E;
	Thu, 12 Feb 2026 22:25:19 +0000
Date: Fri, 13 Feb 2026 06:24:21 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 linux-doc@vger.kernel.org
Subject: [linux-next:master 11762/11841] Warning:
 drivers/video/backlight/cgbc_bl.c:29 This comment starts with '/**', but
 isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
Message-ID: <202602130608.bwks5uv5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   af98e93c5c39e6d0b87b42f0a32dd3066f795718
commit: ce9699c49d159103f86f2be6c37457d50f9cceda [11762/11841] Merge branch 'for-backlight-next' of https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260213/202602130608.bwks5uv5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602130608.bwks5uv5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602130608.bwks5uv5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/video/backlight/cgbc_bl.c:29 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * CGBC backlight driver data

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
