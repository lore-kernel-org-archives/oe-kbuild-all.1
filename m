Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A67F1B6CFE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 00:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737678975; cv=none; b=oi+iXMHsd0AyuzGxDHr6AFrYh3od9kmazS90tCDpYXwPJhA4ESTH/2wMF4wkyn0s87Ljs1VEwne52sq7atkIQvHJ0g1lN+3btyDkbnXCQ80GjbSZ0GtOia+sqLf4WpdSb7r29+vVApdvsO6isb9+xZwF3ZFbAANd6suRhuk44pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737678975; c=relaxed/simple;
	bh=D1iLhJcwQmk28IBEtRIiWXMCUNpOHgShPKdITHAKj60=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HdI6QVgtd4OuwAC8LaHfupcRHhhod9WvXh0lFMijR3vvWOhvdT1ljjGdnpYmEAyZlL2OMpQKXa5dIs+XD3ynL0i+WGmPYqu180HW3CAnoWg8c/ewZm3sc3LGgWSjzhzbMtaHYfd+UNa6reFBlQngE2Sv3o8wZdY5O82tF1iqwJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OlG2TGF2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OlG2TGF2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737678973; x=1769214973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D1iLhJcwQmk28IBEtRIiWXMCUNpOHgShPKdITHAKj60=;
  b=OlG2TGF2eYIwVpOAohSUeUofPjrUxfaRsnkcSeM/sT8JrXf6V7zLgSvu
   VGPmDUcQjjZLC7fzRGo05ljIHeaEl9pwdSycr3vCy++UyxTDFoN6/STDS
   yo9yxNM4wsVkgEhNkWyzYHi1h74cjJeQYzGf6fOGpmsVof6EtvQAZCz9f
   APsJDFzSrbaDpLcmQvN3Cw52vXZCXud5uJaeDmJx5RPh8G/+AxXUtI56S
   4LPTw5KaJzP74yKcyI0JZBBFwDXB7FJayeiWYhN39D2+u8oUvnRq1W15v
   0+gh/Eh6xPBKNvO91gTdIiJdlPSSmmchaGQpD5Rs+ehZ1FZaWHHgorxkt
   A==;
X-CSE-ConnectionGUID: YWX2aMDPQdiK/VIYpf/ZJA==
X-CSE-MsgGUID: 8CCf9sPQTsSmSa6M3Rw61w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38308428"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="38308428"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 16:36:13 -0800
X-CSE-ConnectionGUID: QK7s/wENTfiRmjf/CYCbSQ==
X-CSE-MsgGUID: N/7SjNNJSlylO5jxzoXg5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107473133"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Jan 2025 16:36:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb7g9-000bur-0F;
	Fri, 24 Jan 2025 00:36:09 +0000
Date: Fri, 24 Jan 2025 08:35:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 13/13]
 drivers/soc/mediatek/apusys/midware/2.0/mdw_mem_rsc.c:24:6: warning: no
 previous prototype for 'mtk_apu_init_mdw_dev'
Message-ID: <202501240847.6AAA6e1v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   f612ad76bc03d33dccc654778308af5496867eb5
commit: b33e322e1a35554932b5cfc4cd9f32bfa7d534a9 [13/13] CHROMIUM: soc: mediatek: Add APU mvpu, mdw, apummu driver
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250124/202501240847.6AAA6e1v-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501240847.6AAA6e1v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240847.6AAA6e1v-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/mediatek/apusys/midware/2.0/mdw_mem_drv.c:93:5: warning: no previous prototype for 'apumem_init' [-Wmissing-prototypes]
      93 | int apumem_init(void)
         |     ^~~~~~~~~~~
>> drivers/soc/mediatek/apusys/midware/2.0/mdw_mem_drv.c:113:6: warning: no previous prototype for 'apumem_exit' [-Wmissing-prototypes]
     113 | void apumem_exit(void)
         |      ^~~~~~~~~~~
