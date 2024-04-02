Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CA214AB4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Apr 2024 03:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712028200; cv=none; b=nkLbDeasSXFggNDVpbgda5DEeG5YuGmvR73KzBTlfXa0irCkchEygxPD69zUcQQamwNL+7Qfi9/zdvCoSmu1kWFOS5SkU12xuMn87QhdyQ6ji+e9xzuFCcXcuuIdqW8IQ485rPAIU4XNRwz7j9pOfJxRpjwOPcbBMAXAKvMXdFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712028200; c=relaxed/simple;
	bh=enfETenrwcXfiMXDRsplbF67H+ljDdYyh02rJFU5Fuc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gqDadwK13HgdQEV7Xp0JCWv9ymr5wtDgcJF9HI8B9Lbrby2rq3E8WtIB9C8IykLtRk+GnU1JPdiP5x4G9ROlkW2rADkQNfnj8ln52gU2vayahAulxYoD3Y4ge/1oMSY6WvH+rSX3IYqIPNK4RzAHqq8tjCBr3VKIRjRTUdXvpwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q7s+JQph; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q7s+JQph"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712028199; x=1743564199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=enfETenrwcXfiMXDRsplbF67H+ljDdYyh02rJFU5Fuc=;
  b=Q7s+JQphmDhPz3g3o53OqrJ4csN/lUuzDP2VGrGdzoQnJKHoyOeoabo7
   hBOap2FX6ylqdUi6rLAkEBpzu326KxotnHo6JqQfNVMgP7+/Wh7Oa+rNr
   n8063akqrFoBL1ELIikFcLVtunHtFjV+mkz3zaqrc92ZGL406LJOwMUGA
   kV00zwBmKrt7mjfaC/E6ZapMPhTjRHd5y2nP6ebSlsbjUGpapz1ABx172
   vv6wQidL8hD0DjRkITXvORghkKs4W1/9NNbB75chXA5tzymEN/WL6D61w
   +urcfMTZ8gU/x4SyrjraWCGiodjOm3b1skc4CLx0nIxEDMc1jI5ccH254
   g==;
X-CSE-ConnectionGUID: MZNXY4vTSC+lK5VE/HIOqQ==
X-CSE-MsgGUID: XPrzY1VVTvK8aTffQYn/Fw==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="18536151"
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; 
   d="scan'208";a="18536151"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 20:23:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; 
   d="scan'208";a="18317127"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 01 Apr 2024 20:23:14 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrUjw-0000pd-12;
	Tue, 02 Apr 2024 03:23:12 +0000
