Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC3C32B12B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 May 2026 03:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779249235; cv=none; b=fS3WDtVEmEXTZN2Sw9iPOWoXj7UKR8U7q8Nc9EMBgEcnzRscJ51kvprrcH1nOKrGFlQT1yUeyV+BUemsK9j78dp5F3OOg6xKnt3/oHafarkoLBEMvpOGvkWBK9925rfRO3jWMhy0tvLLBvdxeUYLSzvKAKB25j2vp2dDYEapZKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779249235; c=relaxed/simple;
	bh=sQKsudrU3SC2MWAHkd77Uvx8ap5hdp5koUwfhW99tfw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Xk+EvXRiQ7bAbvfp6c/0yUdo6W8oNNCgOmjMd2H2XaLyWm9TKYsgtWgnoCmSS0GX/sj3jLYzCYhBrk1sbso8exIBW4AYR0lqIulDI33w+0LvdzymWwHsgN6g9E7G/4SkGIT48qT1D/Kf+oA2V1Ybwov0VUB6WkbamVC4Uid+B1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zl+aoGBe; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zl+aoGBe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779249231; x=1810785231;
  h=date:from:to:cc:subject:message-id;
  bh=sQKsudrU3SC2MWAHkd77Uvx8ap5hdp5koUwfhW99tfw=;
  b=Zl+aoGBecARnYCwkSPW+lrLICSlJXq31eQKrsHGPsPyBlLF01HgIiVaY
   2oSpqiWrhkP5KukwFJtioEQ2zYv5dKL4bbdk2XuZRpTz8l08G92azOZuq
   Uv98O3aMQHd+fbQyTlJfP4Yy4oVxx0hX4FytHmF+oVPdyWWZIgjQlLf1M
   r3ojcj0WyabhzVrx/L6S1uA69BG9rjMiMtCl8S6RfIS6Ju3t9R2S7oDvB
   5PGAlhnLGs7AWJJU1v0BBOAHrAefq7oXnkJBZjb5tMlkXI0WCCUrhDxBx
   Ja85yYjR+fV73rygpzmOGyudTW2SI070UbAK7+7Zk2uhLnDInhlajFI1F
   w==;
X-CSE-ConnectionGUID: 6c2tvVisTaiSxvMm294h4Q==
X-CSE-MsgGUID: NBQjgu1vRgK6/t+uSA5f3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="91533736"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="91533736"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:53:50 -0700
X-CSE-ConnectionGUID: Lm0JZwXDQQSfK99m607mpA==
X-CSE-MsgGUID: +fPsUj/iS5q3kB7OZUGBOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="263784775"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 19 May 2026 20:53:50 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPXzw-000000002PB-35iP;
	Wed, 20 May 2026 03:53:38 +0000
Date: Wed, 20 May 2026 11:53:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 4/4]
 fuse_bpf_backing.c:(.text+0x2860): dangerous relocation: unsupported
 relocation
Message-ID: <202605201139.RhlabwzJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   1fb067c84c7678523f616d986e51751e6ed26461
commit: be926e6761d28d105ba672242e81e911e0d7e5e0 [4/4] ANDROID: fuse-bpf: fuse-bpf v1.3
config: arm-randconfig-r073-20260520 (https://download.01.org/0day-ci/archive/20260520/202605201139.RhlabwzJ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605201139.RhlabwzJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605201139.RhlabwzJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: fs/fuse/fuse_bpf_backing.o: in function `fuse_handle_bpf_prog':
   fuse_bpf_backing.c:(.text+0x2860): undefined reference to `fuse_get_bpf_prog'
   arm-linux-gnueabi-ld: (fuse_get_bpf_prog): Unknown destination type (ARM/Thumb) in fs/fuse/fuse_bpf_backing.o
>> fuse_bpf_backing.c:(.text+0x2860): dangerous relocation: unsupported relocation

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
