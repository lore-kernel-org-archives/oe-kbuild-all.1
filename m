Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB3710E4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 00:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714438067; cv=none; b=TIqhJBzt0SwpAGHXXBpNWXc2fhtJ5ndSP7kQt4MRBRCPZtajI7NZCcybfGSesOZZ/ZDK7mhjx4O5ndgRk3z5+9t4QDvgdJWXBTHcXofNCvouHZyDBvtmnp3bM9YntTNXWl3eLyJjB34CJ8SUWB+HGbmrCAhVYQOQgj6XqEWp3ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714438067; c=relaxed/simple;
	bh=uvDCKlCT8UtMP0j0tjJeL5IzS4r2hmOD0c/K5Y7nbZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WKpsJqy+7/Et6etizHXiD8CP5Q+piH+ztXjC3sa7Ypowi+wM0ckcTvgJUHoObfmHZIR7FdIWL7HHiQWojy+DKAo4/QJHmxejANgEPezwyD1CT5fNNAzZiL2YTow74EBkZFObi1JquXGJpFvj3vLkRYto6GehZ1HZ5UlxHqI1PRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PN6rehQL; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PN6rehQL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714438065; x=1745974065;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uvDCKlCT8UtMP0j0tjJeL5IzS4r2hmOD0c/K5Y7nbZI=;
  b=PN6rehQLIt9OuqflIrUkMJUG2zuEQ6IsznANBgUdvTXhJTp0cjdCGrnZ
   JbYQTLPd+NPuWpiW+RxKa5dlWzywIhlnbf0/041GcifQ6qDQkrlVMOJDg
   J4L3UQLTnU/9FUqMAtlXNNy4bGWN95kcxiDuFbK0CPBZdIYM+ykbG3ZK7
   JDA0udsuMneKEZWRKsjaMmYHQdrbFi6d8W2Uk9C2T7mmbRoy4g3iYbc9q
   iT3gXuWW96Gl8C2yjLV8/Z8DzL/gNdX6yNPKZus7Imftg8R3/TuS41x+m
   Rc9DQOdUJ8lybuiQ7PAA2xqDfPFsGn5BJpo8bAvvPO9VytQiIaXWtqP74
   g==;
X-CSE-ConnectionGUID: 7zanNkweSGG1lf+9nWtk9Q==
X-CSE-MsgGUID: cMB8bW0fQQuGeARJAKgZjg==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10658733"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="10658733"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 17:47:43 -0700
X-CSE-ConnectionGUID: YRC4s/SgSNWCtl9tm9CQ5w==
X-CSE-MsgGUID: xUvbxexDQpSH6XD4G7PGZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="31080260"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Apr 2024 17:47:42 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1bel-0007Yu-1O;
	Tue, 30 Apr 2024 00:47:39 +0000
Date: Tue, 30 Apr 2024 08:47:26 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 6175/29983]
 drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c:679:58:
 warning: variable 'shader_volt' set but not used
