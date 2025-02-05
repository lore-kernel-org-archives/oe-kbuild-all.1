Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCBC22DFB4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 10:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738749983; cv=none; b=kfBZk6DyHWjFuk8wJxXfGFLWPZBhowT3kml/rCSAhgpLUm4Uw8fivQxuwyNtRi2RKDlqZwWyJ6OyQWL2SjScqvsE14+t4++K1RGPoUgre03Ar4oz6HsgJw4lpvNiXaaKnRagtxx1/0YpTGmp2ZZyXxU1PJVAG89wymQFoe0ILS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738749983; c=relaxed/simple;
	bh=XPZ85soItfqsc4Lg1fZ3REr+FhPKeItBVJhgbk4KwAw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EAqUL5jjM5c4FNcEb/AiUaWYIxFT3vxcVIh04+tt6C8X/Wmau+i1isE/xaPkL+4tVlXvWuHKNKwBxFN+IqsOcLeKiiII+o3sWaKeYrGSYVR3br0+7ZkGP/Nl6TufZElp3CgKvGr/duDSgSVM382x6a8OftxtJW4ctEA/x34X26g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g7hs06aa; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g7hs06aa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738749981; x=1770285981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XPZ85soItfqsc4Lg1fZ3REr+FhPKeItBVJhgbk4KwAw=;
  b=g7hs06aaffv1fmrudLzw3P4J59y5hs34i1gZr9f6VsYdehm7N6L/57ex
   TQsY+MBjLkVrGw1zYWekw2LQR/8r0qyD8vWePJRCPeYqi/ojJ2oWayhPJ
   WhjeHHXlSS9cMeRlXXzElt3A9WimFyXU/fxXHb3xsg/2TtvJGf8VOB+N/
   OqTTssyKalho+597JopQFpdxFQS/RzKybg8hbapinQzkrYB+vWSvrSuzX
   z/hnURcMFT5dYAOH7lAMd6HXRYeijmtC+HPxGN0PuQlha5NXe3PKMXioM
   uizA7ftjEGjhxWPgjLJ6zsmyHAx0D0unzYn2VckypD31VIkV2Ioq09a6V
   w==;
X-CSE-ConnectionGUID: 2HrH24qESBOzz3TbartR+A==
X-CSE-MsgGUID: yKzMZ6KRTJuJ4nqnpXtWog==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38541448"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="38541448"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 02:06:20 -0800
X-CSE-ConnectionGUID: lIRrxTp8S2Cg4sAPufWFJw==
X-CSE-MsgGUID: CAWGdNmgRWGUPDmLkduuEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="141717621"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Feb 2025 02:06:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfcIR-000tjN-2r;
	Wed, 05 Feb 2025 10:06:15 +0000
Date: Wed, 5 Feb 2025 18:06:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2722/2722] ld.lld: error: version script
 assignment of 'LINUX_2.6' to symbol '__vdso_sgx_enter_enclave' failed:
 symbol not defined
Message-ID: <202502051727.gu6nNdpL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sean,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   86893ebd6e3edffebb8d7dc1091533735c6bb082
commit: 5476cb89ef2297bd36f8b38e27b54617b6f63236 [2722/2722] x86/vdso: Implement a vDSO for Intel SGX enclave call
config: x86_64-buildonly-randconfig-001-20250205 (https://download.01.org/0day-ci/archive/20250205/202502051727.gu6nNdpL-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502051727.gu6nNdpL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502051727.gu6nNdpL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: version script assignment of 'LINUX_2.6' to symbol '__vdso_sgx_enter_enclave' failed: symbol not defined
>> llvm-objdump: error: 'arch/x86/entry/vdso/vdso64.so.dbg': No such file or directory
--
>> llvm-objcopy: error: 'arch/x86/entry/vdso/vdso64.so.dbg': No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
