Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8EB8467
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 05:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730438892; cv=none; b=Eifz5hViUTLklbMmheccCGVhitq3GNVJGbDUGqjCnLrVDx9wwivO7uI4Qx2Q3FH0nqTu9BVUD31o8R3bNJwL31pJgO3UzuxqE8l42GsULSbJQx1IpKk93XuADn+PDJAsXa7TVam90oN0YW+hhyyp9mKfQY9wGEPdMJw/921m7vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730438892; c=relaxed/simple;
	bh=LJBZR5VVYhm/pXMNSCVpcGLDxAg9jrQ/YH/DTLh0bSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E1LnUmjhfEgCuCeLkaQc587UXD5RGVN6bWA69p/eMJKTT/EYvMQjZgBOtYQu5w9f5LwyvZ/jL/odNy8tp1vTXKA2DzO4t0r4hjOKy8PXpbfzg9LdZaLXmjPt5yhsno39GvCo9BHvsf71XbIpDdZfvwB22AmvyPvxwiiBNTcfiLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O8mM8jGI; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O8mM8jGI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730438890; x=1761974890;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=LJBZR5VVYhm/pXMNSCVpcGLDxAg9jrQ/YH/DTLh0bSI=;
  b=O8mM8jGIgyPQZh+Jas2NTfCSIEUXQ6t/NUrWSo0IE9hS1k02gaB/+1UL
   aujAA8Znn88/BiTiRH0UUErClZQWPjGPxFU91fsF567/cUxiD713Xdjeb
   oY1CjcFE3XKj7AEoAhRQ0d8kdheYYHWrdF9Aq2LVUN7zujUGHQHJj/8ax
   OLvzBbEE0v1MuQUZOHFMOxW54zbPoIxxYU2L2GukD1zAH0viCXnt52u7e
   E/RJfw/wd0gNC5qk9qLsW/tTIsWHQq0L44RB04BuLimlHx7lCCfzIqsok
   wYizXWgcMCYnGMlguN1V1E9XZrpwL9fWacUg5lRuO4tRvWmSmGLW7CaAX
   Q==;
X-CSE-ConnectionGUID: s2JZlLltRkC/GG3En9mVAQ==
X-CSE-MsgGUID: NuXgKvsgRbaDBL5sIiQ/bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="30314877"
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="30314877"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 22:28:10 -0700
X-CSE-ConnectionGUID: lF/syzuBR/CjSL/vjg8tsA==
X-CSE-MsgGUID: iao2hjZkQ229xEuAP+x8mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="87679634"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 31 Oct 2024 22:28:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6kCc-000hBB-1V;
	Fri, 01 Nov 2024 05:28:06 +0000
Date: Fri, 1 Nov 2024 13:27:51 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 07/10] sysfs: drop callback bin_attribute::llseek
Message-ID: <202411011313.7WUAqR1h-lkp@intel.com>
References: <20241031-sysfs-const-bin_attr-v1-7-2281afa7f055@weissschuh.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241031-sysfs-const-bin_attr-v1-7-2281afa7f055@weissschuh.net>

Hi Thomas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on e42b1a9a2557aa94fee47f078633677198386a52]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Wei-schuh/sysfs-explicitly-pass-size-to-sysfs_add_bin_file_mode_ns/20241031-104710
base:   e42b1a9a2557aa94fee47f078633677198386a52
patch link:    https://lore.kernel.org/r/20241031-sysfs-const-bin_attr-v1-7-2281afa7f055%40weissschuh.net
patch subject: [PATCH RFC 07/10] sysfs: drop callback bin_attribute::llseek
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241101/202411011313.7WUAqR1h-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411011313.7WUAqR1h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411011313.7WUAqR1h-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/pci-sysfs.c: In function 'pci_create_attr':
>> drivers/pci/pci-sysfs.c:1202:25: error: 'struct bin_attribute' has no member named 'llseek'
    1202 |                 res_attr->llseek = pci_llseek_resource;
         |                         ^~


vim +1202 drivers/pci/pci-sysfs.c

