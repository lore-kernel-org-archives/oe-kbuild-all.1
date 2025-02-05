Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A2221D5B2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 06:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738735738; cv=none; b=AkcGyufkxZB3TCltX7CDBQVMPaaiMYrychBjcH/2ZfIPKz9N0V1cequ21ixKrfjwG4796hLojiEnB4e1eN51pYZcss4rjoGG0QsIyNUaMuromBGKzs79tl7yfjlztsj4LT3futMZZ6FCDSCOtdaOYu3FTXf1lybzabnO8FIdK9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738735738; c=relaxed/simple;
	bh=Fi8ub7q+gLIiMBf75sy4UXKN9HdacnIOKGizODHVK/4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r0jJesQbkbtEQHlD4b0ajv461UPQUr6ROghpOzJzplUDldGUxf9YrS9iVBSq0Jjl9Ofmkt/F8jR1/fwqgY91NuQ7K81VJn3ux6jFXO2wYfqSosfD60iHELzgzk5pDG4YiH00GZY/WZmhbKKFKjxz6XE5KKLICW/ZZPBcx/MywdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FVbnGCp4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FVbnGCp4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738735737; x=1770271737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fi8ub7q+gLIiMBf75sy4UXKN9HdacnIOKGizODHVK/4=;
  b=FVbnGCp4KiHXJNZdG5+Xan2jrH+rhx1eJ8YIqy1tJPfN6jESTONW+5kA
   FA98AhjtOJKKlX9naXcxMbxGtY8KbfNVaweM45uN4nm00xy5u/yLOciMs
   kibe3OpyPK/eVm0euZwsBQsFSIcn585aTL5Org5tYFgMUolWolSXnrboc
   AgBdeOGROptUsOsV0hnwvuMgA1GzN5/7zy3Y4ohJM0+KLZXiacs+09K29
   8CR8aHvWCoXXzQp/jYJhAwgwjMDINhXGzaNTaD8KfVqmpicsuaniwqFbl
   2FjOw9e+J7NCbjefLXHVljEiPw/wPA67fXNP/hUqSVHY4WhD0cKMojb96
   Q==;
X-CSE-ConnectionGUID: Gx2DQwCjRp+9ZtUWwDdveA==
X-CSE-MsgGUID: pglbElDARaOUABNIU11FBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43038812"
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="43038812"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 22:08:56 -0800
X-CSE-ConnectionGUID: VtKpc8LuTKyAxLbc1WI96Q==
X-CSE-MsgGUID: o3TDYtXHTGGcxHFv/8dfCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111251732"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Feb 2025 22:08:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfYai-000tW5-1e;
	Wed, 05 Feb 2025 06:08:52 +0000
Date: Wed, 5 Feb 2025 14:07:51 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Graf <graf@amazon.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:kho/v4 12/13] kismet: WARNING: unmet direct dependencies
 detected for KEXEC_FILE when selected by KEXEC_HANDOVER
Message-ID: <202502051302.wuKDVVWW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git kho/v4
head:   a75b813f58b0bc19b2c4b06bd62afc87f02dcb43
commit: dd730ee646a9855c98bf5e8ed8ccf1ee7c8fe122 [12/13] x86: Add KHO support
config: i386-kismet-CONFIG_KEXEC_FILE-CONFIG_KEXEC_HANDOVER-0-0 (https://download.01.org/0day-ci/archive/20250205/202502051302.wuKDVVWW-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250205/202502051302.wuKDVVWW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502051302.wuKDVVWW-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for KEXEC_FILE when selected by KEXEC_HANDOVER
   WARNING: unmet direct dependencies detected for KEXEC_FILE
     Depends on [n]: ARCH_SUPPORTS_KEXEC_FILE [=n]
     Selected by [y]:
     - KEXEC_HANDOVER [=y] && ARCH_SUPPORTS_KEXEC_HANDOVER [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
