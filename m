Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910B41E8342
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Feb 2026 01:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771466360; cv=none; b=jc/F9ytIEgEXML1DQq1CEMNyz2ko1N8BVExgf1646isKgneKnzdTeBNc478FRho+nugD3SlJO4cyfFti4FNYE6TqZoUoHALMpKlZ7OuqFRLxffn/r+gRBC41M23GmXdHmmz5NAddGlbheWMmqPgtfr3SNmXgWWdbTqN9uFodPsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771466360; c=relaxed/simple;
	bh=HBT0l13krNbUhGKe8rtYHJID04IZ4wdcrz9++9CFyr8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RwxBz+mNEBze0wrdsEby0ELPqpoA53IAf+2v4+uCSb5U2HCcLixerCh1MdQFEvVfUVSjduPJqKGSJS0eCVffuKkX+v6dtqXeB+/cZ04Jx1A0vD4CXOXvZUBiPj95STLmYGuQ76wctm+dR7DEdU4G1Rdb4zlD/BBOkT+EZtM/wII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GZxhe7Vy; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GZxhe7Vy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771466359; x=1803002359;
  h=date:from:to:cc:subject:message-id;
  bh=HBT0l13krNbUhGKe8rtYHJID04IZ4wdcrz9++9CFyr8=;
  b=GZxhe7VyVwATh2AO3GalULFdX0RmApDlP3HOsPSrdiKgD6pv70hJ4IYX
   5KbvLD/VOlCHUh1UP5tJr1yaxKS+tdcsJ8t48oD3+YXstfA9HISFasRYW
   mqcpG01mCmjj8S8rjMjZZsTHNQrS/EelAG0Tt+baeJ4Z5CwO2OSLiZg9Y
   i4GS6ytCFYlcFHcQGmX7IXaJNCWy9+VgGOyeUmefINYraZJ3JR7w2vQ4e
   08PQEWMBbCVFM58zjjx7nYipgBHQ2AZWsdP59CrshwjHUPcuDLIoJP58j
   EqjSvVyf2H75H8CNbzR/69Mbe1Yyi7Yz/U1dYKSJI9rJ1c8STlNd+mz8R
   Q==;
X-CSE-ConnectionGUID: ilK/XGbVTH+Q2cumFhLPqw==
X-CSE-MsgGUID: 9yXbh1ksREyZdfUGYxgB+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72439123"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="72439123"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 17:59:18 -0800
X-CSE-ConnectionGUID: 5I03jiYfSwmhnNGuOALFaQ==
X-CSE-MsgGUID: Hu7DMNyvRPejWZMgQ0qsrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="218515826"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Feb 2026 17:59:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vstJy-000000012su-1RM4;
	Thu, 19 Feb 2026 01:59:14 +0000
Date: Thu, 19 Feb 2026 09:58:25 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:prtpbf 7/12] arch/s390/kvm/gaccess.c:1240:1: error:
 version control conflict marker in file
Message-ID: <202602190955.2r7M1eU3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/norov/linux prtpbf
head:   183ff67aea429409014d667994833a8a6523f3d3
commit: 0b47de2cc7113ef282356c35ff8088d03e4e0510 [7/12] mm: add rest_of_page() macro
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260219/202602190955.2r7M1eU3-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602190955.2r7M1eU3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602190955.2r7M1eU3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/s390/kvm/gaccess.c:1240:1: error: version control conflict marker in file
    1240 | <<<<<<< HEAD
         | ^
   1 error generated.


vim +1240 arch/s390/kvm/gaccess.c

  1224	
  1225	/**
  1226	 * check_gpa_range - test a range of guest physical addresses for accessibility
  1227	 * @kvm: virtual machine instance
  1228	 * @gpa: guest physical address
  1229	 * @length: length of test range
  1230	 * @mode: access mode to test, relevant for storage keys
  1231	 * @access_key: access key to mach the storage keys with
  1232	 */
  1233	int check_gpa_range(struct kvm *kvm, unsigned long gpa, unsigned long length,
  1234			    enum gacc_mode mode, u8 access_key)
  1235	{
  1236		unsigned int fragment_len;
  1237		int rc = 0;
  1238	
  1239		while (length && !rc) {
> 1240	<<<<<<< HEAD
  1241			fragment_len = min(PAGE_SIZE - offset_in_page(gpa), length);
  1242			rc = vm_check_access_key_gpa(kvm, access_key, mode, gpa);
  1243	=======
  1244			fragment_len = min(rest_of_page(gpa), length);
  1245			rc = vm_check_access_key(kvm, access_key, mode, gpa);
  1246	>>>>>>> 831f67e4885e (mm: add rest_of_page() macro)
  1247			length -= fragment_len;
  1248			gpa += fragment_len;
  1249		}
  1250		return rc;
  1251	}
  1252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
