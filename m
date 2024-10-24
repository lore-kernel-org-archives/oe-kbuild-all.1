Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FCB2040B5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 14:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729778884; cv=none; b=rmW6NMyROI4aJXcvOVa33Sg7y4JfyGqBmyc5APBVoD8H4njjETjBpPSS9ha65iqFtWUzkzybDXnH9gXXmYsvJ68e2bgHJkAuIhymMWLRh8P0ic+OqQHql0HJheCCFj6pVeBoMrKEvx+IcOxXFGWaI+SksfStgZdQC0h4UZACwuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729778884; c=relaxed/simple;
	bh=vjpQ6qvc3igr0rIpYi3aYuX5g7ubQ/RjEC2KFx1c4yI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GlO+0wuyPd+gmhcMLKpRpm1vg9MSFZsgV5ooTTf61+R75M8BM2pTCOZtS/sQoZayhIt3Hh9cT1fCwsZGLQw/BXukyfDkou798DdlCGQXq7HwrSIzOoXCA0tPG6c+kjjG48BJtfRysW7qtLPAd9jkYy7K3lCC6gktS0hlLIxS8g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZW3ZX2Zl; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZW3ZX2Zl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729778882; x=1761314882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vjpQ6qvc3igr0rIpYi3aYuX5g7ubQ/RjEC2KFx1c4yI=;
  b=ZW3ZX2Zl1M46YTaBsv+9ALh3zNKk6wkvcDttS9PcqXJhDzEfkXdF+yjt
   FdO/uBvHmkFNvNp/w0jNNM3oPhI9tdix4L79Tu/X4szcAlrXh+SL2+3uI
   E37KkkQEbEgfBmRRcAQ8pwMVPFlqfTBjd7rGva9LutBxg4vfx2wzRjhcf
   4liqjlBj64BXRmiWGubaysCZyaWMzwVpXlpMK5KHX+wpSr8wo1XgWVptl
   rpT3ly2FvTz3u51eRzrXcIxWj8E410iBEsuWpE1WzPxV3fq14LVOFIhn6
   1+pM5lPV+BICfCedJZK4jV9VdGBVhrFcqDsc0EV4VSFiU18YYXGdEZgrg
   A==;
X-CSE-ConnectionGUID: TveRrVzHQOypafsiQhqyMA==
X-CSE-MsgGUID: vry3M1+NTveK72FVKVpiCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="46896519"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="46896519"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 07:07:59 -0700
X-CSE-ConnectionGUID: KTZTSu5TRuWrWt4VCDOmBQ==
X-CSE-MsgGUID: FMB6d1W1TdSYZGINnnkzDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="111443381"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Oct 2024 07:07:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3yVG-000WVI-0w;
	Thu, 24 Oct 2024 14:07:54 +0000
Date: Thu, 24 Oct 2024 22:07:23 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 5561/13046] kismet: WARNING: unmet direct
 dependencies detected for CRYPTO_LZO when selected by EMM_ZRAM_CONF
Message-ID: <202410242121.KztyIHgO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: 5723adb73901b05640a72b59bfa6125a3a469cd3 [5561/13046] emm: configs: enabled EMM related configs
config: x86_64-kismet-CONFIG_CRYPTO_LZO-CONFIG_EMM_ZRAM_CONF-0-0 (https://download.01.org/0day-ci/archive/20241024/202410242121.KztyIHgO-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241024/202410242121.KztyIHgO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410242121.KztyIHgO-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_LZO when selected by EMM_ZRAM_CONF
   WARNING: unmet direct dependencies detected for CRYPTO_LZO
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - EMM_ZRAM_CONF [=y]
     - EMM_ZRAM_CONF [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_ZSTD
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - EMM_ZRAM_CONF [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_LZ4
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - EMM_ZRAM_CONF [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_LZ4HC
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - EMM_ZRAM_CONF [=y]
   
   WARNING: unmet direct dependencies detected for MEMCG_ZRAM
     Depends on [n]: CGROUPS [=y] && MEMCG [=y] && SWAP [=n]
     Selected by [y]:
     - EMM_ZRAM_CONF [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
