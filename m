Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B364CDDC3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 11:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790768858; cv=none; b=fK6RzfZqTHZ7eypxV7+vogQ7qF8/5siaX6OK5F+uCntdkVhBaUmnj/kVQQpdtXA4VcyXixkOugo/8AwpvoA/nqYSFzs1jrF06XHvlSoIWbSx5hASDmZUMfkAHXX/6J4LMYU3Y/1HBTqGFgBaxxEeK0ds11vNxBNLf0KmII9U7xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790768858; c=relaxed/simple;
	bh=nI4oIEEf6gQG03uvJ2Cm7TeW2DWYwn7rUI7x+smR9EE=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s9vjlTpKftPLznHf+c1BjodB4/oIqypCQDQ2jEuu8wxrtEvS7x6v+h2qD+zWbmrQyOW8omVGbKc5lhG0tlh7qzuKEQrK+XtAeFkzLSVWabq73whL65IfdP+tdCCMNHrIPj7GLooMq0KEuYM3CjILXlXfxkrcepr/CNKOLSmG4WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GVEYoAYI; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GVEYoAYI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790768856; x=1822304856;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=nI4oIEEf6gQG03uvJ2Cm7TeW2DWYwn7rUI7x+smR9EE=;
  b=GVEYoAYICIulbjky1VTdjpTiGQk/C+Q6rsvLAfaZ/BJLk4k/2KQo9JUD
   l5oyZuTvNurU+H+c5jI1CGL8qCLQ1MH2dw0aYWUavJwFB20sVKl16V4xP
   31NxC8bITlRBEteU/+MeYEhOAcOUATorDqGKsWnJJus9T0a2uvL7TFp9S
   7V/CNwTif5L8s7gk6EA6UxMlwtMNo3ppOv3Goa/lRTdcF/IVkAohjiAiB
   DTGD08TKa4BAF243MI2T02dJAKqNT2Gzstl9xU1eyhpUFgXayOp7BnoPa
   kmTBSkMnANH8kmmQPysVzsp2H1/GMlNZfSFX7v3dyEWkxkxsYYPDyz+RU
   A==;
X-CSE-ConnectionGUID: NxyyT9B3RZ+vtJg12nHKrw==
X-CSE-MsgGUID: drwaxFoQRkyndqicyFkLKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90719570"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90719570"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 04:47:36 -0700
X-CSE-ConnectionGUID: uTrU7kPVQ0K7lHZ7djO1nQ==
X-CSE-MsgGUID: EIg6RBknQ7ydCuXDrPTB6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="275713284"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Sep 2026 04:47:35 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBsmb-00000000Qai-0tKR
	for oe-kbuild-all@lists.linux.dev;
	Wed, 30 Sep 2026 11:47:33 +0000
Date: Wed, 30 Sep 2026 19:47:21 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: badblocks: actually round to block boundaries in set/clear/check
Message-ID: <202609301934.K2b8Cj8x-lkp@intel.com>
References: <202609301934.K2b8Cj8x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609301934.K2b8Cj8x-lkp@intel.com>

Hi Li,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/lirongqing/badblocks-actually-round-to-block-boundaries-in-set-clear-check/20260930-114941
base:   
patch link:    https://lore.kernel.org/r/202609301934.K2b8Cj8x-lkp%40intel.com
config: sparc-allnoconfig (https://download.01.org/0day-ci/archive/20260930/202609301934.K2b8Cj8x-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301934.K2b8Cj8x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609301934.K2b8Cj8x-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc-linux-ld: block/badblocks.o: in function `badblocks_check':
   badblocks.c:(.text+0x120c): undefined reference to `__umoddi3'
>> sparc-linux-ld: badblocks.c:(.text+0x1248): undefined reference to `__umoddi3'
   sparc-linux-ld: block/badblocks.o: in function `_badblocks_set':
   badblocks.c:(.text+0x1360): undefined reference to `__umoddi3'
   sparc-linux-ld: badblocks.c:(.text+0x139c): undefined reference to `__umoddi3'
   sparc-linux-ld: block/badblocks.o: in function `_badblocks_clear':
   badblocks.c:(.text+0x1cf8): undefined reference to `__umoddi3'
   sparc-linux-ld: block/badblocks.o:badblocks.c:(.text+0x1d14): more undefined references to `__umoddi3' follow

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
