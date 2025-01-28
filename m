Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601511D61BC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jan 2025 18:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738089020; cv=none; b=Hs0NHOfk/El0cKAs+LQ+/tDUzl2qWIPXYoHOJGtW3RtyzQ0H4kdL8nytrGKnANaIcaml0uxlSbNpTirLCM79n0U5FyflHjtc/TpleBfvCT00mCNiDkm4nNbtjLIVBk9FSoyZ5LGhsI4zFZYCDKDpH1hOtFaD14/O0X5lkIDQZ8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738089020; c=relaxed/simple;
	bh=pKLc0XDpBwOGrpY/61sW+flZqq0cxkmEnWJxyo2Z8OA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HCQrg5qU7UT5jWBvHZfW+8DKEKxF46TgmapZHfxymS/gA7qocGWrgsvOFZXxfMCspLI5721wZVyebSXv4bRcdYTHWAVuX1vE0Ql6mcQ8EOQXUzpk9kmx6itjUVeDFPSG6lhzqr1DT8JQRWeyAIp61dGj8t3PzpAE8UDGKzhWG00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iVcLjXLv; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iVcLjXLv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738089017; x=1769625017;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pKLc0XDpBwOGrpY/61sW+flZqq0cxkmEnWJxyo2Z8OA=;
  b=iVcLjXLv+kaGACeZlTuU6LzKTl+nb9gvewDtXx9snMyeUB83FEaI95MJ
   gPoCjpOyKos0ThgrjUW0m4wqxToE2OHeNkRIunjz/yHY5UrMyd0of6xYU
   4mcEdYIhsv6zWEvYw9BXGGWbDTB1UHTkS0KHwtsuQBZrDETGLHG/6d4TS
   e+diyTeYyDc7/67y8IYlOMlLh0t2lUH1pKDkCReviNLADh27SWWfDulsC
   tnEH5kGf6taX/WDj7Rc2tYlyHD6z9Kbz95DeF4HT4DobxTsQ1yV/NdwpH
   K5uhdrqxOzveNnDjfWEymIveNTXOjY2ID0cj8sTWQG/4P4xN9bZSYpE5M
   A==;
X-CSE-ConnectionGUID: XfoKunq0QXWyIIbP5uDQhg==
X-CSE-MsgGUID: QYXIRajBQPq3XFo9tYfepQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38472645"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="38472645"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 10:30:15 -0800
X-CSE-ConnectionGUID: CTRnCWATQvqTG7E0+nltiw==
X-CSE-MsgGUID: WC+KK5QLSYOcp88aXgRR4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="139702465"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Jan 2025 10:30:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcqLj-000i5t-1o;
	Tue, 28 Jan 2025 18:30:11 +0000
Date: Wed, 29 Jan 2025 02:29:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1407/1407]
 include/asm-generic/bitops/non-atomic.h:106:27: warning: array subscript
 'long unsigned int[0]' is partly outside array bounds of 'u32[1]' {aka
 'unsigned int[1]'}
Message-ID: <202501290212.Q2TSAA3o-lkp@intel.com>
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
head:   da51139d17e9d53d61a9877d9042e43b85d71ee1
commit: a6a7981cbf66d4951425d33cdce6ef39206eba83 [1407/1407] Net: ethernet: Support 3snic 3s9xx network card
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250129/202501290212.Q2TSAA3o-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250129/202501290212.Q2TSAA3o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501290212.Q2TSAA3o-lkp@intel.com/

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

4117b02132d1cf9 Akinobu Mita 2006-03-26   98  
4117b02132d1cf9 Akinobu Mita 2006-03-26   99  /**
4117b02132d1cf9 Akinobu Mita 2006-03-26  100   * test_bit - Determine whether a bit is set
4117b02132d1cf9 Akinobu Mita 2006-03-26  101   * @nr: bit number to test
4117b02132d1cf9 Akinobu Mita 2006-03-26  102   * @addr: Address to start counting from
4117b02132d1cf9 Akinobu Mita 2006-03-26  103   */
4117b02132d1cf9 Akinobu Mita 2006-03-26  104  static inline int test_bit(int nr, const volatile unsigned long *addr)
4117b02132d1cf9 Akinobu Mita 2006-03-26  105  {
d05be13bcc6ec61 Jiri Slaby   2007-10-18 @106  	return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
4117b02132d1cf9 Akinobu Mita 2006-03-26  107  }
4117b02132d1cf9 Akinobu Mita 2006-03-26  108  

:::::: The code at line 106 was first introduced by commit
:::::: d05be13bcc6ec615fb2e9556a9b85d52800669b6 define first set of BIT* macros

:::::: TO: Jiri Slaby <jirislaby@gmail.com>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
