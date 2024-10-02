Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA7317548
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 03:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727839368; cv=none; b=rOKt2JCkAAci3ovg7g3f7ueAmo6q89t2lepAmFUBi4A3TBtNcC3InQYtPl+3nw3ZBxIB+24+IDtSE2unLOA1ievXZMuK2HPhHtIT2YUDwDo6SHQEP30AUzrrOq18CpW2ZE0iSraNVUifOJNYGBdQDW4Mu+tP12Mf+a3Lo9VQlKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727839368; c=relaxed/simple;
	bh=XbgvnwBtuUNSTewlFisrO0F0t6E/JswTHlwrByBEswA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=db6XaqvnlGMK8n6VIEDayd35S0VkjKnO9NVmbPlIDUzyeNE1hfLThEbnTvs+elk3IQaDuq8DJsM5scEd+1yoGmqq4jO2rRdw+b3v4aXdrn257tc0BDU9kKIbsLK/hQhIGDWiW9bl/nCGXdc53SLd/p6JKdTB1w1DuUvVguSxa/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b8EJeCPa; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b8EJeCPa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727839366; x=1759375366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XbgvnwBtuUNSTewlFisrO0F0t6E/JswTHlwrByBEswA=;
  b=b8EJeCPal33TgfsakurhOZD8OX9W0gNCBv7QhKfC3bgQOBaQQZ8LT2Qu
   UBvKDa8OtlesCfjKCyJjWprGLh9UrROGbe23ByNmYlazZTb6jYOxuUdOg
   PT0Y8BsK150VXAAS/MVbooMJVwM9e7Z7l3Nf/sDLS4u9tew8hMsP4s0gT
   PI05ks7rotWZyQ6f6+nxV05FGTjffvBQqOjajkc8zFxzTIBc+x1mWsstK
   0kNfbjk3nMXPgf2jDPuByHFMf/BQLgiM7g7eA+fQCYd2pOAXerQgsbeRX
   NA4X2TfvJw4wiQ+h8ydPQyw6q6yAhGcGYXIy7g84ibBURc6kCzfFZ+TVa
   w==;
X-CSE-ConnectionGUID: 1DhRM8aMTKay0PSobziFlA==
X-CSE-MsgGUID: 2LtqXS1VRKy9REyf84qrGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="26464711"
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="26464711"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 20:22:46 -0700
X-CSE-ConnectionGUID: oUwJmWwHRICZBOxrJYYHyQ==
X-CSE-MsgGUID: orGjMonXReavqxb10bKEiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="97235800"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Oct 2024 20:22:44 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svpwo-000RUR-1V;
	Wed, 02 Oct 2024 03:22:42 +0000
Date: Wed, 2 Oct 2024 11:21:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-f9d942cf7d57 1260/1491]
 sound/soc/intel/avs/core.c:814:17: error: initializer element is not
 computable at load time
