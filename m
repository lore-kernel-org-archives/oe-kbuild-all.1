Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3B026AE4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Aug 2025 02:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754967356; cv=none; b=JYf6Uk6igTZu2LzXYE0MF2iyBOSJbEKbzmIkAPr9YlpnmSaOPr8vHp3NFeOG83qtcEfucsEfoJUGjlpGMLN06XAl/XCvmW2fC7Dy4rbn8b1MWd1n/Utx25ESovN+nk6kf7FQePXBo7ffkZ6CzsixYY5q3giVAXDsnOI8jcYLx+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754967356; c=relaxed/simple;
	bh=MrPgul0mih+nmIfEmQA3dKMtjbeDR49s0ifbkJJpgN4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OzP+UghvIUqbzLRxUjH2cX8nOWTpFAahz/kdMORV1y44pNWWOxq5/HWCPJIx06b8Tk7cO7hGN5k6niqXYLVA8DMf1IKHWivUi/M4snb3VvT8DMsA/Iwj56bhRgp9uN1ogAW6lVr4bL+VLcN6LBUiUimIgFXnT6CnpOtJbZiLI2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DbkAbCOg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DbkAbCOg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754967355; x=1786503355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MrPgul0mih+nmIfEmQA3dKMtjbeDR49s0ifbkJJpgN4=;
  b=DbkAbCOgYtlw6TO+ZLI0T43c5dHCF00FoYr/+7XDCkDnLchfW7kp5hNh
   JCQY6WfbLYgq2Ou0i2VRO51yT9mmbYLsVCsvbEFRhlkSsBYwFXhLdTamh
   HUMZm/5kSfTsxM9w3ufHw+QUBv+A073Td0snd6pMpuZAPjN+98KhUHPtX
   DqOTwYc0jAA1Hnc+2wu80sLsYx5Rh+PjiLjHMT4pen+yAJUR3VL7qn3iP
   jPnnPnHqNfuIAD+k/3Q6RMkcUlZzZhnHmFEKdk977THEbcOGEQMLm5Q+J
   BLOITjcmxxptkh1zOoipgyvX1MNnwr07/qHRrvcqr9cMfjaaXuetWHn0j
   A==;
X-CSE-ConnectionGUID: BmoENBW6RaGjxPNCI2NiMg==
X-CSE-MsgGUID: 9OvIBKRQRUOMkIbPx54K5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="60859495"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="60859495"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 19:55:54 -0700
X-CSE-ConnectionGUID: kaCXQyzsRLWnmOtMXhNqyw==
X-CSE-MsgGUID: +hE2qdTxTRKPbYXKlTQxMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="197078429"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa002.jf.intel.com with ESMTP; 11 Aug 2025 19:55:53 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulfB1-0003D1-0Q;
	Tue, 12 Aug 2025 02:55:51 +0000
Date: Tue, 12 Aug 2025 04:55:28 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1750/1750] drivers/pci/pcie/.tmp_aer.o:
 warning: objtool: missing symbol for section .init.text
Message-ID: <202508120412.Xa7JUmZ1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a7892155ca524e224cb2da85c85cc1bd4303179d
commit: 58d584102f06f870f118644f1022c751e015e7bb [1750/1750] PCI: portdrv: Initialize service drivers directly
config: x86_64-buildonly-randconfig-2004-20250805 (https://download.01.org/0day-ci/archive/20250812/202508120412.Xa7JUmZ1-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508120412.Xa7JUmZ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508120412.Xa7JUmZ1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/pcie/aer.c:217: warning: Function parameter or member 'str' not described in 'pcie_ecrc_get_policy'
>> drivers/pci/pcie/.tmp_aer.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
