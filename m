Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FE52209B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Oct 2024 15:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729439753; cv=none; b=GQn57nipyC/bV41gRE7C9OV8+Y08wBF/OSV0nG1V6od+8JfzSs3QCj2ln+jjPvOa2cORGD2rkYJZgJW2qZJ+WjxcFrmcfuay7om/rW44t2cKVVTnEbgYWp0RN5GB0BWugmDGoGvyjJQTV2ZnCpIS2IkvtyKzMqWM/N3XSXfQJ4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729439753; c=relaxed/simple;
	bh=j+N0E0Izaua4g0+T0UikDerlUtZrDFLox2l97SOnlkg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bdtuUVirqiPzFmS0PyqoC7bg/6sUAA7lzBevdRBmyS2vJTwLLJ4mo/OzwUXYP6/BJAZA/leMvhPjhq5UhkHqMGOcmy4n9He3rc4ysya82fzfu4OI8LAdNaIPKZkWx6ESuWPkhBivHr1PzDHCy9jIDtxitySVqNSlfDGeVsI/hSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sh3lf04S; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sh3lf04S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729439751; x=1760975751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j+N0E0Izaua4g0+T0UikDerlUtZrDFLox2l97SOnlkg=;
  b=Sh3lf04SG6U6ycMg4BVPw4b0TlJQumSfQL1RChUIHYtTda+dpuh88BK/
   f77XHFAyVSQnJpQZY30IUY7oo+8Bfh2AAqzzFU8wW+QR8b1QkxuZ7HerJ
   usIaSzen1z2hwALE8gZXQlDaIAoTBbafT1nj79yIZoDYH3YpisuvyFHFI
   W/EFh82sdfRtGAKxz8kjHoCi6iuHzHH5IgPc6sTYfb0ypTKD0JTCOTSPi
   5PL10t1gNX0Ym+8LBs4A4v061oAtmirEvN/PrRsR7mYe8qw6jbOpcY/fu
   ldoobTmCCjBiXU/qmwhpmeo7b/Xq3DgtQFHQfLRf6jBV1/CGcoyyKw3MY
   Q==;
X-CSE-ConnectionGUID: cIouTw9jQ+GjYIBoBYFecQ==
X-CSE-MsgGUID: u2NVRquWQ/CQAVkW9jlvTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46385409"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="46385409"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 08:55:51 -0700
X-CSE-ConnectionGUID: mLYRXkzRTx2q2czkAS/t9w==
X-CSE-MsgGUID: m0ECQrMoR9y/NG5Y7GAMcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="79235318"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Oct 2024 08:55:50 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2YHT-000QR3-2U;
	Sun, 20 Oct 2024 15:55:47 +0000
Date: Sun, 20 Oct 2024 23:55:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 2/42]
 ./usr/include/linux/mtk-fd-v4l2-controls.h:2:1: warning: // comments are not
 allowed in this language
Message-ID: <202410202332.mmNWEuLi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   f80404ea0956d01dcbcdfb1e4807883883fb46bb
commit: 0515dc9d2fe28a3991e1f425fe2f48cb657841ee [2/42] BACKPORT: FROMLIST: media: platform: mediatek: isp: Add Mediatek FD driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241020/202410202332.mmNWEuLi-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410202332.mmNWEuLi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410202332.mmNWEuLi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/mtk-fd-v4l2-controls.h:2:1: warning: // comments are not allowed in this language [-Wcomment]
       2 | //
         | ^
   1 warning generated.
   usr/include/linux/mtk-fd-v4l2-controls.h:21: found __[us]{8,16,32,64} type without #include <linux/types.h>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
