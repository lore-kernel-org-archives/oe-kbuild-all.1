Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A01B20C488
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 18:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745950039; cv=none; b=B1ZKXBT8zDMYl7TsrNtlEy/NU8c3eAt6urld8IaubC/j56MZ/q+cIxfDit6f2lLtJraxS3GLNZX8YNh84NhsOmBvvrO3xseBwZ3XrajbYDXiS31gwaVKVVwp7T37wLRxRe8J6gAuoS9ro+WMtZhQRMDMGHGfQycSaGKEMAjuXHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745950039; c=relaxed/simple;
	bh=EzVPEfSpKDN0w/E4XXm5hhzpNIbXuAPez6aaGEuJ7ds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LmSnfGnIjHOA4rvIj2qiPTzUJiUrRYoZaYrNp2k9FI/0mBp3TqlusjMoCwNHCmjy6FPMpCSy4QHP0rtwbClQS+16jrlww87fMf74QE6NpPJHsvf4W8dP7ZYQXfR9PagHyv9PSR5LzqfeI/yoY0rmPFhEF/LSiKr+ZgwoITDPJtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bMC1jzNV; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bMC1jzNV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745950037; x=1777486037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EzVPEfSpKDN0w/E4XXm5hhzpNIbXuAPez6aaGEuJ7ds=;
  b=bMC1jzNVbFT6wTfYxRQoRNVxgfLgfLFuXcLEV63qFJmZwmFyB+OLKg8v
   d7OzsfnLDncjVDZ/K3Hcwg0GiMBknuE0LpTRqYu2g+4FAiphey0HR+N+2
   VPNP/vj/ju3Ib9WX6l1g9p+xoyUvmojktluLdstAGtpqd1FBfNcoAPq9h
   hu5CJZ8aVVYBK8Ost2hE0tZf9I5EopeA6Tqqn7so/gl3mSaUAgh5PGaV9
   OuV+HVMQMy5YE2r3Kr5U3LsfgLJI0G8n6nxmAVCg6AnNxdVkgcyqkyg0a
   94DbX1We5NdrAPd7m2Cbj394EWp/OQd6DZ7AjXfCIDiF0+Hp4P+TP+F7/
   w==;
X-CSE-ConnectionGUID: vDd3jxjkQaiI5lZq0bm1og==
X-CSE-MsgGUID: KvSpGWoZQ52c5acuZBHuOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="58244548"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="58244548"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 11:07:09 -0700
X-CSE-ConnectionGUID: ENQItulYRHeSLOr73WtoWQ==
X-CSE-MsgGUID: zbvN2X0LQTGfNk2x1jQIQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="137919021"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Apr 2025 11:07:08 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9pMI-0002U7-19;
	Tue, 29 Apr 2025 18:07:06 +0000
Date: Wed, 30 Apr 2025 02:06:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1597/1597]
 include/asm-generic/bitops/non-atomic.h:106:27: warning: array subscript
 'long unsigned int[0]' is partly outside array bounds of 'u32[1]' {aka
 'unsigned int[1]'}
Message-ID: <202504300130.TAvuRGbz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Steven,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a48a35466505c8a52da57596944bd0b4485e825f
commit: a6a7981cbf66d4951425d33cdce6ef39206eba83 [1597/1597] Net: ethernet: Support 3snic 3s9xx network card
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250430/202504300130.TAvuRGbz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300130.TAvuRGbz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300130.TAvuRGbz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats_api.c:492:5: warning: no previous prototype for 'sss_nic_get_io_stats_size' [-Wmissing-prototypes]
     492 | u32 sss_nic_get_io_stats_size(const struct sss_nic_dev *nic_dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/bitops.h:39,
                    from include/linux/bitops.h:20,
                    from include/linux/kernel.h:11,
                    from drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats_api.c:6:
   In function 'test_bit',
       inlined from 'sss_nic_add_ethtool_link_mode' at drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats_api.c:764:7:
>> include/asm-generic/bitops/non-atomic.h:106:27: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'u32[1]' {aka 'unsigned int[1]'} [-Warray-bounds=]
     106 |         return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
         |                       ~~~~^~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats_api.c: In function 'sss_nic_add_ethtool_link_mode':
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats_api.c:759:40: note: object 'hw_mode' of size 4
     759 |                                    u32 hw_mode, u32 op)
         |                                    ~~~~^~~~~~~


vim +106 include/asm-generic/bitops/non-atomic.h

4117b02132d1cf Akinobu Mita 2006-03-26   98  
4117b02132d1cf Akinobu Mita 2006-03-26   99  /**
4117b02132d1cf Akinobu Mita 2006-03-26  100   * test_bit - Determine whether a bit is set
4117b02132d1cf Akinobu Mita 2006-03-26  101   * @nr: bit number to test
4117b02132d1cf Akinobu Mita 2006-03-26  102   * @addr: Address to start counting from
4117b02132d1cf Akinobu Mita 2006-03-26  103   */
4117b02132d1cf Akinobu Mita 2006-03-26  104  static inline int test_bit(int nr, const volatile unsigned long *addr)
4117b02132d1cf Akinobu Mita 2006-03-26  105  {
d05be13bcc6ec6 Jiri Slaby   2007-10-18 @106  	return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
4117b02132d1cf Akinobu Mita 2006-03-26  107  }
4117b02132d1cf Akinobu Mita 2006-03-26  108  

:::::: The code at line 106 was first introduced by commit
:::::: d05be13bcc6ec615fb2e9556a9b85d52800669b6 define first set of BIT* macros

:::::: TO: Jiri Slaby <jirislaby@gmail.com>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
