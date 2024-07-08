Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242077E0FF
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jul 2024 10:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720434477; cv=none; b=IiCeb0Gx9Tk43XiapgCtU/xC275jqkpmY5zlxFCI/26/a0uWodwHWFd1e3OLqnG6Dawb3V8pjrw6Eo69NpkPyhXKNiUwd7lGeVnpLG2fIQhWqy5ydROQI4tsuFWwKsmExv7Hfm1wa6Y8u0aVOoT3QG3g7IRl3LYOP2KCPMg6vXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720434477; c=relaxed/simple;
	bh=6ZnDFXH+Sm5iuvBwC6VEEWGcpWgOKmbTf7pfcs6lnek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WcDUF1OTa0lwVbfXXXhaSKXE5t8qryxZ/+CiEMW2qTzbEyIeO/YH8R4yPNb9B92HwvAR1NqzRALHQ5Oky/ryQ222NHY7xUzReoLufucxBes76T+aS25Vdj7eh36g4UnqyY5gzOn2Gjg3+czufaBVv0AMBvDCrEJ49e0ZTN5LbI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H+97AhdV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H+97AhdV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720434475; x=1751970475;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6ZnDFXH+Sm5iuvBwC6VEEWGcpWgOKmbTf7pfcs6lnek=;
  b=H+97AhdV/cHa26uCJHIE37CvcY3CH4RJGLdJMSEJRRGaQHkrCw8updzg
   POSYpKmd4EzEIM/6+2zuI0+kddE3qrNraMMkEtcnMGPyL6PQXmqMLQCkI
   klmSpd5gb6//NSYCAqqIfST+QP0ahyDR5bZA++svlrFvJuYfCDqtQs/BM
   P8HIeey5rW01GxR4arssCOIg2iPuZNC5EZrj/LXO9cNhoKEJklWDscGfV
   qSSG00xVS6RWEl0Ee2CSZE17s9IF66IpF3xfCyV2zMczvBsJivnHo4B/n
   cdn46A4ZKUTkrqURlCaX9+8IS+X9WbMc8OCBaJW8RhxaEA8OgD7PsiNzE
   A==;
X-CSE-ConnectionGUID: XwkIS6zsSIqcDrpIxKeYUw==
X-CSE-MsgGUID: y7L52xE7Q1e2MEvyYZ+i4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="21438953"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="21438953"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 03:27:54 -0700
X-CSE-ConnectionGUID: 5ZjP0uU9SW2S/IDOBi7DKw==
X-CSE-MsgGUID: oinuyS4CQweYuSkX76uQPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="78203036"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Jul 2024 03:27:53 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQlb5-000Vfi-0b;
	Mon, 08 Jul 2024 10:27:51 +0000
Date: Mon, 8 Jul 2024 18:27:10 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 34/38] veth.c:undefined reference to
 `io_iov_get_page'
Message-ID: <202407081858.NbtQ9dnT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next
head:   e4ca708d438ed78c9d231c7e65365a9a94e4c5bc
commit: bc22399d5d441f626104216e60a0c9788bbb5ecc [34/38] [NOT-FOR-UPSTREAM] veth: add support for io_uring zc rx
config: sparc64-randconfig-001-20240708 (https://download.01.org/0day-ci/archive/20240708/202407081858.NbtQ9dnT-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240708/202407081858.NbtQ9dnT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407081858.NbtQ9dnT-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: drivers/net/veth.o: in function `veth_iou_rcv_skb':
>> veth.c:(.text+0x3d40): undefined reference to `io_iov_get_page'
   sparc64-linux-ld: drivers/net/veth.o: in function `veth_xdp_rcv.constprop.0':
>> veth.c:(.text+0x47a8): undefined reference to `io_uring_pp_zc_ops'
>> sparc64-linux-ld: veth.c:(.text+0x47b8): undefined reference to `io_uring_pp_zc_ops'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
