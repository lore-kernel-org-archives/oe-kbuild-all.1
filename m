Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4233D33CEB5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 20:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766433867; cv=none; b=Chc4EGudGV1xDwN9UX8/PcZh8y8nIhLchQBDXqCOvDQSIhoeulOkKUgrfiPBdgVJ3AvpFvF+3lmeOK944iFXX8e9TvqJnWauR+uVd5efLa/FWbSwRgU0chMISO9wwkJg7iUZTcwWmGxqCR+KiAy5KHu5iT9FU0F4VkC5OKh2b5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766433867; c=relaxed/simple;
	bh=EzzN5J05CdSsPNtN0eHvoVAMfh931ECpKEn3Ew2y/+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K/Dk7r3oCp+nWqh+Ut+kLxRaNDCU5FLtCYeRif2XqCZZRdF3Odv0GXn6TlRYEtHYixtoKkyY5Smp4NUvUKJ6YWDNvSFtzhRFk8q/eT9IqL0kaerK3boj81GV5JnOZDOYSm92MHvt13Mz6D7akfWgJwE7Z28dP/ddKnEjkKdEBJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GzcYyU0r; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GzcYyU0r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766433866; x=1797969866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EzzN5J05CdSsPNtN0eHvoVAMfh931ECpKEn3Ew2y/+U=;
  b=GzcYyU0r3tG48N6+2WTc0Qq7SHaoROIY/vcxhXMNzzl30qMjoW2X6/CU
   AWxsmG4j3d1jUqbXMAQQJcvmHMOYXv5qGepibYP2Mrx4QFrMMCYbT5SPs
   ErumOa+YvIr4CAYPdKUkdRPj9UamjJ4LDweWotfs+paxURAAmqQEG7gYq
   rDHm/yCIr78q21c1CsPBvBLyKOCukcn+J/YSDB/oKAwR8tMRlWcjmJrDE
   YD+DUCaWu8ycL5I8RCywMkEZM4z58CQp+Lkb+YtuJg++5YkQR9oMzRwrx
   AcUKf68cUusxorUMQhU6DH5cF/CJCzmeniUXIOIc8zSgw3EkJL+bWoTK9
   g==;
X-CSE-ConnectionGUID: 0T4APeVWST2P0wsP7oRasA==
X-CSE-MsgGUID: LyxZvbA1R0yQcvxrxlL6mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68333886"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="68333886"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 12:04:26 -0800
X-CSE-ConnectionGUID: ccMR6aEFR4CAUN5qcvBtJA==
X-CSE-MsgGUID: mk1C9NRXTe2qF5HHPloNVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="204656240"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 22 Dec 2025 12:04:25 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXm8k-000000005bM-0tjP;
	Mon, 22 Dec 2025 20:04:22 +0000
Date: Mon, 22 Dec 2025 21:03:24 +0100
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [sashal:spec 67/131] htmldocs: Documentation/filesystems/splice:11:
 ./fs/splice.c:1759: WARNING: Block quote ends without a blank line;
 unexpected unindent. [docutils]
Message-ID: <202512222156.TVN3h6Be-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git spec
head:   d34c22a9d280338fc8a0f12fd5577e62f345503e
commit: bed3e754e9e820f768b4de8fd6924e69291f1314 [67/131] kernel/api: add API specification for sys_vmsplice
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512222156.TVN3h6Be-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512222156.TVN3h6Be-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/filesystems/splice:11: ./fs/splice.c:1664: ERROR: Unexpected indentation. [docutils]
   Documentation/filesystems/splice:11: ./fs/splice.c:1722: ERROR: Unexpected indentation. [docutils]
   Documentation/filesystems/splice:11: ./fs/splice.c:1734: ERROR: Unexpected indentation. [docutils]
   Documentation/filesystems/splice:11: ./fs/splice.c:1744: ERROR: Unexpected indentation. [docutils]
   Documentation/filesystems/splice:11: ./fs/splice.c:1756: ERROR: Unexpected indentation. [docutils]
>> Documentation/filesystems/splice:11: ./fs/splice.c:1759: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/filesystems/splice:11: ./fs/splice.c:1765: ERROR: Unexpected indentation. [docutils]
   Documentation/filesystems/splice:11: ./fs/splice.c:1768: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/filesystems/splice:11: ./fs/splice.c:1775: ERROR: Unexpected indentation. [docutils]
   Documentation/filesystems/splice:11: ./fs/splice.c:1778: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/filesystems/splice:11: ./fs/splice.c:1784: ERROR: Unexpected indentation. [docutils]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
