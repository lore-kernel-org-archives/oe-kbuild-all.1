Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E296189BAE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 06:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729750844; cv=none; b=PlwMJFFCS0Y9pLtGZWZcEDhYaniRCIauvXxHG/PmhkqoPy1fw7XIAiuA8aH6xvcGZ7cCzk65mkBZvcT/CWOSBNXebqraGhUN5kq1Z66rCbU4jEVvIQPYK0y245oU5aB92610t/Iz/tLmOJdlLHqvLa+MH/U94G5BwX7/7U4TiRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729750844; c=relaxed/simple;
	bh=d/wOTLpHwf01mHt+hLMFq6Ny1GYTv/XV3mMKkkGzdRc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Klz4266KtAAvTFPh0Qd+akWpusDLPswRVULhKexyt0mP0SfeZLiQsM9NRYygBNYono+ZX6Hd+PsBC9pVrfYGE5lZHbTa2QUpXRaYi9O5i3tDno97LADnOF3pRVdCISgWB0H21o4lN9qLOJ+gfYmQMkNWRFgwhjI+HRXru3occoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VAU2IE3v; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VAU2IE3v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729750842; x=1761286842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d/wOTLpHwf01mHt+hLMFq6Ny1GYTv/XV3mMKkkGzdRc=;
  b=VAU2IE3vl41Gekf3tFlT8TnTTdAZEQOjWCNDH87pfJe8pieFAun/ba/i
   CRu9Hn3BaLeyM2d+K1XylqfTWI8ZJolUKqufJoVKGTf0K0v42e1XIgg9s
   X/6fUW0ivu1iVlJ/+0i/RYADQRuxwhLD10xRVcMjldinun3GIMvGPA2FW
   2NWeb71af1auWxWBvmkqCLOPmJQ3RyP/6bWCT3QE7NzPAqHBF79qqP14A
   Nd31av9cg5eJMeN4s3QGVekh/Fce6pz+9UxpLe7OIxIeyH+cV1BhxKb6O
   X7x0SRsor7yeEy6rsBu87eOhSi7UxzvpKCyuRfdvPTimvOfwfKoJsZ47h
   A==;
X-CSE-ConnectionGUID: qCCVxrl/SfaJVxNEufawFA==
X-CSE-MsgGUID: jUx5AdeHTjK6VW0DAotBJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29490721"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29490721"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 23:20:42 -0700
X-CSE-ConnectionGUID: dvh7g1qfS3iCxUEfTrrERA==
X-CSE-MsgGUID: 6guFWzoYQZq+QTChkaJS0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="80667137"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Oct 2024 23:20:39 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3rD2-000W42-1y;
	Thu, 24 Oct 2024 06:20:36 +0000
Date: Thu, 24 Oct 2024 14:20:35 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 5561/13046] kismet: WARNING: unmet direct
 dependencies detected for CRYPTO_LZ4 when selected by EMM_ZRAM_CONF
Message-ID: <202410241425.JStVQB7D-lkp@intel.com>
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
config: x86_64-kismet-CONFIG_CRYPTO_LZ4-CONFIG_EMM_ZRAM_CONF-0-0 (https://download.01.org/0day-ci/archive/20241024/202410241425.JStVQB7D-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241024/202410241425.JStVQB7D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410241425.JStVQB7D-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_LZ4 when selected by EMM_ZRAM_CONF
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
     Depends on [n]: CGROUPS [=y] && MEMCG [=n] && SWAP [=n]
     Selected by [y]:
     - EMM_ZRAM_CONF [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
