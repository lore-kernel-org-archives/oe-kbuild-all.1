Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA996ABB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jan 2024 07:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706081280; cv=none; b=BCFppHULB2DiWg7koOXKuHGm/CFEX1gtyRDu/5btA8JRxHaza3Hf2RKmL/2+Dh/ndmHW8xxST3AqgCNJCx28qhsSRX5qjy9hvAqRuS2EbWnY0xOf+onuXg87inn1oVKslArqaHiVpEm3F1tH4GIooDzUZdiacatyHlrFLl2QUIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706081280; c=relaxed/simple;
	bh=o2yKo5Nt/HbGnpixDzZpekRrRZa0EGw3UAHNiYOOIUg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H+cvvBjSCP7VwPkED56sXwmFzNmj5FjN32uvqBph1FRGekLPTa1YaB2bdN+p2U86m4CdVSgFenKNuYIz0OYrwzaX9QJvH+GR8RcksutfwwxrRljFk6xEJLN1rnLjaakljddSGsnYZShnyp2OvlSozZsmszNydMvpQzzWZiUTuY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l7OAYbOz; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l7OAYbOz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706081278; x=1737617278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o2yKo5Nt/HbGnpixDzZpekRrRZa0EGw3UAHNiYOOIUg=;
  b=l7OAYbOz598ZW+nEhh6+1RMLHgaoVA4fQURoiyGFX3UTphz+li3aMrfl
   w8B+EbVVy4A/imQHPFuhTUnB/atRjcvd/oVf+L+v1H8wCOyJancjOTs48
   T0k5v9SFWBOZrtofPKqFP20n8gDh7IG03i93ugmtnwL4y9Q4l+ZASyV5g
   f+9iCrX/SjGo2lgf+BESRbR+9hvRS2lfS3y4hf8okCTTN1n77SBVoElPO
   FShYtuh+XYuGbTm4ADJUjnLSBGastzNHMj4BuNhJXwaabyHJ8Po6IH88S
   PYrbFcnSw6mXHxzcpZtWVqao4Al2Om4bjMeikV5qd5I0q5BxWFOeWtY5t
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1656000"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1656000"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 23:27:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1817244"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Jan 2024 23:27:56 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSXfu-0007xd-07;
	Wed, 24 Jan 2024 07:27:54 +0000
Date: Wed, 24 Jan 2024 15:27:35 +0800
From: kernel test robot <lkp@intel.com>
To: Vishal Verma <vishal.l.verma@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	David Hildenbrand <david@redhat.com>,
	"Huang, Ying" <ying.huang@intel.com>
Subject: [vishal:vv/dax_abi 6/6] drivers/dax/bus.c:1372:29: error: implicit
 declaration of function 'mhp_supports_memmap_on_memory'
Message-ID: <202401241523.oaLhd7fO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vishal/linux.git vv/dax_abi
head:   6a9c721fafa6903e6a18ace2c5401ad674b1367b
commit: 6a9c721fafa6903e6a18ace2c5401ad674b1367b [6/6] dax: add a sysfs knob to control memmap_on_memory behavior
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20240124/202401241523.oaLhd7fO-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240124/202401241523.oaLhd7fO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401241523.oaLhd7fO-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/dax/bus.c: In function 'memmap_on_memory_store':
>> drivers/dax/bus.c:1372:29: error: implicit declaration of function 'mhp_supports_memmap_on_memory' [-Werror=implicit-function-declaration]
    1372 |         if (val == true && !mhp_supports_memmap_on_memory()) {
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/mhp_supports_memmap_on_memory +1372 drivers/dax/bus.c

  1359	
  1360	static ssize_t memmap_on_memory_store(struct device *dev,
  1361					      struct device_attribute *attr,
  1362					      const char *buf, size_t len)
  1363	{
  1364		struct dev_dax *dev_dax = to_dev_dax(dev);
  1365		bool val;
  1366		int rc;
  1367	
  1368		rc = kstrtobool(buf, &val);
  1369		if (rc)
  1370			return rc;
  1371	
> 1372		if (val == true && !mhp_supports_memmap_on_memory()) {
  1373			dev_dbg(dev, "memmap_on_memory is not available\n");
  1374			return -EOPNOTSUPP;
  1375		}
  1376	
  1377		rc = down_write_killable(&dax_dev_rwsem);
  1378		if (rc)
  1379			return rc;
  1380	
  1381		if (dev_dax->memmap_on_memory != val && dev->driver &&
  1382		    to_dax_drv(dev->driver)->type == DAXDRV_KMEM_TYPE) {
  1383			up_write(&dax_dev_rwsem);
  1384			return -EBUSY;
  1385		}
  1386	
  1387		dev_dax->memmap_on_memory = val;
  1388		up_write(&dax_dev_rwsem);
  1389	
  1390		return len;
  1391	}
  1392	static DEVICE_ATTR_RW(memmap_on_memory);
  1393	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
