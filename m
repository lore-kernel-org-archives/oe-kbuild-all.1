Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FF23F076F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Apr 2026 17:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776188285; cv=none; b=ChT2WqJ3uuRDrtgRpJ5kc8T+1gixwVf3dDU+S9Yyk9hhcNDnoW+A65D4GvPfSAUghjCr53+RRePjHwCzcZ+8PQTjcmKeIQzzyGKVu9VRwclRbUjdZesA5DSD+IHNo0vnMZH5WHkWGkFh3IcJOPMeisZs1Uv1J/xEjuTmSgzcg1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776188285; c=relaxed/simple;
	bh=wb9c8WhFzjUbwuAlfieqgOYtPFQr3mEVe3XgV5dp7/c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lrER1E6jygqQ0VNm6SPnAKFaUi1dsuwR763akWvTG0nspTavs5QiWaQ7p9dJAp2OA2pDjA/QvoUxXn1FhKaGTL7nO3jEOlaDmWlE2lqA+sF1Z7DeiIxjc78ITnOylWrufKjT8JWuSUwdVvGUTeLfMUtVowO9KnMKmMVqPbNGgdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gN7ie5Fc; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gN7ie5Fc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776188284; x=1807724284;
  h=date:from:to:cc:subject:message-id;
  bh=wb9c8WhFzjUbwuAlfieqgOYtPFQr3mEVe3XgV5dp7/c=;
  b=gN7ie5Fcrhbn2AJJzy7XkzcE6rUmvQ9E3WhEpsBK6EQ+Uu/AIszhdjxz
   0ka2S9Ds1TvqFIzdLcGd4j8YrblOe5azcZUUmTiDxr6TJLs0mPNZOPNHU
   Z727gZmfSBOWo3IcKWF/yBJHtpf/RPL/+5IMboQV9ke9VdVG21YVW5CkR
   myAVExzThyYWyG6Wi8NANsR1aiK9IoyaZq5bTKd0H6qHNCit9tU3+OPTk
   39Lpf8xJ1wg5MDrM7xyLqX/VitmpSASob0FMmQzQuxqX609NvzT6tYWAL
   VKeN+lmnfxYV4yuT3ZTTdixEpgWMwmQ5LyHgXW0chJUiVgknJ6ap27dHO
   A==;
X-CSE-ConnectionGUID: yU8oeiLnSQC4XGdpkCTXHA==
X-CSE-MsgGUID: HPPlEOvMRRSRJE50jeR08g==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="94723796"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="94723796"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 10:38:03 -0700
X-CSE-ConnectionGUID: tkyNv73kR+iEaGIf1K3Wag==
X-CSE-MsgGUID: U/bdG9jQQcmZeqKQ3iYCqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="230085967"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Apr 2026 10:38:01 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wChi3-000000001iv-174s;
	Tue, 14 Apr 2026 17:37:59 +0000
Date: Wed, 15 Apr 2026 01:37:23 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <threeway@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-7.0.y 189/192]
 sound/soc/codecs/lpass-va-macro.c:1723:23: error: called object type 'void *'
 is not a function or function pointer
Message-ID: <202604150142.L1Bg4R17-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/steev/linux lenovo-x13s-linux-7.0.y
head:   577f25eff3014cf94dcfb85d3230d31ca505d3a4
commit: 15b78619984e7ae96c8336b24cd6fa4e30974abb [189/192] ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime PM
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260415/202604150142.L1Bg4R17-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604150142.L1Bg4R17-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604150142.L1Bg4R17-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/codecs/lpass-va-macro.c:1723:23: error: called object type 'void *' is not a function or function pointer
    1723 |         return pm_clk_suspend(dev);
         |                ~~~~~~~~~~~~~~^
   sound/soc/codecs/lpass-va-macro.c:1731:21: error: called object type 'void *' is not a function or function pointer
    1731 |         ret = pm_clk_resume(dev);
         |               ~~~~~~~~~~~~~^
   2 errors generated.


vim +1723 sound/soc/codecs/lpass-va-macro.c

  1715	
  1716	static int va_macro_runtime_suspend(struct device *dev)
  1717	{
  1718		struct va_macro *va = dev_get_drvdata(dev);
  1719	
  1720		regcache_cache_only(va->regmap, true);
  1721		regcache_mark_dirty(va->regmap);
  1722	
> 1723		return pm_clk_suspend(dev);
  1724	}
  1725	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
