Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13BF624
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Dec 2024 07:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734940152; cv=none; b=rYEDqCBvzDZI6c4To1ItyKkMfuityaPHyE/luCS9cYesS2VWpub+zs0xfYCWkW+Ur6Mfp5Os7wSesNv/g2XGBFwG6QYMnOwDt4MT6kESELJtWC+lJLGJ5MI3v3RoayobLCtRkILAaB2PjNlicnv0VCgWo5xohah0QH5Coq1IAwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734940152; c=relaxed/simple;
	bh=wInYTQZbFcoRGsU2UBD57PceG2zxvIpYWrNfBdhWL3A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GVKgVKI5t9LH/1Oo4RogaeZNcoAnH3qcXqGCvMF6Lkq3qhqbmUh6vknY9+qgs5Cz/84JqXtMmrG8RQM9+0WZY4y8ApIiukaHdSTq7hVlr5TI96iNwuVf8en82Fod9GTpvCtUs8X89y2bwb6TgoxBq4+DvbkFwvuErO65g+ZXpKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VhAbodKE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VhAbodKE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734940151; x=1766476151;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wInYTQZbFcoRGsU2UBD57PceG2zxvIpYWrNfBdhWL3A=;
  b=VhAbodKEwMnJME0vMLA9LkGxyXBhs8ND39uKRdhpEc9/cMnhICQGG5PC
   CYSGS5Qk/xJiG1huR/iekYU5GC9NFW6B4aEHK7xRTJBlxTdkMoPAlRN4u
   hWw89vXGgXjSBT0QeZZKYwTVFMmN/WBoqizqA+JBXn0KUYDMNILNM+4uY
   F8BH8mWCcslqoN+5NJrOddY4bWX5CLZlw6tIHINJiyBIT1OS9YwUk1dZ4
   gC6gzeqyYxBSF53CwhoWyu4ODNjh/uHWdWsHlwiAAeJ9poLP8Exct7Ibn
   puDs4Gjr0sxr5ZrmWg42QLxhZUgHmBRz4zVUzKIuyjbH2ZyvKaQ8VxwP6
   Q==;
X-CSE-ConnectionGUID: 8rc4axHqSr6P3FQenrnvPA==
X-CSE-MsgGUID: FIs8UI2kRzqJYIr5j6I42g==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="46818787"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="46818787"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 23:49:10 -0800
X-CSE-ConnectionGUID: rOxHmYZESxKMhtWcrJugoQ==
X-CSE-MsgGUID: ZgwdeX0ORzyOcvrovH596A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="99357935"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Dec 2024 23:49:09 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPdBb-0003Tf-0V;
	Mon, 23 Dec 2024 07:49:07 +0000
Date: Mon, 23 Dec 2024 15:48:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1342/1342] drivers/pci/pcie/dpc.o:
 warning: objtool: missing symbol for section .init.text
Message-ID: <202412231501.bSKogE49-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Keith,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   765b132216f73bb52fced28360c98a386ee20152
commit: 58d584102f06f870f118644f1022c751e015e7bb [1342/1342] PCI: portdrv: Initialize service drivers directly
config: x86_64-buildonly-randconfig-002-20241223 (https://download.01.org/0day-ci/archive/20241223/202412231501.bSKogE49-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241223/202412231501.bSKogE49-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412231501.bSKogE49-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/pcie/dpc.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
