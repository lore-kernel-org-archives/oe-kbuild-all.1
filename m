Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999EF28F1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 May 2025 10:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746958352; cv=none; b=Ql3X59g/o6aRjm4ON22dFakZI5DioJFbIjSEAs/iX1nXPwxWbX55H0jlxAdXtA61uRqwcKNOTHlYErpFOftBXrnjB69FjK55I7NURKZ64dmSaDtTTfyBDFuoVqrYl0U/lOqtQZRKXHaXhFtsgE9tbrz6NFPbuPtBsg+Cfwb9k7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746958352; c=relaxed/simple;
	bh=zlJYLTAtVzQso5q3JSelRYveY62sZOp5Z2+P33Y2BQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RxKHrGXD5fZ8kXFhEDdqdXDY2iBT4QVjPWsHL2nICN0odnxDTseBjS/u5iAATS8BO2eSPmBU/6ET7Q0M9iN3CF/yFEmKzfoGO2raqwHwDgx702qOb0kaCWLC9CwVG65IpfXQPvhP5vRTygyvNQHn8kFJV8EM1kbo9uFql7Ijv94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m7oi6VKw; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m7oi6VKw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746958351; x=1778494351;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zlJYLTAtVzQso5q3JSelRYveY62sZOp5Z2+P33Y2BQ0=;
  b=m7oi6VKwrRbvBQTiensxdWqSJ69bYxm35k8gSl5yjEO3Gf7Yi2fnb+Id
   //2lEDHQ79NwVsPkdLDG21CSgtSdi1mUQQU4wOAwGD+feGlLPkV6iL35q
   2TdP4XNaDDDof9dFhtXrtECXQYVta4MUJAjHh3DX7dnn3iFa8NjuIKx8D
   BWsUbnqsXzZ7KQMxgw/cwiry9cqqaAQTn1svWph3P4iA8rZFMo/3BOWTs
   qVMtRoKKwFnSu27l9H5WHizOZIoHhwRZ/+H+5ec7/mwgMlcEgVzijzwJF
   bTm4J8XYkwS6+kzpFSxfT0MdANRpYDy6/EBpsxpaRs5NLKYwpJoTntUHX
   g==;
X-CSE-ConnectionGUID: IneVL/nlQB2hG/mlby+EAg==
X-CSE-MsgGUID: p0Z5g0DIQCGxsk55VPzOAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="59419158"
X-IronPort-AV: E=Sophos;i="6.15,280,1739865600"; 
   d="scan'208";a="59419158"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 03:12:30 -0700
X-CSE-ConnectionGUID: mJK3yRbmSDGTlyv0DmrYmA==
X-CSE-MsgGUID: wFeJHm2lTgyf/Y5ngA+8xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,280,1739865600"; 
   d="scan'208";a="168016505"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 May 2025 03:12:29 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uE3fW-000DiJ-1Y;
	Sun, 11 May 2025 10:12:26 +0000
Date: Sun, 11 May 2025 18:11:26 +0800
From: kernel test robot <lkp@intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, Takashi Iwai <tiwai@suse.de>
Subject: [linux-next:master 9199/10031] ld.lld: error: undefined symbol:
 tasdevice_remove
Message-ID: <202505111855.FP2fScKA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ed61cb3d78d585209ec775933078e268544fe9a4
commit: 28a09d9e42c500204fd79e91f40434b16b4c9372 [9199/10031] ALSA: hda/tas2781: Create an independent lib to save the shared parts for both SPI and I2C driver
config: x86_64-randconfig-r071-20250511 (https://download.01.org/0day-ci/archive/20250511/202505111855.FP2fScKA-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250511/202505111855.FP2fScKA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505111855.FP2fScKA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: tasdevice_remove
   >>> referenced by tas2781_hda.c:33 (sound/pci/hda/tas2781_hda.c:33)
   >>>               vmlinux.o:(tas2781_hda_remove)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
