Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8282E1864E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Nov 2023 21:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wkk9baFI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700429687; x=1731965687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UYAqsVQqIUrsC0Pgf7L+WjyPn/FPKHgUEeylHWt/p6w=;
  b=Wkk9baFIM1Rq/Tm8A8D9gRfV/UO+rhwBV9Uv+EAvStCLr6WQvjAMRbwR
   bWGXebSfwBvREhrx2W8NUXrm5ByjsfWpUcuNN4IzeKEc/LbvYdgONsohG
   cL8Ndc7i4TNngxSzOWBDLndabHgoXig14vori1jtmOur0DZUI/qPlklJF
   6S7a/ZbpoYwUgHkp2W7gXmH8XGzmc7laVIVSKR5jYdXBuRKNnPlu+uMMN
   0CunlKgT/O6MAsrdleaRLIkObsiq3p4xdQPlIn+g9r6Gwd97+Yonpww8L
   MMyq/GefFnDdvbd/VMBkbq9luM9Hu3Mg19PJbfGzxPxBiDmECGi455m8v
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="371702056"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="371702056"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 13:34:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="909920496"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="909920496"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 19 Nov 2023 13:34:45 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4pRD-0005Zd-22;
	Sun, 19 Nov 2023 21:34:43 +0000
Date: Mon, 20 Nov 2023 05:34:18 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/070-audio 5/105] sound/soc/soc-ops.c:659:1:
 warning: the frame size of 1232 bytes is larger than 1024 bytes
Message-ID: <202311200559.rF3uMwSF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Martin,

FYI, the error/warning still remains.

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   1c71b1fa2c491cc29c94d29f1a450dba39f27557
commit: ecb9493792851a5f22d39b544e305565a9cc6762 [5/105] ASoC: ops: Enforce platform maximum on initial value
config: mips-loongson2k_defconfig (https://download.01.org/0day-ci/archive/20231120/202311200559.rF3uMwSF-lkp@intel.com/config)
compiler: mips64el-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311200559.rF3uMwSF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311200559.rF3uMwSF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/soc-ops.c: In function 'soc_clip_to_platform_max':
>> sound/soc/soc-ops.c:659:1: warning: the frame size of 1232 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     659 | }
         | ^


vim +659 sound/soc/soc-ops.c

   633	
   634	static int soc_clip_to_platform_max(struct snd_kcontrol *kctl)
   635	{
   636		struct soc_mixer_control *mc = (struct soc_mixer_control *)kctl->private_value;
   637		struct snd_ctl_elem_value uctl;
   638		int ret;
   639	
   640		if (!mc->platform_max)
   641			return 0;
   642	
   643		ret = kctl->get(kctl, &uctl);
   644		if (ret < 0)
   645			return ret;
   646	
   647		if (uctl.value.integer.value[0] > mc->platform_max)
   648			uctl.value.integer.value[0] = mc->platform_max;
   649	
   650		if (snd_soc_volsw_is_stereo(mc) && 
   651		    uctl.value.integer.value[1] > mc->platform_max)
   652			uctl.value.integer.value[1] = mc->platform_max;
   653	
   654		ret = kctl->put(kctl, &uctl);
   655		if (ret < 0)
   656			return ret;
   657	
   658		return 0;
 > 659	}
   660	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
