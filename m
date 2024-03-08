Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B3E2C1AC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 03:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709868458; cv=none; b=ZYQg13fJmk8pxqU8+JXQ+ATNvjkpH6zNmvW/CHJhXT4ZTh6yvzOGAbb9UIialcvNmooQneYgdFgQe2n6o2gGTGdZmEoLrjmpfx7lf6OChtRqmhzBTDcgqBwu8JLQy1reQSJObFpmF4iygc95C35a/SrnEj9diCljzHHyocl5HbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709868458; c=relaxed/simple;
	bh=BOyYXermQx7RX83x/yE6n+sySrus9Hlt573C+93Ksr8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VzOO1v9wXkj0xy/yA7+QF3oCzohVYWs7aYatZ6MS/MB9TJ/W7geoIroV7Ul2K3SsJD+oDMDt6etaGFYNfnMadswEt35AloxkDadKlxTYNB1/S8RlARzRjfLR3Eq0AZI6ynCsIIfpsAva/KpPDc+zRdvUfr+PbXDq+ndqVV8PKFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mmOT2vXk; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mmOT2vXk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709868457; x=1741404457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BOyYXermQx7RX83x/yE6n+sySrus9Hlt573C+93Ksr8=;
  b=mmOT2vXkxKEWjKN2FGDEJaW3IzquF9dvf7mUC+z+PY5uUoFO34CBn08q
   +6ItWgd9LYyEaBuwPwoPvfBQ1lrYhjs9v1QTY5peA1bh5OWQAU4rLWUap
   rAYciLkanmQMeA530D4yF42+Wy+fh81OV3iNqMKL8mJn3aK/7V1dVvUuW
   w6u5Gy1b/3dgZRjAFzoJn/IyE1naHjm6Uvt03WhuTqLTzl3KX/Q1csaH4
   mt4svXmKSJ1QlEdP48Ou67y5Q7cJtOwPHmayKRzgO0TmmC52KZtRru075
   6YYbGkFEoMIiUVYEsSTh5aXijpH8GG1t8KtnTz2kKuladoCUHYQIF/VKh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="22029862"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="22029862"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 19:27:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="10217155"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Mar 2024 19:27:33 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riQtO-0005yX-1Q;
	Fri, 08 Mar 2024 03:27:30 +0000
Date: Fri, 8 Mar 2024 11:26:33 +0800
From: kernel test robot <lkp@intel.com>
To: Phil Elwell <phil@raspberrypi.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [jmondi:pispbe/media-staging/be-upstream 13/143]
 drivers/mfd/rp1.c:86:18: warning: format '%llx' expects argument of type
 'long long unsigned int', but argument 4 has type 'resource_size_t' {aka
 'unsigned int'}
Message-ID: <202403081141.RBCJV2NF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git pispbe/media-staging/be-upstream
head:   b7b928a1ff80dc548d6f5c1b8c00b2082212e38e
commit: fb7bbdfe393a7f6a69e780c5b4b4284ad97c81b8 [13/143] mfd: Add rp1 driver
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240308/202403081141.RBCJV2NF-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403081141.RBCJV2NF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403081141.RBCJV2NF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:8,
                    from include/linux/skbuff.h:28,
                    from include/linux/if_ether.h:19,
                    from include/linux/etherdevice.h:20,
                    from drivers/mfd/rp1.c:11:
   drivers/mfd/rp1.c: In function 'dump_bar':
>> drivers/mfd/rp1.c:86:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
      86 |                  "bar%d len 0x%llx, start 0x%llx, end 0x%llx, flags, 0x%lx\n",
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:150:58: note: in expansion of macro 'dev_fmt'
     150 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   drivers/mfd/rp1.c:85:9: note: in expansion of macro 'dev_info'
      85 |         dev_info(&pdev->dev,
         |         ^~~~~~~~
   drivers/mfd/rp1.c:86:34: note: format string is defined here
      86 |                  "bar%d len 0x%llx, start 0x%llx, end 0x%llx, flags, 0x%lx\n",
         |                               ~~~^
         |                                  |
         |                                  long long unsigned int
         |                               %x
   drivers/mfd/rp1.c:86:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
      86 |                  "bar%d len 0x%llx, start 0x%llx, end 0x%llx, flags, 0x%lx\n",
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:150:58: note: in expansion of macro 'dev_fmt'
     150 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   drivers/mfd/rp1.c:85:9: note: in expansion of macro 'dev_info'
      85 |         dev_info(&pdev->dev,
         |         ^~~~~~~~
   drivers/mfd/rp1.c:86:48: note: format string is defined here
      86 |                  "bar%d len 0x%llx, start 0x%llx, end 0x%llx, flags, 0x%lx\n",
         |                                             ~~~^
         |                                                |
         |                                                long long unsigned int
         |                                             %x
   drivers/mfd/rp1.c:86:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 6 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
      86 |                  "bar%d len 0x%llx, start 0x%llx, end 0x%llx, flags, 0x%lx\n",
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:150:58: note: in expansion of macro 'dev_fmt'
     150 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   drivers/mfd/rp1.c:85:9: note: in expansion of macro 'dev_info'
      85 |         dev_info(&pdev->dev,
         |         ^~~~~~~~
   drivers/mfd/rp1.c:86:60: note: format string is defined here
      86 |                  "bar%d len 0x%llx, start 0x%llx, end 0x%llx, flags, 0x%lx\n",
         |                                                         ~~~^
         |                                                            |
         |                                                            long long unsigned int
         |                                                         %x


vim +86 drivers/mfd/rp1.c

    82	
    83	static void dump_bar(struct pci_dev *pdev, unsigned int bar)
    84	{
    85		dev_info(&pdev->dev,
  > 86			 "bar%d len 0x%llx, start 0x%llx, end 0x%llx, flags, 0x%lx\n",
    87			 bar,
    88			 pci_resource_len(pdev, bar),
    89			 pci_resource_start(pdev, bar),
    90			 pci_resource_end(pdev, bar),
    91			 pci_resource_flags(pdev, bar));
    92	}
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
