Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC073BADB5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 14:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774622204; cv=none; b=WMNQp49cFY8KQfy9vz3UnjMDoppCP71ZqFDyDPxlOyjkPGoKIMnMPrYJH1g2lE8h8c/M/zC5Sx0nifj7nKNrUoodkkIYZ5Egp6b46SnqjZEsZCwjcWBUwPHstRzSfYmcjkT3ikL1v4w/FuZY3f5pRsqZ7VzVW14VNClKipmaWZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774622204; c=relaxed/simple;
	bh=VjphCTqn76dhD85JJmLOxOQLa0/Tzk/xzjVOYQRzk5U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AwyBpiANmtJpNxFC3qvyXJnEE17wPvL+NMqPoO1f5xp0/iFR1j/K8X8zwN0J6ekGCPE9t1sbgaMIllAGgvzBcfaXEZOp0aRUa5InZN6wqdk95WKA0TIII7n7Yga4z6sdMUhehXy5YGDZR3jxKqv8g+ZMnctd3pDCu7ZQKBraY28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XMN3rZYQ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XMN3rZYQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774622202; x=1806158202;
  h=date:from:to:cc:subject:message-id;
  bh=VjphCTqn76dhD85JJmLOxOQLa0/Tzk/xzjVOYQRzk5U=;
  b=XMN3rZYQwcu7JdUJ5CqmfjmoIQKAB1iLG/WrFzX0LuY+HmK76P05lFtv
   /+J9S+3nslhtruiffXQm5xaCHRgrGJ4jouV20mp+LEjTsDcyK6gAhSVZ+
   Fqakxc5sEvqXOnIBqVhC5R6//dCyiolKZISOfXUxSjVrg0DTrsnj74B9N
   uLgDCntqPXf8jlYBlvSXJmvuR2hWplyTLRRDG1VTbydt6iVkZMxyoKwd+
   SdIS39hX9KaGY8K9YuEPUWuvuDYsoR1sChi7O8oRejsncbfkNGJcaYufB
   tgblr4GVZuM5ZCu0xw2VSFb4jgbXH4nTX7dh81tNBWBUPRIik4a9eCEXZ
   g==;
X-CSE-ConnectionGUID: zMKIR0L5QOSIiQM6odxrPQ==
X-CSE-MsgGUID: RA8VdU/MT+O0D8VrKWeJjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="101155323"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="101155323"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 07:36:42 -0700
X-CSE-ConnectionGUID: 2Vfrf9KnR6qTaFqa2tgR3w==
X-CSE-MsgGUID: F0VEAWt2S5iOFbbNguGaXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="230258218"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Mar 2026 07:36:41 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w68Ig-00000000AMj-1qLd;
	Fri, 27 Mar 2026 14:36:38 +0000
Date: Fri, 27 Mar 2026 22:36:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 218/218]
 sound/soc/codecs/cs42l51-i2c.c:22:27: sparse: sparse: symbol
 'cs42l51_of_match' was not declared. Should it be static?
Message-ID: <202603272248.XbmuYHbY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   11d64ee60c8304d3468e4ced34971775c95e3429
commit: 7a413fa0472610c9eccff7c4d89a6918dab8949b [218/218] ASoC: cs42l51: fix driver to properly autoload with automatic module loading
config: arm-randconfig-r121-20260325 (https://download.01.org/0day-ci/archive/20260327/202603272248.XbmuYHbY-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603272248.XbmuYHbY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603272248.XbmuYHbY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/codecs/cs42l51-i2c.c:22:27: sparse: sparse: symbol 'cs42l51_of_match' was not declared. Should it be static?

vim +/cs42l51_of_match +22 sound/soc/codecs/cs42l51-i2c.c

    21	
  > 22	const struct of_device_id cs42l51_of_match[] = {
    23		{ .compatible = "cirrus,cs42l51", },
    24		{ }
    25	};
    26	MODULE_DEVICE_TABLE(of, cs42l51_of_match);
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
