Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21B51095A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Feb 2024 12:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708862844; cv=none; b=GVyVSO+M/wAoKhXeNblQewcSmWw4KNYxPkVhF5pocDXV/aoaid5krvs0ntuyBvYrBHM3x5SHeRYfjGxOUUdcXP/5ubJIY+9rCINbedgqH1VdGWvlkMyYI288wAPGKHYmpPqQ8KSqSYAh7z0T5TAY2LWpv+pTLDCkLZQBdIXoNE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708862844; c=relaxed/simple;
	bh=PZAZn6+tmKA+l40YfSMKRni0fRt63kH4rektTLJ1qVM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jsL+YmOsW2giPSqCKkocc6mAZkNMUjD/58WfMotwsXQGwXNWYB5OZXjGbdbKNOXX8Y4Vj1DLbYXF8ZttI5QHNxug4v94lLY4ybr/5wZMTSfQQ0FWmdli1EVWFxGonWjOCv6SflB0a/dB0zqMl0osFQ/907r8sNdP5OAWNh1YFqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IP5cb14o; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IP5cb14o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708862842; x=1740398842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PZAZn6+tmKA+l40YfSMKRni0fRt63kH4rektTLJ1qVM=;
  b=IP5cb14otEtRs9BZaRpjJMeg8RiODevkZ7SldCKA/cS0TSPNEXtsmiPU
   NTB4v+ZWHcX0oQ/cDOgFQhXUudVzHmrfM0fqeDl4YPGlm4bPBjuqYRktP
   fDGLSiXvYZhJvbrFA14b4Qk7ICZ1gMzmjODhdJctJdbfiegFhMhtJEecL
   ZUezB5Z4OP7H3fSaI9kAT7snVZct+vpRmDzWBUHygxzqMrz2Yrjtx+RIk
   R6XdiOPTu56Z4hZq36GwzUEdKhDSHpcmIWeJlN4wpuNndeEnawBerQR1Z
   eavs1/xRo+hE3ltFyEUmdP8lFSmerZ2ndUs2+dbbMzQeN/QRvWjk2ZI2C
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="3030810"
X-IronPort-AV: E=Sophos;i="6.06,183,1705392000"; 
   d="scan'208";a="3030810"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2024 04:07:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,183,1705392000"; 
   d="scan'208";a="11076824"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 25 Feb 2024 04:07:18 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reDHo-0009Vi-1K;
	Sun, 25 Feb 2024 12:07:16 +0000
Date: Sun, 25 Feb 2024 20:06:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jai Luthra <j-luthra@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 1/6]
 sound/soc/soc-generic-dmaengine-pcm.c:321:5: warning: no previous prototype
 for 'dmaengine_pcm_prepare'
Message-ID: <202402252049.lA7SFnhN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   06aa44273378b04ac8e0185d373052806da1dfb7
commit: 7ff6902b6e5082643c2d5dd34d34fc5a8e53d7d8 [1/6] HACK: ALSA: dmaengine: Synchronize dma channel in prepare()
config: i386-buildonly-randconfig-006-20240225 (https://download.01.org/0day-ci/archive/20240225/202402252049.lA7SFnhN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240225/202402252049.lA7SFnhN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402252049.lA7SFnhN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/soc-generic-dmaengine-pcm.c:321:5: warning: no previous prototype for 'dmaengine_pcm_prepare' [-Wmissing-prototypes]
     321 | int dmaengine_pcm_prepare(struct snd_soc_component *component,
         |     ^~~~~~~~~~~~~~~~~~~~~


vim +/dmaengine_pcm_prepare +321 sound/soc/soc-generic-dmaengine-pcm.c

   320	
 > 321	int dmaengine_pcm_prepare(struct snd_soc_component *component,
   322				  struct snd_pcm_substream *substream)
   323	{
   324		return snd_dmaengine_pcm_prepare(substream);
   325	}
   326	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
