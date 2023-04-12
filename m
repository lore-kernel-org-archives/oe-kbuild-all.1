Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73BD746F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 18:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681322844; x=1712858844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=za3IoSfGXqxap9wFYNmp4bNPdeuTE9+OW883Evxq//8=;
  b=HSBdOvdBhuwAOVmMG28dKQ6LaP4AjX/nUryNHfW6EAH9dHW6UabmIuNQ
   g9urk7PGvWhRE7ZqHdTF393pdlWFyh6vVdVWOT7QvyXvJg1XEiW4TjDdU
   Ld0SARQH9tHYXcd+X1VQuBo6DcfwTeDzIIVfb5sRLmwP3D8DB1uPmN9Mr
   0aPp7Q7dOQ8m1QP5pC7GweWqDW/3MphBJ/Zsz6xef2Wm4Z4BpBi4DbHVk
   hOl5Yf+tVzmE3Zk8g9nPWd3HAnPT742CQUlVQb5F+ZG0TR8q7l0UpA/h4
   o6Us1xgvIdNBgPh54Kj8qvnV2WDZIhEGNO6pP7Bw+qGpzv9hQt4qvCgWF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="323603440"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="323603440"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 11:07:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="721670404"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="721670404"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 12 Apr 2023 11:07:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmesK-000XyB-1E;
	Wed, 12 Apr 2023 18:07:20 +0000
Date: Thu, 13 Apr 2023 02:06:33 +0800
From: kernel test robot <lkp@intel.com>
To: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 88/1065]
 drivers/staging/xlnx_tsmux/xlnx_mpg2tsmux.c:1089:41: warning: format '%llx'
 expects argument of type 'long long unsigned int', but argument 5 has type
 'dma_addr_t' {aka 'unsigned int'}
Message-ID: <202304130246.SOTvGbCg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   e5753363b5e03fc0a3055d5476c6cca93e9ea28b
commit: 94ece3554bcf455d4f036547a7030a774bbeec9c [88/1065] staging: xlnx_tsmux: Initial version of xlnx mpeg2tsmux driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230413/202304130246.SOTvGbCg-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/94ece3554bcf455d4f036547a7030a774bbeec9c
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v6.1_LTS
        git checkout 94ece3554bcf455d4f036547a7030a774bbeec9c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/irqchip/ drivers/media/i2c/ drivers/media/mc/ drivers/net/ethernet/xilinx/ drivers/of/ drivers/ptp/ drivers/spi/ drivers/staging/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304130246.SOTvGbCg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:566,
                    from include/asm-generic/bug.h:22,
                    from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:5,
                    from ./arch/sh/include/generated/asm/current.h:1,
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
--
>> drivers/staging/xlnx_tsmux/xlnx_mpg2tsmux.c:147: warning: expecting prototype for struct strm_node. Prototype was for struct stream_context_node instead
>> drivers/staging/xlnx_tsmux/xlnx_mpg2tsmux.c:161: warning: expecting prototype for struct strm_info. Prototype was for struct stream_info instead


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
https://github.com/intel/lkp-tests
