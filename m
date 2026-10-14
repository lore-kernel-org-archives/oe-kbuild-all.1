Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB113B7747
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Oct 2026 06:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960156; cv=none; b=YcTBB1N2WFXFjmW+h3tIscpDTIXtbkWN/9xBLS63asLsOWIlyFSLQl/pRZs+HL9UbGzbb0Iy5A0cBUQS16TmrqtpkomNqCmIJPZd1Cg0vy4Dt6vfe0Sh38tnUb9sB0UXDRsvnz70gzx40vA0ozXfVT7LESyUu6smfeg0QNlja2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960156; c=relaxed/simple;
	bh=ZRZd86mHacRp20fFhPVwjb/0qtXpGh+rKVDO89RpS78=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WtvZCb8VLisORzTnEfX5ohVW/2l/EwQ1r0nZiMEETnTprNidwGOSJgGFfzd9ukQY58dFrHvGKRLC/CmDjhuJfleos/yAFYB0u6kLV7hizPW+kumckbtOPUh5i+6iHcuo45T/8B4O6aArY3dO/Mop8WOG5BfJVK4gPY2fVIfwqx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kTGA2by1; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kTGA2by1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791960153; x=1823496153;
  h=date:from:to:cc:subject:message-id;
  bh=ZRZd86mHacRp20fFhPVwjb/0qtXpGh+rKVDO89RpS78=;
  b=kTGA2by1LwQKvlVrOqFbb5hwwEb6yvGDzaLt9AHg4MU8lNCXk8Dyn1Ea
   ldgkPyx7kqUqKXsHOZwguav4myHZ8Wy5FtK4tF2WPUwwVRfJ/ICn2g9cw
   a3fam6YaLtkC4QJ8UgDPYYQM8jEcvUDRTyY0+vFsWxjeegULdDn3qSwE1
   jeGb7U+vwOQEUqjSg+pGt+2S70TSwmchrsBKRzPr/vjQddRg65ZGcsx+G
   7JsIeRVTt2zvxzfAw0Dnf12Os0GnnKGUIseRiY+kzFp/SxB4u7dGzTJFK
   aTGlRj/hGxE7kEnr3biUJ/cX2XTjEaWOvXFqz/b2o9v65CctW6Dnt7caS
   w==;
X-CSE-ConnectionGUID: CDsAGz6wRU+llWC97GfLdQ==
X-CSE-MsgGUID: FByiCr5jQN+Hf10mKNQXng==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="794274"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="794274"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 23:42:33 -0700
X-CSE-ConnectionGUID: BDcNKyVoR9yUfdACxEfAkw==
X-CSE-MsgGUID: TrFrtYm+T7OOK14m0fzi4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1290938"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 13 Oct 2026 23:42:31 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGsh3-00000000Asx-28DO;
	Wed, 14 Oct 2026 06:42:29 +0000
Date: Wed, 14 Oct 2026 08:41:46 +0200
From: kernel test robot <lkp@intel.com>
To: "S. Biplab Raut" <Biplab.Raut@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 16148/16498] ld: warning: orphan section
 `.altinstructions' from `arch/x86/boot/compressed/misc.o' being placed in
 section `.altinstructions'
Message-ID: <202610140857.6jRIqXf1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1fffefb00cc0b0da1f2ae24e3d33364530ea6515
commit: b575885f96602d24a127dd325dda1739ef6edd46 [16148/16498] lib/lz4: add software-pipelined prefetch to decode fast loop
config: i386-randconfig-2001-20261014 (https://download.01.org/0day-ci/archive/20261014/202610140857.6jRIqXf1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261014/202610140857.6jRIqXf1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610140857.6jRIqXf1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ld: warning: orphan section `.altinstructions' from `arch/x86/boot/compressed/misc.o' being placed in section `.altinstructions'
>> ld: warning: orphan section `.altinstr_replacement' from `arch/x86/boot/compressed/misc.o' being placed in section `.altinstr_replacement'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
