Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C34079F1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 15:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692632185; x=1724168185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2K3MI7K+COnRaKbzjapXBahZUN/m1kWbdj6gly6joJE=;
  b=oKnTipb+EmfeVyf+S8MUq4PllnjS5qyWZjZ6yC+V/MqK6HAytBBqgG1h
   0a8NRQA//AShCByEUvrLWrKJRrB9gbz2Hys3c89oPlnEPMZ8goQtU9aRC
   n2lNNPs/Y+44BEMot+ooC7LCarINUmCMM1qXUcbLIi+1Hhg0NED8n4vkI
   AOW0+yJ7/Upbqo1AuMe1YPMy6rgyi1527hyLySuLWhwceSd8315nFrmZv
   C6OCn5Dv8jHJCBey96f8yzHEy7eAh83llZbq/ssqJ6tohKFfgIDQ6/fyn
   7J6CBWv9r4p8XK4RxtmI1cu4u3zlvEfRxUWY84KC12X7W5L1965tmWgQC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="377361945"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="377361945"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 08:36:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="738929691"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="738929691"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 21 Aug 2023 08:36:23 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qY6wz-0000e9-0p;
	Mon, 21 Aug 2023 15:36:20 +0000
Date: Mon, 21 Aug 2023 23:35:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2023-07 1/1]
 drivers/hid/hid-core.c:1777: undefined reference to `uhid_hid_driver'
Message-ID: <202308212320.Kue6tDV0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10-2023-07
head:   219d8dfbba0713b72b5b1088ad6c600ec9d656f3
commit: c93516a2d02c0a1f0466b3f512977c40c1bee4f0 [1/1] ANDROID: HID; Over-ride default maximum buffer size when using UHID
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230821/202308212320.Kue6tDV0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230821/202308212320.Kue6tDV0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308212320.Kue6tDV0-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/hid/hid-core.o: in function `hid_report_raw_event':
>> drivers/hid/hid-core.c:1777: undefined reference to `uhid_hid_driver'
   ld: drivers/hid/hid-core.o: in function `hid_add_field':
   drivers/hid/hid-core.c:293: undefined reference to `uhid_hid_driver'


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
