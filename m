Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403A44052D9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 23:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790378326; cv=none; b=n5FH1uYUGQ9oKz82G/elWxtORUATp9Eq4MQYju9fisbBdJbxJMqWSvnYksetzSkRgEc0q2Algw0CMlBQnyetBDW6hPLsmtSFn9mIuV6sAQMoCPsoEXELqakuGyJUOMjr431/Zrqr3bSpaxLs98u4KCYjpSDouGxfB9Su8riCEq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790378326; c=relaxed/simple;
	bh=fpheeffsRtHpr6ImDR+WdmaoeugrHPYS/g5n+6ZwHbs=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ghz21+dUoW+g62YiqBIrZ/lEZeNrmK2eSWgGyk/8oaAPebpA0frosfOe7TNo32nJ6Rp59DnUYVW1f5KP3PHZoLjQTXb5mzE5Z90YmBsiv8oKdkUHJwhYawP7Ss+UhItiHVgQIerJgSf+q5FKXpw5wwLQI1D8gB6oCEYI5Vex9VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OGz8phS8; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OGz8phS8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790378325; x=1821914325;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=fpheeffsRtHpr6ImDR+WdmaoeugrHPYS/g5n+6ZwHbs=;
  b=OGz8phS8tsJyIFFNzra1M2s3bUiKMAOerBX7zzFhujfLEb9p3Tu8afmP
   ySYLvGH1JNwL/GYHtmPQIgJlAU0qpcPzYcIvqUYVcEFeOI8PTbvOJepqp
   Sslg2YT/zTMy3cDMup8kV3r0cnTCQNXiAAmZVzH6EABlu5hnTslM/9Zar
   6/BpA6PNezeA9p/nSAl4zZCPbQ+NwiVN679KQ2F9sQOTrcqtqQCnplWok
   CuThPP3UUyzUPQChEzkflLRj7aJp9GJ/ynXptysOuPwMDAMJpAmz/BF+1
   gH0josLio+CAxRTOAbLFi2zR7nUq2tk97j9k1W2bSPvq3Ced0J2hq3D8S
   Q==;
X-CSE-ConnectionGUID: +US8o+P7RzatMUYt1P4DNQ==
X-CSE-MsgGUID: sRrr0DdDRZ+fBdvjckYl3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="91272099"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="91272099"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 16:18:45 -0700
X-CSE-ConnectionGUID: aMA3VV6CTi2SrRbJIwIKbw==
X-CSE-MsgGUID: DIU7Qy7CTwGzqqrPd/XwUA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Sep 2026 16:18:44 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAFBh-00000000LJF-3ecg
	for oe-kbuild-all@lists.linux.dev;
	Fri, 25 Sep 2026 23:18:41 +0000
Date: Sat, 26 Sep 2026 07:17:58 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re:
Message-ID: <202609260711.YnOvPZGc-lkp@intel.com>
References: <202609260711.YnOvPZGc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609260711.YnOvPZGc-lkp@intel.com>

Hi Frank,

kernel test robot noticed the following build warnings:



url:    https://github.com/intel-lab-lkp/linux/commits/Frank-van-de-Pol/ALSA-usb-Add-support-for-Reloop-Jockey-3-DJ-controllers/20260924-221914
base:   
patch link:    https://lore.kernel.org/r/202609260711.YnOvPZGc-lkp%40intel.com
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260926/202609260711.YnOvPZGc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609260711.YnOvPZGc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609260711.YnOvPZGc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/usb/jockey3/ploytec_codec_kunit.c: In function 'ploytec_test_encode_batch_equals_single':
>> sound/usb/jockey3/ploytec_codec_kunit.c:520:1: warning: the frame size of 1440 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     520 | }
         | ^


vim +520 sound/usb/jockey3/ploytec_codec_kunit.c

   493	
   494	static void ploytec_test_encode_batch_equals_single(struct kunit *test)
   495	{
   496		u8 src[PLOYTEC_TEST_MAX_ENCODE_FRAMES * PLOYTEC_PLAYBACK_PCM_FRAME_SIZE];
   497		u8 batched[PLOYTEC_TEST_MAX_ENCODE_FRAMES * PLOYTEC_PLAYBACK_FRAME_SIZE];
   498		u8 single[PLOYTEC_TEST_MAX_ENCODE_FRAMES * PLOYTEC_PLAYBACK_FRAME_SIZE];
   499		struct ploytec_test_rng rng;
   500	
   501		ploytec_rng_init(&rng, 0xD1CE0FF1CE0FF1CEULL);
   502		ploytec_rng_fill(&rng, src, sizeof(src));
   503	
   504		for (int n = 1; n <= PLOYTEC_TEST_MAX_ENCODE_FRAMES; n++) {
   505			memset(batched, 0, sizeof(batched));
   506			memset(single, 0, sizeof(single));
   507	
   508			ploytec_encode_batch(batched, src, n);
   509	
   510			for (int f = 0; f < n; f++)
   511				ploytec_encode_batch(single + f * PLOYTEC_PLAYBACK_FRAME_SIZE,
   512						     src + f * PLOYTEC_PLAYBACK_PCM_FRAME_SIZE,
   513						     1);
   514	
   515			KUNIT_EXPECT_MEMEQ_MSG(test, batched, single,
   516					       n * PLOYTEC_PLAYBACK_FRAME_SIZE,
   517					       "batch of %d differs from %d single-frame calls",
   518					       n, n);
   519		}
 > 520	}
   521	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
