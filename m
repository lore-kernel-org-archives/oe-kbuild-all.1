Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB452B5EC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 23:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gXNlrF/h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697154246; x=1728690246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ifj2aIndqKRFsPcKNYSxuQB2XwQWnpF8tEA5DGR2s2A=;
  b=gXNlrF/hFOL8cAG1Hjrki492Yds1gdQRRatoHpd/8zxPmZYYYSB6rS/V
   cg1O0miW+hv0Ngrf9VxSVlStpoMJAzBcV7BLEjaewMPVwtHw/puCkUnfS
   2PohDr07TX1bCNo9/Onef4Qa1rnxluXcQkAXsZO/f1tAp6lMSPFd1fQSx
   3JDkUB2Uh4NxgXp9jiV9Xmf1w1d6rA60y64pVB6DkGGE3iUDEYVWEC8Bb
   Ex9TZmHxqDI2r2rQuGkN9HJyq/lYrABasK5HAXQB7SkSAIasWZYgGPQAe
   te+RdicEU2HQ5CJYHloUvSouWacDqZcVWrUfzDzsRAES6UPx2k45tLpMe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="375416842"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="375416842"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 16:44:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="845184819"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="845184819"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Oct 2023 16:44:04 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr5LW-00044N-23;
	Thu, 12 Oct 2023 23:44:02 +0000
Date: Fri, 13 Oct 2023 07:43:09 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pinchartl:mtk/v6.6/thp7312/fixups 4/5]
 drivers/media/i2c/thp7312.c:1836:20: warning: no previous prototype for
 'thp7312_fw_prepare'