45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1165  
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1166  static int pci_create_attr(struct pci_dev *pdev, int num, int write_combine)
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1167  {
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1168  	/* allocate attribute structure, piggyback attribute name */
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1169  	int name_len = write_combine ? 13 : 10;
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1170  	struct bin_attribute *res_attr;
bd5174dfb6f171 Bjorn Helgaas                 2016-03-10  1171  	char *res_attr_name;
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1172  	int retval;
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1173  
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1174  	res_attr = kzalloc(sizeof(*res_attr) + name_len, GFP_ATOMIC);
bd5174dfb6f171 Bjorn Helgaas                 2016-03-10  1175  	if (!res_attr)
bd5174dfb6f171 Bjorn Helgaas                 2016-03-10  1176  		return -ENOMEM;
bd5174dfb6f171 Bjorn Helgaas                 2016-03-10  1177  
bd5174dfb6f171 Bjorn Helgaas                 2016-03-10  1178  	res_attr_name = (char *)(res_attr + 1);
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1179  
a07e4156a2ee63 Eric W. Biederman             2010-02-11  1180  	sysfs_bin_attr_init(res_attr);
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1181  	if (write_combine) {
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1182  		sprintf(res_attr_name, "resource%d_wc", num);
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1183  		res_attr->mmap = pci_mmap_resource_wc;
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1184  	} else {
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1185  		sprintf(res_attr_name, "resource%d", num);
8633328be24267 Alex Williamson               2010-07-19  1186  		if (pci_resource_flags(pdev, num) & IORESOURCE_IO) {
8633328be24267 Alex Williamson               2010-07-19  1187  			res_attr->read = pci_read_resource_io;
8633328be24267 Alex Williamson               2010-07-19  1188  			res_attr->write = pci_write_resource_io;
e854d8b2a82ef7 David Woodhouse               2017-04-12  1189  			if (arch_can_pci_mmap_io())
e854d8b2a82ef7 David Woodhouse               2017-04-12  1190  				res_attr->mmap = pci_mmap_resource_uc;
e854d8b2a82ef7 David Woodhouse               2017-04-12  1191  		} else {
e854d8b2a82ef7 David Woodhouse               2017-04-12  1192  			res_attr->mmap = pci_mmap_resource_uc;
e854d8b2a82ef7 David Woodhouse               2017-04-12  1193  		}
8633328be24267 Alex Williamson               2010-07-19  1194  	}
24de09c16f974d Valentine Sinitsyn            2023-09-25  1195  	if (res_attr->mmap) {
f06aff924f9758 Krzysztof Wilczyński          2021-07-29  1196  		res_attr->f_mapping = iomem_get_mapping;
24de09c16f974d Valentine Sinitsyn            2023-09-25  1197  		/*
24de09c16f974d Valentine Sinitsyn            2023-09-25  1198  		 * generic_file_llseek() consults f_mapping->host to determine
24de09c16f974d Valentine Sinitsyn            2023-09-25  1199  		 * the file size. As iomem_inode knows nothing about the
24de09c16f974d Valentine Sinitsyn            2023-09-25  1200  		 * attribute, it's not going to work, so override it as well.
24de09c16f974d Valentine Sinitsyn            2023-09-25  1201  		 */
24de09c16f974d Valentine Sinitsyn            2023-09-25 @1202  		res_attr->llseek = pci_llseek_resource;
24de09c16f974d Valentine Sinitsyn            2023-09-25  1203  	}
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1204  	res_attr->attr.name = res_attr_name;
e2154044dd4168 Kelsey Skunberg               2019-08-13  1205  	res_attr->attr.mode = 0600;
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1206  	res_attr->size = pci_resource_len(pdev, num);
dca40b186b757c David Woodhouse               2017-04-12  1207  	res_attr->private = (void *)(unsigned long)num;
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1208  	retval = sysfs_create_bin_file(&pdev->dev.kobj, res_attr);
aa382ffa705bea Sascha Hauer                  2022-11-08  1209  	if (retval) {
b562ec8f74e4ed Bjorn Helgaas                 2016-03-10  1210  		kfree(res_attr);
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1211  		return retval;
b19441af185559 Greg Kroah-Hartman            2006-08-28  1212  	}
b19441af185559 Greg Kroah-Hartman            2006-08-28  1213  
aa382ffa705bea Sascha Hauer                  2022-11-08  1214  	if (write_combine)
aa382ffa705bea Sascha Hauer                  2022-11-08  1215  		pdev->res_attr_wc[num] = res_attr;
aa382ffa705bea Sascha Hauer                  2022-11-08  1216  	else
aa382ffa705bea Sascha Hauer                  2022-11-08  1217  		pdev->res_attr[num] = res_attr;
aa382ffa705bea Sascha Hauer                  2022-11-08  1218  
aa382ffa705bea Sascha Hauer                  2022-11-08  1219  	return 0;
aa382ffa705bea Sascha Hauer                  2022-11-08  1220  }
aa382ffa705bea Sascha Hauer                  2022-11-08  1221  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
