Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D345414DFA
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 11:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791201272; cv=none; b=PW9RA5yUgvoO5KBczZmr0mnW6XzZUUf2m9qR/mi+HSsProZWo5wIFuEoOK28qUwBMpyPBtI6WN2Xrt54R1pTZZqNaeBDntXOV26pKnWOsUfYkSD0xvAnitYD+GxHXIls4HRNh7Idpb3lCyCBNegL3cfxtifgxbdnXY6AWuqB6e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791201272; c=relaxed/simple;
	bh=VKQnTHTxYjZjyMonSFqmvNeRLyE+3w7y4Eb17YouQlw=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lA/PkUXUp1EYXlEV7K65SHEaDTK7IjGq3QAYvNrExrSZNuBu3wXvZcqzqRmfRFaFDxJ4fg1UjySVIgtuu0eL5Ioux/zcyvT6mrxcz3+jOTQh4hnHW/b9QyYE8MH176TOHKhvFjjGgtLLqvKd8oPH8Ldre9rEZIkr6i2/KyA8lfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nyB2Hq8H; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nyB2Hq8H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791201270; x=1822737270;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=VKQnTHTxYjZjyMonSFqmvNeRLyE+3w7y4Eb17YouQlw=;
  b=nyB2Hq8HruzuRrBXtRBS6y4XPIoXEieRWkfwuj+LwFScQSaPcl3gbOXa
   lVoHUDM9UFcNc61UDV+/4imLXyV2qTXQHQB2Q+w7SxPjtbe9BOzH54EYe
   8T7uiUpF0VVxfZyN9D8nljbVsy3lkwOLBNJF0s+g+EEtFsxaAStQUlXQ5
   +j5K0hNZih/4JwlzfVvcOaZVPlRueq6F3QF7uDNYqo5SpAK+1Fk7LS7sl
   CImJZpHuKsVoJW9f0QMqgeEMBx8E6bC+jJotfMbUlnzhcnis5oI8+a/mm
   rY2ALYEw+jmHSBcmAHLp0s3FH1506OKD9nkivdpjbWXhpSToh7kOLTxGH
   w==;
X-CSE-ConnectionGUID: QSs43hWoSCqkJZQ/lZnYTg==
X-CSE-MsgGUID: l+7OuIW1S6SsqcCa6gDOMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="94580201"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="94580201"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 04:54:29 -0700
X-CSE-ConnectionGUID: EUCUiK0gQaKL0450LbvG0w==
X-CSE-MsgGUID: 5vIZrO9IQBikmg8Bej1bsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="314812634"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Oct 2026 04:54:29 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDhH0-000000000Fz-308x
	for oe-kbuild-all@lists.linux.dev;
	Mon, 05 Oct 2026 11:54:26 +0000
Date: Mon, 5 Oct 2026 19:54:21 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: sound: airoha: add support for AN7581 PCM driver
Message-ID: <202610051905.F63br3re-lkp@intel.com>
References: <202610051905.F63br3re-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610051905.F63br3re-lkp@intel.com>

Hi Christian,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/sound-airoha-add-support-for-AN7581-PCM-driver/20260930-090715
base:   
patch link:    https://lore.kernel.org/r/202610051905.F63br3re-lkp%40intel.com
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20261005/202610051905.F63br3re-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610051905.F63br3re-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610051905.F63br3re-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/airoha/an7581-pcm.c:617:10: error: 'const struct snd_soc_component_driver' has no member named 'pcm_construct'
     617 |         .pcm_construct = an7581_pcm_new,
         |          ^~~~~~~~~~~~~
>> sound/soc/airoha/an7581-pcm.c:617:26: error: initialization of 'int (*)(struct snd_soc_component *, struct snd_pcm_substream *, struct timespec64 *, struct timespec64 *, struct snd_pcm_audio_tstamp_config *, struct snd_pcm_audio_tstamp_report *)' from incompatible pointer type 'int (*)(struct snd_soc_component *, struct snd_soc_pcm_runtime *)' [-Wincompatible-pointer-types]
     617 |         .pcm_construct = an7581_pcm_new,
         |                          ^~~~~~~~~~~~~~
   sound/soc/airoha/an7581-pcm.c:617:26: note: (near initialization for 'an7581_pcm_platform.get_time_info')
   sound/soc/airoha/an7581-pcm.c:602:12: note: 'an7581_pcm_new' declared here
     602 | static int an7581_pcm_new(struct snd_soc_component *component,
         |            ^~~~~~~~~~~~~~


vim +617 sound/soc/airoha/an7581-pcm.c

   613	
   614	static const struct snd_soc_component_driver an7581_pcm_platform = {
   615		.name = "an7581-pcm-audio",
   616		.pointer = an7581_pcm_pointer,
 > 617		.pcm_construct = an7581_pcm_new,
   618	};
   619	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