Message-ID: <202410021305.iWix8cjF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common chromeos-6.6-f9d942cf7d57
head:   ef2c757e09b49fa8c905e77b7c1e55ccf2be08ee
commit: 5ca9d6321544bcfc52e225c40736fd63f3ebb283 [1260/1491] UPSTREAM: ASoC: Intel: avs: CNL-based platforms support
config: arm64-randconfig-003-20241002 (https://download.01.org/0day-ci/archive/20241002/202410021305.iWix8cjF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410021305.iWix8cjF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410021305.iWix8cjF-lkp@intel.com/

All errors (new ones prefixed by >>):

         |          ^~~~~~~~~~
   sound/soc/intel/avs/registers.h:59:41: warning: excess elements in struct initializer
      59 | #define CNL_ADSP_REG_HIPCIDA            (CNL_ADSP_IPC_BASE + 0x14)
         |                                         ^
   sound/soc/intel/avs/core.c:769:23: note: in expansion of macro 'CNL_ADSP_REG_HIPCIDA'
     769 |         .ack_offset = CNL_ADSP_REG_HIPCIDA,
         |                       ^~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/registers.h:59:41: note: (near initialization for 'cnl_hipc_spec')
      59 | #define CNL_ADSP_REG_HIPCIDA            (CNL_ADSP_IPC_BASE + 0x14)
         |                                         ^
   sound/soc/intel/avs/core.c:769:23: note: in expansion of macro 'CNL_ADSP_REG_HIPCIDA'
     769 |         .ack_offset = CNL_ADSP_REG_HIPCIDA,
         |                       ^~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/core.c:770:10: error: 'const struct avs_hipc_spec' has no member named 'ack_done_mask'
     770 |         .ack_done_mask = CNL_ADSP_HIPCIDA_DONE,
         |          ^~~~~~~~~~~~~
   include/vdso/bits.h:7:33: warning: excess elements in struct initializer
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                 ^
   sound/soc/intel/avs/registers.h:66:41: note: in expansion of macro 'BIT'
      66 | #define CNL_ADSP_HIPCIDA_DONE           BIT(31)
         |                                         ^~~
   sound/soc/intel/avs/core.c:770:26: note: in expansion of macro 'CNL_ADSP_HIPCIDA_DONE'
     770 |         .ack_done_mask = CNL_ADSP_HIPCIDA_DONE,
         |                          ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:33: note: (near initialization for 'cnl_hipc_spec')
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                 ^
   sound/soc/intel/avs/registers.h:66:41: note: in expansion of macro 'BIT'
      66 | #define CNL_ADSP_HIPCIDA_DONE           BIT(31)
         |                                         ^~~
   sound/soc/intel/avs/core.c:770:26: note: in expansion of macro 'CNL_ADSP_HIPCIDA_DONE'
     770 |         .ack_done_mask = CNL_ADSP_HIPCIDA_DONE,
         |                          ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/core.c:771:10: error: 'const struct avs_hipc_spec' has no member named 'rsp_offset'
     771 |         .rsp_offset = CNL_ADSP_REG_HIPCTDR,
         |          ^~~~~~~~~~
   sound/soc/intel/avs/registers.h:55:41: warning: excess elements in struct initializer
      55 | #define CNL_ADSP_REG_HIPCTDR            (CNL_ADSP_IPC_BASE + 0x00)
         |                                         ^
   sound/soc/intel/avs/core.c:771:23: note: in expansion of macro 'CNL_ADSP_REG_HIPCTDR'
     771 |         .rsp_offset = CNL_ADSP_REG_HIPCTDR,
         |                       ^~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/registers.h:55:41: note: (near initialization for 'cnl_hipc_spec')
      55 | #define CNL_ADSP_REG_HIPCTDR            (CNL_ADSP_IPC_BASE + 0x00)
         |                                         ^
   sound/soc/intel/avs/core.c:771:23: note: in expansion of macro 'CNL_ADSP_REG_HIPCTDR'
     771 |         .rsp_offset = CNL_ADSP_REG_HIPCTDR,
         |                       ^~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/core.c:772:10: error: 'const struct avs_hipc_spec' has no member named 'rsp_busy_mask'
     772 |         .rsp_busy_mask = CNL_ADSP_HIPCTDR_BUSY,
         |          ^~~~~~~~~~~~~
   include/vdso/bits.h:7:33: warning: excess elements in struct initializer
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                 ^
   sound/soc/intel/avs/registers.h:63:41: note: in expansion of macro 'BIT'
      63 | #define CNL_ADSP_HIPCTDR_BUSY           BIT(31)
         |                                         ^~~
   sound/soc/intel/avs/core.c:772:26: note: in expansion of macro 'CNL_ADSP_HIPCTDR_BUSY'
     772 |         .rsp_busy_mask = CNL_ADSP_HIPCTDR_BUSY,
         |                          ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:33: note: (near initialization for 'cnl_hipc_spec')
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                 ^
   sound/soc/intel/avs/registers.h:63:41: note: in expansion of macro 'BIT'
      63 | #define CNL_ADSP_HIPCTDR_BUSY           BIT(31)
         |                                         ^~~
   sound/soc/intel/avs/core.c:772:26: note: in expansion of macro 'CNL_ADSP_HIPCTDR_BUSY'
     772 |         .rsp_busy_mask = CNL_ADSP_HIPCTDR_BUSY,
         |                          ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/core.c:773:10: error: 'const struct avs_hipc_spec' has no member named 'ctl_offset'
     773 |         .ctl_offset = CNL_ADSP_REG_HIPCCTL,
         |          ^~~~~~~~~~
   sound/soc/intel/avs/registers.h:61:41: warning: excess elements in struct initializer
      61 | #define CNL_ADSP_REG_HIPCCTL            (CNL_ADSP_IPC_BASE + 0x28)
         |                                         ^
   sound/soc/intel/avs/core.c:773:23: note: in expansion of macro 'CNL_ADSP_REG_HIPCCTL'
     773 |         .ctl_offset = CNL_ADSP_REG_HIPCCTL,
         |                       ^~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/registers.h:61:41: note: (near initialization for 'cnl_hipc_spec')
      61 | #define CNL_ADSP_REG_HIPCCTL            (CNL_ADSP_IPC_BASE + 0x28)
         |                                         ^
   sound/soc/intel/avs/core.c:773:23: note: in expansion of macro 'CNL_ADSP_REG_HIPCCTL'
     773 |         .ctl_offset = CNL_ADSP_REG_HIPCCTL,
         |                       ^~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/core.c:784:21: error: 'skl_dsp_ops' undeclared here (not in a function); did you mean 'avs_dsp_ops'?
     784 |         .dsp_ops = &skl_dsp_ops,
         |                     ^~~~~~~~~~~
         |                     avs_dsp_ops
   sound/soc/intel/avs/core.c:800:21: error: 'apl_dsp_ops' undeclared here (not in a function); did you mean 'avs_dsp_ops'?
     800 |         .dsp_ops = &apl_dsp_ops,
         |                     ^~~~~~~~~~~
         |                     avs_dsp_ops
   sound/soc/intel/avs/core.c:814:10: error: 'const struct avs_spec' has no member named 'sram'
     814 |         .sram = &apl_sram_spec,
         |          ^~~~
   sound/soc/intel/avs/core.c:814:17: error: initialization of 'unsigned int' from 'const struct avs_sram_spec *' makes integer from pointer without a cast [-Wint-conversion]
     814 |         .sram = &apl_sram_spec,
         |                 ^
   sound/soc/intel/avs/core.c:814:17: note: (near initialization for 'cnl_desc.sram_base_offset')
>> sound/soc/intel/avs/core.c:814:17: error: initializer element is not computable at load time
   sound/soc/intel/avs/core.c:814:17: note: (near initialization for 'cnl_desc.sram_base_offset')
   sound/soc/intel/avs/core.c:815:10: error: 'const struct avs_spec' has no member named 'hipc'
     815 |         .hipc = &cnl_hipc_spec,
         |          ^~~~
   sound/soc/intel/avs/core.c:815:17: error: initialization of 'unsigned int' from 'const struct avs_hipc_spec *' makes integer from pointer without a cast [-Wint-conversion]
     815 |         .hipc = &cnl_hipc_spec,
         |                 ^
   sound/soc/intel/avs/core.c:815:17: note: (near initialization for 'cnl_desc.sram_window_size')
   sound/soc/intel/avs/core.c:815:17: error: initializer element is not computable at load time
   sound/soc/intel/avs/core.c:815:17: note: (near initialization for 'cnl_desc.sram_window_size')
   sound/soc/intel/avs/core.c:742:35: error: storage size of 'skl_sram_spec' isn't known
     742 | static const struct avs_sram_spec skl_sram_spec = {
         |                                   ^~~~~~~~~~~~~
   sound/soc/intel/avs/core.c:748:35: error: storage size of 'apl_sram_spec' isn't known
     748 | static const struct avs_sram_spec apl_sram_spec = {
         |                                   ^~~~~~~~~~~~~
   sound/soc/intel/avs/core.c:754:35: error: storage size of 'skl_hipc_spec' isn't known
     754 | static const struct avs_hipc_spec skl_hipc_spec = {
         |                                   ^~~~~~~~~~~~~
   sound/soc/intel/avs/core.c:765:35: error: storage size of 'cnl_hipc_spec' isn't known
     765 | static const struct avs_hipc_spec cnl_hipc_spec = {
         |                                   ^~~~~~~~~~~~~
   sound/soc/intel/avs/core.c:754:35: warning: 'skl_hipc_spec' defined but not used [-Wunused-const-variable=]
     754 | static const struct avs_hipc_spec skl_hipc_spec = {
         |                                   ^~~~~~~~~~~~~
   sound/soc/intel/avs/core.c:742:35: warning: 'skl_sram_spec' defined but not used [-Wunused-const-variable=]
     742 | static const struct avs_sram_spec skl_sram_spec = {
         |                                   ^~~~~~~~~~~~~


vim +814 sound/soc/intel/avs/core.c

   807	
   808	static const struct avs_spec cnl_desc = {
   809		.name = "cnl",
   810		.min_fw_version = { 10, 23, 0, 5314 },
   811		.dsp_ops = &avs_cnl_dsp_ops,
   812		.core_init_mask = 1,
   813		.attributes = AVS_PLATATTR_IMR,
 > 814		.sram = &apl_sram_spec,
   815		.hipc = &cnl_hipc_spec,
   816	};
   817	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
