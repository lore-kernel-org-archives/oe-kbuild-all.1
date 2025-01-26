Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871FC25A632
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Jan 2025 03:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737863075; cv=none; b=A7Y92WxuMEMEnlhTqOkTAzNpjFsuxS5me87eH9/JcroBojGiqVNZnv3Z9cwvt6pafpRbrB8zcfEzuaZarfgBotCjH5/sVvCOwXfWk4LfLraTJEEyZQIxd1NkiN/pLXlZEnOuMV7oZxr4Lz1q1HE8rQDO/9WPCjCWIxOL61brgO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737863075; c=relaxed/simple;
	bh=SX3pbafSUYvzaLaATuwL6LwuqoaWKcpVAH0S+0c9KmY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aIjR/Aemx3hhbQG537+4Hn64N0c4Gp2Lkv5I169qEIdzs6UswmRSZLdTLIOdKdqjWPFrCxQvVBXEKcNnhJBFlneYXSmFeqwfSyA4lOsXa3QO6R5JOYa/xGlffISP7bcDZBBpxXv8tL6HIHlm+34JooLNIjlkfir6HLTpPG7SJEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B43Kh/9l; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B43Kh/9l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737863074; x=1769399074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SX3pbafSUYvzaLaATuwL6LwuqoaWKcpVAH0S+0c9KmY=;
  b=B43Kh/9l2sitW3powc2JWkN0NPcse59rpKwdxWC0GfvKLXwIALc3Fcgv
   jKabWV8v3GS10dTp6vDRr9oR+PJCqKzA/7R8S2dTxY+6U+J1a45kxagZO
   I8AwubC/IMX2zIV70sCBwe/InaVUqwrpBzspvxrubUYpkLoUlSBJyU2bS
   DQCrXBtlmfjnJxgpzUtvWKpifsLGIXPMpCHrfTBYLcP6XccO+Z8KH1ZvI
   ZEOwEphFVwScjPvh8fcKyq2Wxaf6kAKSlIvBV0MhUiddJX4aphDDiHbez
   Z12OhJqk0GDU1mgATrrvZcxpVaRa4nrEexzmWKc6gDVEIwYEyTeMNxXZF
   w==;
X-CSE-ConnectionGUID: HF4IqqQBTKCTBX2FEtmAEg==
X-CSE-MsgGUID: 8eFT+XIhQxqd0mxzjCOqXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="49342254"
X-IronPort-AV: E=Sophos;i="6.13,235,1732608000"; 
   d="scan'208";a="49342254"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 19:44:34 -0800
X-CSE-ConnectionGUID: v1Hmnw7qTd+yaks4IjT8jQ==
X-CSE-MsgGUID: 1Yq6vn3YROWCsgdgM5nsuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113267203"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Jan 2025 19:44:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbtZW-000eop-03;
	Sun, 26 Jan 2025 03:44:30 +0000
Date: Sun, 26 Jan 2025 11:43:58 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:sframe_unwinder.rfc 2/8] aarch64-linux-ld: warning:
 orphan section `.eh_frame' from `arch/arm64/kernel/entry.o' being placed in
 section `.eh_frame'
Message-ID: <202501261139.RBrcBwl9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git sframe_unwinder.rfc
head:   0cc3157743fd72033cfa5de243943249f9d67cea
commit: 7d3be9450822e8d1af0e872d86580e1eab5958cf [2/8] arm64: entry: add unwind info for various kernel entries
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20250126/202501261139.RBrcBwl9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250126/202501261139.RBrcBwl9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501261139.RBrcBwl9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> aarch64-linux-ld: warning: orphan section `.eh_frame' from `arch/arm64/kernel/entry.o' being placed in section `.eh_frame'
>> aarch64-linux-ld: warning: orphan section `.eh_frame' from `arch/arm64/kernel/entry.o' being placed in section `.eh_frame'
>> aarch64-linux-ld: warning: orphan section `.eh_frame' from `arch/arm64/kernel/entry.o' being placed in section `.eh_frame'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
