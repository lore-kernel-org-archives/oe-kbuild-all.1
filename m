Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90824213E97
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 15:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734016316; cv=none; b=o90uOKCFqJT7W5yDJdaPxQVuInf+tuAH212KU1D6c8ZGz5+pDR1T/j6YOf9Fx7HTqCbo7TZZ3P318NQCKqL4BZ5fE6rDjJhuyAiDXPtY6iqrUMTg7ScTQ97yLfCMVaWB0uXFsVXnufFEZ6st0PYng8zZR0tCITFfSwrWwC2Et/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734016316; c=relaxed/simple;
	bh=eukPNUrpjNCWeBK8HHFykjPb/vPGiOPSmViSFYFWf+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UOVomAEknn1RSgRTKtrwO06lGrGkZaKXx4wnEpfn/eIYKk14P0h5DTrZKdp9LkBauZbUFYaQVNfLVzeX7pNsGzp1ItmBtLqw2us3jczCOfWg7CA96uAh5LJHc6K3+8wu65eB8rbKiXNu8+re9x9jDlDbuq1V3q6CwKGeINtqQuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HCoY7MKM; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HCoY7MKM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734016315; x=1765552315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eukPNUrpjNCWeBK8HHFykjPb/vPGiOPSmViSFYFWf+o=;
  b=HCoY7MKMD1MUTNxVmjit8xOT4PjS+k4Zq9W89Ph4pl4W3+pFDQnjhzX0
   FUGyTHKkGZXu1S8DiGTlQ3Krx/wimSIR0J3iKBmsyUpFQ/z/J0CVkquQj
   q0URVkYHpRjSC9iGaMQcqzqGnxk1wVKDzjR+1zEzlTRhahruRlIYATHqR
   +ElhENP0c5VM+/uCGfHDwjrNlWLo5LXuVLC0eDUVvwAp+BJIqakB+iO/7
   QyNvUK3K/b2BHWFq9yGJilUaoqYu4dc8plcSto0R85YcaHEMUupibnnfe
   ztkEsP8x0D0FhAoX7sCuU8mqXIWu5yBrNRHuTjv0PN7PzUk6M/SUtQfWK
   g==;
X-CSE-ConnectionGUID: dFWYct/SQ9CGF/hn/SqLIg==
X-CSE-MsgGUID: j5xuFHn0TAKAfzEwP7sfbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34576831"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="34576831"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 07:11:55 -0800
X-CSE-ConnectionGUID: Mo5FP0mhRvijR/pslL7UXg==
X-CSE-MsgGUID: aDh1M56VQcumodLCm2hbjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96091833"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Dec 2024 07:11:53 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLkr1-00085t-0f;
	Thu, 12 Dec 2024 15:11:51 +0000
Date: Thu, 12 Dec 2024 23:10:53 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/features 10/15] ERROR: modpost: "cxl_features_type"
 [drivers/cxl/core/cxl_core.ko] undefined!
Message-ID: <202412122347.MtwnJ6pn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/features
head:   a67a7f4d25f148893d8c845b36ce97ec806f461f
commit: d632be62a52ab8d4eb49c90c883b2bd1a0859d1a [10/15] cxl: Add skeletal features driver
config: microblaze-randconfig-r133-20241212 (https://download.01.org/0day-ci/archive/20241212/202412122347.MtwnJ6pn-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241212/202412122347.MtwnJ6pn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412122347.MtwnJ6pn-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "xmb_manager_register" [drivers/misc/xilinx_tmr_manager.ko] undefined!
>> ERROR: modpost: "cxl_features_type" [drivers/cxl/core/cxl_core.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
