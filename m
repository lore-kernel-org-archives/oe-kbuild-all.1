Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1070A2594A4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Dec 2024 03:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735441299; cv=none; b=rAOO4Yx792cE/UQH9g52b7+ZW1AH1MqSj0CMck/tSGGTHYPLyxfwllTVnhahbS2jYVxOP8FFnBcSe01diGTc9J4i7DCdURWei4JSAC56uU/JPMJQYqc1L314LzXxSqzbokcmoQZaih4RrTAhhYHbnJu/Q5+jEpFq5plA1t+WYE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735441299; c=relaxed/simple;
	bh=+o5v+YBWE7+6PWcIocx41knJBjoyPjcCcjJfLMWsa4A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rTJiosAz8BHT+g3K2LxVCuULCXS8xR6kckwgdFhccdTaRCNUmykLTlBsUI7AupSG2LM/hUFOSFeSb96npsPmiHRLKTVK+s4Kkgy5AoIHPnPHBNaQhQgV3EUkYOTi/leHqgq3n/iGQpGJ/zRxLFZuarJKZNSO45YEYkFBfQYQ5HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tn5DZze1; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tn5DZze1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735441297; x=1766977297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+o5v+YBWE7+6PWcIocx41knJBjoyPjcCcjJfLMWsa4A=;
  b=Tn5DZze1vOZY5xOuYDm6nDwV66PUCsp5b7sc6XXSiXed8ChRNSy6ISYv
   yjXJw0SrxfKAbCWRLdXF1oTHksi3SFIm59dJ2fr7ruJjn4E0qbDeWHoWV
   2xX/CYYj3ukPIQJM41IMvjWGaIwYIs81/Cl7FpKIrdGB5KKX9xIiItWLt
   1rDDznshO+gMjmreB0L7FOJ+nNhLnbSmPkFiZW++ui2qjU5IbGxoPusZ1
   rx+h59J4/XItU9OIUV+hI2AxfC34dwnc5QdvC+gHrEDKYLYMrZA7nlwcY
   fFMiB1J7I56Me0jpb+kz9UUt9nStJDmexkCvx4z9/h6JTXYXu803G0OQJ
   A==;
X-CSE-ConnectionGUID: Dnykqp7/QiKmU92M+dSwNg==
X-CSE-MsgGUID: Fwccp0XlQqaFjQlhSLGmsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="46773542"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="46773542"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 19:01:36 -0800
X-CSE-ConnectionGUID: aVWQKU4cT/imKZ9bwJMoDQ==
X-CSE-MsgGUID: GkSKHQlzQRaLXi1IsDZpgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105466970"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Dec 2024 19:01:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRjYb-0004RY-1A;
	Sun, 29 Dec 2024 03:01:33 +0000
Date: Sun, 29 Dec 2024 11:01:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yifan Qiao <qiaoyifan4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2589/2589] fs/ext4/xattr.o: warning: objtool:
 ext4_xattr_inode_lookup_create()+0x3f1: unreachable instruction
Message-ID: <202412291044.42VlRDrU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   4848f81edc2027721953fee5ded81f909a833e26
commit: b54fa08a1495ec807a8fa5a4bcab38baf536ec65 [2589/2589] ext4: do not create EA inode under buffer lock
config: x86_64-buildonly-randconfig-002-20241218 (https://download.01.org/0day-ci/archive/20241229/202412291044.42VlRDrU-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412291044.42VlRDrU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412291044.42VlRDrU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ext4/xattr.o: warning: objtool: ext4_xattr_inode_lookup_create()+0x3f1: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
