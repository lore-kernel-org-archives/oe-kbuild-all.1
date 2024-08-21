Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D4F1B81CC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 07:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724224821; cv=none; b=sIkImfZD2ThRfB8yNu/lbEx4nLAdozxkWTtExuSL/9yPeZqdbgjOZQ7UTfXVNmf45axHyKjudWP4ClvlM+gO5wMUlXSwxeFhm5a3kHcObSRWX5yrTSK+reKOKMtZS9U6zNhqBFCXcxewLP43mmWaSIJI7ZpdfRX8a+Ie91rH2Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724224821; c=relaxed/simple;
	bh=t7wqAUxlCcmyGYPIfxQMh5lT7/IwbeQnQzScdlKC6/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FOR2YFT511xwADgb5utHFWNxyEIv+xWGRGbSgNtZW7NJiHKPFRjo2OPXJrTg8cCBE5pU/ltcINGsrqqyiHeeDCQZzRlsckUrEZ1jr3x7KOxAmAGzaAN/e0owjOoL1tPmKtAL9rjvIe/NhaQaha6wB3cRy4rk0TUc5hIN0v7xk0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GWhBhjPy; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GWhBhjPy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724224819; x=1755760819;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t7wqAUxlCcmyGYPIfxQMh5lT7/IwbeQnQzScdlKC6/0=;
  b=GWhBhjPyWC4NCKdIu+i0PcxnrBfLC1TbTQrXel9/uUcGy6eMI4S8PFgA
   RAONbTZr5T/K2Sy/uU34Z3jIkhquJc1hK5Q4uavP5b/w9477MyKHEHTmj
   w/x1hmMQHSiKbawcGODMvOsP9mCUSisrCwclqT7ABkuqAFpEYeqanaH+E
   oRqwAzpndMz194Wqc9RWXdJTx7iUR75H2iE8f0oCM/MdXFiOzBWudhPZw
   KQg7Kr7YR5jo2rfX+BU6f6FDINEC7211OCzPfWwd5+eWCO6EoEemmS7oT
   Gbc2GZ+myF+r5vp5XSa1LkXCXMnJwkIuLPP/wo1T26gSSQz1Jip2njSvb
   w==;
X-CSE-ConnectionGUID: Vrn4kcjqS2Kc6ygIOCFTnw==
X-CSE-MsgGUID: 8rRC7DURQICVCPTF/rUTqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="33228833"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="33228833"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 00:20:19 -0700
X-CSE-ConnectionGUID: JP+SJ7c4Sg6PmUIi0lugsQ==
X-CSE-MsgGUID: k0OOmCZPTYKdDFp470cC5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="65843227"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Aug 2024 00:20:16 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgfdd-000B27-1d;
	Wed, 21 Aug 2024 07:20:13 +0000
Date: Wed, 21 Aug 2024 15:19:30 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 9924/9936] arch/x86/kernel/cpu/mce/apei.c:69:6:
 warning: variable 'apei_error' set but not used
Message-ID: <202408211548.ikO0BsE7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   304e0163925d5bb281ad9846c091c122b6cc42a9
commit: 1e425ba9127d344998738688c024490d496c0771 [9924/9936] x86/mce/zhaoxin: Enable mcelog to decode PCIE, ZDI/ZPI, and DRAM errors
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240821/202408211548.ikO0BsE7-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240821/202408211548.ikO0BsE7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408211548.ikO0BsE7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/mce/apei.c:69:6: warning: variable 'apei_error' set but not used [-Wunused-but-set-variable]
      69 |         int apei_error = 0;
         |             ^
   arch/x86/kernel/cpu/mce/apei.c:135:6: warning: variable 'apei_error' set but not used [-Wunused-but-set-variable]
     135 |         int apei_error = 0;
         |             ^
   arch/x86/kernel/cpu/mce/apei.c:171:6: warning: variable 'apei_error' set but not used [-Wunused-but-set-variable]
     171 |         int apei_error = 0;
         |             ^
   3 warnings generated.


vim +/apei_error +69 arch/x86/kernel/cpu/mce/apei.c

    65	
    66	void zx_apei_mce_report_mem_error(struct cper_sec_mem_err *mem_err)
    67	{
    68		struct mce m;
  > 69		int apei_error = 0;
    70	
    71		if (boot_cpu_data.x86 != 7 || boot_cpu_data.x86_model != 91)
    72			return;
    73	
    74		if (!(mem_err->validation_bits & CPER_MEM_VALID_PA))
    75			return;
    76	
    77		mce_setup(&m);
    78		m.misc = 0;
    79		m.misc = mem_err->module;
    80		m.addr = mem_err->physical_addr;
    81		if (mem_err->card == 0)
    82			m.bank = 9;
    83		else
    84			m.bank = 10;
    85	
    86		switch (mem_err->error_type) {
    87		case 2:
    88			m.status = 0x9c20004000010080;
    89			break;
    90		case 3:
    91			m.status = 0xbe40000000020090;
    92			apei_error = apei_write_mce(&m);
    93			break;
    94		case 8:
    95			if (mem_err->requestor_id == 2) {
    96				m.status = 0x98200040000400b0;
    97			} else if (mem_err->requestor_id == 3) {
    98				m.status = 0xba400000000600a0;
    99				apei_error = apei_write_mce(&m);
   100			} else if (mem_err->requestor_id == 4) {
   101				m.status = 0x98200100000300b0;
   102			} else if (mem_err->requestor_id == 5) {
   103				m.status = 0xba000000000500b0;
   104				apei_error = apei_write_mce(&m);
   105			} else {
   106				pr_info("Undefined Parity error\n");
   107			}
   108			break;
   109		case 10:
   110			if (mem_err->requestor_id == 6) {
   111				m.status = 0xba400000000700a0;
   112				apei_error = apei_write_mce(&m);
   113			} else if (mem_err->requestor_id == 7) {
   114				m.status = 0xba000000000800b0;
   115				apei_error = apei_write_mce(&m);
   116			} else {
   117				pr_info("Undefined dvad error\n");
   118			}
   119			break;
   120		case 13:
   121			m.status = 0x9c200040000100c0;
   122			break;
   123		case 14:
   124			m.status = 0xbd000000000200c0;
   125			apei_error = apei_write_mce(&m);
   126			break;
   127		}
   128		mce_log(&m);
   129	}
   130	EXPORT_SYMBOL_GPL(zx_apei_mce_report_mem_error);
   131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
