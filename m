Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB33818308A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 22:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727218730; cv=none; b=Qgqv0aYMbi2Lh25JCrc7bgFJYBRD+l6K3z7pDW/J8+X9Edy/zKpSLq18lD5vM//zXx4IdSVH5jB620NdkeMhjaBDV+Q7uAL++VDXHBOkA9QjBN9MdwkcrJY4NIXqGwVEVd7lBAyXtR421VvUMQfxOC1yHSB48Nh/32WM8He50pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727218730; c=relaxed/simple;
	bh=zwYAfVMxsFhuigyL4ymSUz0zI+x2d8UtakFsED7kYLc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C7susCJ8pZrjg9bNfM0ewlq9HGA/GDixZnNnlZJnZ30yMomTEo68ZAoRW/lFca86gCgm0Ps1BP65yyO3NYsqj8zgJqCo8BcQhszo0tcaPZYgtZ3+Z/KFlhhqzSq5VmkcrrGBzb9qkTFR0lX/pLpAkbpesi7hePKRd3EFqyVVmtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mHyl5yUL; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mHyl5yUL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727218728; x=1758754728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zwYAfVMxsFhuigyL4ymSUz0zI+x2d8UtakFsED7kYLc=;
  b=mHyl5yULz9lA9FWOvWfJoQ3b4D0c71BxUcvA4KHQF5CtHqzW9Ucw8aSv
   bgtcPEWlY7lgk1VfSslFHeN/S3TvCTcdiyP01EaQ6aix6Dd7aqhJDCPgv
   k5RbNiCDJjrUG4USh5dyUTFaN4tF7piRBUL+Kck6l9UqirgFS1sRTw8hA
   c1e/N0OyEw16kCvYcxnRa8s9Ul4N98MefgU9OhuucgR3NKZMJdAGFZipJ
   8ryxf3GwEWnTudNf4VQ3+qi4UjyjfoaGZ0EICNwpkM7HRkk6XM0ik9vQq
   zH7tmVGA/C/ZOjHrhB+xPYz0HL4/+c1zLSIyY+SRkjQcQRVTuqbnlOs+M
   w==;
X-CSE-ConnectionGUID: lOzQi6fHQvWLHg94+U1c3w==
X-CSE-MsgGUID: +rcSwjX3TWeMX8V0TSkgcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="29956073"
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="29956073"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 15:58:47 -0700
X-CSE-ConnectionGUID: F7W2TqUjQO2ChdqR6M7uiw==
X-CSE-MsgGUID: 9fzLCNkFSBaBsHmqp8SKsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="71198055"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Sep 2024 15:58:46 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stEUV-000Iv7-2g;
	Tue, 24 Sep 2024 22:58:43 +0000
Date: Wed, 25 Sep 2024 06:58:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, xiongmengbiao <xiongmengbiao@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13560/14103] drivers/crypto/ccp/hygon/vpsp.c:91:
 warning: This comment starts with '/**', but isn't a kernel-doc comment.
 Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202409250631.b3SgU0xM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d25e57f47750555950b12145f98d5168319e6712
commit: 3ce4cb81ef2b148f6c830c7debb4405e26cded1c [13560/14103] drivers/crypto/ccp: support TKM run on CSV
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240925/202409250631.b3SgU0xM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240925/202409250631.b3SgU0xM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409250631.b3SgU0xM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/hygon/vpsp.c:91: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copy the guest data to the host kernel buffer
>> drivers/crypto/ccp/hygon/vpsp.c:294: warning: Cannot understand  * @brief Directly convert the gpa address into hpa and forward it to PSP,
    on line 294 - I thought it was a doc line
>> drivers/crypto/ccp/hygon/vpsp.c:381: warning: Cannot understand  * @brief copy data in gpa to host memory and send it to psp for processing.
    on line 381 - I thought it was a doc line


vim +91 drivers/crypto/ccp/hygon/vpsp.c

    89	
    90	/**
  > 91	 * Copy the guest data to the host kernel buffer
    92	 * and record the host buffer address in 'hbuf'.
    93	 * This 'hbuf' is used to restore context information
    94	 * during asynchronous processing.
    95	 */
    96	static int kvm_pv_psp_cmd_pre_op(struct kvm_vpsp *vpsp, gpa_t data_gpa,
    97			struct vpsp_hbuf_wrapper *hbuf)
    98	{
    99		int ret = 0;
   100		void *data = NULL;
   101		struct psp_cmdresp_head psp_head;
   102		uint32_t data_size;
   103	
   104		if (unlikely(vpsp->read_guest(vpsp->kvm, data_gpa, &psp_head,
   105						sizeof(struct psp_cmdresp_head))))
   106			return -EFAULT;
   107	
   108		data_size = psp_head.buf_size;
   109		if (check_psp_mem_range(NULL, data_gpa, data_size))
   110			return -EFAULT;
   111	
   112		data = kzalloc(data_size, GFP_KERNEL);
   113		if (!data)
   114			return -ENOMEM;
   115	
   116		if (unlikely(vpsp->read_guest(vpsp->kvm, data_gpa, data, data_size))) {
   117			ret = -EFAULT;
   118			goto end;
   119		}
   120	
   121		hbuf->data = data;
   122		hbuf->data_size = data_size;
   123	
   124	end:
   125		return ret;
   126	}
   127	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
