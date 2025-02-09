Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284F860DCF
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Feb 2025 07:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739084482; cv=none; b=bqgFc046r+wX92l4hRvilMqqv5G8Rar+I/TqYQAhfcb/qKiIIxywtBjbNphUqF3Epwj/K5lKvDcUzKEae1NDFyqWaBBTdzgMvKn6Nd4GVMPXFmE48u545PHmHzjaRg/XlZ1rFIvSsui2KTdZK2TT+9iNQzTAMxrQdel7sMh+J0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739084482; c=relaxed/simple;
	bh=hZBr9PoNJAvtWKPC2gVCvhFR0WZ/aNcskjmKaMLFnhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ak/JdLppPvzgGRCv2ONu+ZA4nxOGUEzzSFJhnuN1OrWV4FfG4BZnpxXvDxL7dTPHt18s2sULy5Jyw1DlHYUJrvD2Xx3S3BH13VPnpigBTkPXk60WqdcIizizJjHHFNe0J/DEPyOgs/OF5B7Oh0TMx/eco1kNQelP2RJnwvqCAF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hG2B1zvW; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hG2B1zvW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739084480; x=1770620480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hZBr9PoNJAvtWKPC2gVCvhFR0WZ/aNcskjmKaMLFnhQ=;
  b=hG2B1zvWTtUBAPz1W6dYwrzXst0VsZ1MPHtv56Zvoj78RvY4dTT+Ka7N
   Gm2aQSfECLA+vlC0n8kyD8jESX7drIFQuzeQXxH6ViZ/TjehU2wx6O+88
   cDsHZtm67tiZINVKB6Y8boikyvUD0s93U9I9b8G4/8xz2A5JM2od3cHVN
   cyebxzWiwhR41ijR+QoGUEQuRpsUngJ/UsRbsSo2JvyRrl/tCqusmXnjN
   RiI658bFuG6jn0xmFDhKqoN4JJgyQFz7u1Xzh4UsHNbn+ryixr2itr0tU
   hmKrabXro/WQRvCr7FpkLgmKho1kJLGe5jg9C/+4tdMjUKuY9vAUsO569
   Q==;
X-CSE-ConnectionGUID: AmIwlhGAS/2dVEgge7+rlA==
X-CSE-MsgGUID: 0xqaLuKqT0WSwZAcJ+3xhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="27289399"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="27289399"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 23:01:19 -0800
X-CSE-ConnectionGUID: HVl9q15dSoGuZG2JqnMvnw==
X-CSE-MsgGUID: G62mpr8hTd6Dhz0dQbjNag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117100747"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Feb 2025 23:01:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1th1JS-0011BO-2c;
	Sun, 09 Feb 2025 07:01:06 +0000
Date: Sun, 9 Feb 2025 15:00:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1421/1421] drivers/edac/skx_base.o:
 warning: objtool: skx_decode()+0x27b: can't find switch jump table
Message-ID: <202502091441.DGtT0ffE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   cc7cb040bd0afe96f1da94c9f21eda5a986510a5
commit: e34047f6dc606c123911c6db8fa424bb4a035262 [1421/1421] EDAC, skx_edac: Delete duplicated code
config: x86_64-buildonly-randconfig-005-20250208 (https://download.01.org/0day-ci/archive/20250209/202502091441.DGtT0ffE-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502091441.DGtT0ffE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502091441.DGtT0ffE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/edac/skx_base.o: warning: objtool: skx_decode()+0x27b: can't find switch jump table

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
