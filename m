Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A5B199391
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 05:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736143021; cv=none; b=o3O81yzvou0+GYlUUqmTwm6HzNRDjR7/brnffnJKfcz71S0XMCgnIYI35XPmo5l4zWQvDWvErPt1heJ/u/xxyv7y7Z95bd0WuAIOxp6MVzgETK7AnVNh1eH2RgyTs9pUMtplFw/g+xRSGIntMTlsQfR+LSKIpN9/N0R5BhK0hzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736143021; c=relaxed/simple;
	bh=erQmIMzCBUDT3A8Yvg73olkX874DLJY9S4wmAZgsFsU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CsncUv3sC+qvWz5oCMNglw5ozpR+cwtL8PC/XUFdZ6hafXTNI3SfwUIjUrnMP8uGY+V/E1Wy6heA77Roo/IjNaPlSx41RFwD5vOuz4dF0vUxmp+L3sbwpdBPATACnZXBckysbz3xJQEDXhOXYbY5bYerblLFNMuh7XiwGUy8iFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PWITGSRC; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PWITGSRC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736143020; x=1767679020;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=erQmIMzCBUDT3A8Yvg73olkX874DLJY9S4wmAZgsFsU=;
  b=PWITGSRCg42tel7zFxrcq2Eb+NMQJjgOd5zZST+EhlVmLaXa6Qho7+6K
   sc5ZBD8h4+GihWx68tpGYj2diMzhVS46d+mpsYmL6zqOhvcVD9BZWMT3j
   0twgqdq7NQDB5SuTxDIe4hbMAft6rrR/8n9zkrOeZrpR7y76t9OM+JTTP
   1ncqJilbuX3ARAfgk0CGC2nmbKMBQTOz16eh9uJUsecoEoRCIHwy4Vn5A
   Gwlw9S95H23Ms0koWpaZ01phUFgeESQuVMIQrYp957rXdgFv5PAgKYzux
   nPTEh+4VGVEpsKcZa7quexqqsONe2+FfifdcZKOLuApiBPjoBZvN5wDYS
   g==;
X-CSE-ConnectionGUID: rfxtdjcrSs+XwCKBek8e/w==
X-CSE-MsgGUID: jt4vtJudQq6xyxJi96y1kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="35520987"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="35520987"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 21:56:59 -0800
X-CSE-ConnectionGUID: GKIFMGgXQkqvRKCrsNrQ4Q==
X-CSE-MsgGUID: Gb4EJv8KTj+AZ5jCtj9xzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="102834003"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Jan 2025 21:56:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUg6i-000CIZ-03;
	Mon, 06 Jan 2025 05:56:56 +0000
Date: Mon, 6 Jan 2025 13:56:41 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: wm8994.c:undefined reference to `regmap_irq_get_virq'
Message-ID: <202501061337.R0DlBUoD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d89551994a430b50c4fffcb1e617a057fa76e20
commit: ec29170c724ca30305fc3a19ba2ee73ecac65509 ASoC: madera: Add dependencies on MFD
date:   2 years, 11 months ago
config: m68k-randconfig-m031-20230726 (https://download.01.org/0day-ci/archive/20250106/202501061337.R0DlBUoD-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501061337.R0DlBUoD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501061337.R0DlBUoD-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: warning: arch/m68k/lib/umodsi3.o: missing .note.GNU-stack section implies executable stack
   m68k-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   m68k-linux-ld: warning: arch/m68k/lib/umodsi3.o: missing .note.GNU-stack section implies executable stack
   m68k-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   m68k-linux-ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   m68k-linux-ld: sound/soc/codecs/wm8994.o: in function `wm8994_free_irq.isra.0':
>> wm8994.c:(.text+0x2968): undefined reference to `regmap_irq_get_virq'
   m68k-linux-ld: sound/soc/codecs/wm8994.o: in function `wm8994_request_irq.isra.0':
   wm8994.c:(.text+0x2abc): undefined reference to `regmap_irq_get_virq'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
