Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189922BD5AD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 13:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761744070; cv=none; b=kyPe5qaRBH3W6+vnj3kEmZ/ZVVw/YOHPIWFJFkiOnHONWvo1WZ91s1ouro5hHD9Ez5FpcbM95gxjfKCJokpA8rkL18VX4jy2SWu7fBi2YOOLiCu8D8IErKNsqHiAKO5u7hhzqlJmjBIMdLjS0lorJEO93TMYXjYnSqwQeYGRi8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761744070; c=relaxed/simple;
	bh=wNfcms5naLIdBk0EAQhlNnteCdBB63OQRJD5hT4cT7k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AVirk977MkjYkc7dyIsxvpOasPCeyzsRiS16M4UGE83thV+bRMX6AXAcjdxqFwogaG/65ZRk1eqUYROKzbszOUsd1/0EeV7qTrAzFXLi44HpcEcvM95UnSbSOEpBiwDptgKMaCQ4r1ySZLuLBXXHPF6k2H8Z1VQUSjpD8L3fiys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hqKv/lVh; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hqKv/lVh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761744069; x=1793280069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wNfcms5naLIdBk0EAQhlNnteCdBB63OQRJD5hT4cT7k=;
  b=hqKv/lVheMpBl0acfLeOliAXoQkXsPVlTEBluNiaaWTv4NoT1jfpSFss
   yJf1fjWQz8x2wjWxPcDGrOv+1yauPfoBoeFjK+a4zpeGHg69MWXXBR+nz
   N7E6kWttbtAPKkj3umCE0n7WWEplLglY6Gc2b/UqhGSbo0S3KlLAZMzi8
   3uMMdpgZhUkq9zvQz9aGTXzzZnjAzW8769XagZ4UeGUwjYd3crEc1ID4T
   Sgk9RzRjEW6xUsK7oy6F0MCAAGRiiCdGYyNFUOUTxnGFN6AtTqMsLDaQ9
   YlhWt1/gAiH9dZa/p6W4KRbd+pp4ZrWNBSzaXM4IJ6ruVFHHScwgTGRJM
   w==;
X-CSE-ConnectionGUID: oLEmFiAuTpef7TCSpHAmkA==
X-CSE-MsgGUID: lUZB51M6RiW0OkN4LIZ2MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63768306"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63768306"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 06:21:09 -0700
X-CSE-ConnectionGUID: V2dAy87ESHmUx43bMAZHKA==
X-CSE-MsgGUID: OVMQh6aJSb26ECEPVUxhMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="216325845"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 29 Oct 2025 06:21:08 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE66q-000KcT-2u;
	Wed, 29 Oct 2025 13:21:04 +0000
Date: Wed, 29 Oct 2025 21:20:23 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [linux-next:master 3400/4731] mtk-mfg-pmdomain.c:undefined reference
 to `mbox_send_message'
Message-ID: <202510292115.MtowRumM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f9ba12abc5282bf992f9a9ae87ad814fd03a0270
commit: 1ff1f0db6aec80eae1639eff31b5875632d539c0 [3400/4731] pmdomain: mediatek: Add support for MFlexGraphics
config: arm64-randconfig-r131-20251029 (https://download.01.org/0day-ci/archive/20251029/202510292115.MtowRumM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510292115.MtowRumM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510292115.MtowRumM-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/pmdomain/mediatek/mtk-mfg-pmdomain.o: in function `mtk_mfg_send_ipi':
>> mtk-mfg-pmdomain.c:(.text+0x20c): undefined reference to `mbox_send_message'
   aarch64-linux-ld: drivers/pmdomain/mediatek/mtk-mfg-pmdomain.o: in function `mtk_mfg_eb_off':
   mtk-mfg-pmdomain.c:(.text+0xa5c): undefined reference to `mbox_send_message'
   aarch64-linux-ld: drivers/pmdomain/mediatek/mtk-mfg-pmdomain.o: in function `mtk_mfg_remove':
>> mtk-mfg-pmdomain.c:(.text+0x1880): undefined reference to `mbox_free_channel'
>> aarch64-linux-ld: mtk-mfg-pmdomain.c:(.text+0x18b8): undefined reference to `mbox_free_channel'
   aarch64-linux-ld: drivers/pmdomain/mediatek/mtk-mfg-pmdomain.o: in function `mtk_mfg_probe':
>> mtk-mfg-pmdomain.c:(.text+0x1f6c): undefined reference to `mbox_request_channel_byname'
>> aarch64-linux-ld: mtk-mfg-pmdomain.c:(.text+0x2050): undefined reference to `mbox_request_channel_byname'
   aarch64-linux-ld: mtk-mfg-pmdomain.c:(.text+0x2088): undefined reference to `mbox_free_channel'
   aarch64-linux-ld: mtk-mfg-pmdomain.c:(.text+0x2104): undefined reference to `mbox_free_channel'
   aarch64-linux-ld: mtk-mfg-pmdomain.c:(.text+0x2138): undefined reference to `mbox_free_channel'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
