Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FD66FE06
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 13:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710424597; cv=none; b=Ioz9HnBn604bIyWcUTQ6y+emHaPst+DeV/V1xcW+3MKfOvVvAjCWFXvGa3CsIWL523aJDPDLG9sTUwhTxOgZ1YlynqLO3jL31FMOv/SdYCZVtHzfm837v/5/qc/Iez+m9L5vJi3vQqnAeniQfJCKnMkyybObbDts6V+ce1VL9xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710424597; c=relaxed/simple;
	bh=JMUvR14bCEiy+yD7hrQAZRvb/CJZBFmCOTyPzsQzrw4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ki5AFy3N1c/vIA0ry2yJy1dLQGdR03ywMUe3jnRPlufcd2lZCYg2rF0cAihuZ2bnj0thL39x/AjzWAiC89z0Mp5WPJTfBFbX3wfKRiRCM6mjI2F7SJ1v0KGpA3yYsn/CzHcLVVb2XFB1ln15pmN7oJXpkvoCBi8ElgSUTsyargU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dvRzSDZ5; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dvRzSDZ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710424595; x=1741960595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JMUvR14bCEiy+yD7hrQAZRvb/CJZBFmCOTyPzsQzrw4=;
  b=dvRzSDZ5P3JH64eQIV4JI1YwlbZuJGtGn+u53N8iX8tSaIBx8IHZ0CIk
   7f6m6dq7sy/8UwBaBjS5e1NrjJ6/9GLDPPPYjcJgz5FetZWdeb5PfHxUu
   QLMYClc+EHnod9WjNnZhNpyY1iL4+ne7tJFTFtIdvE21+kL1tSHgIVANA
   OyD0i0c7bANHn2F05u/sx01T9BpEE74pyF3dS+IlAMTB65D5cZHB8japc
   eEWK7ZvwqfWMTp9BqaDrQC5WGxgZa3n6/gAoG8p2EDcmnjSw3rexzZtp/
   24PT/iWekVczhJeTImV3oMbbemB6NHePSfdB6jVs/bBrUgyAeQ5uHbRxJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5106827"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5106827"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 06:56:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="43326877"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Mar 2024 06:56:30 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rklZL-000DTH-2s;
	Thu, 14 Mar 2024 13:56:27 +0000
Date: Thu, 14 Mar 2024 21:56:19 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 26652/27507] rue.c:undefined reference
 to `sysctl_io_qos_enabled'
Message-ID: <202403142117.TITEwyEw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   fdd5d0bfc620bd5147ff5b260822c7645aeddad6
commit: 935b312d04ad798a485e245b4fc6e49f6c440623 [26652/27507] rue/io: add buffer IO writeback throtl for cgroup v1
config: x86_64-buildonly-randconfig-003-20240310 (https://download.01.org/0day-ci/archive/20240314/202403142117.TITEwyEw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403142117.TITEwyEw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403142117.TITEwyEw-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/rue.o: in function `rue_io_enabled':
>> rue.c:(.text+0x7): undefined reference to `sysctl_io_qos_enabled'
   ld: mm/page_alloc.o: in function `proc_pagecacache_system_usage':
   page_alloc.c:(.text+0x6e47): undefined reference to `vm_pagecacache_system_usage'
   ld: drivers/acpi/acpi_processor.o: in function `acpi_processor_evaluate_cst':
   acpi_processor.c:(.text+0x348): undefined reference to `acpi_processor_ffh_cstate_probe'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
