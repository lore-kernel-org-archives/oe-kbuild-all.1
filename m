Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DBF39C01E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 22:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778623874; cv=none; b=mX4Bp4FHLKM+r786lFlHrDskllwz5TnlT46CB4gnblCD8hcnz4hbtmwCXBeQ/24aFCCCYbfJVdjsoPOQFCa3YG0Ijil7iGgY8DO+juzIr5hUL9CEjtmPC5T3juja3uUu6IOz0kehOzowT8kybjNnC5fJ6ddUNHOdt/TIX72uFbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778623874; c=relaxed/simple;
	bh=sTfY+TbLiEI19mCEeQj1xd4ACM74qvNvLPCWOv0FG+4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cGYaDO7W+5EZWiCGPEiBC50KqWXXXsofvHtJBqldyb9Rt6Gq1NcVxpLI40tBIQXgpgowYDvKpqbb/vjRD9DbN4Dr6k9m91FKRJbhhSXK72QDWmBV96YznId/JQrxtotbUR1KJogN2QGOStdEwf5pqGu5qMlNk99cxEf1gmovqg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OIBezFS+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OIBezFS+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778623873; x=1810159873;
  h=date:from:to:cc:subject:message-id;
  bh=sTfY+TbLiEI19mCEeQj1xd4ACM74qvNvLPCWOv0FG+4=;
  b=OIBezFS+/krtKmsWFjfoAku/iDsoIWaT8R94UVCd/r2OdnlHwqcv4F/0
   1lW4SIWwLI4hwR1HnDCfv0DItwkXkT1awXMU/wsCof5aGefKQDVDQFnSc
   gznCe7DTOjgKYSxvyCTs3lvqHhk1i4GC/HWOJ1MUqMyaJtTdqLNWtqH/v
   eh7zdcfPIQh+tBfyqsPwSuKiZnZzEyQ0zf9OaCENuk/5G4NWgRKFXiqBQ
   KIFDGqYsDCvcEfn+MBOLZmAu37ltyMXizpaAFc/xYmdiS+WgPinWc253K
   hcgqv/qbIHa9Nh7KOF6Y+xaazrRJnutpJ2m2ocl6gvaYeG1K46NG4GsXh
   g==;
X-CSE-ConnectionGUID: fxUO3mlySZKOWqfz6fPa3g==
X-CSE-MsgGUID: 41gGBC9SS+i1Iz52k+RHqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79494710"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="79494710"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 15:11:11 -0700
X-CSE-ConnectionGUID: GTRD6UKBSKKKGJ1TK+P/Tg==
X-CSE-MsgGUID: oin+gVBxSjq1xVwJbIfe6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="237984930"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 May 2026 15:11:09 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMvJi-000000002tD-0XpA;
	Tue, 12 May 2026 22:11:06 +0000
Date: Wed, 13 May 2026 06:10:25 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
 Jiri Kosina <jikos@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: [hid:for-next 9/14] drivers/hid/hid-core.c:2053:43: warning:
 format '%ld' expects argument of type 'long int', but argument 5 has type
 'size_t' {aka 'unsigned int'}
