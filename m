Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7CB2E8B98
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jul 2026 05:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783746207; cv=none; b=CWg5L8KNQQrpwx+pe3OQfwCdOVN3d5p3B9ilAGqOUGQc1lY7wjH5GM3SCzxjpE0VlexBh0MZSXyiB6omJs/rsL+nw3qjJk7I005vmJ81b8kVnQnLavqnCUFFtK6mxYIn+WOQgaYWBWTRh7394qZVUOst+X3IiNzLJhN3cXfy2Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783746207; c=relaxed/simple;
	bh=ptFOBenMUWRHRuVHVlXdS/DXkIsL0bTDIccB2+UanG4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LGEo+SXqhlWY10xGizuaz5QO2qtdpyyee0D6/bvAbNqQDbKlg1khlEThcJGkmdv+SOrlYIOtTTbKV52JzDQIBRrRe1x5RTqPKUC/oN2RsQ20rzyx05p08i5PA0+Jzxw4ITl9kpXRSPhk7bK71UtAGZRmA0jAGOVMoLWmsphKvTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FBDhX2DU; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FBDhX2DU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783746205; x=1815282205;
  h=date:from:to:cc:subject:message-id;
  bh=ptFOBenMUWRHRuVHVlXdS/DXkIsL0bTDIccB2+UanG4=;
  b=FBDhX2DUqJUPyDj3P0wIrqXMJnsoTPtVqYa9UwB2TLULuHNhB7kRagvO
   ClG13ZO5X8PvXvvfxJ/2PqAa80N1Ap1yQMWCRRkVj2LZkFSoZZ1LjbfSQ
   +Uu2gYvibGfotKZW2gbwgdN06X1BD3wgcWpK9KM6RaMt5DmQ9i0rgsrND
   IS6QojR1zcFa9AdV8ViB7fMcOBg1zUCd3aUWcXy0ytkypyl50Br6hRoRm
   io1gF/8ORBXnm5SF4pHL/C8WOQcy2908CsuHwrFCQs0HTfQ8zhxBPIEYN
   P84H12Pj14mkiGBbXYsiAlc+eAuCJ6lS2/6zoOpwNvXEgzw8shSSlog/P
   Q==;
X-CSE-ConnectionGUID: JuyjWVqWRdCaLyF7PuI5kA==
X-CSE-MsgGUID: H3SkjArCRWOadNp+gVCqbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94791430"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="94791430"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 22:03:24 -0700
X-CSE-ConnectionGUID: 9N2/mGP4SyCIo/tVKjhOKQ==
X-CSE-MsgGUID: BhSrd9ZoRE26jrVSQSEecw==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jul 2026 22:03:21 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiPrz-00000000Jkx-2Aqe;
	Sat, 11 Jul 2026 05:03:19 +0000
Date: Sat, 11 Jul 2026 13:02:38 +0800
From: kernel test robot <lkp@intel.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 Harshal Dev <harshal.dev@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [linux-next:master 4886/5655] ld.lld: error: undefined
 symbol: of_address_to_resource
Message-ID: <202607111203.KPtXWor1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bee763d5f341b99cf472afeb508d4988f62a6ca1
commit: 5c1a2975d23c51c01aca51945d0f10a4ee4c9020 [4886/5655] firmware: qcom_scm: Migrate to generic PAS service
config: s390-randconfig-r062-20260711 (https://download.01.org/0day-ci/archive/20260711/202607111203.KPtXWor1-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607111203.KPtXWor1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607111203.KPtXWor1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: of_address_to_resource
   >>> referenced by qcom_scm.c
   >>>               drivers/firmware/qcom/qcom_scm.o:(qcom_scm_probe) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
