Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D5217623F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 19:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729798342; cv=none; b=lGv480QV7ZebxQI6ZAYHtfPh25u068VrL6gvjNaAMATfgrw+v8qm+aH0XylnrqcBil2JtK1P7O/58GvphNdr+6gWNRVQ0Ze/Sf+OLUpkLq3VuP2aFwvU+BkHWw05VjSVBZIoL5ccc1kRKaaosh2TgrXC1EOyfEzaianJ9cmzGWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729798342; c=relaxed/simple;
	bh=goWkqbBppzxM7l0XFNAghlHxb5b72XVspJJkkk1/6dk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T43Dq30S0EzNzgjB/+4OkXUaQOA8cCIYgqNNxm0s0SYgf8tLk4+E1V2rIwJ7jee818PxllwoqPrWt8wlDmEh2Hs+HiONpgLUN2xrltZO5NjuTj0+LQeGK4x3OzNCPPO6E1P4rVV0Lef/qxMut+ikjuUXImL8a/Y5KZj0UHlbWA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YtYbrtOT; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YtYbrtOT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729798340; x=1761334340;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=goWkqbBppzxM7l0XFNAghlHxb5b72XVspJJkkk1/6dk=;
  b=YtYbrtOTwZb2VKVM2soJWMBtgEVLP3V0NgvPBlnwg9n015d4fpH3PD+P
   9nA3X0j+heD2yt4Wnr5UYMDlNnyLb+s/9YT/U1iXylpoDtIZ4w0Bz9dxc
   hKNVyvQfsBNJ9IAaHzu/5wnAv3tJN/qNWPWL30GDLPpd3W+rc8XMrVZ8X
   NxMN0H+8ywW2lRqG8+7DKJNP1Y5VlluoAbw7+5kEveyyLQyVgtClKQRmi
   c5fMAlp7f2f2YXTNwqwz8PVrnE1hAzlHm2ZvgfEMbhVu5/iS8ARj/1taz
   djYo3m4oTBhoHwvywb9cFJXm64MV9G0VhRV5T/N8WHgwuw8PjaA9e+P2K
   w==;
X-CSE-ConnectionGUID: q1twLetsQkmkpXfruISheg==
X-CSE-MsgGUID: SoTtuEnhSNuk+DgXINxdSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="40825695"
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="40825695"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 12:32:18 -0700
X-CSE-ConnectionGUID: eC6AxK3nQvC5E844fQ1vbA==
X-CSE-MsgGUID: Jp/AC62UShiwAcUvnlbMXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="85467901"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Oct 2024 12:32:15 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t43Z6-000Wvk-2z;
	Thu, 24 Oct 2024 19:32:12 +0000
Date: Fri, 25 Oct 2024 03:31:20 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 5561/13046] kismet: WARNING: unmet direct
 dependencies detected for MEMCG_ZRAM when selected by EMM_ZRAM_CONF
Message-ID: <202410250320.1DUuVTNT-lkp@intel.com>
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
config: x86_64-kismet-CONFIG_MEMCG_ZRAM-CONFIG_EMM_ZRAM_CONF-0-0 (https://download.01.org/0day-ci/archive/20241025/202410250320.1DUuVTNT-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241025/202410250320.1DUuVTNT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410250320.1DUuVTNT-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for MEMCG_ZRAM when selected by EMM_ZRAM_CONF
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
