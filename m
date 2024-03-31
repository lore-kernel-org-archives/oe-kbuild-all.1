Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456AB1482E4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Mar 2024 22:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711926001; cv=none; b=ofA6eoLVQClDVwsWTMplK5EI5tR0U13vy5gmfZ89q+Sy+vkFVN7gZxFHtfNhFEFqeRTud0YYwz3jzXH6s1+afL1xXkSTLjrYnv5B2GpUAuVMsyfGMK/KNa7AfMi7Tn/STPws3n+JBiOGHbzctheBEH7u0M6UDWTdqeKwJXxviDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711926001; c=relaxed/simple;
	bh=3ewxPWwZB4kAonrGwcUcqiiRPMPHu8jXF4jEGgUH3xU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AJm/RY9nmwUaqUCHQwt3T/thgPPaEQq/43XD2SKetImVEFw/j+IhVcHQe/fm60+LOtV0NHn4HSWIk1OZrcJBKDpfVa3qEGSSXUJfqdVX3IDACNc2poqhForfu6ExfH4Oz4o4/XyycUIAFLxd1Z9lL3X3q/beXFzWRDL1LmsIYVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IUxUAjI1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IUxUAjI1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711925999; x=1743461999;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3ewxPWwZB4kAonrGwcUcqiiRPMPHu8jXF4jEGgUH3xU=;
  b=IUxUAjI1O2Jktzsf8zospqDz032Dc6sPVgJMnhmBBXKYk2BvAkN2sAAm
   nvyLBub4W7r8FUer6Gr1+TONn9opZQltJj+OoDAZQciM4oQZsL1W2JSkp
   +zyKFmCQgQraYQy4JDOPVmXSuHib6CZT8gIZv2ONpGdNhpE/cRnrQv3+k
   MBD09+thS15SvSm7eOjp47LE3UbwHB/GN0ORwW8VdqWJ3DpsK021POHqX
   mvuMD8ZLsjtmu0t+miJDVFZD6AooPUmA9In4MHmmLP0oQaSO1BuffhYHP
   uPxJeBcr+bb8E2dSsgr5Vy+iWyEnk5mCKy9IMNExHF2a6afEqEDQcFk8H
   A==;
X-CSE-ConnectionGUID: oF1o01KeRSivhmSCv/3Eiw==
X-CSE-MsgGUID: F3CKGHZ/TEGU+3hAZ/lHFA==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="10868935"
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="10868935"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 15:59:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="40704588"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 31 Mar 2024 15:59:54 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rr49Y-0001TI-07;
	Sun, 31 Mar 2024 22:59:52 +0000
Date: Mon, 1 Apr 2024 06:59:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 10/13]
 drivers/remoteproc/mediatek_apusys/mtk_apu_ipi.c:368:77: warning: cast from
 pointer to integer of different size
Message-ID: <202404010604.NOXfhhcx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   d010d5e1e024413b59938c00d390018f0e5305f8
commit: 7cf1285ed4af5b1002e8f9263a16aa7f618f9c98 [10/13] CHROMIUM: remoteproc: mediatek: Add APU remoteproc driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240401/202404010604.NOXfhhcx-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240401/202404010604.NOXfhhcx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404010604.NOXfhhcx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:7,
                    from drivers/remoteproc/mediatek_apusys/mtk_apu_ipi.c:6:
   drivers/remoteproc/mediatek_apusys/mtk_apu_ipi.c: In function 'mtk_apu_ipi_tx_done':
