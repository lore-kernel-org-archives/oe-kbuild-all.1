Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323B51BFDFC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 22:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732313850; cv=none; b=JpiWxJJqvmWjyEnVNGXQk+Z3W0ANj3CmySpMNbDx0rxEzo3kayLvodREad8R8LE7ub9/aX0kAgrE9g96FW95uxcF1V4OXN3tTbe+87OhgI3WmWndDIu0/Yznyqkob183302xNmpCtcv38mhj4J+HU8pf3NItY6Tehs2ZV41fNhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732313850; c=relaxed/simple;
	bh=HBA0Pzavek0NhwoG5fUbjqWgouLifSWFWd3lkdEDnrA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BfsRtVHRWxx7UaZcik895rGSp5QXVn3CqDpOBL87H4R90U5QChzES4iidcuvBYHmSQswL96ojlKV0f/HYHLBAHb4faHCWHAcELyxdaHeEVBKrhdw2F8pcllURoyxgB04UPuZr0MRi57sTfVkNOwPJqRFog+0bowbp9ZRREJNI0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N8yNQpVF; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N8yNQpVF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732313848; x=1763849848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HBA0Pzavek0NhwoG5fUbjqWgouLifSWFWd3lkdEDnrA=;
  b=N8yNQpVFIBmYD7IYpwz9hHtZScA6Jkh4mnIzJ9uxv3sqeH8UBoODRDEn
   TVr6pK+BoAqsvLHPbwvDCtCUR9+VU4wvK254ui0q8LX9gJ9ZAdZW0QhYk
   oElnVtNHclGYkOHPLLcrDpMa3EP8n7Yvy2hcLVGbQaU4M4lFc9oiX//SV
   ewGwi01WGlQWJ38PmEkU3FdwwWxR6pJoQzCTDfX021rNVz5cG/7gsBZfe
   xWVkETOzRzsfYq38rSBAS+Jn9IpuCC601Te1iCJhCxth3/G40nM/4whXL
   U1NfMUkfj1IhBAwV/FaUWYRih2ONVSoBGwqOxvarTj9wRpUb6FoUO/wDJ
   A==;
X-CSE-ConnectionGUID: pHQd1WWDRG+aut5oxeWjMQ==
X-CSE-MsgGUID: MlTMzSuYQXKCnnv9mblyeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="32636295"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="32636295"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 14:17:25 -0800
X-CSE-ConnectionGUID: 9vnoHepHTaOSAl1SZcYOGg==
X-CSE-MsgGUID: VXhE7byAR62CUmYjcbUa/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="95749408"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Nov 2024 14:17:26 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEbxr-0004Fd-03;
	Fri, 22 Nov 2024 22:17:23 +0000
Date: Sat, 23 Nov 2024 06:16:42 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.12-main 8/62]
 utils/firmware/airoha/EthMD32.DSP.bin: warning: ignored by one of the
 .gitignore files
Message-ID: <202411230618.bGssBfoe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.12-main
head:   fc18a51777815a2de7bd2a88e44b3707632980d4
commit: cb43c2aa66bfe58d5018badf91f26e6235b5736e [8/62] utils: firmware: add r3mini phy firmware
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241123/202411230618.bGssBfoe-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411230618.bGssBfoe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411230618.bGssBfoe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
>> utils/firmware/airoha/EthMD32.DSP.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/airoha/EthMD32.dm.bin: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
