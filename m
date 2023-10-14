Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2960320F1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 19:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HQVQDu3u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697312800; x=1728848800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FcMw4VhMLf1iCIyioXxV23ssg8y2kJYl0q1+AvhUaoE=;
  b=HQVQDu3uINqMoW0cHHyXtasaYcR7P1wOhhH/+HH4AJfP4WyrTE76aXyj
   JMLVUFWuFzqoiRk6IkB3dASqfwyDUxaz0gWzHcsPh//zeDuGYcuaOaUkC
   grAIhbnbskD/aEf2F91ViRtuDhkO3+EJ4cuv3n2YiJNqjtRq7l0OnBg0K
   cqXKNoMPzCgaT1D81DnP0aMJ63tpsQITmunuIPzrcn54/IWeEEtxCPrA4
   QtLxc9xzUJ8m9NBEabFRtvJKHYG1D1s/PPAb4MJpT0Hip8QrmTfYWb6t1
   LwVcdSvweZvNBX9LzbdQjKHRcc3pE8bOXD74F2OO6AdH09+c3EDfuxWMw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="365608774"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="365608774"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 12:46:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="1002374090"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="1002374090"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Oct 2023 12:46:38 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrkan-0006aH-0p;
	Sat, 14 Oct 2023 19:46:33 +0000
Date: Sun, 15 Oct 2023 03:45:41 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:pr/215 1/1] checkpatch: WARNING: braces {} are not
 necessary for single statement blocks
Message-ID: <202310150324.phbveWh6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux pr/215
head:   5b169658c09fd18c0050693852c07106a91328c5
commit: 5b169658c09fd18c0050693852c07106a91328c5 [1/1] ASoC: macaudio: Add initial j473 fixup_controls
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310150324.phbveWh6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150324.phbveWh6-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BRACES: braces {} are not necessary for single statement blocks
#26: FILE: sound/soc/apple/macaudio.c:859:
+	if (ma->has_speakers) {
+		CHECK(snd_soc_limit_volume, "* Amp Gain Volume", 14); // 20 set by macOS, this is 3 dB below
+	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
