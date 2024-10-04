Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99194224D1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 11:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728040639; cv=none; b=OvDOElvHtGfFxyXSe0YCZE8JsPQvwR3W3GmEfMmnUPm09mhne50LwN9AA6zmjmn39twQcrK1GyV46Cwm7CITMGMskoPQ9VstTTa/XEdk1/OXLniU4/D6pErOfyVL/piAzXFMakOuiSCcmJoad8Jtf1Ks/imIt99bfcSISzlSsl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728040639; c=relaxed/simple;
	bh=bepu9rpmKRAlHBeCMI/iAZxudwXQCKPwoQdPz9opmsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d2Rt9oz0uLS/Nuye45OgiJ3aOoHacindbEBG5CO2EfzG8T3KH2h2olsvxRocgcQrbZuOlmln+K0eDmFDFEitSQcnox78NKWkylfZ/1SUt2Oxv0R9bBGttCqaCfNJKSYLwPvEWky3totVd4falb1nCLuLwM+XAMH6sbYwYSVSf4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BvQNdoYA; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BvQNdoYA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728040638; x=1759576638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bepu9rpmKRAlHBeCMI/iAZxudwXQCKPwoQdPz9opmsQ=;
  b=BvQNdoYAZ1MTR94vRCw+daP3nfh0la3m8Uiz9te013fyV/LKovnq3tyv
   SpiqFSVWCrCt/emoQgTNTt0GlZ1sPHCGK1GpsMjMKS3DZOIQbGa1j/Ex4
   4DmIymOhWkWB9NucPLsXbPxPcpF1T3slhEv7AmEtDH2uVTKCjrJ4FBRfo
   YHDZFWRQK22ILDhlUCBdWPWzckGu5YQnGGSNyX8awLQeNI58r3TxJ7Q5j
   WqMnyjI6GGkcjjupihIfLWg5oxzS9YX3gQRtrX1c1LitGHWjvM6NaVvZk
   VJkEmeh0PN4uoKTk767laHtMdiZZWXEoKToiXTCUnah9BJCZ3qlGALOfI
   g==;
X-CSE-ConnectionGUID: rlHRhky7QfO6WZR3jtoqwg==
X-CSE-MsgGUID: r0ksucFeR16+dvc6q0PY8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27429550"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="27429550"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 04:17:16 -0700
X-CSE-ConnectionGUID: DpRQ42T0TwCAwHNWTARUlg==
X-CSE-MsgGUID: nLTPkjXUR3CE6Y0CvLc1aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="79102497"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Oct 2024 04:17:14 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swgJ6-0001Xw-0d;
	Fri, 04 Oct 2024 11:17:12 +0000
Date: Fri, 4 Oct 2024 19:16:26 +0800
From: kernel test robot <lkp@intel.com>
To: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 146/1001]
 drivers/staging/xlnx_tsmux/xlnx_mpg2tsmux.c:1089:41: warning: format '%llx'
 expects argument of type 'long long unsigned int', but argument 5 has type
 'dma_addr_t' {aka 'unsigned int'}
Message-ID: <202410041953.UlnTEMS5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: aafe7922b017060a8c5fdf4f98899737206200af [146/1001] staging: xlnx_tsmux: Initial version of xlnx mpeg2tsmux driver
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241004/202410041953.UlnTEMS5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410041953.UlnTEMS5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410041953.UlnTEMS5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:564,
                    from include/linux/kernel.h:30,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/current.h:10,
                    from include/linux/mutex.h:14,
                    from include/linux/kernfs.h:11,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/cdev.h:5,
                    from drivers/staging/xlnx_tsmux/xlnx_mpg2tsmux.c:10:
   drivers/staging/xlnx_tsmux/xlnx_mpg2tsmux.c: In function 'xlnx_tsmux_ioctl_verify_dmabuf':