Date: Tue, 2 Apr 2024 11:22:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 11/21]
 drivers/soc/mediatek/apusys/midware/2.0/rv/mdw_rv_dev.c:256:5: warning:
 conflicting types for 'mdw_rv_dev_set_param' due to enum/integer mismatch;
 have 'int(struct mdw_rv_dev *, enum mdw_info_type,  uint32_t)' {aka
 'int(struct mdw_rv_dev *, enum mdw_info_...
Message-ID: <202404021129.ZyHlV25B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   8a2979b7e24036b83245022616c7d557cde22c2a
commit: 0affd47da25bc485829a3db3e7f3290947c87e5e [11/21] CHROMIUM: soc: mediatek: apu: Add apu middleware driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240402/202404021129.ZyHlV25B-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240402/202404021129.ZyHlV25B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404021129.ZyHlV25B-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/mediatek/apusys/midware/2.0/rv/mdw_rv_dev.c: In function 'mdw_rv_dev_send_msg':
   drivers/soc/mediatek/apusys/midware/2.0/rv/mdw_rv_dev.c:49:30: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      49 |         s_msg->msg.sync_id = (uint64_t)s_msg;
         |                              ^
   In file included from include/linux/printk.h:566,
                    from include/linux/kernel.h:29,
                    from include/linux/iopoll.h:9,
                    from drivers/soc/mediatek/apusys/midware/2.0/rv/mdw_rv_dev.c:6:
   drivers/soc/mediatek/apusys/midware/2.0/rv/mdw_rv_dev.c: In function 'mdw_rv_dev_run_cmd':
   drivers/soc/mediatek/apusys/midware/2.0/rv/mdw_rv_dev.c:223:42: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     223 |         mdw_drv_debug("run rc(0%llx)\n", (uint64_t)rc);
         |                                          ^
   include/linux/dynamic_debug.h:247:9: note: in expansion of macro '__dynamic_func_call_cls'
     247 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:268:9: note: in expansion of macro '_dynamic_func_call'
     268 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:581:9: note: in expansion of macro 'dynamic_pr_debug'
     581 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:27:17: note: in expansion of macro 'pr_debug'
      27 |                 pr_debug("[debug] %s/%d " x, __func__, __LINE__, ##__VA_ARGS__); \
         |                 ^~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:30:31: note: in expansion of macro 'mdw_debug'
      30 | #define mdw_drv_debug(x, ...) mdw_debug(MDW_DBG_DRV, x, ##__VA_ARGS__)
         |                               ^~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/rv/mdw_rv_dev.c:223:9: note: in expansion of macro 'mdw_drv_debug'
     223 |         mdw_drv_debug("run rc(0%llx)\n", (uint64_t)rc);
         |         ^~~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/rv/mdw_rv_dev.c: At top level:
>> drivers/soc/mediatek/apusys/midware/2.0/rv/mdw_rv_dev.c:256:5: warning: conflicting types for 'mdw_rv_dev_set_param' due to enum/integer mismatch; have 'int(struct mdw_rv_dev *, enum mdw_info_type,  uint32_t)' {aka 'int(struct mdw_rv_dev *, enum mdw_info_type,  unsigned int)'} [-Wenum-int-mismatch]
     256 | int mdw_rv_dev_set_param(struct mdw_rv_dev *mrdev, enum mdw_info_type type, uint32_t val)
         |     ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/soc/mediatek/apusys/midware/2.0/rv/mdw_rv_dev.c:9:
   drivers/soc/mediatek/apusys/midware/2.0/rv/mdw_rv.h:58:5: note: previous declaration of 'mdw_rv_dev_set_param' with type 'int(struct mdw_rv_dev *, uint32_t,  uint32_t)' {aka 'int(struct mdw_rv_dev *, unsigned int,  unsigned int)'}
      58 | int mdw_rv_dev_set_param(struct mdw_rv_dev *mrdev, uint32_t idx, uint32_t val);
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/soc/mediatek/apusys/midware/2.0/rv/mdw_rv_dev.c:283:5: warning: conflicting types for 'mdw_rv_dev_get_param' due to enum/integer mismatch; have 'int(struct mdw_rv_dev *, enum mdw_info_type,  uint32_t *)' {aka 'int(struct mdw_rv_dev *, enum mdw_info_type,  unsigned int *)'} [-Wenum-int-mismatch]
     283 | int mdw_rv_dev_get_param(struct mdw_rv_dev *mrdev, enum mdw_info_type type, uint32_t *val)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/rv/mdw_rv.h:59:5: note: previous declaration of 'mdw_rv_dev_get_param' with type 'int(struct mdw_rv_dev *, uint32_t,  uint32_t *)' {aka 'int(struct mdw_rv_dev *, unsigned int,  unsigned int *)'}
      59 | int mdw_rv_dev_get_param(struct mdw_rv_dev *mrdev, uint32_t idx, uint32_t *val);
         |     ^~~~~~~~~~~~~~~~~~~~


vim +256 drivers/soc/mediatek/apusys/midware/2.0/rv/mdw_rv_dev.c

   255	
 > 256	int mdw_rv_dev_set_param(struct mdw_rv_dev *mrdev, enum mdw_info_type type, uint32_t val)
   257	{
   258		struct mdw_ipi_msg msg;
   259		int ret = 0;
   260	
   261		if (type == MDW_INFO_KLOG) {
   262			mrdev->mdev->mdw_klog = val;
   263			goto out;
   264		} else if (type >= MDW_INFO_MAX) {
   265			ret = -EINVAL;
   266			goto out;
   267		}
   268		memset(&msg, 0, sizeof(msg));
   269		msg.id = MDW_IPI_PARAM;
   270		msg.p.type = type;
   271		msg.p.dir = MDW_INFO_SET;
   272		msg.p.value = val;
   273	
   274		mdw_drv_debug("set param(%u/%u/%u)\n", msg.p.type, msg.p.dir, msg.p.value);
   275		ret = mdw_rv_dev_send_sync(mrdev, &msg);
   276		if (!ret)
   277			memcpy(&mrdev->param, &msg.p, sizeof(msg.p));
   278	
   279	out:
   280		return ret;
   281	}
   282	
 > 283	int mdw_rv_dev_get_param(struct mdw_rv_dev *mrdev, enum mdw_info_type type, uint32_t *val)
   284	{
   285		int ret = 0;
   286		struct mdw_ipi_msg msg;
   287	
   288		switch (type) {
   289		case MDW_INFO_KLOG:
   290			*val = mrdev->mdev->mdw_klog;
   291			break;
   292		case MDW_INFO_NORMAL_TASK_DLA:
   293			*val = mrdev->stat->task_num[APUSYS_DEVICE_MDLA][MDW_QUEUE_NORMAL];
   294			break;
   295		case MDW_INFO_NORMAL_TASK_DSP:
   296			*val = mrdev->stat->task_num[APUSYS_DEVICE_VPU][MDW_QUEUE_NORMAL] +
   297			mrdev->stat->task_num[APUSYS_DEVICE_MVPU][MDW_QUEUE_NORMAL];
   298			break;
   299		case MDW_INFO_NORMAL_TASK_DMA:
   300			*val = mrdev->stat->task_num[APUSYS_DEVICE_EDMA][MDW_QUEUE_NORMAL];
   301			break;
   302		case MDW_INFO_RESERV_TIME_REMAIN:
   303			memset(&msg, 0, sizeof(msg));
   304			msg.id = MDW_IPI_PARAM;
   305			msg.p.type = type;
   306			msg.p.dir = MDW_INFO_GET;
   307	
   308			mdw_drv_debug("get param(%u/%u/%u)\n", msg.p.type, msg.p.dir, msg.p.value);
   309			ret = mdw_rv_dev_send_sync(mrdev, &msg);
   310			if (!ret)
   311				*val = msg.p.value;
   312			break;
   313		default:
   314			ret = -EINVAL;
   315		}
   316	
   317		return ret;
   318	}
   319	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
