Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781F7273D76
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 01:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775179172; cv=none; b=AfO8c3ND2nLEXK3KLhleiWER9Okg+0IIDaYS/cUZfNfnj3ouyvzpzrF+S4tNZGVWFz03v6LctxyJMZC7NXFNV+mDosIRT5Z5Jm1771xVCpwR53WAFK7cnKniQJoE6YpIGJOTDAXh+JMdJahWUBOOC8UbnzKj3Ivpwrf2dsvKChk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775179172; c=relaxed/simple;
	bh=MrZsIufVinlkrraYwhg+mdMWgCoI4SufEn0vqNMQNXM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YkPyrE0CoT8pChI2lA8vZ3URKKB8XkAyLWIGc8c3FA6SRa3GvePr7wbIGNlI5CVGBUInKOeUfObbPuHkzOinPJ3CP9pzmAODD2BAQuvXVP6B8oCAlAC87Z7Bf16bxn01xf3C7Tn3IdzRpw2y9wO6XayYPS5Zlc0zmxG+eivKczo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZDBGv84v; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZDBGv84v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775179170; x=1806715170;
  h=date:from:to:cc:subject:message-id;
  bh=MrZsIufVinlkrraYwhg+mdMWgCoI4SufEn0vqNMQNXM=;
  b=ZDBGv84v9TAJy5U/hysD8oK0Dzfp6ATiTJ0w12jFfzZUwms8wAiiZunN
   ssI9Rlp6YxORIvN2orhyua0ag81Hrc/V1bU2DdBKi4omacgXRwPzTOtll
   uwote7U28r/xapCcNE7Lt76qXm2MffaADgkhXk7IhIP6Db9dBNhTdmvgJ
   Gh52ecQ8Va0c1F7EcYeuQozhVP96h3aJeIVPoJRyqt9kBI1F9kQXZca/e
   cqLuW8nn+oqP2NReoR0mLeLQinM+uKAU7hnmPB+oPQsXXvvCb6OX28pWt
   7RZy/ZLx0DOAoh2jQNXS1nFszV9Yujnf5SCnTs1fW0164yDQEWCLoFmXf
   w==;
X-CSE-ConnectionGUID: UO68988qSj2Z0OZVkyONLA==
X-CSE-MsgGUID: OR1fbigOTRqAL2jwpNqx0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="87638815"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="87638815"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 18:19:30 -0700
X-CSE-ConnectionGUID: gfPSdvfGTgut5Pq5YaS/RQ==
X-CSE-MsgGUID: t4MSEn/BRLq3P85tPEMG7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="257600946"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 02 Apr 2026 18:19:28 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8TC1-000000009CP-3sum;
	Fri, 03 Apr 2026 01:19:25 +0000
Date: Fri, 03 Apr 2026 03:18:47 +0200
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, fuse-devel@lists.sourceforge.net,
 linux-doc@vger.kernel.org
Subject: [mszeredi-fuse:for-next 35/53] Warning: fs/fuse/dev.c:524
 This comment starts with '/**', but isn't a kernel-doc comment. Refer to
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202604030310.s2J0eCKb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git for-next
head:   e0d07024fdb2588cd6afcc1b1f1e4bc62ba2c886
commit: ca520dba20d4472694a1895fb4de513be8dab3eb [35/53] fuse: don't access transport layer structs directly from the fs layer
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260403/202604030310.s2J0eCKb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604030310.s2J0eCKb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604030310.s2J0eCKb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/fuse/dev.c:524 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Checks if @fc matches the one installed in @fud

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
