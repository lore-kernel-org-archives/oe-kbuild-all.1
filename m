Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C753469950
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 May 2024 02:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715567174; cv=none; b=OTClXkCaNYTXPcU+CB/Gr8VSqsNJZQJfeiZQ6OXlfFuVmwKfXakX0TfxhBwQsLwcTFleLhJwGsyaVghhfxghwTZY9klg3SIEVzQFV+0ODGXp4vbrLPh/UTLwFabyEP0ow6763K4H82y9wxWrzedXkm0SxikyhmvCkjozKwZSUEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715567174; c=relaxed/simple;
	bh=+5LqUOvsenBRZjzhkf0nzQ0UXTOb70DRoLB91R3Zj8w=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eXLwdJKxsFoRIPqoCtMzZXD7zORTi+Xr5urQofTmkF4S0kO45MBiftxnfO9NXenK4b03NEJYnxko7CReMfNJ0xqPS4XZa8aHoniDiPhM2qtOmsauflwWn+/1zE/M5fJDDQX8y5OBqtfPZSuBX+c0BpaCzjewA3qGR0kMAFfWECM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M1rOx5ny; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M1rOx5ny"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715567171; x=1747103171;
  h=date:from:cc:subject:message-id:mime-version;
  bh=+5LqUOvsenBRZjzhkf0nzQ0UXTOb70DRoLB91R3Zj8w=;
  b=M1rOx5nyzL2ZEoXeNgxY8xlRRISQFnXP2ViVa/TaYFEmhkTC0sWMN+zG
   s757yoHpvZAho3HIBYeiu+Zz/gvHwg/mqHJeQsswgESbC6GN1lz5fry3U
   vUeazBa0Bl3+nhKfTbyN7Dy0s+4WAG9nmYPPRrZ3QvoL9KKLkgyZTlT52
   VxThlds4K4mV2uyx4K/hoy9C2Ca3a18eD2hVYbTsZYEg5oX4UN+/kbBYj
   LIrVLowFZmPsYmzqmLxR7BXL8lJS6GTUGdfTUYOvbc9OdB41RBtTIFmcR
   TkB3VL2GW4j9k5VwDF0rrfEDV5TRdzUXxRlNFFErT5ocnGZjZU9AXcnvi
   w==;
X-CSE-ConnectionGUID: bPNFrD+/SaymDnIcBjDvMQ==
X-CSE-MsgGUID: kRk4hYdGRMC9UshCSg7HDQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11319785"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="11319785"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2024 19:26:11 -0700
X-CSE-ConnectionGUID: w7kVJ21fTXiWpGiQPhoioA==
X-CSE-MsgGUID: KaVgltZbT/22L9r8zH+8Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="34703095"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 May 2024 19:26:09 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6LOB-0009Pj-1t;
	Mon, 13 May 2024 02:26:07 +0000
Date: Mon, 13 May 2024 10:25:10 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-linux-6.1.y-wip 17/22]
 drivers/tty/serial/8250/8250_omap.c:1251:8: error: call to undeclared
 function 'pinctrl_select_state'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202405131054.YwqK1E7Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.1.y-wip
head:   3faaed63dfc4e8016f0c2ddb9c6f1ac12f9c6fc2
commit: 9a2c8fd78ca6eb30b1ea6aa3400d74871a51dca0 [17/22] serial: 8250: omap: Support wakeup pinctrl state
config: hexagon-randconfig-r063-20240513 (https://download.01.org/0day-ci/archive/20240513/202405131054.YwqK1E7Z-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240513/202405131054.YwqK1E7Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405131054.YwqK1E7Z-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/tty/serial/8250/8250_omap.c:13:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/tty/serial/8250/8250_omap.c:13:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/tty/serial/8250/8250_omap.c:13:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/tty/serial/8250/8250_omap.c:15:
   In file included from include/linux/serial_8250.h:10:
   In file included from include/linux/serial_core.h:17:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1756:
   include/linux/vmstat.h:516:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     516 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/tty/serial/8250/8250_omap.c:1251:8: error: call to undeclared function 'pinctrl_select_state'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1251 |         ret = pinctrl_select_state(priv->pinctrl, priv->pinctrl_wakeup);
         |               ^
>> drivers/tty/serial/8250/8250_omap.c:1482:18: error: call to undeclared function 'devm_pinctrl_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1482 |         priv->pinctrl = devm_pinctrl_get(&pdev->dev);
         |                         ^
   drivers/tty/serial/8250/8250_omap.c:1482:18: note: did you mean 'of_pinctrl_get'?
   include/linux/pinctrl/pinctrl.h:213:21: note: 'of_pinctrl_get' declared here
     213 | struct pinctrl_dev *of_pinctrl_get(struct device_node *np)
         |                     ^
>> drivers/tty/serial/8250/8250_omap.c:1482:16: error: incompatible integer to pointer conversion assigning to 'struct pinctrl *' from 'int' [-Wint-conversion]
    1482 |         priv->pinctrl = devm_pinctrl_get(&pdev->dev);
         |                       ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/tty/serial/8250/8250_omap.c:1484:27: error: call to undeclared function 'pinctrl_lookup_state'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1484 |                 priv->pinctrl_default = pinctrl_lookup_state(priv->pinctrl, "default");
         |                                         ^
>> drivers/tty/serial/8250/8250_omap.c:1484:25: error: incompatible integer to pointer conversion assigning to 'struct pinctrl_state *' from 'int' [-Wint-conversion]
    1484 |                 priv->pinctrl_default = pinctrl_lookup_state(priv->pinctrl, "default");
         |                                       ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_omap.c:1485:24: error: incompatible integer to pointer conversion assigning to 'struct pinctrl_state *' from 'int' [-Wint-conversion]
    1485 |                 priv->pinctrl_wakeup = pinctrl_lookup_state(priv->pinctrl, "wakeup");
         |                                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   7 warnings and 6 errors generated.


vim +/pinctrl_select_state +1251 drivers/tty/serial/8250/8250_omap.c

  1237	
  1238	static int omap8250_sysoff_handler(struct sys_off_data *data)
  1239	{
  1240		struct omap8250_priv *priv = dev_get_drvdata(data->dev);
  1241		int ret;
  1242	
  1243		dev_dbg(data->dev, "sysoff handler\n");
  1244	
  1245		if (IS_ERR_OR_NULL(priv->pinctrl_wakeup))
  1246			return NOTIFY_DONE;
  1247	
  1248		if (!device_may_wakeup(data->dev))
  1249			return NOTIFY_DONE;
  1250	
> 1251		ret = pinctrl_select_state(priv->pinctrl, priv->pinctrl_wakeup);
  1252		if (ret)
  1253			dev_err(data->dev, "Failed to select pinctrl state 'wakeup', continuing poweroff\n");
  1254	
  1255		dev_dbg(data->dev, "Setup wakeup pinctrl\n");
  1256	
  1257		return NOTIFY_DONE;
  1258	}
  1259	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
