Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1F01EB35
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Dec 2023 18:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BmXYIcsH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703530012; x=1735066012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nZULWy0uYcv0gZNnwDiVPMfw80BZn0zxlsxbMOz6iJ0=;
  b=BmXYIcsHdCq2I6T4mvaYpJcm6VXzQ8NLM33Z38J9LqUYJ3l6IvVBMGL1
   STv6tGEooUFRfmpNHBY+YPLEjhVXbqygxpYNbSy8676E3PJyjP2qvPFfi
   y7NPhdfZXwla/MmXxkmZ9p/LTrSNpDxV0RvNvTmn9tvh4njArXznEbr73
   1wJZAFW+WF7Nn+UwaPHjnk89Kf55hoRYS5vN9T4NiMB31NKOU+g/E9oTo
   SlS26OuX3C7zEyg61SkiCtKH1yHuZvHQAYn0xr3WwEf+OtD+MoXkRbu8+
   cNz7cbpiMf/ZH27VvBu5tBDR1EQ3MZuKW8l9GT+PqvTKVtS57tmS36rX2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="381275357"
X-IronPort-AV: E=Sophos;i="6.04,304,1695711600"; 
   d="scan'208";a="381275357"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2023 10:46:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="848249644"
X-IronPort-AV: E=Sophos;i="6.04,304,1695711600"; 
   d="scan'208";a="848249644"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 25 Dec 2023 10:46:49 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHpwm-000DbZ-2W;
	Mon, 25 Dec 2023 18:46:30 +0000
Date: Tue, 26 Dec 2023 02:44:31 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 10126/10295] WARNING: modpost: vmlinux: section
 mismatch in reference: rt5682_jack_detect_handler+0xe6 (section: .text) ->
 (unknown) (section: .init.text)