>> drivers/remoteproc/mediatek_apusys/mtk_apu_ipi.c:368:77: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     368 |                 dev_err(apu->dev, "tx not complete: sent:0x%llx, ret:%d\n", (u64)msg, ret);
         |                                                                             ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/remoteproc/mediatek_apusys/mtk_apu_ipi.c:368:17: note: in expansion of macro 'dev_err'
     368 |                 dev_err(apu->dev, "tx not complete: sent:0x%llx, ret:%d\n", (u64)msg, ret);
         |                 ^~~~~~~
   In file included from include/linux/printk.h:566,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:5,
                    from include/linux/string.h:293,
                    from include/linux/dma-mapping.h:6:
   drivers/remoteproc/mediatek_apusys/mtk_apu_ipi.c:370:74: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     370 |                 dev_dbg(apu->dev, "tx completed. sent:0x%llx, ret:%d\n", (u64)msg, ret);
         |                                                                          ^
   include/linux/dynamic_debug.h:223:29: note: in definition of macro '__dynamic_func_call_cls'
     223 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:272:9: note: in expansion of macro '_dynamic_func_call'
     272 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/remoteproc/mediatek_apusys/mtk_apu_ipi.c:370:17: note: in expansion of macro 'dev_dbg'
     370 |                 dev_dbg(apu->dev, "tx completed. sent:0x%llx, ret:%d\n", (u64)msg, ret);
         |                 ^~~~~~~
--
   In file included from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:7,
                    from drivers/remoteproc/mediatek_apusys/mtk_apu_rproc.c:7:
   drivers/remoteproc/mediatek_apusys/mtk_apu_rproc.c: In function 'mtk_apu_dram_boot_init':