Message-ID: <202605130624.FPpzDGhD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
head:   5d1aae9252b4632ef942017fdd18b9993a5a22ef
commit: 2c85c61d1332e1e16f020d76951baf167dcb6f7a [9/14] HID: pass the buffer size to hid_report_raw_event
config: nios2-defconfig (https://download.01.org/0day-ci/archive/20260513/202605130624.FPpzDGhD-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130624.FPpzDGhD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605130624.FPpzDGhD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/input.h:19,
                    from drivers/hid/hid-core.c:25:
   drivers/hid/hid-core.c: In function 'hid_report_raw_event':
>> drivers/hid/hid-core.c:2053:43: warning: format '%ld' expects argument of type 'long int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
    2053 |                 hid_warn_ratelimited(hid, "Event data for report %d is incorrect (%d vs %ld)\n",
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:156:61: note: in expansion of macro 'dev_fmt'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   include/linux/dev_printk.h:215:17: note: in expansion of macro 'dev_warn'
     215 |                 dev_level(dev, fmt, ##__VA_ARGS__);                     \
         |                 ^~~~~~~~~
   include/linux/dev_printk.h:227:9: note: in expansion of macro 'dev_level_ratelimited'
     227 |         dev_level_ratelimited(dev_warn, dev, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:1340:9: note: in expansion of macro 'dev_warn_ratelimited'
    1340 |         dev_warn_ratelimited(&(hid)->dev, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:2053:17: note: in expansion of macro 'hid_warn_ratelimited'
    2053 |                 hid_warn_ratelimited(hid, "Event data for report %d is incorrect (%d vs %ld)\n",
         |                 ^~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:2053:91: note: format string is defined here
    2053 |                 hid_warn_ratelimited(hid, "Event data for report %d is incorrect (%d vs %ld)\n",
         |                                                                                         ~~^
         |                                                                                           |
         |                                                                                           long int
         |                                                                                         %d
   In file included from include/linux/device.h:15,
                    from include/linux/input.h:19,
                    from drivers/hid/hid-core.c:25:
   drivers/hid/hid-core.c:2075:43: warning: format '%ld' expects argument of type 'long int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
    2075 |                 hid_warn_ratelimited(hid, "Event data for report %d was too short (%d vs %ld)\n",
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:156:61: note: in expansion of macro 'dev_fmt'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   include/linux/dev_printk.h:215:17: note: in expansion of macro 'dev_warn'
     215 |                 dev_level(dev, fmt, ##__VA_ARGS__);                     \
         |                 ^~~~~~~~~
   include/linux/dev_printk.h:227:9: note: in expansion of macro 'dev_level_ratelimited'
     227 |         dev_level_ratelimited(dev_warn, dev, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:1340:9: note: in expansion of macro 'dev_warn_ratelimited'
    1340 |         dev_warn_ratelimited(&(hid)->dev, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:2075:17: note: in expansion of macro 'hid_warn_ratelimited'
    2075 |                 hid_warn_ratelimited(hid, "Event data for report %d was too short (%d vs %ld)\n",
         |                 ^~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:2075:92: note: format string is defined here
    2075 |                 hid_warn_ratelimited(hid, "Event data for report %d was too short (%d vs %ld)\n",
         |                                                                                          ~~^
         |                                                                                            |
         |                                                                                            long int
         |                                                                                          %d


vim +2053 drivers/hid/hid-core.c

  2035	
  2036	int hid_report_raw_event(struct hid_device *hid, enum hid_report_type type, u8 *data,
  2037				 size_t bufsize, u32 size, int interrupt)
  2038	{
  2039		struct hid_report_enum *report_enum = hid->report_enum + type;
  2040		struct hid_report *report;
  2041		struct hid_driver *hdrv;
  2042		int max_buffer_size = HID_MAX_BUFFER_SIZE;
  2043		u32 rsize, csize = size;
  2044		size_t bsize = bufsize;
  2045		u8 *cdata = data;
  2046		int ret = 0;
  2047	
  2048		report = hid_get_report(report_enum, data);
  2049		if (!report)
  2050			return 0;
  2051	
  2052		if (unlikely(bsize < csize)) {
> 2053			hid_warn_ratelimited(hid, "Event data for report %d is incorrect (%d vs %ld)\n",
  2054					     report->id, csize, bsize);
  2055			return -EINVAL;
  2056		}
  2057	
  2058		if (report_enum->numbered) {
  2059			cdata++;
  2060			csize--;
  2061			bsize--;
  2062		}
  2063	
  2064		rsize = hid_compute_report_size(report);
  2065	
  2066		if (hid->ll_driver->max_buffer_size)
  2067			max_buffer_size = hid->ll_driver->max_buffer_size;
  2068	
  2069		if (report_enum->numbered && rsize >= max_buffer_size)
  2070			rsize = max_buffer_size - 1;
  2071		else if (rsize > max_buffer_size)
  2072			rsize = max_buffer_size;
  2073	
  2074		if (bsize < rsize) {
  2075			hid_warn_ratelimited(hid, "Event data for report %d was too short (%d vs %ld)\n",
  2076					     report->id, rsize, bsize);
  2077			return -EINVAL;
  2078		}
  2079	
  2080		if (csize < rsize) {
  2081			dbg_hid("report %d is too short, (%d < %d)\n", report->id,
  2082				csize, rsize);
  2083			memset(cdata + csize, 0, rsize - csize);
  2084		}
  2085	
  2086		if ((hid->claimed & HID_CLAIMED_HIDDEV) && hid->hiddev_report_event)
  2087			hid->hiddev_report_event(hid, report);
  2088		if (hid->claimed & HID_CLAIMED_HIDRAW) {
  2089			ret = hidraw_report_event(hid, data, size);
  2090			if (ret)
  2091				return ret;
  2092		}
  2093	
  2094		if (hid->claimed != HID_CLAIMED_HIDRAW && report->maxfield) {
  2095			hid_process_report(hid, report, cdata, interrupt);
  2096			hdrv = hid->driver;
  2097			if (hdrv && hdrv->report)
  2098				hdrv->report(hid, report);
  2099		}
  2100	
  2101		if (hid->claimed & HID_CLAIMED_INPUT)
  2102			hidinput_report_event(hid, report);
  2103	
  2104		return ret;
  2105	}
  2106	EXPORT_SYMBOL_GPL(hid_report_raw_event);
  2107	
  2108	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
