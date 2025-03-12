Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68E623C8CB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Mar 2025 09:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741772970; cv=none; b=C1zlHGeOxMmuBdgaU5UFn3WZkJIm0yaWqLQFkrc5kNQzxY+FLTdp8bVnMuQiyyeWTYH8W6o8M4diltoWZNtwT5ODmUFgKbB4JCgjvy4H6GFKLRDEThdc3uffxyPYT6v/mXByM5/KbDy6PipWVVkSnHGZ2fCbH433KtkmVHm0rXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741772970; c=relaxed/simple;
	bh=M0vXqwDcgSiEPtStCdQDPQCuTrcIXrDE7c26PGEYGKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MzQw3gCc80LyBSjP+MO/tpxvgd4TQQGGCQF4FOoF2ACYcnvcQM8wOlIX9FnyuZu8vAazYgduuCn5Wien3FBTwQZxZrlabdDTUfJTDwtrdWo75urHjUOBDMrkoGEborZntIfs58G7J6F//kSwylu5Y9NZPBrCZBNYIZOvQfxepAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BE/7kd13; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BE/7kd13"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741772969; x=1773308969;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M0vXqwDcgSiEPtStCdQDPQCuTrcIXrDE7c26PGEYGKk=;
  b=BE/7kd13reP7+WDFwZYwTawLE+ZmqLVIjkszZmfFftPbi4yx5azcRN0/
   /ROkzszo3rYi2GeZlmK0vmiRb5KCVXYODHGaeQfGKr+gs2YPkM0dKRjyK
   4gJdmYTfzhcutC6PnzCIVbfq1c9lGSEnqattGJZ+1uw/BALm0TipbdFSp
   eotTyX2KlJ7c6zUplOrXWitVBZ8iQc0Xg+WTZ9/xLriSgdd25Wd/+E/DL
   oF+I/7SFQfN++zVRPEGN+9awCvmCYMq1jjUuBdrIjUCgKY+xt0+N9JBRC
   sQhDtseyEbcjHlPYiawNOvnCD0nX/IqZAfVvqc4C0XxvDhAaSbQ9Ygd21
   w==;
X-CSE-ConnectionGUID: xVHhXxktRPG0nh2jioaRmA==
X-CSE-MsgGUID: SXmX4MWgRTizsRH1vqxTVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42718729"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="42718729"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 02:49:28 -0700
X-CSE-ConnectionGUID: JiErWgbqQAyZ+uZVHFcAIg==
X-CSE-MsgGUID: ZJRnq0EgRXeqMeL6ZvIvVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="120617662"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 12 Mar 2025 02:49:21 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsIiF-0008M4-15;
	Wed, 12 Mar 2025 09:49:19 +0000
Date: Wed, 12 Mar 2025 17:48:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
	eajames@linux.ibm.com, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	dmitry.torokhov@gmail.com, mchehab@kernel.org,
	awalls@md.metrocast.net, hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	louis.peens@corigine.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 10/16] wifi: brcm80211: Replace open-coded parity
 calculation with parity32()
Message-ID: <202503121740.GFiY9SqN-lkp@intel.com>
References: <20250306162541.2633025-11-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306162541.2633025-11-visitorckw@gmail.com>

Hi Kuan-Wei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on akpm-mm/mm-nonmm-unstable wireless-next/main wireless/main mtd/mtd/next mtd/mtd/fixes linus/master v6.14-rc6 next-20250311]
[cannot apply to dtor-input/for-linus]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuan-Wei-Chiu/bitops-Change-parity8-return-type-to-bool/20250307-002940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20250306162541.2633025-11-visitorckw%40gmail.com
patch subject: [PATCH v3 10/16] wifi: brcm80211: Replace open-coded parity calculation with parity32()
config: hexagon-randconfig-r132-20250312 (https://download.01.org/0day-ci/archive/20250312/202503121740.GFiY9SqN-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e15545cad8297ec7555f26e5ae74a9f0511203e7)
reproduce: (https://download.01.org/0day-ci/archive/20250312/202503121740.GFiY9SqN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503121740.GFiY9SqN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c:289:64: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 @@
   drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c:289:64: sparse:     expected unsigned int [usertype] val
   drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c:289:64: sparse:     got restricted __le32

vim +289 drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c

5b435de0d786869 drivers/net/wireless/brcm80211/brcmsmac/dma.c Arend van Spriel 2011-10-05  286  
5b435de0d786869 drivers/net/wireless/brcm80211/brcmsmac/dma.c Arend van Spriel 2011-10-05  287  static bool dma64_dd_parity(struct dma64desc *dd)
5b435de0d786869 drivers/net/wireless/brcm80211/brcmsmac/dma.c Arend van Spriel 2011-10-05  288  {
5b435de0d786869 drivers/net/wireless/brcm80211/brcmsmac/dma.c Arend van Spriel 2011-10-05 @289  	return parity32(dd->addrlow ^ dd->addrhigh ^ dd->ctrl1 ^ dd->ctrl2);
5b435de0d786869 drivers/net/wireless/brcm80211/brcmsmac/dma.c Arend van Spriel 2011-10-05  290  }
5b435de0d786869 drivers/net/wireless/brcm80211/brcmsmac/dma.c Arend van Spriel 2011-10-05  291  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
