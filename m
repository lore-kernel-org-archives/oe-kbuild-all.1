Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F7A21C163
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 May 2025 11:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748516595; cv=none; b=mydpldj9aTH6BaL7SoQtZoQBp1poHUYJE38av5gS3DNIHtgNp0jDeIPi5Eqqh1DVHZcX3846kSQ1fg97aHW2CXsK8IrMgpXXJccko9reg8BibPE84EN13NH/NRcN6D8P77zvTolgxxnmNT7eSEC0CWRLsE54w536Y+XDdgb2CTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748516595; c=relaxed/simple;
	bh=pnXWe2JbAaKvk4uIDdKMtxkxt+73XR61LlkSEseqSV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ADsUaYBxCJOM9cuxDzAgGIyRoIWE9fCnLZxS/CXmoHshIDb5bgc2Z1+YYILzw3s7FK2LVJ/UWpBHZXteOfbUDjEFI6FFl7qQLUkRIFMN1lbVl2md1OiJciczD5fExkb0QE7EIhnXpDCB/yoqwEpvTOe+d3arMKo5YuftGvFgaAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d4etdpoJ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4etdpoJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748516594; x=1780052594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pnXWe2JbAaKvk4uIDdKMtxkxt+73XR61LlkSEseqSV0=;
  b=d4etdpoJ9KPQwk9dKWXE0I9zz4q4zC8FhnZh/wrO7FAtFUPv/0rT31IS
   z07wc99HpRX8EXDKvCwFrr4VngZ0+THdkLik+lgCLNXT9L8ODs7N2A8w1
   JVAasPZYBC08mmCwkWnm8ywaJxrYaSNsv0d/ySDGaWxI5g4qWBvgjL92c
   VXyJMmGh6VB+v9qEiaXi861esefG6QdDnQd07uHgvCfngCp2ToQnR+tbH
   Gw5cwkNHJSKZmsVapt1wKn1Bwz7Bz1gl6AfKIvGZGWQTCc6el0mX7v6v1
   Ww+3UevbadukAPrf9WnUH6xwS7wPoziFu10/KgjhmKUuvG1QC6/bg2zxZ
   g==;
X-CSE-ConnectionGUID: hL650OMcSOig7os/85UhOw==
X-CSE-MsgGUID: Jna/xzHiRcWPMusrtQn8eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="54369590"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="54369590"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 04:03:11 -0700
X-CSE-ConnectionGUID: 0i4N47HUSDSMrVYNszgzew==
X-CSE-MsgGUID: 43yRcUewTiyMHetPWA208g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="148303611"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa003.jf.intel.com with ESMTP; 29 May 2025 04:03:10 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKb2R-0000G1-2U;
	Thu, 29 May 2025 11:03:07 +0000
Date: Mon, 26 May 2025 20:21:29 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 0/1] lib/find_bit.c:46:15: warning: no
 previous prototype for '__find_nth_bit'
Message-ID: <202505262012.ntVFIaKo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   de277dab626c9ece4c9cf99ec9c56f23b298a042
commit: 8b9a759b54b442fb86b9fe4182c933103c12bebb [0/1] lib: add find_nth{,_and,_andnot}_bit()
config: x86_64-buildonly-randconfig-2002-20250514 (https://download.01.org/0day-ci/archive/20250526/202505262012.ntVFIaKo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250526/202505262012.ntVFIaKo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505262012.ntVFIaKo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/find_bit.c:46:15: warning: no previous prototype for '__find_nth_bit' [-Wmissing-prototypes]
      46 | unsigned long __find_nth_bit(const unsigned long *addr, unsigned long size, unsigned long n)
         |               ^~~~~~~~~~~~~~
>> lib/find_bit.c:52:15: warning: no previous prototype for '__find_nth_and_bit' [-Wmissing-prototypes]
      52 | unsigned long __find_nth_and_bit(const unsigned long *addr1, const unsigned long *addr2,
         |               ^~~~~~~~~~~~~~~~~~
>> lib/find_bit.c:59:15: warning: no previous prototype for '__find_nth_andnot_bit' [-Wmissing-prototypes]
      59 | unsigned long __find_nth_andnot_bit(const unsigned long *addr1, const unsigned long *addr2,
         |               ^~~~~~~~~~~~~~~~~~~~~


vim +/__find_nth_bit +46 lib/find_bit.c

    45	
  > 46	unsigned long __find_nth_bit(const unsigned long *addr, unsigned long size, unsigned long n)
    47	{
    48		return FIND_NTH_BIT(addr[idx], size, n);
    49	}
    50	EXPORT_SYMBOL(__find_nth_bit);
    51	
  > 52	unsigned long __find_nth_and_bit(const unsigned long *addr1, const unsigned long *addr2,
    53					 unsigned long size, unsigned long n)
    54	{
    55		return FIND_NTH_BIT(addr1[idx] & addr2[idx], size, n);
    56	}
    57	EXPORT_SYMBOL(__find_nth_and_bit);
    58	
  > 59	unsigned long __find_nth_andnot_bit(const unsigned long *addr1, const unsigned long *addr2,
    60					 unsigned long size, unsigned long n)
    61	{
    62		return FIND_NTH_BIT(addr1[idx] & ~addr2[idx], size, n);
    63	}
    64	EXPORT_SYMBOL(__find_nth_andnot_bit);
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
