Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77045629F6
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 20:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707163243; cv=none; b=t8/jFLZv23KoO9YaCU0m9sLHJVQPtCc5TuoyoY8ncIJBYrtUUz10KTq1MattPNgkFcuc1e5q8UanF6+Oq9vktGsD/bP1aiwaGMcZzxnNfps/Q9CzofZfNWoeMDeQeeRoowLuV0ONDRbN6e6tCbio5sgBntpNeKWGwcPqS7wK6X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707163243; c=relaxed/simple;
	bh=C72JHJVOy+nRp1hTNAXHqrLJp3A62K8GdThB7qQKYrY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z+JBTemoXQ9bW5KEandLqnvJIXNrsa9eIuJ/C5d0ZnrCi22LxpxAQul3KKWZh9FaQwQWEInyPwwqECnf9O4gtyJxJZE/ZewMgGOeTBwqBd0LZ3bI8+Lk2766cV3ClMifasHl6HXJouupIvljLCKI4G5PGoJ81kEEPtEhpNzHMPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hFpPs2jn; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hFpPs2jn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707163241; x=1738699241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C72JHJVOy+nRp1hTNAXHqrLJp3A62K8GdThB7qQKYrY=;
  b=hFpPs2jn8bQWVh+axsnZJMmvk7N6RRPwMJi5p1W72D471sB1CoocmYUj
   i6Hbp2MfVGUf6b5v0I/IpPfJcw+8HeqY0SIpErS6jzJZM2vYD1wYi5STb
   eLQ23yQQ6nyzb69RhaLFKI/ONdCXl8tAb+z3/d2lIG1e7bggWJGMqEpCR
   nwv3XMDvngyaN6e+lg3UXH8/P7YMQgK81L2/UdhBUr6IOC06oscsiA54E
   nIbi2jCrtF2IXysrBcYrxzoIcXTJmDqvEWsp8jzhQ1JIp1JuhJ7Nc5iU6
   CMdOr3Rv2Fg2BtLyHKONAOSLUz4itDHXNrcQAmxYlrBGjQmi0IrbHXpsE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="11333145"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="11333145"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 12:00:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="1117664"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Feb 2024 12:00:38 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rX58u-0000m4-1j;
	Mon, 05 Feb 2024 20:00:36 +0000
Date: Tue, 6 Feb 2024 04:00:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15494/21616]
 drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.o: warning: objtool:
 missing symbol for section .text
Message-ID: <202402060344.3muEo68Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3a28772f4b29bdda924e9a5d2e3ff1ff1b23fd14
commit: d83c305cb9b2708b835a47c9ddcbcab97cf70c9f [15494/21616] Huawei BMA: Adding Huawei BMA driver: host_kbox_drv
config: x86_64-buildonly-randconfig-001-20240203 (https://download.01.org/0day-ci/archive/20240206/202402060344.3muEo68Z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240206/202402060344.3muEo68Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402060344.3muEo68Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:42:6: warning: no previous prototype for 'kbox_write_to_pci' [-Wmissing-prototypes]
      42 | void kbox_write_to_pci(void __iomem *dest, const void *src, int len,
         |      ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:111:6: warning: no previous prototype for 'kbox_read_from_pci' [-Wmissing-prototypes]
     111 | void kbox_read_from_pci(void *dest, void __iomem *src, int len,
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:172:6: warning: no previous prototype for 'kbox_memset_pci' [-Wmissing-prototypes]
     172 | void kbox_memset_pci(void __iomem *dest, const char set_byte, int len,
         |      ^~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.o: warning: objtool: missing symbol for section .text
--
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_dump.c:35:19: warning: 'g_day_in_month' defined but not used [-Wunused-const-variable=]
      35 | static const char g_day_in_month[] = {
         |                   ^~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/bma/kbox_drv/kbox_dump.o: warning: objtool: missing symbol for section .text
--
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_panic.c: In function 'kbox_dump_painc_info':
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_panic.c:85:9: warning: function 'kbox_dump_painc_info' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
      85 |         num = vsnprintf(tmp_buf, sizeof(tmp_buf) - 1, fmt, args);
         |         ^~~
>> drivers/net/ethernet/huawei/bma/kbox_drv/kbox_panic.o: warning: objtool: missing symbol for section .text
--
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_main.c: In function 'kbox_init':
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_main.c:99:55: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
      99 |                 KBOX_MSG("kbox_printk_init failed!\n");
         |                                                       ^
>> drivers/net/ethernet/huawei/bma/kbox_drv/kbox_main.o: warning: objtool: missing symbol for section .init.text
--
>> drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_image.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
