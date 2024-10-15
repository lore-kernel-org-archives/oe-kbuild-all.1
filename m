Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2716F14C5B0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 08:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728982302; cv=none; b=UL+5IiJWOfODRcHg9Jj35Glph+jqlAVQpV6ZdTSG8fCf8goegj16RQQ4F3WPG76ZX3w6VghgBoR7/QUHYKwZYS4DktAweo9M8K7zvaBdbe8uB9ty5iDZjJ1YmP7zqB4seHYzBFumvzbI3bgyQozfscCVRRxfZMqi1B2oSV3tCLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728982302; c=relaxed/simple;
	bh=k4/tR0uSlc41POK6enwU5Q6/N4wbgBRcSiQXQWcMSEI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nU1FkzADdzmDqR+CYMK5I7Od6VS3/8PSLubi4NpDv7kg1inFgSYJWBHt7tXVqWITzoe7wp7My2yWnP0MWlSi8ehYy2WOCcoxSSJhVgB22XoZtMOADPRy8UYhgQUBESQiADzTZMBGfM1nY6aURsi9NSbBWvnUTMUt6cfiNEqjLCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i1dTSlZa; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i1dTSlZa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728982301; x=1760518301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k4/tR0uSlc41POK6enwU5Q6/N4wbgBRcSiQXQWcMSEI=;
  b=i1dTSlZaHAYKSl2hQKGCMOpPpx/byOrDx2nHt1MTmMEgs2Z2c1K2H1Ww
   L7OQhgndO5hmZcFGwyCTiDOKzIPs8Xby7xWF9XYAlEiQtr6i+79qa8EtG
   cOuKOMUeVth+LEEmBBpflPoFvmwafnmv8AJaBjeTGZWncxvnCz+VRD54Y
   QxhH02VFsYQl7iRHdz+thSWI8mjDVcLr1NM9hUMO0F6QdVdnZ+3i2k56q
   P5awUlY5WqkfZXz4U1lhFrxvd2uDNxeMqSZCWvKxj5AfWRMxVwB0yoC77
   h35FS4kbRsvvLWDvRC2CEEQtsA0LLHNO72NdjRTgzu8EIZlfSSHy6t/bh
   g==;
X-CSE-ConnectionGUID: 7R0IjysjQ72VEL26KwxXVw==
X-CSE-MsgGUID: 5VJlrB7IRviuHGW/Rqs2MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28460332"
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="28460332"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 01:51:41 -0700
X-CSE-ConnectionGUID: yaLYxNBoRtmAO2fV5WnPng==
X-CSE-MsgGUID: GAGVLaTlSSKIkRplH3B/Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="78653388"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Oct 2024 01:51:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0dHF-000Hqj-0b;
	Tue, 15 Oct 2024 08:51:37 +0000
Date: Tue, 15 Oct 2024 16:51:01 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:objtool-jump-table-annotations-v3 10/10]
 arch/x86/crypto/crc32c-intel.o: warning: objtool: crc_pcl+0x12e5: BP used as
 a scratch register
Message-ID: <202410151656.VgzPnTFf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git objtool-jump-table-annotations-v3
head:   477193de52ecbc0367ed1db0439ae09f6396cf97
commit: 477193de52ecbc0367ed1db0439ae09f6396cf97 [10/10] crypto: x86/crc32c-intel - Tweaks to make objtool's life harder
config: x86_64-randconfig-003-20241015 (https://download.01.org/0day-ci/archive/20241015/202410151656.VgzPnTFf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410151656.VgzPnTFf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410151656.VgzPnTFf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/crypto/crc32c-intel.o: warning: objtool: crc_pcl+0x12e5: BP used as a scratch register

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
