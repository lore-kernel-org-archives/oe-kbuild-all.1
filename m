Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D396259C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Nov 2024 03:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732331520; cv=none; b=e7sg69fsz1qTbsuz/W8qqxiYmO/YPF3hKb1HfB+CIwI8cRtL6hAR+wZyIvGwC1JzOtUfhOyM17SoqsE8bRHUC4O3t+xhpjiWxFMhyRkwarYkUd89rAO/xg9xh7Zvg5CZLsRtEpOfNco62Cu91heKgGd6g5MAgZgQjxXMYvCl/bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732331520; c=relaxed/simple;
	bh=Umrs83/38dqrBfTBd6XLGG6M0MGhYZlxawrI10ZKYTw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R5xH4V4NP7s24VoSG8hZJurJjrWOxfgvC31H7m5tD/QxA7zygTVt5U5sQ0WuNFCZzIu39M0OFgq7CAucWi6C1ejBGnWML1iwRcmUPOqDiScpD9DgyrxS8wrAXd0V1hvbvcAmrEykrgS5Cmc6/xD9FSLY46vU7IJNXcWGsjlK5U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W872AR6U; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W872AR6U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732331519; x=1763867519;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Umrs83/38dqrBfTBd6XLGG6M0MGhYZlxawrI10ZKYTw=;
  b=W872AR6UAkOq3Nu1KyauID5Gm+6hSogcf+1kzXeZVn0JuT6LlVrSQIjE
   9y5OyAdzcxw5sOkX8bsUIGlGPvPbNjchM/NRi1JpD1uUrrt0qPsIR0FUk
   OpAXcDJ9uZOv1kA/XjpRdq6HccurSqtQ90b9l3R0Blt+ibYZD18wO4f0F
   8HNUoK4cpN27+LILeNNwGdgXaaUKbKqJMhAe5cZzpa2nwtvXdnegQgKK0
   GNRDqt36BsDD61+vw+HlxXknQ9GD2B6166p9L3ne9E+5sxsBAJmfOkS2Y
   5RffJd5b2o894vGb7CLsHz/RwRS3jZ8JdzoYpFZjOd0ZDESUL2/TPDyPn
   A==;
X-CSE-ConnectionGUID: qRd/S8p9Q1a+FT9eZ/Layg==
X-CSE-MsgGUID: JJZbN71NRoqjDMbCBjpZqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="32239556"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="32239556"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 19:11:58 -0800
X-CSE-ConnectionGUID: 6JaK+FkSSYalTMKcFJ8Pqg==
X-CSE-MsgGUID: TqXcYIjhRMSbKuUif+c2OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="90923066"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Nov 2024 19:11:56 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEgYs-0004NN-2D;
	Sat, 23 Nov 2024 03:11:54 +0000
Date: Sat, 23 Nov 2024 11:11:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 7/11]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_dmcu.o: warning: objtool:
 dcn10_dmcu_set_psr_enable()+0x357: unreachable instruction
Message-ID: <202411231151.yyn0hUpa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   894861d67a0f883c2fa20a8ce58634c15d0a27dd
commit: fca16257ca2966b34ef1689ef101170bf932e835 [7/11] UPSTREAM: ubsan: remove UBSAN_MISC in favor of individual options
config: x86_64-randconfig-072-20241123 (https://download.01.org/0day-ci/archive/20241123/202411231151.yyn0hUpa-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411231151.yyn0hUpa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411231151.yyn0hUpa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_dmcu.o: warning: objtool: dcn10_dmcu_set_psr_enable()+0x357: unreachable instruction

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
