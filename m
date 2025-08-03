Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D34F15B135
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Aug 2025 03:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754190734; cv=none; b=VvdwXERgiK1dTMxKlXT6k4VwO1Tu5cTJLKz7cEcFEHIOQjG/PDX9yk72rmjwRzZ5HHeXBqb65suihTKUMigKgAi7JMlv+43akb9GvPmf8I+PfH0IYJySusweXoLoqkimFcH0MzC2af8V4UCsSoQ1EhfAqaHE4nuo+ZB6Mto8608=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754190734; c=relaxed/simple;
	bh=3aSl6hRDyPAlEiw/jbmM3lv0wo4M1+U3it3864oWUjE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dOISRdhJ7mHW2ZV+D7b8VIt9nMoM4X7Xk0/WMliT2oqa9vBiMvGKoChu4emGKLP5e5SCu7SRf+o9RI7W1WjbK+azHpHXWtffbL5h9xXPoqzK2dM6YbakUPdJx0O0wtxbLWfVOwkjIFMhrTyhexkwdXDyBYnJrOg/GmsVVA6ZMKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cCq09Re5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cCq09Re5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754190732; x=1785726732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3aSl6hRDyPAlEiw/jbmM3lv0wo4M1+U3it3864oWUjE=;
  b=cCq09Re5cTWnB9mJjOwS6IrmAxoVz2+3WlyRVNLldLZC4YxkLT3yI1Z/
   9BRW5TBZ61UrbqjlvoL7uF7KKc+EJZrRxBHYwWkLTrWqIVxnhgFSj5RYC
   FWea8trBqObos3xSjVWJn2ajBTD/SrJkUm+AAbZyXOtvp9YEfOcRI60xm
   j2r85bEn9brou3KtQna4PyeYQagOn91FyfbKLCgpysKmf04oOMjtoBeG2
   VMZW0x8YoG13BgG1wQSHREeHTEgXCicxtYNwKmWnb8Mgwtungb3nEksAP
   I9+7NMHEkQkJ5ZebdZApMpGXWHDm7MU8Cge+dPGVW2f9CWuj2Qe5r7bs3
   A==;
X-CSE-ConnectionGUID: mwPggvL8TyOsXdmEXm5iqw==
X-CSE-MsgGUID: WFgVKBAbRE669704S8uTRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="55545476"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="55545476"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 20:12:11 -0700
X-CSE-ConnectionGUID: XPcVwM0LRAaU4VHIGNm5bQ==
X-CSE-MsgGUID: fvf0ACakT6u3VYI5F7kqLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168062288"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 Aug 2025 20:12:10 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiP8q-0005ke-1l;
	Sun, 03 Aug 2025 03:12:08 +0000
Date: Sun, 3 Aug 2025 11:12:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2630/2630] arch/arm64/include/asm/xcall.h:13:31:
 error: '__NR_syscalls' undeclared here (not in a function); did you mean
 'rseq_syscall'?
Message-ID: <202508031142.M80c8vhN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e5f0407c7ee0aba1c7b2ab0f516e9dfb707a0ee2
commit: b5fb30ccdb3d8ed46e1e740d9aaebcb96f8db97a [2630/2630] arm64: Reserve a kabi in task_struct exclusively for xcall
config: arm64-randconfig-r113-20250803 (https://download.01.org/0day-ci/archive/20250803/202508031142.M80c8vhN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250803/202508031142.M80c8vhN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508031142.M80c8vhN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/vdso/const.h:5:0,
                    from include/linux/const.h:4,
                    from include/linux/align.h:5,
                    from include/linux/bitmap.h:7,
                    from arch/arm64/kernel/xcall.c:8:
>> arch/arm64/include/asm/xcall.h:13:31: error: '__NR_syscalls' undeclared here (not in a function); did you mean 'rseq_syscall'?
     DECLARE_BITMAP(xcall_enable, __NR_syscalls);
                                  ^
   include/uapi/linux/const.h:34:40: note: in definition of macro '__KERNEL_DIV_ROUND_UP'
    #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                           ^
   include/linux/types.h:11:21: note: in expansion of macro 'BITS_TO_LONGS'
     unsigned long name[BITS_TO_LONGS(bits)]
                        ^~~~~~~~~~~~~
   arch/arm64/include/asm/xcall.h:13:2: note: in expansion of macro 'DECLARE_BITMAP'
     DECLARE_BITMAP(xcall_enable, __NR_syscalls);
     ^~~~~~~~~~~~~~


vim +13 arch/arm64/include/asm/xcall.h

    10	
    11	struct xcall_info {
    12		/* Must be first! */
  > 13		DECLARE_BITMAP(xcall_enable, __NR_syscalls);
    14	};
    15	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
