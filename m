Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4F020304
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Apr 2024 19:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712000483; cv=none; b=tyTZ7jYpYjSz+bTDHueTD2D5mubY4UfbcKV0NBlxG6EEjrLpQI5EF/IHrhQ4Vy1MTebEVnFniAd47tp+T+8v+7w17lONjSspQtKSAUf/K3sOs3jUvv1HAlnYswqtkSY2sbpF80HCWFz6gUiiBNxH4oc0DNUneRvKGVBGN9M2GDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712000483; c=relaxed/simple;
	bh=L0GCb/xtH/ObtuHjrUztekt1PZC9blG9AJ1sTSu/xac=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jawIIz/WPa/GPzIESu/UfCfCcJzCFM2w9TLczNWKHkKjvH8Wu1HCSTGIEOTtDkTXP/W+yXSA4eOCNAuqUDDegTk8PolUymzlNJhNhRurh5cWtNMqWDEzmoo/AwwjP9rDG0HSnKRiqSafwmT3xStCfsLbUI8FGWe5I+9AYR56mhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZCI1pYNd; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZCI1pYNd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712000482; x=1743536482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L0GCb/xtH/ObtuHjrUztekt1PZC9blG9AJ1sTSu/xac=;
  b=ZCI1pYNdmfEQ7ilGggKCA15PIEryJiMgT9GslivoNKAhn9by052yl5Ku
   4aTPDcVBUkC/XeA0de7KOrnuJmZXJLdePKTN/ICgkvdvum4vG5GDTqcfw
   CMh5ZfSUALWslRkJ35ZfTj9WF/D3OnXYvdLtaVqjQBNGP4wX47Njz1FbO
   rtaf5fIAwh2harLVik/4m7E07BW1S9vTAXvFrNvnznfexlpvJ1elIRVB0
   IGlhOJhcIkvuydIubxd51R12YVijvv/fuUeJGlE2exVGufMayU1aDRStF
   lI2M4/wi34UH0oAk4DwIZT4TtcOBxHRfGQx1EXjcsrvX9Ay+Iko7JPNCy
   w==;
X-CSE-ConnectionGUID: I1GhbPQLQTu1JDIGoS7Otw==
X-CSE-MsgGUID: WMyaC75zSk6qO7v4vdE66A==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="10924952"
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; 
   d="scan'208";a="10924952"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 12:41:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; 
   d="scan'208";a="22550632"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 01 Apr 2024 12:41:20 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrNWv-0000aD-1B;
	Mon, 01 Apr 2024 19:41:17 +0000
Date: Tue, 2 Apr 2024 03:40:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 11954/22019]
 drivers/soc/amlogic/.tmp_meson-gx-socinfo.o: warning: objtool: missing
 symbol for section .text
Message-ID: <202404020329.LC4cVwbN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   bca07979c0a7054331b91c892163a0d214cffcbe
commit: a95885602b93885b15fd80d3a9f59db0daa6d831 [11954/22019] drivers: soc: Allow building the amlogic drivers without ARCH_MESON
config: x86_64-buildonly-randconfig-003-20240324 (https://download.01.org/0day-ci/archive/20240402/202404020329.LC4cVwbN-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240402/202404020329.LC4cVwbN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404020329.LC4cVwbN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/amlogic/.tmp_meson-gx-socinfo.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
