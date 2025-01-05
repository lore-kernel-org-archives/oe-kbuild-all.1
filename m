Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AA2224D6
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Jan 2025 17:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736097607; cv=none; b=CgZxZv3647FX0Z+5NEUrGcwS3TO6G55Hlih1DpF+ogwBlqXbSo7JC7WXVW06nVy3A3MYG2VTrlxI1L7XkUaQvYp/m95PTuKiQRf5sj1dlhyCJtnlacRUXrh9BiGhv4IkxLRkBPOUtzutMqSRdb1LUNKnO2tUhTcyFodB9gVFd+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736097607; c=relaxed/simple;
	bh=6TJP9vzr6LAHItn1N0Ftrjv6ubs1uH7yzCOA/rUaIeA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HkdeBtUwdEj7Az+RssXXpIhRnC/mD/SLyMx/FhRTdOBmSjWGOXiU5zTJ7r/Tc7/FMxoCr6XxmHSZ4IoElEjk7yHfGc7sMj11O8Og+JXyfZa4v64AuRlVN3t0YDOxLEolbHW0A7cVDj7FfY73v98FpFXZG2anEZUyO7hdYs6StcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=llG7JerK; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="llG7JerK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736097605; x=1767633605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6TJP9vzr6LAHItn1N0Ftrjv6ubs1uH7yzCOA/rUaIeA=;
  b=llG7JerKlCG88nDf7ZPs0Nc/YVbW1GyfAG5fdKCjCbbgaACXo31am8RM
   Paz+sckMNFFLm/S18rI8xmA4PuQsmKgr2bO16UOaLJPR7EWqvku2NAi2w
   aI6YroXyMjOskZ10khpi3iBsIRDToUp9yr9NiO3+bAkwGwVUQSuTaLwMd
   rdlEpyTtI2+mYNbr1Ngpyny6gvxGnp227bwr7ZNSoRiuK0soecy+/pie7
   vwLBl1mNrBvvT23r2gLBmbZYYQuf9HysD3yNas+BbFDwSjkilZB0d474o
   ZnyYJsNXb+oQloCyj3wftxxkekPIXBpbwnUvCcB/NhRT3s/8cPoKppxx1
   w==;
X-CSE-ConnectionGUID: WWwhDXVtTNal5uS/IUV0qw==
X-CSE-MsgGUID: zrakW5zeRHSzaA+SCQrpdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="53800667"
X-IronPort-AV: E=Sophos;i="6.12,291,1728975600"; 
   d="scan'208";a="53800667"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 09:20:04 -0800
X-CSE-ConnectionGUID: DXyrZIQKSxyqIGT6p9Wc2g==
X-CSE-MsgGUID: 0+gCGnjvRZ2UHUmjbtKXGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,291,1728975600"; 
   d="scan'208";a="102759777"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Jan 2025 09:20:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUUIC-000Brr-2J;
	Sun, 05 Jan 2025 17:20:00 +0000
Date: Mon, 6 Jan 2025 01:19:48 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>
Subject: drivers/platform/x86/dell/dcdbas.c:80: warning: Function parameter
 or struct member 'size' not described in 'smi_data_buf_realloc'