>> drivers/staging/xlnx_tsmux/xlnx_mpg2tsmux.c:1089:41: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
    1089 |                                         "%s: phy-addr=0x%llx for src dmabuf=%d",
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/staging/xlnx_tsmux/xlnx_mpg2tsmux.c:1088:33: note: in expansion of macro 'dev_dbg'
    1088 |                                 dev_dbg(mpgmuxts->dev,
         |                                 ^~~~~~~
   drivers/staging/xlnx_tsmux/xlnx_mpg2tsmux.c:1089:60: note: format string is defined here
    1089 |                                         "%s: phy-addr=0x%llx for src dmabuf=%d",
         |                                                         ~~~^
         |                                                            |
         |                                                            long long unsigned int
         |                                                         %x
   drivers/staging/xlnx_tsmux/xlnx_mpg2tsmux.c:1117:41: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
    1117 |                                         "phy-addr=0x%llx for src dmabuf=%d",
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/staging/xlnx_tsmux/xlnx_mpg2tsmux.c:1116:33: note: in expansion of macro 'dev_dbg'
    1116 |                                 dev_dbg(mpgmuxts->dev,
         |                                 ^~~~~~~
   drivers/staging/xlnx_tsmux/xlnx_mpg2tsmux.c:1117:56: note: format string is defined here
    1117 |                                         "phy-addr=0x%llx for src dmabuf=%d",
         |                                                     ~~~^
         |                                                        |
         |                                                        long long unsigned int
         |                                                     %x


vim +1089 drivers/staging/xlnx_tsmux/xlnx_mpg2tsmux.c

  1016	
  1017	static int xlnx_tsmux_ioctl_verify_dmabuf(struct xlnx_tsmux *mpgmuxts,
  1018						  void __user *arg)
  1019	{
  1020		struct dma_buf *dbuf;
  1021		struct dma_buf_attachment *attach;
  1022		struct sg_table *sgt;
  1023		struct xlnx_tsmux_dmabuf_info *dbuf_info;
  1024		s32 i;
  1025		int ret = 0;
  1026	
  1027		dbuf_info = kzalloc(sizeof(*dbuf_info), GFP_KERNEL);
  1028		if (!dbuf_info)
  1029			return -ENOMEM;
  1030	
  1031		ret = copy_from_user(dbuf_info, arg,
  1032				     sizeof(struct xlnx_tsmux_dmabuf_info));
  1033		if (ret) {
  1034			dev_err(mpgmuxts->dev, "Failed to copy from user");
  1035			goto dmak_free;
  1036		}
  1037		if (dbuf_info->dir != DMA_TO_MPG2MUX &&
  1038		    dbuf_info->dir != DMA_FROM_MPG2MUX) {
  1039			dev_err(mpgmuxts->dev, "Incorrect DMABUF direction %d",
  1040				dbuf_info->dir);
  1041			ret = -EINVAL;
  1042			goto dmak_free;
  1043		}
  1044		dbuf = dma_buf_get(dbuf_info->buf_fd);
  1045		if (IS_ERR(dbuf)) {
  1046			dev_err(mpgmuxts->dev, "dma_buf_get fail fd %d direction %d",
  1047				dbuf_info->buf_fd, dbuf_info->dir);
  1048			ret = PTR_ERR(dbuf);
  1049			goto dmak_free;
  1050		}
  1051		attach = dma_buf_attach(dbuf, mpgmuxts->dev);
  1052		if (IS_ERR(attach)) {
  1053			dev_err(mpgmuxts->dev, "dma_buf_attach fail fd %d dir %d",
  1054				dbuf_info->buf_fd, dbuf_info->dir);
  1055			ret = PTR_ERR(attach);
  1056			goto err_dmabuf_put;
  1057		}
  1058		sgt = dma_buf_map_attachment(attach,
  1059					     (enum dma_data_direction)(dbuf_info->dir));
  1060		if (IS_ERR(sgt)) {
  1061			dev_err(mpgmuxts->dev, "dma_buf_map_attach fail fd %d dir %d",
  1062				dbuf_info->buf_fd, dbuf_info->dir);
  1063			ret = PTR_ERR(sgt);
  1064			goto err_dmabuf_detach;
  1065		}
  1066	
  1067		if (sgt->nents > 1) {
  1068			ret = -EIO;
  1069			dev_dbg(mpgmuxts->dev, "Not contig nents %d fd %d direction %d",
  1070				sgt->nents, dbuf_info->buf_fd, dbuf_info->dir);
  1071			goto err_dmabuf_unmap_attachment;
  1072		}
  1073		dev_dbg(mpgmuxts->dev, "dmabuf %s is physically contiguous",
  1074			(dbuf_info->dir ==
  1075			 DMA_TO_MPG2MUX ? "Source" : "Destination"));
  1076	
  1077		if (dbuf_info->dir == DMA_TO_MPG2MUX) {
  1078			for (i = 0; i < XTSMUX_MAXIN_STRM; i++) {
  1079				if (!mpgmuxts->src_dmabufintl[i].buf_id) {
  1080					mpgmuxts->src_dmabufintl[i].dbuf = dbuf;
  1081					mpgmuxts->src_dmabufintl[i].attach = attach;
  1082					mpgmuxts->src_dmabufintl[i].sgt = sgt;
  1083					mpgmuxts->src_dmabufintl[i].dmabuf_addr =
  1084							sg_dma_address(sgt->sgl);
  1085					mpgmuxts->src_dmabufintl[i].dmabuf_fd =
  1086								dbuf_info->buf_fd;
  1087					mpgmuxts->src_dmabufintl[i].buf_id = i + 1;
  1088					dev_dbg(mpgmuxts->dev,
> 1089						"%s: phy-addr=0x%llx for src dmabuf=%d",
  1090						__func__,
  1091						mpgmuxts->src_dmabufintl[i].dmabuf_addr,
  1092						mpgmuxts->src_dmabufintl[i].dmabuf_fd);
  1093					break;
  1094				}
  1095			}
  1096			/* External src streams more than XTSMUX_MAXIN_STRM
  1097			 * can not be handled
  1098			 */
  1099			if (i == XTSMUX_MAXIN_STRM) {
  1100				ret = -EIO;
  1101				dev_dbg(mpgmuxts->dev, "src DMA bufs more than %d",
  1102					XTSMUX_MAXIN_STRM);
  1103				goto err_dmabuf_unmap_attachment;
  1104			}
  1105		} else {
  1106			for (i = 0; i < XTSMUX_MAXOUT_STRM; i++) {
  1107				if (!mpgmuxts->dst_dmabufintl[i].buf_id) {
  1108					mpgmuxts->dst_dmabufintl[i].dbuf = dbuf;
  1109					mpgmuxts->dst_dmabufintl[i].attach = attach;
  1110					mpgmuxts->dst_dmabufintl[i].sgt = sgt;
  1111					mpgmuxts->dst_dmabufintl[i].dmabuf_addr =
  1112							sg_dma_address(sgt->sgl);
  1113					mpgmuxts->dst_dmabufintl[i].dmabuf_fd =
  1114							dbuf_info->buf_fd;
  1115					mpgmuxts->dst_dmabufintl[i].buf_id = i + 1;
  1116					dev_dbg(mpgmuxts->dev,
  1117						"phy-addr=0x%llx for src dmabuf=%d",
  1118						mpgmuxts->dst_dmabufintl[i].dmabuf_addr,
  1119						mpgmuxts->dst_dmabufintl[i].dmabuf_fd);
  1120					break;
  1121				}
  1122			}
  1123			/* External dst streams more than XTSMUX_MAXOUT_STRM
  1124			 * can not be handled
  1125			 */
  1126			if (i == XTSMUX_MAXOUT_STRM) {
  1127				ret = -EIO;
  1128				dev_dbg(mpgmuxts->dev, "dst DMA bufs more than %d",
  1129					XTSMUX_MAXOUT_STRM);
  1130				goto err_dmabuf_unmap_attachment;
  1131			}
  1132		}
  1133	
  1134		return 0;
  1135	
  1136	err_dmabuf_unmap_attachment:
  1137		dma_buf_unmap_attachment(attach, sgt,
  1138					 (enum dma_data_direction)dbuf_info->dir);
  1139	err_dmabuf_detach:
  1140		dma_buf_detach(dbuf, attach);
  1141	err_dmabuf_put:
  1142		dma_buf_put(dbuf);
  1143	dmak_free:
  1144		kfree(dbuf_info);
  1145	
  1146		return ret;
  1147	}
  1148	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
