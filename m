Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E381E0DF4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Oct 2024 16:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728405970; cv=none; b=ezDfcQaogRrFXTRGkGOznARzL0lBhKulK3cRaD2oqdnSoxVe9yyN7MmAYMLGMaJ7EVGQpOD4R851vg1O4Pe7WPlhB/C2QmxS5oMSJeq5mGJCicMVE9xI25YPEfgpIGq81Cv1UNjvYj40mQLinXceUwIJCfTOE80cZ87zYorTaRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728405970; c=relaxed/simple;
	bh=KJsytW8IC3lAb9gbCQ8wFdWVFMVNG1XQqPD9bDtg/cs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UU86Om2+xa17isAUYLzYcMkzx0gepnmv1tzhXPtcFetF/PD6/cfkqpM2tCG9T3HiI3ECDp8wM/Ekm6H85Ne9cxmGBsRCWz40RIQPItok+lr9bzNKNvfd1vU4MVsxmZ4Sj/w36rwyxEb9wCKEYwve5e/3WQ//n7/gF1aSF1ifBg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XhA+EX2i; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XhA+EX2i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728405968; x=1759941968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KJsytW8IC3lAb9gbCQ8wFdWVFMVNG1XQqPD9bDtg/cs=;
  b=XhA+EX2iPJqsf0lIyHIZgt35h8WIQluHoA7DtlDasqosf+tGOR6GQhvm
   blnX+xMy7jjmfeeWLbjAb/51WDES74Lc6qiwEcWcXe8PpmD6JUKdEM+ZL
   cMxHhj+Ku53HtUP6U8Y7oygyJ7yE/KVB3WHlUaBkx4EpD4J0hE/mVQPUE
   buSHuM3aY9yeEtzbnwnNLxg1SvjBuzxJOc9XzULrAP7k8VVR98M9x167R
   sUa+r2yv6jIQwkuj5X16+rOxPTbodtrzDPIsJSYda4YDJA91bDPzKyeOp
   myQf5zyrWix1cDx81kFWcT/azVQ2rTBr7u6H0q6CKYp3e2riR6aTkvqGn
   g==;
X-CSE-ConnectionGUID: 9An9VpSeQfSbA8tobkEgag==
X-CSE-MsgGUID: 6R1+XbYUQAC3RqKAtljtJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27571239"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="27571239"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 09:45:57 -0700
X-CSE-ConnectionGUID: dwtKwiqfQ4azdcsAPcJdcg==
X-CSE-MsgGUID: +BxMZbF0TxGYluN9+xSxCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="99233235"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Oct 2024 09:45:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syDLN-00088e-1L;
	Tue, 08 Oct 2024 16:45:53 +0000
Date: Wed, 9 Oct 2024 00:45:23 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/070-audio 15/128]
 sound/soc/codecs/cs42l84.c:1019:34: warning: 'cs42l84_of_match' defined but
 not used
Message-ID: <202410090014.Nh8ADsAq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   efb959d4a6cd9f5627d9994e244e22f750c6f0fc
commit: 9ee029babce6b9f263a0cf514395750176e4ff48 [15/128] wip: ASoC: cs42l84: Start new codec driver
config: parisc-randconfig-001-20241008 (https://download.01.org/0day-ci/archive/20241009/202410090014.Nh8ADsAq-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410090014.Nh8ADsAq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410090014.Nh8ADsAq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/cs42l84.c:1019:34: warning: 'cs42l84_of_match' defined but not used [-Wunused-const-variable=]
    1019 | static const struct of_device_id cs42l84_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~


vim +/cs42l84_of_match +1019 sound/soc/codecs/cs42l84.c

  1018	
> 1019	static const struct of_device_id cs42l84_of_match[] = {
  1020		{ .compatible = "cirrus,cs42l84", },
  1021		{}
  1022	};
  1023	MODULE_DEVICE_TABLE(of, cs42l84_of_match);
  1024	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
