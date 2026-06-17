Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3010F347FFE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jun 2026 05:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781672959; cv=none; b=ew7nAeFptLU2UwbMbSUWgjaUlm+VOe1KRIZpFaLucxma2XdHOXOpoz1viX1XZvcETV+sdB2BNH2QFkN8vxyCpFCrrr9a+H3VOxHtgEI/Rmqi+SvbZER4Xq2cSNxlCIys1uyXIesq+h2ytihcB7bcDPAxgOqwrBXybi+RWQV21Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781672959; c=relaxed/simple;
	bh=XIg+Wf3boNiiuihBqr011CgO4/z3ER7SeiG6GY+kQCc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aDboEGxCcicV2vIDSPQjHKvyssZP82RJniNwf9MJDcXDD4QfOxLeTULNS0tvdd9WXrRG07gVdr3KAL2NWh7dXjy9xVIBOcjAmK9U4D6zCFNgcmgcmhY/+OQHpqLJOehSvdN6xYbxndBRl/m4HWCYFHyYj3nRyMXXRiqHK3mcbZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B7nrIjyP; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B7nrIjyP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781672956; x=1813208956;
  h=date:from:to:cc:subject:message-id;
  bh=XIg+Wf3boNiiuihBqr011CgO4/z3ER7SeiG6GY+kQCc=;
  b=B7nrIjyP/WgKg+UokkQy8sur5Xs7eJOfqKmQdTOA9X/owj263DeAavHu
   FAh2rs5hXPtCZKXcs7WVORzSZ8Juc9Lz3NnfT+VVUVWIbz+nVy8JRXnWA
   R9Fyr56RmXLWKRnDUENO1qRnXOocQ7lAwGi+Mtzjo22Bml25kxrSrppCi
   2u+S06IrmCHTFPs2C1od1y0J3J2EPKYbb3WmvxUp+6NfkMpM0izIwfDDi
   oQaCzOJlOUCI1NefRMfUzlc/kIB+x67jjmsXmWtjp7MNz4xJnGDk4QN9S
   ZnPfAlRcghQ1+BYJTN6NvBC7kNOpU+XPtYxEshQG+OwlOMBC+CFBVSmQP
   g==;
X-CSE-ConnectionGUID: tcwC9JNFSnaTUHvGBgDyVQ==
X-CSE-MsgGUID: blRMjXMLQauCxC6COwxq4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="107923753"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="107923753"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 22:09:15 -0700
X-CSE-ConnectionGUID: R05fylmvSVGZkGAT+sgBwg==
X-CSE-MsgGUID: 6HUTMC0ORoaZMij1Iil3+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="243810568"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Jun 2026 22:09:14 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZiWV-00000000U8u-0c3G;
	Wed, 17 Jun 2026 05:09:11 +0000
Date: Wed, 17 Jun 2026 13:08:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-16 326/326]
 drivers/gpu/drm/vc4/vc4_hdmi.c:2232:10: error: 'const struct
 snd_soc_component_driver' has no member named 'name'
Message-ID: <202606171216.sdnJjcvt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-16
head:   5ce50ac7d0a59c6fb15e1baa7e6824ac096fe092
commit: 05b5b2a6efd5a6e54abc6f45325da66dd0680510 [326/326] ASoC: soc-component: remove compatible definition
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20260617/202606171216.sdnJjcvt-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260617/202606171216.sdnJjcvt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606171216.sdnJjcvt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/vc4/vc4_hdmi.c:2232:10: error: 'const struct snd_soc_component_driver' has no member named 'name'
    2232 |         .name = "vc4-hdmi-cpu-dai-component",
         |          ^~~~


vim +2232 drivers/gpu/drm/vc4/vc4_hdmi.c

bb7d78568814a3 Eric Anholt    2017-02-27  2230  
bb7d78568814a3 Eric Anholt    2017-02-27  2231  static const struct snd_soc_component_driver vc4_hdmi_audio_cpu_dai_comp = {
bb7d78568814a3 Eric Anholt    2017-02-27 @2232  	.name = "vc4-hdmi-cpu-dai-component",
db827cb34ca38f Charles Keepax 2022-06-23  2233  	.legacy_dai_naming = 1,
bb7d78568814a3 Eric Anholt    2017-02-27  2234  };
bb7d78568814a3 Eric Anholt    2017-02-27  2235  

:::::: The code at line 2232 was first introduced by commit
:::::: bb7d78568814a31a11fa14f1479a9fe51f1582ad drm/vc4: Add HDMI audio support

:::::: TO: Eric Anholt <eric@anholt.net>
:::::: CC: Eric Anholt <eric@anholt.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
