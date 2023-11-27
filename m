Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89369171B4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Nov 2023 09:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g6CK4zzK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701078243; x=1732614243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d4KBOoYjMHui34rWLF8ywLr8IleMWlfEzyUhnuuO0Ag=;
  b=g6CK4zzKrV+7LZxKlBHGBVycVDX8y3/hj3JwvcAj5wdk1ifnbqL/rgV6
   FN6kY2nmOoZhQB4wDBfVDd6c4U3ubjLnz5vy6nAqEiEfvWO8QgjnsptUS
   rd41/Njz1s5BNOpTi2p8M87/pXhxiqNEBkO95I2x0CHvD1bvZ6nAZ1/6j
   79lZX9mb0AzP0jqxyhCgqHCDSED8yInSi8XLqqFeiCXxxGqhi5pHcfCN8
   z7fzFIUtHEn4YDy4Z2wtU8F2CW7KXEdGiAvPK2gLwiFC79kIJ1wyrOYdK
   3JknDhZ9QuIz+qUCkA71K1y23pVDa0k2sIItGIBr58Fpa/PA3Bh9FWWwt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="389815964"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="389815964"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 01:44:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="797198455"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="797198455"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 27 Nov 2023 01:44:01 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7Y9m-00067L-33;
	Mon, 27 Nov 2023 09:43:58 +0000
Date: Mon, 27 Nov 2023 17:43:55 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/070-audio 11/105] sound/soc/apple/macaudio.c:778:1:
 sparse: sparse: symbol 'macaudio_spk_mux_enum' was not declared. Should it
 be static?
Message-ID: <202311271623.qkddyH1J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   2bf9b3889b901afbfafee41080d3051e34314f51
commit: c58ceb13a4c2cc59f093a06dfd9ce4804826264c [11/105] ASoC: apple: Add macaudio machine driver
config: sh-randconfig-r121-20231127 (https://download.01.org/0day-ci/archive/20231127/202311271623.qkddyH1J-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231127/202311271623.qkddyH1J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311271623.qkddyH1J-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/apple/macaudio.c:778:1: sparse: sparse: symbol 'macaudio_spk_mux_enum' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:788:1: sparse: sparse: symbol 'macaudio_hp_mux_enum' was not declared. Should it be static?

vim +/macaudio_spk_mux_enum +778 sound/soc/apple/macaudio.c

   777	
 > 778	SOC_ENUM_SINGLE_VIRT_DECL(macaudio_spk_mux_enum, macaudio_spk_mux_texts);
   779	
   780	static const struct snd_kcontrol_new macaudio_spk_mux =
   781		SOC_DAPM_ENUM("Speaker Playback Mux", macaudio_spk_mux_enum);
   782	
   783	static const char * const macaudio_hp_mux_texts[] = {
   784		"Primary",
   785		"Secondary"
   786	};
   787	
 > 788	SOC_ENUM_SINGLE_VIRT_DECL(macaudio_hp_mux_enum, macaudio_hp_mux_texts);
   789	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
