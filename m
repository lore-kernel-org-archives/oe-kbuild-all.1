Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC04612E4A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 May 2024 03:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716520695; cv=none; b=jJYWrMGtgd2RtbQTUZSRsV6ju6f66F34/yfUQRHtRIcgjn0hbq3FQxlCXp7a+3p1wM8bnjalMyDUUHMSAOO8uFRAeTH+z4Z8Aw/xJMw+KG2icjuUp4ErCZMTka3zMhKM2f2cwUR+9YbM5k1E1YNKCDfQvOS8XCbu0VDHKa9HrPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716520695; c=relaxed/simple;
	bh=5v3cf0NFfw9VtcFsmHYv16O9ElT8r/XxbZ15l0EWZC8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BinSWlIvjKHZMxPOPrl7wQ+fwEPTpGNMsprzKLD/DT0mX6KSsyOnGnlTJQHov3i81hoXocDwN6bXdvlVm/PMF8OKNEme9HNf3fjCDcJRMMTKFZGbjV83W26cRu21xQ3CuP5UMLCzwdEWeXrcVZ9gSVybhr3QbDUIN+Xv4JxAp9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jKW91rY/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jKW91rY/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716520694; x=1748056694;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5v3cf0NFfw9VtcFsmHYv16O9ElT8r/XxbZ15l0EWZC8=;
  b=jKW91rY/6yptkPjLa6kkCrQ1IuTsFEfu/il58mDnZsYIITBtGayDA/KR
   X8Zyem+YKOvIPcXYy5UBK/6bRcvl4sqd6grDpR6K5RaHUUq4vUAVnE6ak
   MBKerjWlwgxBQ88gX9VepUUYfXIvaw7ZAstNSn8A+Kgj29XM1U5SdtcA5
   ORTn3L7FC6FjX1j7HmOGv2E21HuZYxqlur17kexKxeSUBUkNXY6xOMrM+
   Y89Q/vaes83btqigkRVTzAgCQO42btGNseQeCCNcVXnYjNFO74MerWaBr
   QXNQpqvWsYx+r/8QA1/H33IbrownbIsXsVFOiT6fXk6aV0VaYTuRs1CqK
   Q==;
X-CSE-ConnectionGUID: mo8QA5tJS6+L/F2dxSUeNw==
X-CSE-MsgGUID: Hzu63MFPThitFMQkHBPh9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="23489614"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; 
   d="scan'208";a="23489614"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 20:18:13 -0700
X-CSE-ConnectionGUID: xQ0SRPM0TqK8PS52GqMrwg==
X-CSE-MsgGUID: PWnbqMwpTRePKMTLaS3hRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; 
   d="scan'208";a="64701617"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 23 May 2024 20:18:11 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sALRT-0003mp-2l;
	Fri, 24 May 2024 03:18:07 +0000
Date: Fri, 24 May 2024 11:17:27 +0800
From: kernel test robot <lkp@intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 67/107] udmabuf.c:undefined reference to
 `vmf_insert_pfn'
Message-ID: <202405241147.o3dxyegy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   732582c0b8771019632ed05af91c4a5ce47c8d2d
commit: 6c33b13e9c704dc19c26503d3875c3b7775a9cd4 [67/107] udmabuf: use vmf_insert_pfn and VM_PFNMAP for handling mmap
config: sh-randconfig-001-20240523 (https://download.01.org/0day-ci/archive/20240524/202405241147.o3dxyegy-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240524/202405241147.o3dxyegy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405241147.o3dxyegy-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: drivers/dma-buf/udmabuf.o: in function `udmabuf_vm_fault':
>> udmabuf.c:(.text+0x1b8): undefined reference to `vmf_insert_pfn'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
