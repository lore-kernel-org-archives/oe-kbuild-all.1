Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC45222AE45
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 02:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766112166; cv=none; b=sPD+ZeT3nFZMAfmM4c4yDMl4XJd2QMamjBMK3IzM9/XdsRSaRcElu2g9wwKP0EiajSuhxNKAKHdlnDLKJ75nIw2zjOR5q26ZXvDavaegc7F23MesIMOtZQIknowCodssnuUCx1PAnBk2uLerHgNBNw2cw30JdecH7ATrU3gEIGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766112166; c=relaxed/simple;
	bh=d+ltFLQ0WO40jm0Np+u54CPIdZheXhCQodq237UeVkk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=svv6cHVoEBP3dUFSZIIESf9djg9cutNGCr3ZfESQrWHTChwMESa/BA8f0vHEyybmCy2FPwwo6sGIl5NcjqHc9G/I4Arn+rt4J8acS0YMYElgggfvYT8ID+v9VTMOrDV5dXaZY9COfrmYBBm3Gw5lIe5/VSihVtrhFl1YWazPvgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DMxZIP9b; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DMxZIP9b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766112165; x=1797648165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d+ltFLQ0WO40jm0Np+u54CPIdZheXhCQodq237UeVkk=;
  b=DMxZIP9bEs5wmfUwAyWP4WnuQr8OLRooQPx3D5hAROpnNgzCk3TEWsuI
   ZSaXCcG0wK7g9mT2SMJwdh4oilx/c0m9x5uJlwuOXwUGUxPIQPYqMRzQV
   wiQbXfXaJsBYYq7GZAeVcjbJDRB8ecf8pTzUunbVXwyZiQt0BlOM3Wjci
   zy4+R8Q6Ch/MS4cbvQs1gxeF43gDE3ekSvQW7kT6PQESh7A9wncxa4RCy
   0UaozwbsX8qW6qI2SGWm8ds0xP1GikBDvQvqYVS9CLL2jj+gCjNstfvaC
   OgPHOxc9VUv03Ye7rjPBq5b2YeKtvPh0iJkkKA0ihm1sTZY5o1bL9/d/y
   g==;
X-CSE-ConnectionGUID: 3ZsNhreKRaeYJ/LAAG3avw==
X-CSE-MsgGUID: eXG0w6V/QPGeFZV6V2TZdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79443413"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="79443413"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 18:42:44 -0800
X-CSE-ConnectionGUID: rwBLanpMTg+x+Ku21RGZSQ==
X-CSE-MsgGUID: 2UrL1gRnSc6j1sQq5IT07w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="236169848"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Dec 2025 18:42:42 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWQS0-000000002uH-1x8E;
	Fri, 19 Dec 2025 02:42:40 +0000
Date: Fri, 19 Dec 2025 10:41:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 43/43]
 arch/arm64/kvm/hyp_trace.c:245:6: warning: no previous prototype for
 'hyp_poke_tracing'
Message-ID: <202512191044.Ya6bc1d7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d13a7e3b3e0f1ca9e8faea93fbebfed911c2588d
commit: a262be0c417b3b3b6c6390f34b468049fab254e1 [43/43] ANDROID: KVM: arm64: Flush hyp trace pipe when tracing stops
config: arm64-randconfig-r123-20251217 (https://download.01.org/0day-ci/archive/20251219/202512191044.Ya6bc1d7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512191044.Ya6bc1d7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512191044.Ya6bc1d7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp_trace.c:245:6: warning: no previous prototype for 'hyp_poke_tracing' [-Wmissing-prototypes]
     245 | void hyp_poke_tracing(int cpu, const struct cpumask *cpus)
         |      ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp_trace.c:713:5: warning: no previous prototype for 'hyp_trace_release' [-Wmissing-prototypes]
     713 | int hyp_trace_release(struct inode *inode, struct file *file)
         |     ^~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
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

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kvm/hyp_trace.c:102:27: sparse: sparse: symbol 'hyp_cb' was not declared. Should it be static?
>> arch/arm64/kvm/hyp_trace.c:245:6: sparse: sparse: symbol 'hyp_poke_tracing' was not declared. Should it be static?
   arch/arm64/kvm/hyp_trace.c:713:5: sparse: sparse: symbol 'hyp_trace_release' was not declared. Should it be static?

vim +/hyp_poke_tracing +245 arch/arm64/kvm/hyp_trace.c

   244	
 > 245	void hyp_poke_tracing(int cpu, const struct cpumask *cpus)
   246	{
   247		if (cpu == RING_BUFFER_ALL_CPUS) {
   248			for_each_cpu(cpu, cpus)
   249				WARN_ON_ONCE(ring_buffer_poke(hyp_trace_buffer, cpu));
   250		} else {
   251			WARN_ON_ONCE(ring_buffer_poke(hyp_trace_buffer, cpu));
   252		}
   253	}
   254	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