Message-ID: <202501060133.5bUeh1W9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ab75170520d4964f3acf8bb1f91d34cbc650688e
commit: f1e1ea516721d1ea0b21327ff9e6cb2c2bb86e28 platform/x86: Move all dell drivers to their own subdirectory
date:   3 years, 11 months ago
config: i386-randconfig-063-20231024 (https://download.01.org/0day-ci/archive/20250106/202501060133.5bUeh1W9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501060133.5bUeh1W9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501060133.5bUeh1W9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/dell/dcdbas.c:80: warning: Function parameter or struct member 'size' not described in 'smi_data_buf_realloc'
>> drivers/platform/x86/dell/dcdbas.c:271: warning: Function parameter or struct member 'smi_cmd' not described in 'dcdbas_smi_request'
>> drivers/platform/x86/dell/dcdbas.c:302: warning: Function parameter or struct member 'dev' not described in 'smi_request_store'
>> drivers/platform/x86/dell/dcdbas.c:302: warning: Function parameter or struct member 'attr' not described in 'smi_request_store'
>> drivers/platform/x86/dell/dcdbas.c:302: warning: Function parameter or struct member 'buf' not described in 'smi_request_store'
>> drivers/platform/x86/dell/dcdbas.c:302: warning: Function parameter or struct member 'count' not described in 'smi_request_store'
>> drivers/platform/x86/dell/dcdbas.c:603: warning: Function parameter or struct member 'nb' not described in 'dcdbas_reboot_notify'
>> drivers/platform/x86/dell/dcdbas.c:603: warning: Function parameter or struct member 'code' not described in 'dcdbas_reboot_notify'
>> drivers/platform/x86/dell/dcdbas.c:603: warning: Function parameter or struct member 'unused' not described in 'dcdbas_reboot_notify'


vim +80 drivers/platform/x86/dell/dcdbas.c

90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06   75  
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06   76  /**
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06   77   * smi_data_buf_realloc: grow SMI data buffer if needed
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06   78   */
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06   79  static int smi_data_buf_realloc(unsigned long size)
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  @80  {
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06   81  	void *buf;
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06   82  	dma_addr_t handle;
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06   83  
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06   84  	if (smi_data_buf_size >= size)
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06   85  		return 0;
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06   86  
12c956c4f32e08 drivers/firmware/dcdbas.c Stuart Hayes     2018-09-26   87  	if (size > max_smi_data_buf_size)
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06   88  		return -EINVAL;
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06   89  
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06   90  	/* new buffer is needed */
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06   91  	buf = dma_alloc_coherent(&dcdbas_pdev->dev, size, &handle, GFP_KERNEL);
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06   92  	if (!buf) {
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06   93  		dev_dbg(&dcdbas_pdev->dev,
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06   94  			"%s: failed to allocate memory size %lu\n",
eecd58536a9750 drivers/firmware/dcdbas.c Harvey Harrison  2008-04-29   95  			__func__, size);
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06   96  		return -ENOMEM;
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06   97  	}
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06   98  	/* memory zeroed by dma_alloc_coherent */
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06   99  
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  100  	if (smi_data_buf)
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  101  		memcpy(buf, smi_data_buf, smi_data_buf_size);
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  102  
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  103  	/* free any existing buffer */
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  104  	smi_data_buf_free();
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  105  
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  106  	/* set up new buffer for use */
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  107  	smi_data_buf = buf;
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  108  	smi_data_buf_handle = handle;
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  109  	smi_data_buf_phys_addr = (u32) virt_to_phys(buf);
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  110  	smi_data_buf_size = size;
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  111  
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  112  	dev_dbg(&dcdbas_pdev->dev, "%s: phys: %x size: %lu\n",
eecd58536a9750 drivers/firmware/dcdbas.c Harvey Harrison  2008-04-29  113  		__func__, smi_data_buf_phys_addr, smi_data_buf_size);
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  114  
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  115  	return 0;
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  116  }
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  117  
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  118  static ssize_t smi_data_buf_phys_addr_show(struct device *dev,
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  119  					   struct device_attribute *attr,
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  120  					   char *buf)
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  121  {
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  122  	return sprintf(buf, "%x\n", smi_data_buf_phys_addr);
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  123  }
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  124  
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  125  static ssize_t smi_data_buf_size_show(struct device *dev,
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  126  				      struct device_attribute *attr,
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  127  				      char *buf)
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  128  {
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  129  	return sprintf(buf, "%lu\n", smi_data_buf_size);
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  130  }
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  131  
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  132  static ssize_t smi_data_buf_size_store(struct device *dev,
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  133  				       struct device_attribute *attr,
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  134  				       const char *buf, size_t count)
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  135  {
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  136  	unsigned long buf_size;
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  137  	ssize_t ret;
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  138  
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  139  	buf_size = simple_strtoul(buf, NULL, 10);
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  140  
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  141  	/* make sure SMI data buffer is at least buf_size */
8ed965d612d9e9 drivers/firmware/dcdbas.c Arjan van de Ven 2006-03-23  142  	mutex_lock(&smi_data_lock);
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  143  	ret = smi_data_buf_realloc(buf_size);
8ed965d612d9e9 drivers/firmware/dcdbas.c Arjan van de Ven 2006-03-23  144  	mutex_unlock(&smi_data_lock);
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  145  	if (ret)
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  146  		return ret;
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  147  
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  148  	return count;
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  149  }
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  150  
2c3c8bea608866 drivers/firmware/dcdbas.c Chris Wright     2010-05-12  151  static ssize_t smi_data_read(struct file *filp, struct kobject *kobj,
91a6902958f052 drivers/firmware/dcdbas.c Zhang Rui        2007-06-09  152  			     struct bin_attribute *bin_attr,
91a6902958f052 drivers/firmware/dcdbas.c Zhang Rui        2007-06-09  153  			     char *buf, loff_t pos, size_t count)
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  154  {
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  155  	ssize_t ret;
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  156  
8ed965d612d9e9 drivers/firmware/dcdbas.c Arjan van de Ven 2006-03-23  157  	mutex_lock(&smi_data_lock);
abe19b7b822a8f drivers/firmware/dcdbas.c Akinobu Mita     2008-07-25  158  	ret = memory_read_from_buffer(buf, count, &pos, smi_data_buf,
abe19b7b822a8f drivers/firmware/dcdbas.c Akinobu Mita     2008-07-25  159  					smi_data_buf_size);
8ed965d612d9e9 drivers/firmware/dcdbas.c Arjan van de Ven 2006-03-23  160  	mutex_unlock(&smi_data_lock);
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  161  	return ret;
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  162  }
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  163  
2c3c8bea608866 drivers/firmware/dcdbas.c Chris Wright     2010-05-12  164  static ssize_t smi_data_write(struct file *filp, struct kobject *kobj,
91a6902958f052 drivers/firmware/dcdbas.c Zhang Rui        2007-06-09  165  			      struct bin_attribute *bin_attr,
91a6902958f052 drivers/firmware/dcdbas.c Zhang Rui        2007-06-09  166  			      char *buf, loff_t pos, size_t count)
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  167  {
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  168  	ssize_t ret;
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  169  
12c956c4f32e08 drivers/firmware/dcdbas.c Stuart Hayes     2018-09-26  170  	if ((pos + count) > max_smi_data_buf_size)
b95936cb9267e4 drivers/firmware/dcdbas.c Doug Warzecha    2006-10-19  171  		return -EINVAL;
b95936cb9267e4 drivers/firmware/dcdbas.c Doug Warzecha    2006-10-19  172  
8ed965d612d9e9 drivers/firmware/dcdbas.c Arjan van de Ven 2006-03-23  173  	mutex_lock(&smi_data_lock);
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  174  
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  175  	ret = smi_data_buf_realloc(pos + count);
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  176  	if (ret)
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  177  		goto out;
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  178  
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  179  	memcpy(smi_data_buf + pos, buf, count);
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  180  	ret = count;
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  181  out:
8ed965d612d9e9 drivers/firmware/dcdbas.c Arjan van de Ven 2006-03-23  182  	mutex_unlock(&smi_data_lock);
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  183  	return ret;
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  184  }
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  185  
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  186  static ssize_t host_control_action_show(struct device *dev,
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  187  					struct device_attribute *attr,
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  188  					char *buf)
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  189  {
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  190  	return sprintf(buf, "%u\n", host_control_action);
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  191  }
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  192  
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  193  static ssize_t host_control_action_store(struct device *dev,
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  194  					 struct device_attribute *attr,
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  195  					 const char *buf, size_t count)
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  196  {
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  197  	ssize_t ret;
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  198  
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  199  	/* make sure buffer is available for host control command */
8ed965d612d9e9 drivers/firmware/dcdbas.c Arjan van de Ven 2006-03-23  200  	mutex_lock(&smi_data_lock);
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  201  	ret = smi_data_buf_realloc(sizeof(struct apm_cmd));
8ed965d612d9e9 drivers/firmware/dcdbas.c Arjan van de Ven 2006-03-23  202  	mutex_unlock(&smi_data_lock);
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  203  	if (ret)
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  204  		return ret;
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  205  
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  206  	host_control_action = simple_strtoul(buf, NULL, 10);
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  207  	return count;
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  208  }
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  209  
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  210  static ssize_t host_control_smi_type_show(struct device *dev,
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  211  					  struct device_attribute *attr,
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  212  					  char *buf)
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  213  {
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  214  	return sprintf(buf, "%u\n", host_control_smi_type);
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  215  }
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  216  
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  217  static ssize_t host_control_smi_type_store(struct device *dev,
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  218  					   struct device_attribute *attr,
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  219  					   const char *buf, size_t count)
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  220  {
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  221  	host_control_smi_type = simple_strtoul(buf, NULL, 10);
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  222  	return count;
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  223  }
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  224  
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  225  static ssize_t host_control_on_shutdown_show(struct device *dev,
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  226  					     struct device_attribute *attr,
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  227  					     char *buf)
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  228  {
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  229  	return sprintf(buf, "%u\n", host_control_on_shutdown);
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  230  }
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  231  
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  232  static ssize_t host_control_on_shutdown_store(struct device *dev,
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  233  					      struct device_attribute *attr,
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  234  					      const char *buf, size_t count)
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  235  {
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  236  	host_control_on_shutdown = simple_strtoul(buf, NULL, 10);
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  237  	return count;
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  238  }
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  239  
e23f22b5cb9e44 drivers/firmware/dcdbas.c Juergen Gross    2016-08-29  240  static int raise_smi(void *par)
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  241  {
e23f22b5cb9e44 drivers/firmware/dcdbas.c Juergen Gross    2016-08-29  242  	struct smi_cmd *smi_cmd = par;
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  243  
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  244  	if (smp_processor_id() != 0) {
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  245  		dev_dbg(&dcdbas_pdev->dev, "%s: failed to get CPU 0\n",
eecd58536a9750 drivers/firmware/dcdbas.c Harvey Harrison  2008-04-29  246  			__func__);
e23f22b5cb9e44 drivers/firmware/dcdbas.c Juergen Gross    2016-08-29  247  		return -EBUSY;
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  248  	}
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  249  
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  250  	/* generate SMI */
dd65c736d1b531 drivers/firmware/dcdbas.c Stuart Hayes     2011-03-02  251  	/* inb to force posted write through and make SMI happen now */
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  252  	asm volatile (
dd65c736d1b531 drivers/firmware/dcdbas.c Stuart Hayes     2011-03-02  253  		"outb %b0,%w1\n"
dd65c736d1b531 drivers/firmware/dcdbas.c Stuart Hayes     2011-03-02  254  		"inb %w1"
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  255  		: /* no output args */
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  256  		: "a" (smi_cmd->command_code),
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  257  		  "d" (smi_cmd->command_address),
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  258  		  "b" (smi_cmd->ebx),
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  259  		  "c" (smi_cmd->ecx)
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  260  		: "memory"
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  261  	);
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  262  
e23f22b5cb9e44 drivers/firmware/dcdbas.c Juergen Gross    2016-08-29  263  	return 0;
e23f22b5cb9e44 drivers/firmware/dcdbas.c Juergen Gross    2016-08-29  264  }
e23f22b5cb9e44 drivers/firmware/dcdbas.c Juergen Gross    2016-08-29  265  /**
e23f22b5cb9e44 drivers/firmware/dcdbas.c Juergen Gross    2016-08-29  266   * dcdbas_smi_request: generate SMI request
e23f22b5cb9e44 drivers/firmware/dcdbas.c Juergen Gross    2016-08-29  267   *
e23f22b5cb9e44 drivers/firmware/dcdbas.c Juergen Gross    2016-08-29  268   * Called with smi_data_lock.
e23f22b5cb9e44 drivers/firmware/dcdbas.c Juergen Gross    2016-08-29  269   */
e23f22b5cb9e44 drivers/firmware/dcdbas.c Juergen Gross    2016-08-29  270  int dcdbas_smi_request(struct smi_cmd *smi_cmd)
e23f22b5cb9e44 drivers/firmware/dcdbas.c Juergen Gross    2016-08-29 @271  {
e23f22b5cb9e44 drivers/firmware/dcdbas.c Juergen Gross    2016-08-29  272  	int ret;
e23f22b5cb9e44 drivers/firmware/dcdbas.c Juergen Gross    2016-08-29  273  
e23f22b5cb9e44 drivers/firmware/dcdbas.c Juergen Gross    2016-08-29  274  	if (smi_cmd->magic != SMI_CMD_MAGIC) {
e23f22b5cb9e44 drivers/firmware/dcdbas.c Juergen Gross    2016-08-29  275  		dev_info(&dcdbas_pdev->dev, "%s: invalid magic value\n",
e23f22b5cb9e44 drivers/firmware/dcdbas.c Juergen Gross    2016-08-29  276  			 __func__);
e23f22b5cb9e44 drivers/firmware/dcdbas.c Juergen Gross    2016-08-29  277  		return -EBADR;
e23f22b5cb9e44 drivers/firmware/dcdbas.c Juergen Gross    2016-08-29  278  	}
e23f22b5cb9e44 drivers/firmware/dcdbas.c Juergen Gross    2016-08-29  279  
e23f22b5cb9e44 drivers/firmware/dcdbas.c Juergen Gross    2016-08-29  280  	/* SMI requires CPU 0 */
e23f22b5cb9e44 drivers/firmware/dcdbas.c Juergen Gross    2016-08-29  281  	get_online_cpus();
e23f22b5cb9e44 drivers/firmware/dcdbas.c Juergen Gross    2016-08-29  282  	ret = smp_call_on_cpu(0, raise_smi, smi_cmd, true);
e23f22b5cb9e44 drivers/firmware/dcdbas.c Juergen Gross    2016-08-29  283  	put_online_cpus();
e23f22b5cb9e44 drivers/firmware/dcdbas.c Juergen Gross    2016-08-29  284  
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  285  	return ret;
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  286  }
90563ec4129f14 drivers/firmware/dcdbas.c Doug Warzecha    2005-09-06  287  

:::::: The code at line 80 was first introduced by commit
:::::: 90563ec4129f14d19f018240d1d3ff5c0e5e6392 [PATCH] dcdbas: add Dell Systems Management Base Driver with sysfs support

:::::: TO: Doug Warzecha <Douglas_Warzecha@dell.com>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
