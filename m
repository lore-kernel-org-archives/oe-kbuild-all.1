Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BBA25B088
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 06:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781419651; cv=none; b=TEjen0YliWE3v+etWWgETzxMrYA8aVGl4zkBlPkHCHqO8Iek4z4Ofky8TrAtcJcPsZddFuPcMQOgpDDLCeuql01fhsC+jo5kfwemFtRduzXsO30zAjfFeKADi7TKCwgPHIUbolbq/Z3Y3MXjOydsrmTJSalkfOaoUQlK6+N/EQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781419651; c=relaxed/simple;
	bh=mOt+Smu0IBdN090V0l7AGuvATbOfPryDN+Emfuo6cBE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dgz8XEY7QZdnpX2prJGIhrY9uVd/Q/Lxp9zjhU6NUgzG77hNlDSQpuV3CXpqztPZuVd5u8KwzF3nIlJD0eDzmUxmWy5wp3iKuhsf+kfCwfYyHmWiNHewxVwtMXPp2WN/Fz51hhgjnvD5ljdqASZ8kH6hDisrnH9kIrRcS4BCy4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GzjvVdKd; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GzjvVdKd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781419649; x=1812955649;
  h=date:from:to:cc:subject:message-id;
  bh=mOt+Smu0IBdN090V0l7AGuvATbOfPryDN+Emfuo6cBE=;
  b=GzjvVdKd3PGLWbT6acAVoWbu/m9U5JUpJu6k267jMjICprJm7Af0HYKe
   oW857hhSGg3VlRXUSFpmJ92JQDCqEvvbSKPiQXZlBlsVBQNnbhYd8Wnnh
   K8FjLrt2QBHU7qIBB96ejWtghnZ0qdnJV6pFBDUaBmuxDYXkeCNJ0XwOm
   RMDWpEzNj8Z0WICWrrn8fT85kSMn765jxP/fPzEROzqiGwyPEy5rl18x6
   rhAw93mwersGBvBBZMvnprN89YwmkduLA/c2XPWGSPdGBNgRkTAp9wGCD
   Jrs967pTUPvW9aZ318gxrQXUOR/ZaoHoRhFHzXNo49v+3DXPKoBQnaYtH
   w==;
X-CSE-ConnectionGUID: v/wsRtLVTv2KzBWqEFMdYw==
X-CSE-MsgGUID: H33QQLYuT4GEp3Zz11g98A==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="93582413"
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="93582413"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 23:47:28 -0700
X-CSE-ConnectionGUID: EVa1L2ZURpK6JIo9/YvjNQ==
X-CSE-MsgGUID: E6+NIoltSsqIFkL0Rdx1/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="277386827"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Jun 2026 23:47:26 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYect-00000000Qdi-3N98;
	Sun, 14 Jun 2026 06:47:23 +0000
Date: Sun, 14 Jun 2026 14:46:38 +0800
From: kernel test robot <lkp@intel.com>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, Nuno Sa <noname.nuno@gmail.com>,
 Mark Brown <broonie@kernel.org>
Subject: [nsa:xlnx/fix/buf-mmap-multibuffer 26472/27391]
 drivers/regulator/adp5055-regulator.c:346:34: warning: 'adp5055_dt_ids'
 defined but not used
Message-ID: <202606141416.i7mIXv2U-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/nunojsa/linux xlnx/fix/buf-mmap-multibuffer
head:   a26a8baba71e866951f6abf4fc6c0504770c272e
commit: 26093278369bb221ac638ab991ed01d38e7b1786 [26472/27391] regulator: adp5055: Add driver for adp5055
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20260614/202606141416.i7mIXv2U-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606141416.i7mIXv2U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606141416.i7mIXv2U-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/regulator/adp5055-regulator.c:346:34: warning: 'adp5055_dt_ids' defined but not used [-Wunused-const-variable=]
     346 | static const struct of_device_id adp5055_dt_ids[] = {
         |                                  ^~~~~~~~~~~~~~


vim +/adp5055_dt_ids +346 drivers/regulator/adp5055-regulator.c

   345	
 > 346	static const struct of_device_id adp5055_dt_ids[] = {
   347		{ .compatible = "adi,adp5055"},
   348		{ }
   349	};
   350	MODULE_DEVICE_TABLE(of, adp5055_dt_ids);
   351	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
