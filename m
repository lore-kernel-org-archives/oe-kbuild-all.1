Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AF5153801
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Feb 2025 05:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738562318; cv=none; b=rzj55dk0mA56dU5ba1GiGW7a3obERnf8ud3LyoK/A3i3vokuw/Z9gjkc+zbnenTTGCpjbmpkDiBjHNVCbQTpevXaklCBqZzBBbvZyLF4Xefd5kq4uBoWZwart4nQ1mUPZ0xIyJJsjhAAzFX1jHWMBos8EBrHiRWzf2D9hOI2FjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738562318; c=relaxed/simple;
	bh=fDnJpE6HR0qFR/V1hnP4wKmRK6yWJOrtdl9SslW9mdI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JMElhdJqzeOhfMlmSGLTT5FB4l0c5JQEU2SE9XEXQadk9kHmQUyarFYUump6sJ8dA5jhdP8YoYgjwKqpM74laKh4fBaY4LWjElX+iWQ+d9XX5HliztX4qfQHtHrkFXEPfmsWyiXq40EXITybfBod9DiDZoMNEOUvT8WQcHMvbsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D15AHADK; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D15AHADK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738562316; x=1770098316;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fDnJpE6HR0qFR/V1hnP4wKmRK6yWJOrtdl9SslW9mdI=;
  b=D15AHADKXu0XRwoU056I55jTmti+9BiiLZC0c17SSr0zcFnTGU9pRq2d
   JxMse6LEm7HTje5AeWYYvXJO9sZb9HcPTmsOlU4yeduJJ6VgpDrVQq/eN
   uGOtBO54PjtRnhVFJXE0qx4ChQi5cMW7pPsH66HAuXUOqC/qoYXFCGQI5
   W7P7XvFyOZ1f3FSnhjigEH+0HTz7u+TgNF1nL4Y4rzgWXIOg3SY+29Pma
   Vw/Tl7rUluYOYEgkUoAMX/kkFFjlOVKH4gW+BO2h6LQZVDuE7XS+QBH5w
   67m1vl/ddC9xkC8rLrlO5W25fPgm4DdLAAuKFDNOZ2/BFS72sJjVJSk3p
   A==;
X-CSE-ConnectionGUID: E1sH/pw4QGGVmhdUuaXe2w==
X-CSE-MsgGUID: ItjY1qr7RaWoznr99tYcUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="38949445"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="38949445"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 21:58:35 -0800
X-CSE-ConnectionGUID: CEr19oQ4Q0+d2XasyHZpbw==
X-CSE-MsgGUID: UeVqB1CSTcSwmFiOzW6bbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147398129"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Feb 2025 21:58:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tepTc-000qWl-0Q;
	Mon, 03 Feb 2025 05:58:32 +0000
Date: Mon, 3 Feb 2025 13:58:06 +0800
From: kernel test robot <lkp@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:v2_20250123_cezary_rojewski_asoc_intel_avs_add_support_for_maliboulake_configuration
 4/11] sound/soc/intel/avs/boards/pcm3168a.c:69:33: warning:
 'avs_pcm3168a_ops' defined but not used
Message-ID: <202502031332.lVgdnyQV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v2_20250123_cezary_rojewski_asoc_intel_avs_add_support_for_maliboulake_configuration
head:   3318c70b5b94baa4e764ab05fa97c74643e7dc35
commit: b0d1438e2006a914d55496f4a5e588ca9d3c0a6f [4/11] ASoC: Intel: avs: Add pcm3168a machine board
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250203/202502031332.lVgdnyQV-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502031332.lVgdnyQV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502031332.lVgdnyQV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/intel/avs/boards/pcm3168a.c:69:33: warning: 'avs_pcm3168a_ops' defined but not used [-Wunused-const-variable=]
      69 | static const struct snd_soc_ops avs_pcm3168a_ops = {
         |                                 ^~~~~~~~~~~~~~~~


vim +/avs_pcm3168a_ops +69 sound/soc/intel/avs/boards/pcm3168a.c

    68	
  > 69	static const struct snd_soc_ops avs_pcm3168a_ops = {
    70		.hw_params = avs_pcm3168a_hw_params,
    71	};
    72	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