--
>> drivers/soc/mediatek/apusys/midware/2.0/mdw_mem_rsc.c:24:6: warning: no previous prototype for 'mtk_apu_init_mdw_dev' [-Wmissing-prototypes]
      24 | void mtk_apu_init_mdw_dev(struct device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from include/linux/of_device.h:5,
                    from drivers/soc/mediatek/apusys/midware/2.0/mdw_drv.c:9:
   drivers/soc/mediatek/apusys/midware/2.0/mdw_drv.c: In function 'mdw_drv_priv_delete':
   drivers/soc/mediatek/apusys/midware/2.0/mdw_drv.c:33:47: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      33 |         mdw_drv_debug("mpriv(0x%llx) free\n", (uint64_t) mpriv);
         |                                               ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:44:17: note: in expansion of macro 'dev_info'
      44 |                 dev_info(mdw_dev->misc_dev->this_device, \
         |                 ^~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:58:31: note: in expansion of macro 'mdw_debug'
      58 | #define mdw_drv_debug(x, ...) mdw_debug(MDW_DBG_DRV, x, ##__VA_ARGS__)
         |                               ^~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_drv.c:33:9: note: in expansion of macro 'mdw_drv_debug'
      33 |         mdw_drv_debug("mpriv(0x%llx) free\n", (uint64_t) mpriv);
         |         ^~~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_drv.c: In function 'mdw_drv_priv_get':
   drivers/soc/mediatek/apusys/midware/2.0/mdw_drv.c:41:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      41 |                 (uint64_t) mpriv, kref_read(&mpriv->ref));
         |                 ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:44:17: note: in expansion of macro 'dev_info'
      44 |                 dev_info(mdw_dev->misc_dev->this_device, \
         |                 ^~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:59:31: note: in expansion of macro 'mdw_debug'
      59 | #define mdw_flw_debug(x, ...) mdw_debug(MDW_DBG_FLW, x, ##__VA_ARGS__)
         |                               ^~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_drv.c:40:9: note: in expansion of macro 'mdw_flw_debug'
      40 |         mdw_flw_debug("mpriv(0x%llx) ref(%u)\n",
         |         ^~~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_drv.c: In function 'mdw_drv_priv_put':
   drivers/soc/mediatek/apusys/midware/2.0/mdw_drv.c:48:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      48 |                 (uint64_t) mpriv, kref_read(&mpriv->ref));
         |                 ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:44:17: note: in expansion of macro 'dev_info'
      44 |                 dev_info(mdw_dev->misc_dev->this_device, \
         |                 ^~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:59:31: note: in expansion of macro 'mdw_debug'
      59 | #define mdw_flw_debug(x, ...) mdw_debug(MDW_DBG_FLW, x, ##__VA_ARGS__)
         |                               ^~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_drv.c:47:9: note: in expansion of macro 'mdw_flw_debug'
      47 |         mdw_flw_debug("mpriv(0x%llx) ref(%u)\n",
         |         ^~~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_drv.c: In function 'mdw_drv_close':
   drivers/soc/mediatek/apusys/midware/2.0/mdw_drv.c:122:42: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     122 |         mdw_flw_debug("mpriv(0x%llx)\n", (uint64_t)mpriv);
         |                                          ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:44:17: note: in expansion of macro 'dev_info'
      44 |                 dev_info(mdw_dev->misc_dev->this_device, \
         |                 ^~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:59:31: note: in expansion of macro 'mdw_debug'
      59 | #define mdw_flw_debug(x, ...) mdw_debug(MDW_DBG_FLW, x, ##__VA_ARGS__)
         |                               ^~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_drv.c:122:9: note: in expansion of macro 'mdw_flw_debug'
     122 |         mdw_flw_debug("mpriv(0x%llx)\n", (uint64_t)mpriv);
         |         ^~~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_drv.c: At top level:
>> drivers/soc/mediatek/apusys/midware/2.0/mdw_drv.c:147:6: warning: no previous prototype for 'mtk_apu_init_mdw_dtime_setting' [-Wmissing-prototypes]
     147 | void mtk_apu_init_mdw_dtime_setting(void (*update_power_dtime)(int dtime))
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/soc/mediatek/apusys/midware/2.0/mdw_drv.c:267:5: warning: no previous prototype for 'mdw_init' [-Wmissing-prototypes]
     267 | int mdw_init(void)
         |     ^~~~~~~~
>> drivers/soc/mediatek/apusys/midware/2.0/mdw_drv.c:319:6: warning: no previous prototype for 'mdw_exit' [-Wmissing-prototypes]
     319 | void mdw_exit(void)
         |      ^~~~~~~~
--
>> drivers/soc/mediatek/apusys/midware/2.0/mdw_ctx.c:8:5: warning: no previous prototype for 'mdw_ctx_init' [-Wmissing-prototypes]
       8 | int mdw_ctx_init(struct mdw_device *mdev)
         |     ^~~~~~~~~~~~
>> drivers/soc/mediatek/apusys/midware/2.0/mdw_ctx.c:13:6: warning: no previous prototype for 'mdw_ctx_deinit' [-Wmissing-prototypes]
      13 | void mdw_ctx_deinit(struct mdw_device *mdev)
         |      ^~~~~~~~~~~~~~
--
         |                 ^~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:61:31: note: in expansion of macro 'mdw_debug'
      61 | #define mdw_mem_debug(x, ...) mdw_debug(MDW_DBG_MEM, x, ##__VA_ARGS__)
         |                               ^~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:25:9: note: in expansion of macro 'mdw_mem_debug'
      25 |         mdw_mem_debug("mem(0x%llx/0x%llx/%d/0x%llx/%d/0x%llx/0x%llx/0x%llx" \
         |         ^~~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:448:9: note: in expansion of macro 'mdw_mem_show'
     448 |         mdw_mem_show(m);
         |         ^~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:28:18: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      28 |         m->type, (uint64_t)m->vaddr, m->size, \
         |                  ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:44:17: note: in expansion of macro 'dev_info'
      44 |                 dev_info(mdw_dev->misc_dev->this_device, \
         |                 ^~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:61:31: note: in expansion of macro 'mdw_debug'
      61 | #define mdw_mem_debug(x, ...) mdw_debug(MDW_DBG_MEM, x, ##__VA_ARGS__)
         |                               ^~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:25:9: note: in expansion of macro 'mdw_mem_debug'
      25 |         mdw_mem_debug("mem(0x%llx/0x%llx/%d/0x%llx/%d/0x%llx/0x%llx/0x%llx" \
         |         ^~~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:448:9: note: in expansion of macro 'mdw_mem_show'
     448 |         mdw_mem_show(m);
         |         ^~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:27:9: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      27 |         (uint64_t)m->mpriv, (uint64_t)m, m->handle, (uint64_t)m->dbuf, \
         |         ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:44:17: note: in expansion of macro 'dev_info'
      44 |                 dev_info(mdw_dev->misc_dev->this_device, \
         |                 ^~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:61:31: note: in expansion of macro 'mdw_debug'
      61 | #define mdw_mem_debug(x, ...) mdw_debug(MDW_DBG_MEM, x, ##__VA_ARGS__)
         |                               ^~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:25:9: note: in expansion of macro 'mdw_mem_debug'
      25 |         mdw_mem_debug("mem(0x%llx/0x%llx/%d/0x%llx/%d/0x%llx/0x%llx/0x%llx" \
         |         ^~~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:457:9: note: in expansion of macro 'mdw_mem_show'
     457 |         mdw_mem_show(m);
         |         ^~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:27:29: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      27 |         (uint64_t)m->mpriv, (uint64_t)m, m->handle, (uint64_t)m->dbuf, \
         |                             ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:44:17: note: in expansion of macro 'dev_info'
      44 |                 dev_info(mdw_dev->misc_dev->this_device, \
         |                 ^~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:61:31: note: in expansion of macro 'mdw_debug'
      61 | #define mdw_mem_debug(x, ...) mdw_debug(MDW_DBG_MEM, x, ##__VA_ARGS__)
         |                               ^~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:25:9: note: in expansion of macro 'mdw_mem_debug'
      25 |         mdw_mem_debug("mem(0x%llx/0x%llx/%d/0x%llx/%d/0x%llx/0x%llx/0x%llx" \
         |         ^~~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:457:9: note: in expansion of macro 'mdw_mem_show'
     457 |         mdw_mem_show(m);
         |         ^~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:27:53: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      27 |         (uint64_t)m->mpriv, (uint64_t)m, m->handle, (uint64_t)m->dbuf, \
         |                                                     ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:44:17: note: in expansion of macro 'dev_info'
      44 |                 dev_info(mdw_dev->misc_dev->this_device, \
         |                 ^~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:61:31: note: in expansion of macro 'mdw_debug'
      61 | #define mdw_mem_debug(x, ...) mdw_debug(MDW_DBG_MEM, x, ##__VA_ARGS__)
         |                               ^~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:25:9: note: in expansion of macro 'mdw_mem_debug'
      25 |         mdw_mem_debug("mem(0x%llx/0x%llx/%d/0x%llx/%d/0x%llx/0x%llx/0x%llx" \
         |         ^~~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:457:9: note: in expansion of macro 'mdw_mem_show'
     457 |         mdw_mem_show(m);
         |         ^~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:28:18: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      28 |         m->type, (uint64_t)m->vaddr, m->size, \
         |                  ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:44:17: note: in expansion of macro 'dev_info'
      44 |                 dev_info(mdw_dev->misc_dev->this_device, \
         |                 ^~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:61:31: note: in expansion of macro 'mdw_debug'
      61 | #define mdw_mem_debug(x, ...) mdw_debug(MDW_DBG_MEM, x, ##__VA_ARGS__)
         |                               ^~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:25:9: note: in expansion of macro 'mdw_mem_debug'
      25 |         mdw_mem_debug("mem(0x%llx/0x%llx/%d/0x%llx/%d/0x%llx/0x%llx/0x%llx" \
         |         ^~~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:457:9: note: in expansion of macro 'mdw_mem_show'
     457 |         mdw_mem_show(m);
         |         ^~~~~~~~~~~~
>> drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:467:65: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     467 |                                 current->comm, m->type, m->size);
         |                                                                 ^
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c: In function 'mdw_mem_invoke_release':
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:27:9: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      27 |         (uint64_t)m->mpriv, (uint64_t)m, m->handle, (uint64_t)m->dbuf, \
         |         ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:44:17: note: in expansion of macro 'dev_info'
      44 |                 dev_info(mdw_dev->misc_dev->this_device, \
         |                 ^~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:61:31: note: in expansion of macro 'mdw_debug'
      61 | #define mdw_mem_debug(x, ...) mdw_debug(MDW_DBG_MEM, x, ##__VA_ARGS__)
         |                               ^~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:25:9: note: in expansion of macro 'mdw_mem_debug'
      25 |         mdw_mem_debug("mem(0x%llx/0x%llx/%d/0x%llx/%d/0x%llx/0x%llx/0x%llx" \
         |         ^~~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:483:9: note: in expansion of macro 'mdw_mem_show'
     483 |         mdw_mem_show(m_invoke->m);
         |         ^~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:27:29: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      27 |         (uint64_t)m->mpriv, (uint64_t)m, m->handle, (uint64_t)m->dbuf, \
         |                             ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:44:17: note: in expansion of macro 'dev_info'
      44 |                 dev_info(mdw_dev->misc_dev->this_device, \
         |                 ^~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:61:31: note: in expansion of macro 'mdw_debug'
      61 | #define mdw_mem_debug(x, ...) mdw_debug(MDW_DBG_MEM, x, ##__VA_ARGS__)
         |                               ^~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:25:9: note: in expansion of macro 'mdw_mem_debug'
      25 |         mdw_mem_debug("mem(0x%llx/0x%llx/%d/0x%llx/%d/0x%llx/0x%llx/0x%llx" \
         |         ^~~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:483:9: note: in expansion of macro 'mdw_mem_show'
     483 |         mdw_mem_show(m_invoke->m);
         |         ^~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:27:53: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      27 |         (uint64_t)m->mpriv, (uint64_t)m, m->handle, (uint64_t)m->dbuf, \
         |                                                     ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:44:17: note: in expansion of macro 'dev_info'
      44 |                 dev_info(mdw_dev->misc_dev->this_device, \
         |                 ^~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:61:31: note: in expansion of macro 'mdw_debug'
      61 | #define mdw_mem_debug(x, ...) mdw_debug(MDW_DBG_MEM, x, ##__VA_ARGS__)
         |                               ^~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:25:9: note: in expansion of macro 'mdw_mem_debug'
      25 |         mdw_mem_debug("mem(0x%llx/0x%llx/%d/0x%llx/%d/0x%llx/0x%llx/0x%llx" \
         |         ^~~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:483:9: note: in expansion of macro 'mdw_mem_show'
     483 |         mdw_mem_show(m_invoke->m);
         |         ^~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:28:18: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      28 |         m->type, (uint64_t)m->vaddr, m->size, \
         |                  ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:44:17: note: in expansion of macro 'dev_info'
      44 |                 dev_info(mdw_dev->misc_dev->this_device, \
         |                 ^~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:61:31: note: in expansion of macro 'mdw_debug'
      61 | #define mdw_mem_debug(x, ...) mdw_debug(MDW_DBG_MEM, x, ##__VA_ARGS__)
         |                               ^~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:25:9: note: in expansion of macro 'mdw_mem_debug'
      25 |         mdw_mem_debug("mem(0x%llx/0x%llx/%d/0x%llx/%d/0x%llx/0x%llx/0x%llx" \
         |         ^~~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:483:9: note: in expansion of macro 'mdw_mem_show'
     483 |         mdw_mem_show(m_invoke->m);
         |         ^~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c: In function 'mdw_mem_invoke_find':
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:500:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     500 |                                 (uint64_t)mpriv, (uint64_t)m_invoke,
         |                                 ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:44:17: note: in expansion of macro 'dev_info'
      44 |                 dev_info(mdw_dev->misc_dev->this_device, \
         |                 ^~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:59:31: note: in expansion of macro 'mdw_debug'
      59 | #define mdw_flw_debug(x, ...) mdw_debug(MDW_DBG_FLW, x, ##__VA_ARGS__)
         |                               ^~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:499:25: note: in expansion of macro 'mdw_flw_debug'
     499 |                         mdw_flw_debug("s(0x%llx) find invoke(0x%llx) to mem(0x%llx)\n",
         |                         ^~~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:500:50: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     500 |                                 (uint64_t)mpriv, (uint64_t)m_invoke,
         |                                                  ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:44:17: note: in expansion of macro 'dev_info'
      44 |                 dev_info(mdw_dev->misc_dev->this_device, \
         |                 ^~~~~~~~
--
         |                 ^~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:61:31: note: in expansion of macro 'mdw_debug'
      61 | #define mdw_mem_debug(x, ...) mdw_debug(MDW_DBG_MEM, x, ##__VA_ARGS__)
         |                               ^~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:25:9: note: in expansion of macro 'mdw_mem_debug'
      25 |         mdw_mem_debug("mem(0x%llx/0x%llx/%d/0x%llx/%d/0x%llx/0x%llx/0x%llx" \
         |         ^~~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:836:9: note: in expansion of macro 'mdw_mem_show'
     836 |         mdw_mem_show(m);
         |         ^~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c: In function 'mdw_mem_ioctl_unmap':
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:27:9: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      27 |         (uint64_t)m->mpriv, (uint64_t)m, m->handle, (uint64_t)m->dbuf, \
         |         ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:44:17: note: in expansion of macro 'dev_info'
      44 |                 dev_info(mdw_dev->misc_dev->this_device, \
         |                 ^~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:61:31: note: in expansion of macro 'mdw_debug'
      61 | #define mdw_mem_debug(x, ...) mdw_debug(MDW_DBG_MEM, x, ##__VA_ARGS__)
         |                               ^~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:25:9: note: in expansion of macro 'mdw_mem_debug'
      25 |         mdw_mem_debug("mem(0x%llx/0x%llx/%d/0x%llx/%d/0x%llx/0x%llx/0x%llx" \
         |         ^~~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:870:9: note: in expansion of macro 'mdw_mem_show'
     870 |         mdw_mem_show(m);
         |         ^~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:27:29: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      27 |         (uint64_t)m->mpriv, (uint64_t)m, m->handle, (uint64_t)m->dbuf, \
         |                             ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:44:17: note: in expansion of macro 'dev_info'
      44 |                 dev_info(mdw_dev->misc_dev->this_device, \
         |                 ^~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:61:31: note: in expansion of macro 'mdw_debug'
      61 | #define mdw_mem_debug(x, ...) mdw_debug(MDW_DBG_MEM, x, ##__VA_ARGS__)
         |                               ^~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:25:9: note: in expansion of macro 'mdw_mem_debug'
      25 |         mdw_mem_debug("mem(0x%llx/0x%llx/%d/0x%llx/%d/0x%llx/0x%llx/0x%llx" \
         |         ^~~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:870:9: note: in expansion of macro 'mdw_mem_show'
     870 |         mdw_mem_show(m);
         |         ^~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:27:53: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      27 |         (uint64_t)m->mpriv, (uint64_t)m, m->handle, (uint64_t)m->dbuf, \
         |                                                     ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:44:17: note: in expansion of macro 'dev_info'
      44 |                 dev_info(mdw_dev->misc_dev->this_device, \
         |                 ^~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:61:31: note: in expansion of macro 'mdw_debug'
      61 | #define mdw_mem_debug(x, ...) mdw_debug(MDW_DBG_MEM, x, ##__VA_ARGS__)
         |                               ^~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:25:9: note: in expansion of macro 'mdw_mem_debug'
      25 |         mdw_mem_debug("mem(0x%llx/0x%llx/%d/0x%llx/%d/0x%llx/0x%llx/0x%llx" \
         |         ^~~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:870:9: note: in expansion of macro 'mdw_mem_show'
     870 |         mdw_mem_show(m);
         |         ^~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:28:18: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      28 |         m->type, (uint64_t)m->vaddr, m->size, \
         |                  ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:44:17: note: in expansion of macro 'dev_info'
      44 |                 dev_info(mdw_dev->misc_dev->this_device, \
         |                 ^~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:61:31: note: in expansion of macro 'mdw_debug'
      61 | #define mdw_mem_debug(x, ...) mdw_debug(MDW_DBG_MEM, x, ##__VA_ARGS__)
         |                               ^~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:25:9: note: in expansion of macro 'mdw_mem_debug'
      25 |         mdw_mem_debug("mem(0x%llx/0x%llx/%d/0x%llx/%d/0x%llx/0x%llx/0x%llx" \
         |         ^~~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:870:9: note: in expansion of macro 'mdw_mem_show'
     870 |         mdw_mem_show(m);
         |         ^~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c: In function 'mdw_mem_ioctl':
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:887:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     887 |         mdw_flw_debug("s(0x%llx) op::%d\n", (uint64_t)mpriv, args->in.op);
         |                                             ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:44:17: note: in expansion of macro 'dev_info'
      44 |                 dev_info(mdw_dev->misc_dev->this_device, \
         |                 ^~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:59:31: note: in expansion of macro 'mdw_debug'
      59 | #define mdw_flw_debug(x, ...) mdw_debug(MDW_DBG_FLW, x, ##__VA_ARGS__)
         |                               ^~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:887:9: note: in expansion of macro 'mdw_flw_debug'
     887 |         mdw_flw_debug("s(0x%llx) op::%d\n", (uint64_t)mpriv, args->in.op);
         |         ^~~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c: At top level:
>> drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:933:17: warning: no previous prototype for 'mdw_mem_query_mem' [-Wmissing-prototypes]
     933 | struct mdw_mem *mdw_mem_query_mem(uint64_t kva)
         |                 ^~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c: In function 'mdw_mem_query_mem':
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:939:28: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     939 |                 if (kva >= (uint64_t)m->vaddr &&
         |                            ^
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:940:31: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     940 |                         kva < (uint64_t)m->vaddr + m->size) {
         |                               ^
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:943:38: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     943 |                                 kva, (uint64_t)m);
         |                                      ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:44:17: note: in expansion of macro 'dev_info'
      44 |                 dev_info(mdw_dev->misc_dev->this_device, \
         |                 ^~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:61:31: note: in expansion of macro 'mdw_debug'
      61 | #define mdw_mem_debug(x, ...) mdw_debug(MDW_DBG_MEM, x, ##__VA_ARGS__)
         |                               ^~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:942:25: note: in expansion of macro 'mdw_mem_debug'
     942 |                         mdw_mem_debug("query iova (0x%llx->0x%llx)\n",
         |                         ^~~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c: In function 'apusys_mem_validate_by_cmd':
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:970:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     970 |                 (uint64_t)mpriv, (uint64_t)c, iova, size);
         |                 ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:44:17: note: in expansion of macro 'dev_info'
      44 |                 dev_info(mdw_dev->misc_dev->this_device, \
         |                 ^~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:64:31: note: in expansion of macro 'mdw_debug'
      64 | #define mdw_vld_debug(x, ...) mdw_debug(MDW_DBG_VLD, x, ##__VA_ARGS__)
         |                               ^~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:969:9: note: in expansion of macro 'mdw_vld_debug'
     969 |         mdw_vld_debug("target: s(0x%llx) c(0x%llx) iova(0x%llx/%u)\n",
         |         ^~~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:970:34: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     970 |                 (uint64_t)mpriv, (uint64_t)c, iova, size);
         |                                  ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:44:17: note: in expansion of macro 'dev_info'
      44 |                 dev_info(mdw_dev->misc_dev->this_device, \
         |                 ^~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:64:31: note: in expansion of macro 'mdw_debug'
      64 | #define mdw_vld_debug(x, ...) mdw_debug(MDW_DBG_VLD, x, ##__VA_ARGS__)
         |                               ^~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:969:9: note: in expansion of macro 'mdw_vld_debug'
     969 |         mdw_vld_debug("target: s(0x%llx) c(0x%llx) iova(0x%llx/%u)\n",
         |         ^~~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:976:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     976 |                                 (uint64_t)mpriv, (uint64_t)c);
         |                                 ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:49:9: note: in expansion of macro 'dev_info'
      49 |         dev_info(mdw_dev->misc_dev->this_device, \
         |         ^~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:975:25: note: in expansion of macro 'mdw_drv_err'
     975 |                         mdw_drv_err("session(0x%llx) cmd(0x%llx) not match\n",
         |                         ^~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:976:50: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     976 |                                 (uint64_t)mpriv, (uint64_t)c);
         |                                                  ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:49:9: note: in expansion of macro 'dev_info'
      49 |         dev_info(mdw_dev->misc_dev->this_device, \
         |         ^~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:975:25: note: in expansion of macro 'mdw_drv_err'
     975 |                         mdw_drv_err("session(0x%llx) cmd(0x%llx) not match\n",
         |                         ^~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:985:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     985 |                         (uint64_t)m->vaddr, m->size, m->device_iova, m->dva_size);
         |                         ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:44:17: note: in expansion of macro 'dev_info'
      44 |                 dev_info(mdw_dev->misc_dev->this_device, \
         |                 ^~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_cmn.h:64:31: note: in expansion of macro 'mdw_debug'
      64 | #define mdw_vld_debug(x, ...) mdw_debug(MDW_DBG_VLD, x, ##__VA_ARGS__)
         |                               ^~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:984:17: note: in expansion of macro 'mdw_vld_debug'
     984 |                 mdw_vld_debug("check mem invoke list: va(0x%llx/%llu) iova(0x%llx/%llu)...\n",
         |                 ^~~~~~~~~~~~~
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:989:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     989 |                         (uint64_t)m->vaddr, m->size, m->device_iova, m->dva_size);
         |                         ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
..


vim +/mtk_apu_init_mdw_dev +24 drivers/soc/mediatek/apusys/midware/2.0/mdw_mem_rsc.c

    23	
  > 24	void mtk_apu_init_mdw_dev(struct device *dev)
    25	{
    26		apu_dev = dev;
    27	}
    28	EXPORT_SYMBOL_NS(mtk_apu_init_mdw_dev, MTK_APU_MDW);
    29	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
