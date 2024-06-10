Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F8D3C0B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jun 2024 03:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717991199; cv=none; b=iD0sz3n9YOV7giFWvu8Q021xs/wkgOmR7bkDmQ8Mus/AhaQdJgCMV1SdBcxoNtYxyczAysiQUOUI5AQeeRUpzoTebVydJkhanfFBa4LwNPpvLlgvLklNgIAH0bRmPSyEh2rvSZGnVtCX9JeS7Vhda3eniz1cBe6iC99/rq5kGTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717991199; c=relaxed/simple;
	bh=ulJ3Sh7DiqxOHdpbb86wo4qS3OgHxZAMNi/16ZnYN2s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sR9n7H6K0PRJGvN9D+yPCPn4w82oqsrv8fuep15So5b6yHjp69PvgoWW+d+b7YI+T8ztcciTM5bwXHzoosjIPaO14zYe2Vxf7Cq2a8C7U5esl10W3LU0ZNfmNCLI/5+KMrLDcrmBFF0pYYna+XrQUANhKG3zYmhtR8oTbK4NDNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C1YBMWwU; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C1YBMWwU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717991198; x=1749527198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ulJ3Sh7DiqxOHdpbb86wo4qS3OgHxZAMNi/16ZnYN2s=;
  b=C1YBMWwUvH68wvtzDEIF2E1b93KRwL+ccnq9pZeyZfEucKwPa5eSsxlu
   PO1B6n0nd/jG22DTVH/6Mt7PRca2I6j530L+gPm4lIsHHD1suQ9gzXRFd
   s4Y09ABao2VhbL9eu3teDxYFJidCqNkzTeZwvIEFuikMYtGehGWS2Blrm
   XMw9bH2wsOf3wScVowq2mWjc0h4/hkfoCKsEeK84flCP9zd5BYE1YYDcN
   tX2aw31N8FEOYtuOVnTV9r6eyK5XY0ucATpwu/DKukuiplAINqaD3SOzQ
   zzJr/Gz/pQ5fZC5kSGdElzHCttXlsh8gRS1wNYwTMFQPK8COZYI8/XY3+
   A==;
X-CSE-ConnectionGUID: zHJJrrI4RnaxJ1VoCm3kFQ==
X-CSE-MsgGUID: L6Ow5fe4TUmN7sygi18oIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="25744444"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="25744444"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 20:46:37 -0700
X-CSE-ConnectionGUID: HDoQ65KIS56Lshm1oJQQgA==
X-CSE-MsgGUID: OATOpgzhS/2Uk44C0qDG7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="39595221"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Jun 2024 20:46:36 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGVzN-0001pW-1t;
	Mon, 10 Jun 2024 03:46:33 +0000
Date: Mon, 10 Jun 2024 11:45:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/3]
 drivers/hid/hid-core.c:1777:undefined reference to `uhid_hid_driver'
Message-ID: <202406101114.Tq3c9sfx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   4c32142bde61e3d99fc56ea42581d06c33435fe7
commit: 6804500c16a5ba86b57c9976fc1491fa0efc2132 [2/3] ANDROID: HID; Over-ride default maximum buffer size when using UHID
config: x86_64-randconfig-014-20240610 (https://download.01.org/0day-ci/archive/20240610/202406101114.Tq3c9sfx-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406101114.Tq3c9sfx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406101114.Tq3c9sfx-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/hid/hid-core.o: in function `hid_report_raw_event':
>> drivers/hid/hid-core.c:1777:(.text+0x7090): undefined reference to `uhid_hid_driver'
   ld: drivers/hid/hid-core.o: in function `hid_add_field':
   drivers/hid/hid-core.c:293:(.text+0x83e2): undefined reference to `uhid_hid_driver'


vim +1777 drivers/hid/hid-core.c

  1753	
  1754	int hid_report_raw_event(struct hid_device *hid, int type, u8 *data, u32 size,
  1755			int interrupt)
  1756	{
  1757		struct hid_report_enum *report_enum = hid->report_enum + type;
  1758		struct hid_report *report;
  1759		struct hid_driver *hdrv;
  1760		int max_buffer_size = HID_MAX_BUFFER_SIZE;
  1761		unsigned int a;
  1762		u32 rsize, csize = size;
  1763		u8 *cdata = data;
  1764		int ret = 0;
  1765	
  1766		report = hid_get_report(report_enum, data);
  1767		if (!report)
  1768			goto out;
  1769	
  1770		if (report_enum->numbered) {
  1771			cdata++;
  1772			csize--;
  1773		}
  1774	
  1775		rsize = hid_compute_report_size(report);
  1776	
> 1777		if (hid->ll_driver == &uhid_hid_driver)
  1778			max_buffer_size = UHID_DATA_MAX;
  1779	
  1780		if (report_enum->numbered && rsize >= max_buffer_size)
  1781			rsize = max_buffer_size - 1;
  1782		else if (rsize > max_buffer_size)
  1783			rsize = max_buffer_size;
  1784	
  1785		if (csize < rsize) {
  1786			dbg_hid("report %d is too short, (%d < %d)\n", report->id,
  1787					csize, rsize);
  1788			memset(cdata + csize, 0, rsize - csize);
  1789		}
  1790	
  1791		if ((hid->claimed & HID_CLAIMED_HIDDEV) && hid->hiddev_report_event)
  1792			hid->hiddev_report_event(hid, report);
  1793		if (hid->claimed & HID_CLAIMED_HIDRAW) {
  1794			ret = hidraw_report_event(hid, data, size);
  1795			if (ret)
  1796				goto out;
  1797		}
  1798	
  1799		if (hid->claimed != HID_CLAIMED_HIDRAW && report->maxfield) {
  1800			for (a = 0; a < report->maxfield; a++)
  1801				hid_input_field(hid, report->field[a], cdata, interrupt);
  1802			hdrv = hid->driver;
  1803			if (hdrv && hdrv->report)
  1804				hdrv->report(hid, report);
  1805		}
  1806	
  1807		if (hid->claimed & HID_CLAIMED_INPUT)
  1808			hidinput_report_event(hid, report);
  1809	out:
  1810		return ret;
  1811	}
  1812	EXPORT_SYMBOL_GPL(hid_report_raw_event);
  1813	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
