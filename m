Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57633EEACF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 22:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778883834; cv=none; b=qn9lD/brUKrFQ4B1SGgo8ErqNoZJ4P2XOTL3QjA7xKfQA0yGXVDodD7jdzKoZyImtN2zaBMp12wCCYYdc41hppkH8GEw513MForCrHOPulSHdCEJgRF6xMTzF6RWtrHtgEOHvNz0WNVOFLHh57kpzronb1zUAHcT9sN/yf5uBIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778883834; c=relaxed/simple;
	bh=xBJS6KsO6ufvDaGXp48UK16rDCQHX1HIGv0SJor/9Ho=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KMFzmbxaaJ8NM2p4lPhOry7Js2PjMIznUh9QCaP91i/brGhKyPv9fDqNIZylE6l7QoftOF71naoqgONldl9Gy7R2rFOuM3AMOKN5ErauNk0nm99DpTVXl9AeucZ/W7v+6O71W6QsipI+ToXh3SVhJFfP40rKKgHDHlP2ir8BpTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eY9KE1Wx; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eY9KE1Wx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778883834; x=1810419834;
  h=date:from:to:cc:subject:message-id;
  bh=xBJS6KsO6ufvDaGXp48UK16rDCQHX1HIGv0SJor/9Ho=;
  b=eY9KE1Wx9iX7q+ycy+/Xg3bPL1GhkHmJNQ6EhqWkxuq2JPSa8ztz/Uzn
   EJoqTOkKWE3IXvJFkILGprpFkK2RgU056CBblIXbV+Mg7JBuBFFawRFJ+
   2kMc/AL+KHJQIMCQALiAlRBrkBJtj7ip6QwjEUMw1tS1E5uocJ2VktA2x
   T42UUVb4pd1mJxgsBmZ4RyG0fwG5BR6OEr3naxPT3mBwJ5GOdk9zjbZvO
   sna6VFj53qx7t/ihpWGQElGCcZ4YWDrTjBMctE0DRHaGm6RA26zf/+AEz
   ewYJmOqBFpVN+ZCyZhLugwPoSg+HyZ4m/Z8lxNjor2vVQu2ljxW1BLh8r
   A==;
X-CSE-ConnectionGUID: AHi9JFjPT1W5l+YXV9EQzw==
X-CSE-MsgGUID: KGlaXuU4Q7u9p7pQcQNeHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79737290"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="79737290"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 15:23:53 -0700
X-CSE-ConnectionGUID: YWRo7NR0THCotbSq8owERQ==
X-CSE-MsgGUID: T6y9YE+ERpaIHok8I0vgCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="243787357"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 May 2026 15:23:51 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO0we-000000000A9-2XYO;
	Fri, 15 May 2026 22:23:48 +0000
Date: Sat, 16 May 2026 06:23:23 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, CK Hu <ck.hu@mediatek.com>,
 "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Subject: drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:384:24: sparse:
 sparse: symbol 'mtk_hdmi_ddc_v2_driver' was not declared. Should it be
 static?
Message-ID: <202605160625.YbQZbGyz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d458a240344c4369bf6f3da203f2779515177738
commit: 8d0f798862731c62b09e7138a9032964d70566c2 drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188
date:   6 months ago
config: openrisc-randconfig-r132-20260516 (https://download.01.org/0day-ci/archive/20260516/202605160625.YbQZbGyz-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160625.YbQZbGyz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605160625.YbQZbGyz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:384:24: sparse: sparse: symbol 'mtk_hdmi_ddc_v2_driver' was not declared. Should it be static?
--
>> drivers/gpu/drm/mediatek/mtk_hdmi_v2.c:53:12: sparse: sparse: symbol 'mtk_hdmi_v2_clk_names' was not declared. Should it be static?

vim +/mtk_hdmi_ddc_v2_driver +384 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c

   383	
 > 384	struct platform_driver mtk_hdmi_ddc_v2_driver = {
   385		.probe = mtk_hdmi_ddc_v2_probe,
   386		.driver = {
   387			.name = "mediatek-hdmi-ddc-v2",
   388			.of_match_table = mtk_hdmi_ddc_v2_match,
   389		},
   390	};
   391	module_platform_driver(mtk_hdmi_ddc_v2_driver);
   392	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