>> drivers/remoteproc/mediatek_apusys/mtk_apu_rproc.c:131:28: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     131 |                  __func__, (uint64_t) apu->code_buf, (uint64_t) apu->code_da);
         |                            ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/remoteproc/mediatek_apusys/mtk_apu_rproc.c:130:9: note: in expansion of macro 'dev_info'
     130 |         dev_info(dev, "%s: apu->code_buf = 0x%llx, apu->code_da = 0x%llx\n",
         |         ^~~~~~~~
   drivers/remoteproc/mediatek_apusys/mtk_apu_rproc.c: In function 'mtk_apu_probe':
   drivers/remoteproc/mediatek_apusys/mtk_apu_rproc.c:415:38: warning: variable 'hw_ops' set but not used [-Wunused-but-set-variable]
     415 |         const struct mtk_apu_hw_ops *hw_ops;
         |                                      ^~~~~~
--
   drivers/remoteproc/mediatek_apusys/mtk_apu_loadimage.c: In function 'mtk_apusys_rv_load_fw':
>> drivers/remoteproc/mediatek_apusys/mtk_apu_loadimage.c:50:47: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      50 |                         sec_info->up_fw_ofs = (u64)img - (u64)sec_mem_addr_va;
         |                                               ^
   drivers/remoteproc/mediatek_apusys/mtk_apu_loadimage.c:50:58: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      50 |                         sec_info->up_fw_ofs = (u64)img - (u64)sec_mem_addr_va;
         |                                                          ^
   drivers/remoteproc/mediatek_apusys/mtk_apu_loadimage.c:59:50: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      59 |                         sec_info->up_xfile_ofs = (u64)hdr - (u64)sec_mem_addr_va;
         |                                                  ^
   drivers/remoteproc/mediatek_apusys/mtk_apu_loadimage.c:59:61: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      59 |                         sec_info->up_xfile_ofs = (u64)hdr - (u64)sec_mem_addr_va;
         |                                                             ^
   drivers/remoteproc/mediatek_apusys/mtk_apu_loadimage.c:66:54: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      66 |                         sec_info->mdla_fw_boot_ofs = (u64)img - (u64)sec_mem_addr_va;
         |                                                      ^
   drivers/remoteproc/mediatek_apusys/mtk_apu_loadimage.c:66:65: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      66 |                         sec_info->mdla_fw_boot_ofs = (u64)img - (u64)sec_mem_addr_va;
         |                                                                 ^
   drivers/remoteproc/mediatek_apusys/mtk_apu_loadimage.c:74:54: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      74 |                         sec_info->mdla_fw_main_ofs = (u64)img - (u64)sec_mem_addr_va;
         |                                                      ^
   drivers/remoteproc/mediatek_apusys/mtk_apu_loadimage.c:74:65: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      74 |                         sec_info->mdla_fw_main_ofs = (u64)img - (u64)sec_mem_addr_va;
         |                                                                 ^
   drivers/remoteproc/mediatek_apusys/mtk_apu_loadimage.c:82:52: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      82 |                         sec_info->mdla_xfile_ofs = (u64)hdr - (u64)sec_mem_addr_va;
         |                                                    ^
   drivers/remoteproc/mediatek_apusys/mtk_apu_loadimage.c:82:63: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      82 |                         sec_info->mdla_xfile_ofs = (u64)hdr - (u64)sec_mem_addr_va;
         |                                                               ^
   drivers/remoteproc/mediatek_apusys/mtk_apu_loadimage.c:90:49: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      90 |                         sec_info->mvpu_fw_ofs = (u64)img - (u64)sec_mem_addr_va;
         |                                                 ^
   drivers/remoteproc/mediatek_apusys/mtk_apu_loadimage.c:90:60: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      90 |                         sec_info->mvpu_fw_ofs = (u64)img - (u64)sec_mem_addr_va;
         |                                                            ^
   drivers/remoteproc/mediatek_apusys/mtk_apu_loadimage.c:97:52: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      97 |                         sec_info->mvpu_xfile_ofs = (u64)hdr - (u64)sec_mem_addr_va;
         |                                                    ^
   drivers/remoteproc/mediatek_apusys/mtk_apu_loadimage.c:97:63: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      97 |                         sec_info->mvpu_xfile_ofs = (u64)hdr - (u64)sec_mem_addr_va;
         |                                                               ^
   drivers/remoteproc/mediatek_apusys/mtk_apu_loadimage.c:105:53: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     105 |                         sec_info->mvpu_sec_fw_ofs = (u64)img - (u64)sec_mem_addr_va;
         |                                                     ^
   drivers/remoteproc/mediatek_apusys/mtk_apu_loadimage.c:105:64: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     105 |                         sec_info->mvpu_sec_fw_ofs = (u64)img - (u64)sec_mem_addr_va;
         |                                                                ^
   drivers/remoteproc/mediatek_apusys/mtk_apu_loadimage.c:113:56: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     113 |                         sec_info->mvpu_sec_xfile_ofs = (u64)hdr - (u64)sec_mem_addr_va;
         |                                                        ^
   drivers/remoteproc/mediatek_apusys/mtk_apu_loadimage.c:113:67: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     113 |                         sec_info->mvpu_sec_xfile_ofs = (u64)hdr - (u64)sec_mem_addr_va;
         |                                                                   ^
--
   drivers/soc/mediatek/apusys/mtk_apu_hw_logger.c: In function 'mtk_apu_hw_logger_seq_show':
>> drivers/soc/mediatek/apusys/mtk_apu_hw_logger.c:852:37: warning: passing argument 2 of 'seq_putc' makes integer from pointer without a cast [-Wint-conversion]
     852 |                         seq_putc(s, "\n");
         |                                     ^~~~
         |                                     |
         |                                     char *
   In file included from include/linux/debugfs.h:16,
                    from drivers/soc/mediatek/apusys/mtk_apu_hw_logger.c:8:
   include/linux/seq_file.h:120:40: note: expected 'char' but argument is of type 'char *'
     120 | void seq_putc(struct seq_file *m, char c);
         |                                   ~~~~~^


vim +368 drivers/remoteproc/mediatek_apusys/mtk_apu_ipi.c

   362	
   363	static void mtk_apu_ipi_tx_done(struct mbox_client *cl, void *msg, int ret)
   364	{
   365		struct mtk_apu *apu = container_of(cl, struct mtk_apu, cl);
   366	
   367		if (ret < 0)
 > 368			dev_err(apu->dev, "tx not complete: sent:0x%llx, ret:%d\n", (u64)msg, ret);
   369		else
   370			dev_dbg(apu->dev, "tx completed. sent:0x%llx, ret:%d\n", (u64)msg, ret);
   371	}
   372	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
