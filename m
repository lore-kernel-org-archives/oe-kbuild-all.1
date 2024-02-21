Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB141468F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Feb 2024 01:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708480506; cv=none; b=T8gXR4xMaEGKqPO6C0MAUMKSNqi11kkQRwM/lGDJg5ZYBTCaPPARREijn/UIuWmMdCuv+jxEHMEpeAdpbLhTuiIIOAfvNNOsA7V8pD+BtNHHG85MgojzzUesskQ5NlzHSmjCzfMLhWsbRSILQq34HV5xkls+LohA5N73h5lLLS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708480506; c=relaxed/simple;
	bh=HZyUBjf59pamVNUIhfbnTWD6OGh4NVz5E5K+UKDaVyY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aYbJgmOZeSyDcJlwfg43BT4VU5nkl1XALeO9agFYR77eeRUOkne9PjS5U0wlO5aPOGUbzVk4aGHpT9k/GDPxkz2WqhTXjMOpbEvMy0NZQHaMayfFoDE6uEudyZsig15zg3rdsDzOfO68zVNPTzlj5DHQTnprKgUwToo6KBa/JVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R2MxXIJ8; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R2MxXIJ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708480504; x=1740016504;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HZyUBjf59pamVNUIhfbnTWD6OGh4NVz5E5K+UKDaVyY=;
  b=R2MxXIJ8U/8oL5/QkWH4HFVIqzbSTdRAwjBwF55MzDITwE1kzyFZP6fU
   Af77lf1s46NF1IfxMDCk3OYTEGSCokMLF02LNhtceE/ghUBYIp/IzETLv
   eD5vnmUsghyA2tijk89CD8g5z7W9h4+63sIaSftcM6EVlkJO1dn4yTCBD
   TGGIcy9a6pdlesYO+VvssTyHOC07nmzPEqSrDS20cB3nFVqCGu/x718EF
   chJy4kCryh8x8ykmKZOp4uEth3EYk5VDy54TdmpYgfQx/m8b9UXkDowpE
   faFto3UWY6dSGB00D8/X4acx04jdYU2VtCuXo09+GX2wZbPqvvV013imD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="20159256"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="20159256"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 17:55:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5125591"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 20 Feb 2024 17:55:00 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcbp3-0004wG-0N;
	Wed, 21 Feb 2024 01:54:57 +0000
Date: Wed, 21 Feb 2024 09:54:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 13615/21630] binfmt_elf32.c:undefined
 reference to `elf_core_extra_phdrs'
Message-ID: <202402210911.dCu8im0A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   caea2096c89e8d8cbaffde0d33f3c6d748c4d0c5
commit: 63a07568188f27d31954cf24f43540c9c2fa92cd [13615/21630] arm64: introduce binfmt_elf32.c
config: arm64-randconfig-001-20240220 (https://download.01.org/0day-ci/archive/20240221/202402210911.dCu8im0A-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240221/202402210911.dCu8im0A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402210911.dCu8im0A-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: warning: -z norelro ignored
   aarch64-linux-ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   aarch64-linux-ld: arch/arm64/kernel/binfmt_elf32.o: in function `elf_core_dump':
>> binfmt_elf32.c:(.text+0x8e0c): undefined reference to `elf_core_extra_phdrs'
>> aarch64-linux-ld: binfmt_elf32.c:(.text+0x92ac): undefined reference to `elf_core_extra_data_size'
>> aarch64-linux-ld: binfmt_elf32.c:(.text+0x9608): undefined reference to `elf_core_write_extra_phdrs'
>> aarch64-linux-ld: binfmt_elf32.c:(.text+0x9b34): undefined reference to `elf_core_write_extra_data'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
