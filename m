Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D556CE541
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Mar 2024 12:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711541009; cv=none; b=YU72wyj8EjOwDclgp6pvKrhNzT1fCjGOHXpqiDtioeMIQmzJKDFwSFsyFlIPRlu4MKZ9vH1eUvM8Ge5IW0RDEIkeluq+bmFIwK3MrUOyP2F9vvEGt5YDWmWatXgyZrVVTHEg/AlnJOom5h8CeXy/mUgS0fj+2YZ5n7pUxGX/QT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711541009; c=relaxed/simple;
	bh=u0Uq0H2KdaS2XZy7T+U8PG9pi+lg51+oc+hAPnAmGb4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q7gX0g0A3j8YrMieHbuknbDNIZcxad2zowmQfomX99kdO58QmEvh92uyot3FzzkyAUTBECFheg/Ccrp9jNmJWcLPbepmC2LawKQZ9FcnTOAWDUA9/fei1O3EUdYr16c10a/s5PCLao/7cBz5yIHqyzZDNs+thxKIc5hKbgykpSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KVwDvEkb; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KVwDvEkb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711541006; x=1743077006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u0Uq0H2KdaS2XZy7T+U8PG9pi+lg51+oc+hAPnAmGb4=;
  b=KVwDvEkbY+PJDcPtghTJrkpBa9OE5KK3dPF4cwuyZxmTesIWd6irWPnB
   o+nfoSmHLR3hIFR/OAuZSo+mIuEzTH37TCtniGl/A1MsURXDJQ4Ke99nA
   U1nwmtk9E+xFJVZKWFoGmwjl7peiNaT285r5Ob3qrZW0DpnwP4FZoBscF
   yvgdmhEZJUrxzo9/gl0MqbGVTFBNmbuz5au28eGJ7/z9WYg5cN8AbwiiG
   1pXyXQVBLPb9pZ9cUuhlT2CctUsR0zR7st828sIQCwlp45JqfgszC1PBo
   njeK1tc06ZG9ALia9qIvTGCMT6E4yMcsnX8TjzqbwcVClG9VUSlaZoLwS
   w==;
X-CSE-ConnectionGUID: zJDCC8UkS4+l1f6SBwdlDw==
X-CSE-MsgGUID: XwcdD0AgRweBEdBnmjuNnw==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6843645"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; 
   d="scan'208";a="6843645"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 05:03:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; 
   d="scan'208";a="47472288"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Mar 2024 05:03:24 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpS01-00011i-30;
	Wed, 27 Mar 2024 12:03:21 +0000
Date: Wed, 27 Mar 2024 20:02:29 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 1915/2169]
 sound/soc/codecs/rk3308_codec.c:956:34: warning: 'rk3308_codec_of_match'
 defined but not used
Message-ID: <202403271907.0z0uuG5I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   26074e1be23143b2388cacb36166766c235feb7c
commit: 4ed0915f5bc4bcc81bca783a5b984f3d81e9764e [1915/2169] ASoC: codecs: Add RK3308 internal audio codec driver
config: x86_64-buildonly-randconfig-001-20240327 (https://download.01.org/0day-ci/archive/20240327/202403271907.0z0uuG5I-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240327/202403271907.0z0uuG5I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403271907.0z0uuG5I-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   ld: sound/soc/intel/boards/sof_board_helpers.o: in function `sof_intel_board_get_ctx':
>> sof_board_helpers.c:(.text+0x149): undefined reference to `sof_ssp_detect_codec_type'
>> ld: sof_board_helpers.c:(.text+0x157): undefined reference to `sof_ssp_detect_amp_type'
--
>> sound/soc/codecs/rk3308_codec.c:956:34: warning: 'rk3308_codec_of_match' defined but not used [-Wunused-const-variable=]
     956 | static const struct of_device_id rk3308_codec_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~


vim +/rk3308_codec_of_match +956 sound/soc/codecs/rk3308_codec.c

   955	
 > 956	static const struct of_device_id rk3308_codec_of_match[] = {
   957		{ .compatible = "rockchip,rk3308-codec", },
   958		{},
   959	};
   960	MODULE_DEVICE_TABLE(of, rk3308_codec_of_match);
   961	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
