Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42DC3D567B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 12:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773838444; cv=none; b=TiZJ581djsDVMEnrjIIPsOA1ZFkvt93aIVLIS/ZQvNX2s8oFq7h9iNuuhDOr2Sn3FS4KMlptNQIRJhzM/ZdWQSSX6KhzrQUvKxNrEyfw1HLGkThJww+Aqy8uUlXPWlgMEDjy6EAW89oXaQ6cjQQ8vYWI2SahgCui5ruzAb2o5F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773838444; c=relaxed/simple;
	bh=0YSHWwjLUFeRH/f3bQ7ZT76FHaNZGHkTcO2POj2WS40=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ao/4qh9xcnBKoSJtXF+iukcqAlXN/cuJVkc4DrGYbeSBrNiY5c9R8bkrMOYEaapXYakKY6Hck/PQMA40fM1PC4IS8dmoAZufXweCX8iPBO7p/SCjlow3bjgL5gelFFkZLHvvMzCTNYkTVFpiNKozZXX9s6HHVc/415jnf4ycCOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D72sHUbt; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D72sHUbt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773838441; x=1805374441;
  h=date:from:to:cc:subject:message-id;
  bh=0YSHWwjLUFeRH/f3bQ7ZT76FHaNZGHkTcO2POj2WS40=;
  b=D72sHUbtp5hiCTsxmsKhkRihuywmj3FZepAgWIbITQ74QUPEtfgOC9PF
   8pqWEdvV+R0uVP4Um0UPDwIfTSUeSnp9ATZyJjRChjE+FtivMZZSA08QN
   Esoyv00+IqimIE+gKGKRt4MLMaTbmw42SZ7lUDv/dLmi2HoGQss9vALMf
   1QlzhFLf/VG98zwYF0nHak8DHsgxoWS/6LSzW7RNwDaW9jGcMZXEdLsEa
   2vY1NGdq7PcBIK1Wy2rYFrQ6rgWEUu0F1uqiEg28ktwTgqt79RWWiZzJc
   yT4Hh7Du7a1mjqvIFQzf8IsoSwCHFYD1h1u7cbYROFtAkHZSziyEz59gf
   A==;
X-CSE-ConnectionGUID: P1nJ5oWHTV6MtLV2Ri1EEg==
X-CSE-MsgGUID: 6EXfHnXOR1WA7+MJ9uHXGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74863745"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="74863745"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 05:54:00 -0700
X-CSE-ConnectionGUID: qhfOL2DWQS+QtPyi62ZuyQ==
X-CSE-MsgGUID: PXJ3lVO3QeWCyDyvPR+/Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="222830095"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Mar 2026 05:53:58 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2qPM-000000002vB-01hA;
	Wed, 18 Mar 2026 12:53:56 +0000
Date: Wed, 18 Mar 2026 20:53:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2] Warning:
 drivers/dma-buf/dma-buf.c:413 function parameter 'dmabuf_info' not described
 in 'dma_buf_account_task'
Message-ID: <202603182029.8uiPQUhI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   b0e662fb17ec139a265b282999e920fe1f021414
commit: 09725f5bd79ddb1909d7d05ec74c9378c9e662c3 [2/2] ANDROID: Don't use current pointer for per-process dmabuf accounting
config: i386-randconfig-141-20260318 (https://download.01.org/0day-ci/archive/20260318/202603182029.8uiPQUhI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603182029.8uiPQUhI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603182029.8uiPQUhI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/dma-buf/dma-buf.c:413 function parameter 'dmabuf_info' not described in 'dma_buf_account_task'
>> Warning: drivers/dma-buf/dma-buf.c:428 function parameter 'dmabuf_info' not described in 'dma_buf_unaccount_task'
   Warning: drivers/dma-buf/dma-buf.c:953 function parameter 'name' not described in 'dma_buf_set_name'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
