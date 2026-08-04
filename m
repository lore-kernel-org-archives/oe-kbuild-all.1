Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE4B33D6EE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Aug 2026 22:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785881261; cv=none; b=RTe6cGRQMmYjWK1COpfTrmwsc+NMR5ucvdbN/Mek7FHVEVU24YIMuDCL9tvozDBVcrtBvWeQv5hGB8gAIrNzf+cqrInrmiTFgCW2s7hz4FMf2MsRdW7VyKeI0OmXLaJsKX/lnnw22I6wGWdArnwM6YF6BwUqgb7KKYO+ACvwxrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785881261; c=relaxed/simple;
	bh=MG+zh9T9WbtzrAldYsQ54pjmUfNegwsk4N0IfJb81GI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=na+GXorQnJuwd1RqlGkns26v/6xRx07ZtrGRZ4SRIJLBwiYJivEEXbQq7YYYKwDkdtSrpW4wweVvx3eQx2eBos6HbfgTJvZxCGKK+yJ7nuTgGEHT72mK0So/YLpRYybDwTPemvOIuVhWPyaAyeC2G0p81itPOto9pwcIfJAkFto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ma+jq3mW; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ma+jq3mW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785881260; x=1817417260;
  h=date:from:to:cc:subject:message-id;
  bh=MG+zh9T9WbtzrAldYsQ54pjmUfNegwsk4N0IfJb81GI=;
  b=ma+jq3mW16+RDgyw7S7OiK4P4l+cVorZ4QHGSFYIZz7LJFw8p0b3x6Jp
   Z1sFBxxoP6bplJfV3kuyyYlzF8YKbQ/wZXFcz+HZ1kyd0A1VlsTkKd2IY
   EdTZRbF0T+zjsOiFn0UtEGAP1Wyz+Q9ANlqB1AG9g/4KF4rD9wV0LphA6
   hNJYwGQ+z0hbuXWXPoyfKjMvaC6IALLieVdNJOL0RtJpKuVnnPhhN/3hK
   4nSQYpTjE0u7xb3Jge7sWDH6sPXh/qMNMbiDsP5dAsMvtFmarXlOb8hcF
   YouY3Cp6AHrR9jQQQie4p1wcxxnaWLteB/zFZ0b2yCgUmbM9wsmbOIyLS
   Q==;
X-CSE-ConnectionGUID: x3uWZU44SyKNcgw5JNrh0Q==
X-CSE-MsgGUID: DCTpKDqwSJamSke/zzgrEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86215009"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="86215009"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 15:07:39 -0700
X-CSE-ConnectionGUID: r1JFs33uRgChQPYxWni5ow==
X-CSE-MsgGUID: Sss6MDZWQneTL8iUIR3osw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="262206624"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Aug 2026 15:07:38 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrNIN-00000000ArF-2PXC;
	Tue, 04 Aug 2026 22:07:35 +0000
Date: Wed, 05 Aug 2026 06:07:31 +0800
From: kernel test robot <lkp@intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:asoc-7.3 14/15] Warning:
 sound/soc/codecs/tas2781-i2c.c:1018 expecting prototype for
 tasdevice_get_capture_profile_id(). Prototype was for
 tasdevice_set_capture_profile_id() instead
Message-ID: <202608050620.ikOtmY9K-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git asoc-7.3
head:   99ddfbba9e71617494c14b95ed85b9d25bc3202c
commit: 431c15610d017a470e488284c3b8f977f35e3309 [14/15] ASoC: tas2781: add capture_profile_id field and update the tuning_switch function
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260805/202608050620.ikOtmY9K-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608050620.ikOtmY9K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608050620.ikOtmY9K-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: sound/soc/codecs/tas2781-i2c.c:1018 expecting prototype for tasdevice_get_capture_profile_id(). Prototype was for tasdevice_set_capture_profile_id() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