Message-ID: <202310130712.U4QdgR7l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Laurent,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git mtk/v6.6/thp7312/fixups
head:   e16a701c1ccadbb92d46e6b9004d83f2ba14f3be
commit: 7c7072ea706aa592948b1c62fb21980400269e30 [4/5] fixup! media: i2c: Add driver for THine THP7312
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231013/202310130712.U4QdgR7l-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310130712.U4QdgR7l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130712.U4QdgR7l-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/thp7312.c:1836:20: warning: no previous prototype for 'thp7312_fw_prepare' [-Wmissing-prototypes]
    1836 | enum fw_upload_err thp7312_fw_prepare(struct fw_upload *fw_upload,
         |                    ^~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/thp7312.c:1872:20: warning: no previous prototype for 'thp7312_fw_write' [-Wmissing-prototypes]
    1872 | enum fw_upload_err thp7312_fw_write(struct fw_upload *fw_upload,
         |                    ^~~~~~~~~~~~~~~~
>> drivers/media/i2c/thp7312.c:1916:20: warning: no previous prototype for 'thp7312_fw_poll_complete' [-Wmissing-prototypes]
    1916 | enum fw_upload_err thp7312_fw_poll_complete(struct fw_upload *fw_upload)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/thp7312.c:1927:6: warning: no previous prototype for 'thp7312_fw_cancel' [-Wmissing-prototypes]
    1927 | void thp7312_fw_cancel(struct fw_upload *fw_upload)
         |      ^~~~~~~~~~~~~~~~~
   drivers/media/i2c/thp7312.c:2381:10: error: 'struct i2c_driver' has no member named 'probe_new'
    2381 |         .probe_new = thp7312_probe,
         |          ^~~~~~~~~
   drivers/media/i2c/thp7312.c:2381:22: error: initialization of 'const struct i2c_device_id *' from incompatible pointer type 'int (*)(struct i2c_client *)' [-Werror=incompatible-pointer-types]
    2381 |         .probe_new = thp7312_probe,
         |                      ^~~~~~~~~~~~~
   drivers/media/i2c/thp7312.c:2381:22: note: (near initialization for 'thp7312_i2c_driver.id_table')
   drivers/media/i2c/thp7312.c:2382:21: error: initialization of 'void (*)(struct i2c_client *)' from incompatible pointer type 'int (*)(struct i2c_client *)' [-Werror=incompatible-pointer-types]
    2382 |         .remove   = thp7312_remove,
         |                     ^~~~~~~~~~~~~~
   drivers/media/i2c/thp7312.c:2382:21: note: (near initialization for 'thp7312_i2c_driver.remove')
>> drivers/media/i2c/thp7312.c:2372:32: warning: 'thp7312_pm_ops' defined but not used [-Wunused-const-variable=]
    2372 | static const struct dev_pm_ops thp7312_pm_ops = {
         |                                ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/thp7312_fw_prepare +1836 drivers/media/i2c/thp7312.c

75997e37fcd3e0 Paul Elder 2023-06-20  1835  
75997e37fcd3e0 Paul Elder 2023-06-20 @1836  enum fw_upload_err thp7312_fw_prepare(struct fw_upload *fw_upload,
75997e37fcd3e0 Paul Elder 2023-06-20  1837  				      const u8 *data, u32 size)
75997e37fcd3e0 Paul Elder 2023-06-20  1838  {
75997e37fcd3e0 Paul Elder 2023-06-20  1839  	struct thp7312_device *thp7312 = fw_upload->dd_handle;
75997e37fcd3e0 Paul Elder 2023-06-20  1840  	struct device *dev = thp7312->dev;
75997e37fcd3e0 Paul Elder 2023-06-20  1841  	enum fw_upload_err ret;
75997e37fcd3e0 Paul Elder 2023-06-20  1842  
75997e37fcd3e0 Paul Elder 2023-06-20  1843  	mutex_lock(&thp7312->fw_lock);
75997e37fcd3e0 Paul Elder 2023-06-20  1844  	thp7312->fw_cancel = false;
75997e37fcd3e0 Paul Elder 2023-06-20  1845  	mutex_unlock(&thp7312->fw_lock);
75997e37fcd3e0 Paul Elder 2023-06-20  1846  
75997e37fcd3e0 Paul Elder 2023-06-20  1847  	if (size < THP7312_FW_MIN_SIZE || size > THP7312_FW_MAX_SIZE) {
75997e37fcd3e0 Paul Elder 2023-06-20  1848  		dev_err(dev, "%s: Invalid firmware size %d; must be between %d and %d\n",
75997e37fcd3e0 Paul Elder 2023-06-20  1849  			__func__, size, THP7312_FW_MIN_SIZE, THP7312_FW_MAX_SIZE);
75997e37fcd3e0 Paul Elder 2023-06-20  1850  		return FW_UPLOAD_ERR_INVALID_SIZE;
75997e37fcd3e0 Paul Elder 2023-06-20  1851  	}
75997e37fcd3e0 Paul Elder 2023-06-20  1852  
75997e37fcd3e0 Paul Elder 2023-06-20  1853  	ret = thp7312_fw_prepare_config(thp7312);
75997e37fcd3e0 Paul Elder 2023-06-20  1854  	if (ret != FW_UPLOAD_ERR_NONE)
75997e37fcd3e0 Paul Elder 2023-06-20  1855  		return ret;
75997e37fcd3e0 Paul Elder 2023-06-20  1856  
75997e37fcd3e0 Paul Elder 2023-06-20  1857  	ret = thp7312_fw_prepare_check(thp7312);
75997e37fcd3e0 Paul Elder 2023-06-20  1858  	if (ret != FW_UPLOAD_ERR_NONE)
75997e37fcd3e0 Paul Elder 2023-06-20  1859  		return ret;
75997e37fcd3e0 Paul Elder 2023-06-20  1860  
75997e37fcd3e0 Paul Elder 2023-06-20  1861  	ret = thp7312_fw_prepare_reset(thp7312);
75997e37fcd3e0 Paul Elder 2023-06-20  1862  	if (ret != FW_UPLOAD_ERR_NONE)
75997e37fcd3e0 Paul Elder 2023-06-20  1863  		return ret;
75997e37fcd3e0 Paul Elder 2023-06-20  1864  
75997e37fcd3e0 Paul Elder 2023-06-20  1865  	mutex_lock(&thp7312->fw_lock);
75997e37fcd3e0 Paul Elder 2023-06-20  1866  	ret = thp7312->fw_cancel ? FW_UPLOAD_ERR_CANCELED : FW_UPLOAD_ERR_NONE;
75997e37fcd3e0 Paul Elder 2023-06-20  1867  	mutex_unlock(&thp7312->fw_lock);
75997e37fcd3e0 Paul Elder 2023-06-20  1868  
75997e37fcd3e0 Paul Elder 2023-06-20  1869  	return ret;
75997e37fcd3e0 Paul Elder 2023-06-20  1870  }
75997e37fcd3e0 Paul Elder 2023-06-20  1871  
75997e37fcd3e0 Paul Elder 2023-06-20 @1872  enum fw_upload_err thp7312_fw_write(struct fw_upload *fw_upload,
75997e37fcd3e0 Paul Elder 2023-06-20  1873  				    const u8 *data, u32 offset,
75997e37fcd3e0 Paul Elder 2023-06-20  1874  				    u32 size, u32 *written)
75997e37fcd3e0 Paul Elder 2023-06-20  1875  {
75997e37fcd3e0 Paul Elder 2023-06-20  1876  	struct thp7312_device *thp7312 = fw_upload->dd_handle;
75997e37fcd3e0 Paul Elder 2023-06-20  1877  	struct device *dev = thp7312->dev;
75997e37fcd3e0 Paul Elder 2023-06-20  1878  	u16 header_size = size - THP7312_FW_RAM_SIZE;
75997e37fcd3e0 Paul Elder 2023-06-20  1879  	enum fw_upload_err ret;
75997e37fcd3e0 Paul Elder 2023-06-20  1880  
75997e37fcd3e0 Paul Elder 2023-06-20  1881  	mutex_lock(&thp7312->fw_lock);
75997e37fcd3e0 Paul Elder 2023-06-20  1882  	if (thp7312->fw_cancel)
75997e37fcd3e0 Paul Elder 2023-06-20  1883  		return FW_UPLOAD_ERR_CANCELED;
75997e37fcd3e0 Paul Elder 2023-06-20  1884  	mutex_unlock(&thp7312->fw_lock);
75997e37fcd3e0 Paul Elder 2023-06-20  1885  
75997e37fcd3e0 Paul Elder 2023-06-20  1886  	ret = thp7312_flash_erase(thp7312);
75997e37fcd3e0 Paul Elder 2023-06-20  1887  	if (ret != FW_UPLOAD_ERR_NONE)
75997e37fcd3e0 Paul Elder 2023-06-20  1888  		return ret;
75997e37fcd3e0 Paul Elder 2023-06-20  1889  
75997e37fcd3e0 Paul Elder 2023-06-20  1890  	ret = thp7312_fw_load_to_ram(thp7312, data, THP7312_FW_RAM_SIZE);
75997e37fcd3e0 Paul Elder 2023-06-20  1891  	if (ret != FW_UPLOAD_ERR_NONE)
75997e37fcd3e0 Paul Elder 2023-06-20  1892  		return ret;
75997e37fcd3e0 Paul Elder 2023-06-20  1893  
75997e37fcd3e0 Paul Elder 2023-06-20  1894  	ret = thp7312_fw_write_to_flash(thp7312, 0, 0x1ffff);
75997e37fcd3e0 Paul Elder 2023-06-20  1895  	if (ret != FW_UPLOAD_ERR_NONE)
75997e37fcd3e0 Paul Elder 2023-06-20  1896  		return ret;
75997e37fcd3e0 Paul Elder 2023-06-20  1897  
75997e37fcd3e0 Paul Elder 2023-06-20  1898  	ret = thp7312_fw_load_to_ram(thp7312, data + THP7312_FW_RAM_SIZE, header_size);
75997e37fcd3e0 Paul Elder 2023-06-20  1899  	if (ret != FW_UPLOAD_ERR_NONE)
75997e37fcd3e0 Paul Elder 2023-06-20  1900  		return ret;
75997e37fcd3e0 Paul Elder 2023-06-20  1901  
75997e37fcd3e0 Paul Elder 2023-06-20  1902  	ret = thp7312_fw_write_to_flash(thp7312, 0x20000, header_size - 1);
75997e37fcd3e0 Paul Elder 2023-06-20  1903  	if (ret != FW_UPLOAD_ERR_NONE)
75997e37fcd3e0 Paul Elder 2023-06-20  1904  		return ret;
75997e37fcd3e0 Paul Elder 2023-06-20  1905  
75997e37fcd3e0 Paul Elder 2023-06-20  1906  	ret = thp7312_fw_check_crc(thp7312, data, size);
75997e37fcd3e0 Paul Elder 2023-06-20  1907  	if (ret != FW_UPLOAD_ERR_NONE)
75997e37fcd3e0 Paul Elder 2023-06-20  1908  		return ret;
75997e37fcd3e0 Paul Elder 2023-06-20  1909  
75997e37fcd3e0 Paul Elder 2023-06-20  1910  	dev_info(dev, "Successfully wrote firmware\n");
75997e37fcd3e0 Paul Elder 2023-06-20  1911  
75997e37fcd3e0 Paul Elder 2023-06-20  1912  	*written = size;
75997e37fcd3e0 Paul Elder 2023-06-20  1913  	return FW_UPLOAD_ERR_NONE;
75997e37fcd3e0 Paul Elder 2023-06-20  1914  }
75997e37fcd3e0 Paul Elder 2023-06-20  1915  
75997e37fcd3e0 Paul Elder 2023-06-20 @1916  enum fw_upload_err thp7312_fw_poll_complete(struct fw_upload *fw_upload)
75997e37fcd3e0 Paul Elder 2023-06-20  1917  {
75997e37fcd3e0 Paul Elder 2023-06-20  1918  	return FW_UPLOAD_ERR_NONE;
75997e37fcd3e0 Paul Elder 2023-06-20  1919  }
75997e37fcd3e0 Paul Elder 2023-06-20  1920  
75997e37fcd3e0 Paul Elder 2023-06-20  1921  /*
75997e37fcd3e0 Paul Elder 2023-06-20  1922   * This may be called asynchronously with an on-going update.  All other
75997e37fcd3e0 Paul Elder 2023-06-20  1923   * functions are called sequentially in a single thread. To avoid contention on
75997e37fcd3e0 Paul Elder 2023-06-20  1924   * register accesses, only update the cancel_request flag. Other functions will
75997e37fcd3e0 Paul Elder 2023-06-20  1925   * check this flag and handle the cancel request synchronously.
75997e37fcd3e0 Paul Elder 2023-06-20  1926   */
75997e37fcd3e0 Paul Elder 2023-06-20 @1927  void thp7312_fw_cancel(struct fw_upload *fw_upload)
75997e37fcd3e0 Paul Elder 2023-06-20  1928  {
75997e37fcd3e0 Paul Elder 2023-06-20  1929  	struct thp7312_device *thp7312 = fw_upload->dd_handle;
75997e37fcd3e0 Paul Elder 2023-06-20  1930  
75997e37fcd3e0 Paul Elder 2023-06-20  1931  	mutex_lock(&thp7312->fw_lock);
75997e37fcd3e0 Paul Elder 2023-06-20  1932  	thp7312->fw_cancel = true;
75997e37fcd3e0 Paul Elder 2023-06-20  1933  	mutex_unlock(&thp7312->fw_lock);
75997e37fcd3e0 Paul Elder 2023-06-20  1934  }
75997e37fcd3e0 Paul Elder 2023-06-20  1935  

:::::: The code at line 1836 was first introduced by commit
:::::: 75997e37fcd3e03d0b4cd663baf147b3712e9c2a media: i2c: Add driver for THine THP7312

:::::: TO: Paul Elder <paul.elder@ideasonboard.com>
:::::: CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
