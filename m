Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03821C2315
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 15:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719587201; cv=none; b=gMWvsmW1cF/7x0NX9QKN97pxWHtkoMk0ezo5TAU1jjGLNL68LwH4cAP5zCfCyN6I5nIj4J28Y8vKiMRrGhaVOPawu6y1NuSB41Ne7fO9YE1XL+zvjsJGTw/Rmqf6WtCTD2rNfj4WKacVuooS9iCrHVgDytzkoVqgpbcmrTzDqTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719587201; c=relaxed/simple;
	bh=KBwlLDuFPqQqvFb/mvlVfnAiZbel7wzB7bapwuhr8Sw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tkQQkGvkP9jej7Gc/FDh/I6vtwcq3D/zPNQsetOSZjVJqzVC0nMcX31D/LWQbQ87eUzPC7zppkT1C5JW6r4CU6O7WlPiliGVa0IHqSAB0Xcb9q2p2vn4GFhuqtO0rZ1YGguRn88J/5k2C8Z0stfztUSwqDjVv5AXaCn4btEvXxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V1eFoOY1; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V1eFoOY1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719587199; x=1751123199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KBwlLDuFPqQqvFb/mvlVfnAiZbel7wzB7bapwuhr8Sw=;
  b=V1eFoOY1d1p4Bt8HrdxVZoM7C8kjBvkvRDIWm8rPCGIlaX3+ljNV356C
   fOUpmMDT4UEhMZxrqXBo+zSNBbQD902QKhYZfnVAmttkeiNcPaDttmNs4
   PqpqKq/FSRQZPCqj4hDw3vcoXAuYJf/WOcd1MFsUL0jYdexXOXZT9xtIc
   iKfU3QlXahn5h5wLJd+Vq73EwXlsIVIYgKuqyhxd0LNW4oS+csAjXWxuU
   TDAjn3kO5dCG/KaMnmPS18YhAxCzjMGCfezZHiiz9HlyZDZxcb6kRJQ9o
   ghaLY4AtqNvczX6CYY1ooFZN6E9yCAofbZoIZuzbXjHjaZfo7WT+vVIuB
   Q==;
X-CSE-ConnectionGUID: rKo5riTAStKMk2cyn+ylJw==
X-CSE-MsgGUID: w8/1MCLpTEm3Jd8FhgKZaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="28172165"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="28172165"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 08:06:38 -0700
X-CSE-ConnectionGUID: ZQfa1HQsS5CfuZo2Lrqudw==
X-CSE-MsgGUID: o+B5tKyoSUSp/TIcSqS/pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="45188458"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Jun 2024 08:06:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNDBK-000HDs-0N;
	Fri, 28 Jun 2024 15:06:34 +0000
Date: Fri, 28 Jun 2024 23:06:31 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 8744/9027] drivers/hid/hidraw.c:143:70: sparse:
 sparse: non size-preserving pointer to integer cast
Message-ID: <202406282242.Fk738zzy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   642a16ca7994a50d7de85715996a8ce171a5bdfb
commit: 67eccf151d76a9939ad8a50c6db5cb486b01df24 [8744/9027] HID: add source argument to HID low level functions
config: i386-randconfig-r132-20240628 (https://download.01.org/0day-ci/archive/20240628/202406282242.Fk738zzy-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406282242.Fk738zzy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406282242.Fk738zzy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hid/hidraw.c:143:70: sparse: sparse: non size-preserving pointer to integer cast
   drivers/hid/hidraw.c:154:63: sparse: sparse: non size-preserving pointer to integer cast
   drivers/hid/hidraw.c:231:63: sparse: sparse: non size-preserving pointer to integer cast

vim +143 drivers/hid/hidraw.c

   101	
   102	/*
   103	 * The first byte of the report buffer is expected to be a report number.
   104	 */
   105	static ssize_t hidraw_send_report(struct file *file, const char __user *buffer, size_t count, unsigned char report_type)
   106	{
   107		unsigned int minor = iminor(file_inode(file));
   108		struct hid_device *dev;
   109		__u8 *buf;
   110		int ret = 0;
   111	
   112		lockdep_assert_held(&minors_rwsem);
   113	
   114		if (!hidraw_table[minor] || !hidraw_table[minor]->exist) {
   115			ret = -ENODEV;
   116			goto out;
   117		}
   118	
   119		dev = hidraw_table[minor]->hid;
   120	
   121		if (count > HID_MAX_BUFFER_SIZE) {
   122			hid_warn(dev, "pid %d passed too large report\n",
   123				 task_pid_nr(current));
   124			ret = -EINVAL;
   125			goto out;
   126		}
   127	
   128		if (count < 2) {
   129			hid_warn(dev, "pid %d passed too short report\n",
   130				 task_pid_nr(current));
   131			ret = -EINVAL;
   132			goto out;
   133		}
   134	
   135		buf = memdup_user(buffer, count);
   136		if (IS_ERR(buf)) {
   137			ret = PTR_ERR(buf);
   138			goto out;
   139		}
   140	
   141		if ((report_type == HID_OUTPUT_REPORT) &&
   142		    !(dev->quirks & HID_QUIRK_NO_OUTPUT_REPORTS_ON_INTR_EP)) {
 > 143			ret = __hid_hw_output_report(dev, buf, count, (__u64)file);
   144			/*
   145			 * compatibility with old implementation of USB-HID and I2C-HID:
   146			 * if the device does not support receiving output reports,
   147			 * on an interrupt endpoint, fallback to SET_REPORT HID command.
   148			 */
   149			if (ret != -ENOSYS)
   150				goto out_free;
   151		}
   152	
   153		ret = __hid_hw_raw_request(dev, buf[0], buf, count, report_type,
   154					   HID_REQ_SET_REPORT, (__u64)file);
   155	
   156	out_free:
   157		kfree(buf);
   158	out:
   159		return ret;
   160	}
   161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