Message-ID: <202312260238.ZoOojQOE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   39676dfe52331dba909c617f213fdb21015c8d10
commit: b7bfaf6abac6e3f239e669dfdf032032a78dc39c [10126/10295] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git
config: riscv-randconfig-r016-20230807 (https://download.01.org/0day-ci/archive/20231226/202312260238.ZoOojQOE-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231226/202312260238.ZoOojQOE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312260238.ZoOojQOE-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: pcm3008_codec_probe+0xaa (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt1016_i2c_probe+0x40 (section: .text) -> proc_execdomains_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt1016_i2c_probe+0x52 (section: .text) -> proc_execdomains_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt1017_sdca_update_status+0x8c (section: .text) -> panic_on_taint_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt1017_sdca_update_status+0x10a (section: .text) -> panic_on_taint_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt1017_sdca_update_status+0x110 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt1019_i2c_probe+0x44 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt1019_i2c_probe+0x52 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt1318_read_prop+0x66 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt1318_read_prop+0xf0 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt1318_sdw_probe+0x20 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt1318_sdw_probe+0x28 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: snd_mask_min+0x10 (section: .text) -> pid_idr_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: snd_mask_min+0x22 (section: .text) -> pid_idr_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: snd_mask_min+0x2c (section: .text) -> pid_idr_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: snd_mask_min+0x36 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: snd_mask_min+0x40 (section: .text) -> pid_idr_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: snd_mask_min+0x48 (section: .text) -> pid_idr_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: snd_mask_min+0x52 (section: .text) -> pid_idr_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_volatile_register+0xa (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_volatile_register+0x12 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_volatile_register+0x1c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_volatile_register+0x24 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_volatile_register+0x2c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_volatile_register+0x34 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_volatile_register+0x3c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_volatile_register+0x5c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_volatile_register+0x62 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_volatile_register+0x6c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_volatile_register+0x74 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_volatile_register+0x7c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_volatile_register+0x84 (section: .text) -> sort_main_extable (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_volatile_register+0x8e (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_volatile_register+0x94 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_volatile_register+0xa0 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_volatile_register+0xa6 (section: .text) -> sort_main_extable (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0xa (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0x12 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0x1a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0x22 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0x2a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0x32 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0x3a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0x46 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0x62 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0x70 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0x7e (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0x8c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0x9a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0xa4 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0xae (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0xbe (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0xce (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0xd8 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0xf2 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0xfe (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0x108 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0x114 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0x134 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0x140 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0x14c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0x15c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0x174 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0x17e (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0x18e (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0x19e (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0x1b6 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0x1c0 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0x1c8 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0x1e0 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0x1ea (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_readable_register+0x1f4 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5668_hw_params+0x1c8 (section: .text) -> sort_main_extable (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5668_hp_event+0x12 (section: .text) -> param_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5668_set_component_pll+0x4e (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5668_set_component_pll+0x52 (section: .text) -> param_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5668_set_component_pll+0x13a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5682_set_bias_level+0x36 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5682_set_bias_level+0x4c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5682_set_bias_level+0x68 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5682_parse_dt+0x1e (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5682_parse_dt+0x34 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5682_parse_dt+0x4a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5682_parse_dt+0x60 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5682_parse_dt+0x76 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5682_parse_dt+0x8c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5682_resume+0xa4 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5682_set_jack_detect+0xa6 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5682_set_jack_detect+0xb8 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5682_set_jack_detect+0xca (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5682_set_jack_detect+0xdc (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5682_set_jack_detect+0xf8 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5682_set_jack_detect+0x114 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5682_set_jack_detect+0x130 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5682_set_jack_detect+0x14c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5682_set_jack_detect+0x164 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5682_set_jack_detect+0x178 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5682_set_jack_detect+0x18a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5682_set_jack_detect+0x1b6 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5682_set_jack_detect+0x1c8 (section: .text) -> (unknown) (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: rt5682_jack_detect_handler+0xe6 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5682_jack_detect_handler+0x28c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5682_jack_detect_handler+0x2a0 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5682_jack_detect_handler+0x2b4 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_readable_register+0xc (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_readable_register+0x18 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_readable_register+0x22 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_readable_register+0x2c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_readable_register+0x50 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_readable_register+0x5e (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_readable_register+0x6c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_readable_register+0x76 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_readable_register+0x7a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_readable_register+0x84 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_readable_register+0x94 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_readable_register+0xa2 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_volatile_register+0xe (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_volatile_register+0x12 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_volatile_register+0x20 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_volatile_register+0x3e (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_volatile_register+0x48 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_volatile_register+0x58 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_mbq_readable_register+0xc (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_mbq_readable_register+0x16 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_mbq_readable_register+0x24 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_mbq_readable_register+0x28 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_mbq_readable_register+0x36 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_mbq_readable_register+0x3a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_mbq_readable_register+0x58 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_mbq_readable_register+0x66 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_mbq_readable_register+0x6c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_mbq_readable_register+0x7a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_mbq_readable_register+0x86 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_mbq_readable_register+0x94 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_mbq_readable_register+0x9a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_mbq_readable_register+0xaa (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_mbq_readable_register+0xae (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_mbq_readable_register+0xbc (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_mbq_readable_register+0xc8 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_mbq_readable_register+0xd2 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_mbq_readable_register+0xe0 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_mbq_readable_register+0xee (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_mbq_readable_register+0xfe (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_mbq_volatile_register+0x10 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_mbq_volatile_register+0x14 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_mbq_volatile_register+0x1e (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_mbq_volatile_register+0x2a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_mbq_volatile_register+0x48 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_mbq_volatile_register+0x4e (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_mbq_volatile_register+0x5c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_mbq_volatile_register+0x64 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_fu1e_capture_get+0x16 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_fu1e_capture_get+0x34 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_fu_info+0xe (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_dev_suspend+0x10 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_dev_system_suspend+0x6 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_dev_system_suspend+0x10 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_dev_resume+0x14 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_dev_resume+0x1c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_dev_resume+0x30 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_dev_resume+0x32 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_dev_resume+0x36 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_dev_resume+0x9c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_set_fu1e_capture_ctl+0x30 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_set_fu1e_capture_ctl+0x4a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_set_fu1e_capture_ctl+0x50 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_fu1e_event+0x12 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_fu1e_event+0x18 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_fu1e_event+0x2a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_fu1e_event+0x32 (section: .text) -> setup_sched_thermal_decay_shift (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_fu1e_event+0x3a (section: .text) -> setup_sched_thermal_decay_shift (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_fu1e_capture_put+0x32 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_mux_put+0x9c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_mux_put+0xce (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_mux_put+0x114 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_io_init+0x72 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_io_init+0x8a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_io_init+0xa2 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_io_init+0xba (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_io_init+0xd0 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_io_init+0xe6 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_io_init+0xfc (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_io_init+0x110 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_io_init+0x124 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_io_init+0x138 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_io_init+0x162 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_update_status+0x24 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_mux_get+0x70 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_sdw_probe+0x1c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_sdw_probe+0x28 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_sdw_probe+0x5a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt712_sdca_dmic_sdw_probe+0x62 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rtq9128_dai_set_tdm_slot+0x1a8 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rtq9128_dai_set_tdm_slot+0x1b0 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rtq9128_dai_set_tdm_slot+0x1ee (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rtq9128_dai_set_tdm_slot+0x1f2 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rtq9128_dai_set_tdm_slot+0x1fa (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rtq9128_dai_set_tdm_slot+0x1fe (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rtq9128_dai_set_tdm_slot+0x202 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rtq9128_dai_set_tdm_slot+0x206 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rtq9128_dai_set_tdm_slot+0x210 (section: .text) -> lockdep_init (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
