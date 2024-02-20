Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF644482D1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Feb 2024 05:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708407844; cv=none; b=dn2XDsW6Q/7cpuDdxSN3LZLqARsT17OVn2LJ9y2VWX65/HYEOu7hCz010ZBU1gWpnevHUHsVOFyPOhGXHswt8YNZHIWwPS7jRHAZQn0lHI9Y9vZBbq6Idzuq9iBZFbVfb4Za/eUy9ZZJ5lzUKn435cyMvm55dXRXMuy3dn2UhpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708407844; c=relaxed/simple;
	bh=XkSPG+HabMoixWW6a8N1XRyXg5zvDtHP3+lOuJ6g7Gc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uF6VRI04F1g4lWVSKs4RWHsaoR0sSVhP2D7ZkkGo26U4EimLvOompityOAuEMDU+5NIMR2kvTVu4/ckyGnd5SKQ7XQRujrOB2Mzms4hn3fYUtd2jYkyWN9b+vb1xaQ6mtEg3tr2PMozooZhzoY1dDf0d6X0FZlfiFPex5mSwxts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iiRWU2CI; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iiRWU2CI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708407843; x=1739943843;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XkSPG+HabMoixWW6a8N1XRyXg5zvDtHP3+lOuJ6g7Gc=;
  b=iiRWU2CIq1VRC8yLUtwwYVoa9Pr2F2TwCWZcinJDcDT0t9i12N90tHEL
   pNtEPOvg7O8GIYC7zShmzqzfCE1je1vnQOnDuFIBDLqxNRnm0ORdmu7U1
   WCpQuKttrFUglYL3GWqdD3kAq7kYWs7YbODL2UJu6lfW8g6D3g49REiuP
   7/egNLkP9J4j26v/Apd6TY65n2s9SDZ1DPgJOa8midPbxMulTsgtdQvpo
   s0iF6lpDm0a3x3Yw/r6gW2AaUjDWlLLlhkvfxX/JmgDmBr9x/hxOmi3Vs
   2Kj+h1IEKp33sOSREymiHTTT+zn+rDB3BMUqfanN4a+90HZLVwRdjG68P
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2360950"
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="2360950"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 21:44:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="4918320"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 19 Feb 2024 21:44:00 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcIun-0004Ga-0l;
	Tue, 20 Feb 2024 05:43:44 +0000
Date: Tue, 20 Feb 2024 13:42:19 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.8-rc5-esp32 36/48]
 drivers/net/wireless/espressif/esp32-ng/esp_shmem.c:274:34: warning: unused
 variable 'esp_wifi_shmem_match'
Message-ID: <202402201324.vxOQoG4z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.8-rc5-esp32
head:   0a3bc9a6486ba4ea87994cf3225f1084bf3aedfa
commit: 46a44f9b7339ff74f54aaad7e4d20bb94f429103 [36/48] esp_wifi: add IPC transport
config: hexagon-randconfig-r051-20240220 (https://download.01.org/0day-ci/archive/20240220/202402201324.vxOQoG4z-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 36adfec155de366d722f2bac8ff9162289dcf06c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240220/202402201324.vxOQoG4z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402201324.vxOQoG4z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/wireless/espressif/esp32-ng/esp_shmem.c:10:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/net/wireless/espressif/esp32-ng/esp_shmem.c:10:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/net/wireless/espressif/esp32-ng/esp_shmem.c:10:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/net/wireless/espressif/esp32-ng/esp_shmem.c:274:34: warning: unused variable 'esp_wifi_shmem_match' [-Wunused-const-variable]
     274 | static const struct of_device_id esp_wifi_shmem_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~
   7 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ESP32_IPC
   Depends on [n]: OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - MTD_ESP32 [=y] && MTD [=y]
   - ESP32_WIFI_SHMEM [=y] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_ESPRESSIF [=y]


vim +/esp_wifi_shmem_match +274 drivers/net/wireless/espressif/esp32-ng/esp_shmem.c

   273	
 > 274	static const struct of_device_id esp_wifi_shmem_match[] = {
   275		{
   276			.compatible = "esp,esp32-wifi-shmem",
   277		}, {},
   278	};
   279	MODULE_DEVICE_TABLE(of, esp_wifi_shmem_match);
   280	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