Message-ID: <202404300803.ZyxExMoi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   5134e031114e613cb04858e248af5e65fe1e112f
commit: b83a99edcb3eb46360f4b4470a51e0f0749bd73e [6175/29983] Merge branch 'mxc/next' into next
config: arm64-randconfig-003-20240429 (https://download.01.org/0day-ci/archive/20240430/202404300803.ZyxExMoi-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404300803.ZyxExMoi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404300803.ZyxExMoi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c:56:
   In file included from drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_linux.h:63:
   In file included from include/linux/mm.h:1601:
   include/linux/vmstat.h:450:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     450 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c:679:58: warning: variable 'shader_volt' set but not used [-Wunused-but-set-variable]
     679 |         unsigned long core_freq, core_volt, shader_freq, shader_volt;
         |                                                          ^
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c:630:5: warning: no previous prototype for function 'init_gpu_opp_table' [-Wmissing-prototypes]
     630 | int init_gpu_opp_table(struct device *dev)
         |     ^
   drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c:630:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     630 | int init_gpu_opp_table(struct device *dev)
         | ^
         | static 
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c:725:5: warning: no previous prototype for function 'remove_gpu_opp_table' [-Wmissing-prototypes]
     725 | int remove_gpu_opp_table(void)
         |     ^
   drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c:725:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     725 | int remove_gpu_opp_table(void)
         | ^
         | static 
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c:1197:5: warning: no previous prototype for function 'init_priv' [-Wmissing-prototypes]
    1197 | int init_priv(void)
         |     ^
   drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c:1197:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1197 | int init_priv(void)
         | ^
         | static 
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c:1217:1: warning: no previous prototype for function 'free_priv' [-Wmissing-prototypes]
    1217 | free_priv(void)
         | ^
   drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c:1216:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1216 | void
         | ^
         | static 
   6 warnings generated.


vim +/shader_volt +679 drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c

3dcab85234f3a4 Xianzhong 2019-01-29  629  
3dcab85234f3a4 Xianzhong 2019-01-29 @630  int init_gpu_opp_table(struct device *dev)
3dcab85234f3a4 Xianzhong 2019-01-29  631  {
3dcab85234f3a4 Xianzhong 2019-01-29  632      const struct property *prop;
3dcab85234f3a4 Xianzhong 2019-01-29  633      const __be32 *val;
3dcab85234f3a4 Xianzhong 2019-01-29  634      int nr;
3dcab85234f3a4 Xianzhong 2019-01-29  635      int ret = 0;
3dcab85234f3a4 Xianzhong 2019-01-29  636      int i, p;
3dcab85234f3a4 Xianzhong 2019-01-29  637      struct imx_priv *priv = &imxPriv;
3dcab85234f3a4 Xianzhong 2019-01-29  638  
3dcab85234f3a4 Xianzhong 2019-01-29  639      priv->imx_gpu_govern.num_modes = 0;
3dcab85234f3a4 Xianzhong 2019-01-29  640  
3dcab85234f3a4 Xianzhong 2019-01-29  641      prop = of_find_property(dev->of_node, "operating-points", NULL);
3dcab85234f3a4 Xianzhong 2019-01-29  642      if (!prop) {
3dcab85234f3a4 Xianzhong 2019-01-29  643          return 0;
3dcab85234f3a4 Xianzhong 2019-01-29  644      }
3dcab85234f3a4 Xianzhong 2019-01-29  645  
3dcab85234f3a4 Xianzhong 2019-01-29  646      if (!prop->value) {
3dcab85234f3a4 Xianzhong 2019-01-29  647          dev_err(dev, "operating-points invalid. Frequency scaling will not work\n");
3dcab85234f3a4 Xianzhong 2019-01-29  648          return -ENODATA;
3dcab85234f3a4 Xianzhong 2019-01-29  649      }
3dcab85234f3a4 Xianzhong 2019-01-29  650  
3dcab85234f3a4 Xianzhong 2019-01-29  651      /*
3dcab85234f3a4 Xianzhong 2019-01-29  652       * Each OPP is a set of tuples consisting of frequency and
3dcab85234f3a4 Xianzhong 2019-01-29  653       * voltage like <freq-kHz vol-uV>.
3dcab85234f3a4 Xianzhong 2019-01-29  654       */
3dcab85234f3a4 Xianzhong 2019-01-29  655      nr = prop->length / sizeof(u32);
3dcab85234f3a4 Xianzhong 2019-01-29  656      if (nr % 2) {
3dcab85234f3a4 Xianzhong 2019-01-29  657          dev_err(dev, "%s: Invalid OPP list\n", __func__);
3dcab85234f3a4 Xianzhong 2019-01-29  658          return -EINVAL;
3dcab85234f3a4 Xianzhong 2019-01-29  659      }
3dcab85234f3a4 Xianzhong 2019-01-29  660  
3dcab85234f3a4 Xianzhong 2019-01-29  661      /*
3dcab85234f3a4 Xianzhong 2019-01-29  662       * We handle both cases where UNDERDRIVE is represented by a single tuple
3dcab85234f3a4 Xianzhong 2019-01-29  663       * or when it is represented by two. More than 4 tuples means that we have
3dcab85234f3a4 Xianzhong 2019-01-29  664       * the current mode defaulting to OVERDRIVE, while less than 3 means only
3dcab85234f3a4 Xianzhong 2019-01-29  665       * nominal. Lastly just two tuples means UNDERDRIVE. Note that the tuples
3dcab85234f3a4 Xianzhong 2019-01-29  666       * are divisible by 2 (X Y) hence there's no need to test for odd values.
3dcab85234f3a4 Xianzhong 2019-01-29  667       */
3dcab85234f3a4 Xianzhong 2019-01-29  668      if (nr < 6)
3dcab85234f3a4 Xianzhong 2019-01-29  669          priv->imx_gpu_govern.current_mode = UNDERDRIVE;
3dcab85234f3a4 Xianzhong 2019-01-29  670      else if (nr == 6 || nr == 8)
3dcab85234f3a4 Xianzhong 2019-01-29  671          priv->imx_gpu_govern.current_mode = NOMINAL;
3dcab85234f3a4 Xianzhong 2019-01-29  672      else
3dcab85234f3a4 Xianzhong 2019-01-29  673          priv->imx_gpu_govern.current_mode = OVERDRIVE;
3dcab85234f3a4 Xianzhong 2019-01-29  674  
3dcab85234f3a4 Xianzhong 2019-01-29  675      val = prop->value;
3dcab85234f3a4 Xianzhong 2019-01-29  676  
3dcab85234f3a4 Xianzhong 2019-01-29  677      for (p = 0, i = priv->imx_gpu_govern.current_mode; nr > 0 && i < GOVERN_COUNT; nr -= 4)
3dcab85234f3a4 Xianzhong 2019-01-29  678      {
3dcab85234f3a4 Xianzhong 2019-01-29 @679          unsigned long core_freq, core_volt, shader_freq, shader_volt;
3dcab85234f3a4 Xianzhong 2019-01-29  680  
3dcab85234f3a4 Xianzhong 2019-01-29  681          core_freq = be32_to_cpup(val++) * 1000;
3dcab85234f3a4 Xianzhong 2019-01-29  682          core_volt = be32_to_cpup(val++);
3dcab85234f3a4 Xianzhong 2019-01-29  683  
3dcab85234f3a4 Xianzhong 2019-01-29  684          if (nr == 2)
3dcab85234f3a4 Xianzhong 2019-01-29  685          {
3dcab85234f3a4 Xianzhong 2019-01-29  686              shader_freq = core_freq;
3dcab85234f3a4 Xianzhong 2019-01-29  687              shader_volt = core_volt;
3dcab85234f3a4 Xianzhong 2019-01-29  688          }
3dcab85234f3a4 Xianzhong 2019-01-29  689          else
3dcab85234f3a4 Xianzhong 2019-01-29  690          {
3dcab85234f3a4 Xianzhong 2019-01-29  691              shader_freq = be32_to_cpup(val++) * 1000;
3dcab85234f3a4 Xianzhong 2019-01-29  692              shader_volt = be32_to_cpup(val++);
3dcab85234f3a4 Xianzhong 2019-01-29  693          }
3dcab85234f3a4 Xianzhong 2019-01-29  694  
3dcab85234f3a4 Xianzhong 2019-01-29  695          /* We only register core_clk frequency */
3dcab85234f3a4 Xianzhong 2019-01-29  696          if (dev_pm_opp_add(dev, core_freq, core_volt))
3dcab85234f3a4 Xianzhong 2019-01-29  697          {
3dcab85234f3a4 Xianzhong 2019-01-29  698              dev_warn(dev, "%s: Failed to add OPP %ld\n",
3dcab85234f3a4 Xianzhong 2019-01-29  699                   __func__, core_freq);
3dcab85234f3a4 Xianzhong 2019-01-29  700              continue;
3dcab85234f3a4 Xianzhong 2019-01-29  701          }
3dcab85234f3a4 Xianzhong 2019-01-29  702  
3dcab85234f3a4 Xianzhong 2019-01-29  703          priv->imx_gpu_govern.core_clk_freq[i]   = core_freq;
3dcab85234f3a4 Xianzhong 2019-01-29  704          priv->imx_gpu_govern.shader_clk_freq[i] = shader_freq;
3dcab85234f3a4 Xianzhong 2019-01-29  705  
3dcab85234f3a4 Xianzhong 2019-01-29  706          p++;
3dcab85234f3a4 Xianzhong 2019-01-29  707      i++;
3dcab85234f3a4 Xianzhong 2019-01-29  708      }
3dcab85234f3a4 Xianzhong 2019-01-29  709  
3dcab85234f3a4 Xianzhong 2019-01-29  710      priv->imx_gpu_govern.num_modes = p;
3dcab85234f3a4 Xianzhong 2019-01-29  711      priv->imx_gpu_govern.dev = dev;
3dcab85234f3a4 Xianzhong 2019-01-29  712  
3dcab85234f3a4 Xianzhong 2019-01-29  713      if (priv->imx_gpu_govern.num_modes > 0)
3dcab85234f3a4 Xianzhong 2019-01-29  714      {
3dcab85234f3a4 Xianzhong 2019-01-29  715          ret = driver_create_file(dev->driver, &driver_attr_gpu_govern);
3dcab85234f3a4 Xianzhong 2019-01-29  716          if (ret) {
3dcab85234f3a4 Xianzhong 2019-01-29  717              dev_err(dev, "create gpu_govern attr failed (%d)\n", ret);
3dcab85234f3a4 Xianzhong 2019-01-29  718          return ret;
3dcab85234f3a4 Xianzhong 2019-01-29  719      }
3dcab85234f3a4 Xianzhong 2019-01-29  720      }
3dcab85234f3a4 Xianzhong 2019-01-29  721  
3dcab85234f3a4 Xianzhong 2019-01-29  722      return ret;
3dcab85234f3a4 Xianzhong 2019-01-29  723  }
3dcab85234f3a4 Xianzhong 2019-01-29  724  
3dcab85234f3a4 Xianzhong 2019-01-29 @725  int remove_gpu_opp_table(void)
3dcab85234f3a4 Xianzhong 2019-01-29  726  {
3dcab85234f3a4 Xianzhong 2019-01-29  727      struct imx_priv *priv = &imxPriv;
3dcab85234f3a4 Xianzhong 2019-01-29  728      struct device* dev = priv->imx_gpu_govern.dev;
3dcab85234f3a4 Xianzhong 2019-01-29  729      int i = 0;
3dcab85234f3a4 Xianzhong 2019-01-29  730      int max_modes;
3dcab85234f3a4 Xianzhong 2019-01-29  731  
3dcab85234f3a4 Xianzhong 2019-01-29  732      if (priv->imx_gpu_govern.num_modes == GOVERN_COUNT)
3dcab85234f3a4 Xianzhong 2019-01-29  733          max_modes = priv->imx_gpu_govern.num_modes - 1;
3dcab85234f3a4 Xianzhong 2019-01-29  734      else
3dcab85234f3a4 Xianzhong 2019-01-29  735          max_modes = priv->imx_gpu_govern.num_modes;
3dcab85234f3a4 Xianzhong 2019-01-29  736  
3dcab85234f3a4 Xianzhong 2019-01-29  737      /* if we don't have any modes available we don't have OPP */
3dcab85234f3a4 Xianzhong 2019-01-29  738      if (max_modes == 0)
3dcab85234f3a4 Xianzhong 2019-01-29  739          return 0;
3dcab85234f3a4 Xianzhong 2019-01-29  740  
3dcab85234f3a4 Xianzhong 2019-01-29  741      for (i = priv->imx_gpu_govern.current_mode; i <= max_modes; i++)
3dcab85234f3a4 Xianzhong 2019-01-29  742      {
3dcab85234f3a4 Xianzhong 2019-01-29  743          unsigned long core_freq;
3dcab85234f3a4 Xianzhong 2019-01-29  744  
3dcab85234f3a4 Xianzhong 2019-01-29  745          core_freq = priv->imx_gpu_govern.core_clk_freq[i];
3dcab85234f3a4 Xianzhong 2019-01-29  746          dev_pm_opp_remove(dev, core_freq);
3dcab85234f3a4 Xianzhong 2019-01-29  747      }
3dcab85234f3a4 Xianzhong 2019-01-29  748  
3dcab85234f3a4 Xianzhong 2019-01-29  749      if (i > 0)
3dcab85234f3a4 Xianzhong 2019-01-29  750      {
3dcab85234f3a4 Xianzhong 2019-01-29  751          driver_remove_file(dev->driver, &driver_attr_gpu_govern);
3dcab85234f3a4 Xianzhong 2019-01-29  752      }
3dcab85234f3a4 Xianzhong 2019-01-29  753  
3dcab85234f3a4 Xianzhong 2019-01-29  754      return 0;
3dcab85234f3a4 Xianzhong 2019-01-29  755  }
3dcab85234f3a4 Xianzhong 2019-01-29  756  #endif
3dcab85234f3a4 Xianzhong 2019-01-29  757  

:::::: The code at line 679 was first introduced by commit
:::::: 3dcab85234f3a4768e11d0fa9b18cfc9145c1131 MGS-4530-1 add 6.2.4.p4 gpu driver for L4.19

:::::: TO: Xianzhong <xianzhong.li@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
