Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D60440C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 01:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726278282; cv=none; b=PbRw5fyxf7ymwcvrwvheli4pjfDBjoYPTsouCeuPCl3y1yaHsh/oZebQT23aNOTsfd9JixOu2Q1mywWBz/9MMiWaAK1ZVxnhBGW0e9VdqTes+/WwuvhcBT11qgS1qUusSl5E6SMBjVK/K+wQNCzBICx7FKnIG1191haP1h6/VBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726278282; c=relaxed/simple;
	bh=7PE0TWR4MidGJwasi90H0Hd94ViXnJcHbucQglJ+DzM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kX5DPdQpDARG9ChbZEY+l7UNrpy/yGLEnRf9DC6aBquJuc4Io3peND8gSk7ZLKTRMQCiLd76qf6Wxc+L1u+9bnTQVykU2ywTRWTm1ZutmNRO2Shk/Ju1wmzjEV0YF1ACc/9LsQnmHBAgEdl4XN+g6avwNOCa/11rKMt+43LkryI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XSUP5ORb; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XSUP5ORb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726278281; x=1757814281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7PE0TWR4MidGJwasi90H0Hd94ViXnJcHbucQglJ+DzM=;
  b=XSUP5ORbWqLX6laN/EJyNZaL7vw0JhXdxsSewAcBsnUaRDWwMCLv+vgu
   66kunX234kZ36NAsC7RbLnYS2tapast1WTjK8kgxOlYMArduEl2X6fD3Y
   QtreKtyWXgr/aWOvKqLnKyBtmd3c29wdev9i9lq4z+ocVevwVYW/EZy2d
   v1hKmqY1dYoYNdD6s8x02ti1/TnAsHFNFgjhHphUEfTzp/JhHf942WvEm
   iMagDIDM9GZiRPdYuJxbLJ9CqsgL4Yei3OslEXEfOSih6gFmabQQFIcvi
   96uFSt30CYgcB2LGWnhXkk5aBm5ZUIeI7vIWHeZ7KwSK9PC6Km/OTAtUs
   g==;
X-CSE-ConnectionGUID: c9D4OqKeTSuqFR8FHJs5Lw==
X-CSE-MsgGUID: PxtY1NSSTRmW5BQXYM/2AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="28978675"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="28978675"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 18:44:38 -0700
X-CSE-ConnectionGUID: MkElL7YtT8+Bn2Ii+BeKmg==
X-CSE-MsgGUID: l8DHiFTXSx2TsX/RCR3utA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="67887818"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Sep 2024 18:44:34 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spHpw-0007Eg-1o;
	Sat, 14 Sep 2024 01:44:32 +0000
Date: Sat, 14 Sep 2024 09:44:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhangshuowen96 <zhangshuowen@hisilicon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29981/30000]
 drivers/misc/sdma-dae/sdma_dbg.c:84:13: warning: variable
 'exclusive_chn_num' set but not used
Message-ID: <202409140941.IxieoOe3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   5a1d9701155c6908c76c68951170f10279685143
commit: bacc47789eb5be49559f82859f5e4f0f25122af6 [29981/30000] driver:misc:sdma-dae: add debugfs of sdma-dae
config: arm64-randconfig-002-20240914 (https://download.01.org/0day-ci/archive/20240914/202409140941.IxieoOe3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409140941.IxieoOe3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140941.IxieoOe3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/misc/sdma-dae/sdma_dbg.c:6:
   drivers/misc/sdma-dae/sdma_hal.h: In function 'sdma_channel_clear_ioe_status':
   drivers/misc/sdma-dae/sdma_hal.h:227:32: warning: variable 'reg_val' set but not used [-Wunused-but-set-variable]
     227 |         union sdmam_irq_status reg_val = {0};
         |                                ^~~~~~~
   drivers/misc/sdma-dae/sdma_dbg.c: In function 'sdma_debugfs_stats_show':
>> drivers/misc/sdma-dae/sdma_dbg.c:84:13: warning: variable 'exclusive_chn_num' set but not used [-Wunused-but-set-variable]
      84 |         u32 exclusive_chn_num;
         |             ^~~~~~~~~~~~~~~~~


vim +/exclusive_chn_num +84 drivers/misc/sdma-dae/sdma_dbg.c

    75	
    76	static int sdma_debugfs_stats_show(struct seq_file *f, void *data SDMA_UNUSED)
    77	{
    78		u32 num = dbg_g_info.core_dev->sdma_device_num;
    79		struct hisi_sdma_chn_num chn_num;
    80		struct hisi_sdma_channel *pchan;
    81		struct hisi_sdma_device *dev;
    82		u32 exclusive_chn_used_nr;
    83		u32 share_chn_used_nr;
  > 84		u32 exclusive_chn_num;
    85		u32 chn_idx;
    86		u32 i;
    87	
    88		split_line(f);
    89		seq_printf(f, "SDMA Devices Num = %u\n", num);
    90		if (num == 0)
    91			return 0;
    92	
    93		for (i = 0; i < num; i++) {
    94			spin_lock(&dbg_g_info.core_dev->device_lock);
    95			dev = dbg_g_info.core_dev->sdma_devices[i];
    96			if (!dev) {
    97				seq_puts(f, "sdma_devices already released!\n");
    98				spin_unlock(&dbg_g_info.core_dev->device_lock);
    99				return -ENXIO;
   100			}
   101			chn_num = sdma_chn_info(f, dev);
   102			exclusive_chn_num = chn_num.total_chn_num - chn_num.share_chn_num;
   103			exclusive_chn_used_nr = dev->nr_channel_used;
   104			seq_printf(f, "Used exclusive chn total num = %u\n", exclusive_chn_used_nr);
   105			seq_puts(f, "\n");
   106			split_line(f);
   107			share_chn_used_nr = 0;
   108			chn_idx = 0;
   109			seq_printf(f, "SDMA[%u] Used share chn id:\n", i);
   110			while (chn_idx < chn_num.share_chn_num) {
   111				pchan = dev->channels + chn_idx;
   112				if (pchan->cnt_used != 0) {
   113					share_chn_used_nr++;
   114					seq_printf(f, "%u\t", chn_idx);
   115				}
   116				++chn_idx;
   117			}
   118			seq_printf(f, "\nSDMA[%u] Used share chn total num = %u\n", i, share_chn_used_nr);
   119			split_line(f);
   120			sdma_scan_channel_status(f, dev, chn_num.share_chn_num);
   121			spin_unlock(&dbg_g_info.core_dev->device_lock);
   122		}
   123	
   124		return 0;
   125	}
   126	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
