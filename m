Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD014165F1C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Sep 2024 14:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727273723; cv=none; b=GfHPakzXnrHD3kAAJVRHwfSe6QDCpu84bq5b3S5lSG3DHVQ2oVTngbtSrfTjjQla8DnjIREnJmuEtHhCVAb9425QHGwWtORBr2Y2e70WpwlnVEiUQ6u+sBv/e/9YC/B1+Qe4ubKRzpKOF1ghPZrA+vB5JIyEDGTxxBX76CIh1bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727273723; c=relaxed/simple;
	bh=IQK3v9p5ReS4aIEBmiJkF9FLXnPKBuRdrTod/beZB2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h9nko6aM9qX0dMWDq4e+1Dm6abRQE+LlH1Iu56EVzCdRTNOT2XMN1gLuPVg6WME3SMy5KXIFthbsYRzxgaImZ0blfoFPEDDfCMGxys7o3UZNeeJ6gIi0W1Y9GImQ3aWw6Rcf69+C1CG6oz1u2BCdEx7B6CxHOhdI2MR+jzNio3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eIk2DYdG; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eIk2DYdG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727273722; x=1758809722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IQK3v9p5ReS4aIEBmiJkF9FLXnPKBuRdrTod/beZB2I=;
  b=eIk2DYdGNRBjGO0GWhVUIsj2wspmnWE2XkEBsQB+b7e+yzbg1KY4Lunu
   xCRnW1gnKG5vMSduvStln2TV4ikaOEWWRgsI2pkVibP6XLunjI0hmctNt
   z9gv+S5/qWZSsUQZ5INmIUcDnuQRqY+aU/IKOlgTi66+R/fYkw56tNeyS
   FQHPfMz8f4N7SPbHeeFGsOHU1g7fXR6HsFBshMXmJDOIiGmkCGCu2H2Jv
   BQznL+Y01EuLAb2jPUn/8WSM89ESrkc9j+W8bdSvAhH5PRGd9AhlIIIyI
   Qrk3c5PIFLgj689kq+UYVhi3H71KfxKkxlqjSlU9FTF3QOxYHaEjdDxiY
   w==;
X-CSE-ConnectionGUID: 7wAN/jj9TEOqUDflJNhyLw==
X-CSE-MsgGUID: +fbOqmBFT+OKsKHTY6AJnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="36889800"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="36889800"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 07:15:21 -0700
X-CSE-ConnectionGUID: 1iMo6mfTQV2MpeduFOyGLw==
X-CSE-MsgGUID: 0eWno47ySfq/DMfTAbj5Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="71388070"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Sep 2024 07:15:20 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stSnV-000JaH-2m;
	Wed, 25 Sep 2024 14:15:17 +0000
Date: Wed, 25 Sep 2024 22:14:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 13475/23766]
 net/can/j1939/.tmp_address-claim.o: warning: objtool: missing symbol for
 section .text
Message-ID: <202409252213.wl2sqtkC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ecca3ab84cbf3cf5ec32574bcec8a068e79d14df
commit: e0c2ee9edcacfdda0e806166eaec1310cdf9e324 [13475/23766] can: add support of SAE J1939 protocol
config: x86_64-buildonly-randconfig-006-20240923 (https://download.01.org/0day-ci/archive/20240925/202409252213.wl2sqtkC-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240925/202409252213.wl2sqtkC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409252213.wl2sqtkC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/can/j1939/.tmp_address-claim.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
