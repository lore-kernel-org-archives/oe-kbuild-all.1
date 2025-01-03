Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0F913AA2A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 00:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735865024; cv=none; b=rAJGlSahk8Ng9j4pBY45sEnI7O7alxXTQCAJfMg43RGj++NsZk2mvKd0tw1AdF1RrzFaVeOdmBXyQHBNCq9Mrz/LNUZheHGOU3ciWvOHIkiETVoAcL+L6M4IqMX9AEibp1tPo4FCBTT6SDazpqYg2MgDJG4OLPeGKR1IHWwtx5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735865024; c=relaxed/simple;
	bh=evyTVioEnv/+GvvTIk9JFjtGj83ivp5eTu/OCUE3K6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mYFPyzY+vAByqgMPhbpIbccV0Mlqn2OOHTjZmK1+CyhSl2MIfFSmhg27Zfk/o0aB8P9pmO1a9AOyzdx3xeyTsfKrMZ07ODCtaQsmJ0fQNzQaIgtPYUC2rnNsu2QeGUGdDFn2iHp9R5LA08AXu3mtSoQ0GR2A/sRCDHX7oyXm3gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ha8jT+VN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ha8jT+VN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735865022; x=1767401022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=evyTVioEnv/+GvvTIk9JFjtGj83ivp5eTu/OCUE3K6Q=;
  b=ha8jT+VNYCmG+LcThuqxc0/aH6HGmqWd2aQLhuLJhYZFY/f6EtaWg42W
   eI9IUtbzETWyMnzWEbW4rx0tSnu5+aNPO7kqQlb7TwiNc6E8/+OK3zU0I
   RdhlidDpvq44TSu/1GXy/GK9GyREO5xZJO89DbZ6gHsR/H6Ap5xE4lhUu
   MkzkiR7F5+Tw6YveIr2JQ1ic5OyS8P0aBZDES2n2twHFtjD+NsljTVPOx
   CEVTcSI8CLbEjw5xDNGYt7NXRodI9sVhN3NrTiHTdTrT+Wt230FiS73Tg
   DmJw6E6r0xbtaWPWoFaFMuyQEXX4lPNrExr9nXowBnPTmai9X+teLdfVJ
   A==;
X-CSE-ConnectionGUID: fwyUrXihTLySyuz8Gzr2Ow==
X-CSE-MsgGUID: A3K1VYOfStWf+Jmi/sQTZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="40037818"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="40037818"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 16:43:40 -0800
X-CSE-ConnectionGUID: o7bNOt0MRQi+GK0GsT06MQ==
X-CSE-MsgGUID: l+TJVcYbShW5kUTj2JiIRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101498574"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Jan 2025 16:43:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTVmq-000900-0Y;
	Fri, 03 Jan 2025 00:43:36 +0000
Date: Fri, 3 Jan 2025 08:43:34 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Matt Roper <matthew.d.roper@intel.com>
Subject: drivers/gpu/drm/i915/display/intel_cursor.c:314:17: error:
 arithmetic between different enumeration types ('enum pipe' and 'enum
 intel_display_power_domain')
Message-ID: <202501030820.uuKfUZvC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lucas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
commit: 237412e45390805e14a6936fb998d756c4eac9d8 drm/xe: Enable 32bits build
date:   11 months ago
config: i386-randconfig-053-20250103 (https://download.01.org/0day-ci/archive/20250103/202501030820.uuKfUZvC-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501030820.uuKfUZvC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501030820.uuKfUZvC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/intel_cursor.c:7:
   In file included from include/drm/drm_atomic_helper.h:31:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/i915/display/intel_cursor.c:314:17: error: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Werror,-Wenum-enum-conversion]
     314 |         power_domain = POWER_DOMAIN_PIPE(PIPE_A);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:120:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
     120 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_cursor.c:610:17: error: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Werror,-Wenum-enum-conversion]
     610 |         power_domain = POWER_DOMAIN_PIPE(plane->pipe);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:120:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
     120 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   3 errors generated.
--
   In file included from drivers/gpu/drm/i915/display/intel_ddi.c:32:
   In file included from include/drm/drm_privacy_screen_consumer.h:13:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/i915/display/intel_ddi.c:811:12: error: arithmetic between different enumeration types ('enum transcoder' and 'enum intel_display_power_domain') [-Werror,-Wenum-enum-conversion]
     811 |                                                                    POWER_DOMAIN_TRANSCODER(cpu_transcoder));
         |                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:125:10: note: expanded from macro 'POWER_DOMAIN_TRANSCODER'
     125 |          (tran) + POWER_DOMAIN_TRANSCODER_A)
         |          ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_ddi.c:825:37: error: arithmetic between different enumeration types ('enum transcoder' and 'enum intel_display_power_domain') [-Werror,-Wenum-enum-conversion]
     825 |                 intel_display_power_put(dev_priv, POWER_DOMAIN_TRANSCODER(cpu_transcoder),
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:125:10: note: expanded from macro 'POWER_DOMAIN_TRANSCODER'
     125 |          (tran) + POWER_DOMAIN_TRANSCODER_A)
         |          ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_ddi.c:3754:18: error: arithmetic between different enumeration types ('enum transcoder' and 'enum intel_display_power_domain') [-Werror,-Wenum-enum-conversion]
    3754 |                 power_domain = POWER_DOMAIN_TRANSCODER(cpu_transcoder);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:125:10: note: expanded from macro 'POWER_DOMAIN_TRANSCODER'
     125 |          (tran) + POWER_DOMAIN_TRANSCODER_A)
         |          ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_ddi.c:4669:21: error: arithmetic between different enumeration types ('enum hpd_pin' and 'enum port') [-Werror,-Wenum-enum-conversion]
    4669 |                 return HPD_PORT_D + port - PORT_D_XELPD;
         |                        ~~~~~~~~~~ ^ ~~~~
   drivers/gpu/drm/i915/display/intel_ddi.c:4671:23: error: arithmetic between different enumeration types ('enum hpd_pin' and 'enum port') [-Werror,-Wenum-enum-conversion]
    4671 |                 return HPD_PORT_TC1 + port - PORT_TC1;
         |                        ~~~~~~~~~~~~ ^ ~~~~
   drivers/gpu/drm/i915/display/intel_ddi.c:4673:21: error: arithmetic between different enumeration types ('enum hpd_pin' and 'enum port') [-Werror,-Wenum-enum-conversion]
    4673 |                 return HPD_PORT_A + port - PORT_A;
         |                        ~~~~~~~~~~ ^ ~~~~
   drivers/gpu/drm/i915/display/intel_ddi.c:4680:21: error: arithmetic between different enumeration types ('enum hpd_pin' and 'enum port') [-Werror,-Wenum-enum-conversion]
    4680 |                 return HPD_PORT_C + port - PORT_TC1;
         |                        ~~~~~~~~~~ ^ ~~~~
   drivers/gpu/drm/i915/display/intel_ddi.c:4682:21: error: arithmetic between different enumeration types ('enum hpd_pin' and 'enum port') [-Werror,-Wenum-enum-conversion]
    4682 |                 return HPD_PORT_A + port - PORT_A;
         |                        ~~~~~~~~~~ ^ ~~~~
   drivers/gpu/drm/i915/display/intel_ddi.c:4689:23: error: arithmetic between different enumeration types ('enum hpd_pin' and 'enum port') [-Werror,-Wenum-enum-conversion]
    4689 |                 return HPD_PORT_TC1 + port - PORT_TC1;
         |                        ~~~~~~~~~~~~ ^ ~~~~
   drivers/gpu/drm/i915/display/intel_ddi.c:4691:21: error: arithmetic between different enumeration types ('enum hpd_pin' and 'enum port') [-Werror,-Wenum-enum-conversion]
    4691 |                 return HPD_PORT_A + port - PORT_A;
         |                        ~~~~~~~~~~ ^ ~~~~
   drivers/gpu/drm/i915/display/intel_ddi.c:4701:21: error: arithmetic between different enumeration types ('enum hpd_pin' and 'enum port') [-Werror,-Wenum-enum-conversion]
    4701 |                 return HPD_PORT_C + port - PORT_TC1;
         |                        ~~~~~~~~~~ ^ ~~~~
   drivers/gpu/drm/i915/display/intel_ddi.c:4703:21: error: arithmetic between different enumeration types ('enum hpd_pin' and 'enum port') [-Werror,-Wenum-enum-conversion]
    4703 |                 return HPD_PORT_A + port - PORT_A;
         |                        ~~~~~~~~~~ ^ ~~~~
   drivers/gpu/drm/i915/display/intel_ddi.c:4710:23: error: arithmetic between different enumeration types ('enum hpd_pin' and 'enum port') [-Werror,-Wenum-enum-conversion]
    4710 |                 return HPD_PORT_TC1 + port - PORT_C;
         |                        ~~~~~~~~~~~~ ^ ~~~~
   drivers/gpu/drm/i915/display/intel_ddi.c:4712:21: error: arithmetic between different enumeration types ('enum hpd_pin' and 'enum port') [-Werror,-Wenum-enum-conversion]
    4712 |                 return HPD_PORT_A + port - PORT_A;
         |                        ~~~~~~~~~~ ^ ~~~~
   drivers/gpu/drm/i915/display/intel_ddi.c:4724:20: error: arithmetic between different enumeration types ('enum hpd_pin' and 'enum port') [-Werror,-Wenum-enum-conversion]
    4724 |         return HPD_PORT_A + port - PORT_A;
         |                ~~~~~~~~~~ ^ ~~~~
   drivers/gpu/drm/i915/display/intel_ddi.c:4732:20: error: arithmetic between different enumeration types ('enum hpd_pin' and 'enum port') [-Werror,-Wenum-enum-conversion]
    4732 |         return HPD_PORT_A + port - PORT_A;
         |                ~~~~~~~~~~ ^ ~~~~
   17 errors generated.
--
   In file included from drivers/gpu/drm/i915/display/intel_display.c:28:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/i915/display/intel_display.c:314:17: error: arithmetic between different enumeration types ('enum transcoder' and 'enum intel_display_power_domain') [-Werror,-Wenum-enum-conversion]
     314 |         power_domain = POWER_DOMAIN_TRANSCODER(cpu_transcoder);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:125:10: note: expanded from macro 'POWER_DOMAIN_TRANSCODER'
     125 |          (tran) + POWER_DOMAIN_TRANSCODER_A)
         |          ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_display.c:1889:16: error: arithmetic between different enumeration types ('enum phy' and 'enum port') [-Werror,-Wenum-enum-conversion]
    1889 |                 return PHY_D + port - PORT_D_XELPD;
         |                        ~~~~~ ^ ~~~~
   drivers/gpu/drm/i915/display/intel_display.c:1891:16: error: arithmetic between different enumeration types ('enum phy' and 'enum port') [-Werror,-Wenum-enum-conversion]
    1891 |                 return PHY_F + port - PORT_TC1;
         |                        ~~~~~ ^ ~~~~
   drivers/gpu/drm/i915/display/intel_display.c:1893:16: error: arithmetic between different enumeration types ('enum phy' and 'enum port') [-Werror,-Wenum-enum-conversion]
    1893 |                 return PHY_B + port - PORT_TC1;
         |                        ~~~~~ ^ ~~~~
   drivers/gpu/drm/i915/display/intel_display.c:1895:16: error: arithmetic between different enumeration types ('enum phy' and 'enum port') [-Werror,-Wenum-enum-conversion]
    1895 |                 return PHY_C + port - PORT_TC1;
         |                        ~~~~~ ^ ~~~~
   drivers/gpu/drm/i915/display/intel_display.c:1900:15: error: arithmetic between different enumeration types ('enum phy' and 'enum port') [-Werror,-Wenum-enum-conversion]
    1900 |         return PHY_A + port - PORT_A;
         |                ~~~~~ ^ ~~~~
>> drivers/gpu/drm/i915/display/intel_display.c:1909:20: error: arithmetic between different enumeration types ('enum tc_port' and 'enum port') [-Werror,-Wenum-enum-conversion]
    1909 |                 return TC_PORT_1 + port - PORT_TC1;
         |                        ~~~~~~~~~ ^ ~~~~
   drivers/gpu/drm/i915/display/intel_display.c:1911:20: error: arithmetic between different enumeration types ('enum tc_port' and 'enum port') [-Werror,-Wenum-enum-conversion]
    1911 |                 return TC_PORT_1 + port - PORT_C;
         |                        ~~~~~~~~~ ^ ~~~~
>> drivers/gpu/drm/i915/display/intel_display.c:1939:10: error: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Werror,-Wenum-enum-conversion]
    1939 |         set_bit(POWER_DOMAIN_PIPE(pipe), mask->bits);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:120:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
     120 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:1940:10: error: arithmetic between different enumeration types ('enum transcoder' and 'enum intel_display_power_domain') [-Werror,-Wenum-enum-conversion]
    1940 |         set_bit(POWER_DOMAIN_TRANSCODER(cpu_transcoder), mask->bits);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:125:10: note: expanded from macro 'POWER_DOMAIN_TRANSCODER'
     125 |          (tran) + POWER_DOMAIN_TRANSCODER_A)
         |          ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:1943:11: error: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Werror,-Wenum-enum-conversion]
    1943 |                 set_bit(POWER_DOMAIN_PIPE_PANEL_FITTER(pipe), mask->bits);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:122:11: note: expanded from macro 'POWER_DOMAIN_PIPE_PANEL_FITTER'
     122 |                 ((pipe) + POWER_DOMAIN_PIPE_PANEL_FITTER_A)
         |                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:2943:17: error: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Werror,-Wenum-enum-conversion]
    2943 |         power_domain = POWER_DOMAIN_PIPE(crtc->pipe);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:120:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
     120 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:3335:17: error: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Werror,-Wenum-enum-conversion]
    3335 |         power_domain = POWER_DOMAIN_PIPE(crtc->pipe);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:120:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
     120 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:3426:17: error: arithmetic between different enumeration types ('enum transcoder' and 'enum intel_display_power_domain') [-Werror,-Wenum-enum-conversion]
    3426 |         power_domain = POWER_DOMAIN_TRANSCODER(cpu_transcoder);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:125:10: note: expanded from macro 'POWER_DOMAIN_TRANSCODER'
     125 |          (tran) + POWER_DOMAIN_TRANSCODER_A)
         |          ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:3464:18: error: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Werror,-Wenum-enum-conversion]
    3464 |                 power_domain = POWER_DOMAIN_PIPE(pipe);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:120:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
     120 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:3542:18: error: arithmetic between different enumeration types ('enum transcoder' and 'enum intel_display_power_domain') [-Werror,-Wenum-enum-conversion]
    3542 |                 power_domain = POWER_DOMAIN_TRANSCODER(cpu_transcoder);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:125:10: note: expanded from macro 'POWER_DOMAIN_TRANSCODER'
     125 |          (tran) + POWER_DOMAIN_TRANSCODER_A)
         |          ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:3647:14: error: arithmetic between different enumeration types ('enum transcoder' and 'enum intel_display_power_domain') [-Werror,-Wenum-enum-conversion]
    3647 |                                                        POWER_DOMAIN_TRANSCODER(pipe_config->cpu_transcoder)))
         |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:125:10: note: expanded from macro 'POWER_DOMAIN_TRANSCODER'
     125 |          (tran) + POWER_DOMAIN_TRANSCODER_A)
         |          ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:3679:15: error: arithmetic between different enumeration types ('enum transcoder' and 'enum intel_display_power_domain') [-Werror,-Wenum-enum-conversion]
    3679 |                                                                POWER_DOMAIN_TRANSCODER(cpu_transcoder)))
         |                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:125:10: note: expanded from macro 'POWER_DOMAIN_TRANSCODER'
     125 |          (tran) + POWER_DOMAIN_TRANSCODER_A)
         |          ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
   In file included from drivers/gpu/drm/i915/display/intel_display_irq.c:7:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:15:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h:11:
   In file included from drivers/gpu/drm/xe/xe_bo.h:9:
   In file included from include/drm/ttm/ttm_tt.h:30:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/i915/display/intel_display_irq.c:1428:10: error: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Werror,-Wenum-enum-conversion]
    1428 |                                                    POWER_DOMAIN_PIPE(pipe)))
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:120:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
     120 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_display_irq.c:1453:13: error: arithmetic between different enumeration types ('enum transcoder' and 'enum intel_display_power_domain') [-Werror,-Wenum-enum-conversion]
    1453 |                         domain = POWER_DOMAIN_TRANSCODER(trans);
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:125:10: note: expanded from macro 'POWER_DOMAIN_TRANSCODER'
     125 |          (tran) + POWER_DOMAIN_TRANSCODER_A)
         |          ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_irq.c:1467:10: error: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Werror,-Wenum-enum-conversion]
    1467 |                                                    POWER_DOMAIN_PIPE(pipe)))
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:120:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
     120 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_irq.c:1686:13: error: arithmetic between different enumeration types ('enum transcoder' and 'enum intel_display_power_domain') [-Werror,-Wenum-enum-conversion]
    1686 |                         domain = POWER_DOMAIN_TRANSCODER(trans);
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:125:10: note: expanded from macro 'POWER_DOMAIN_TRANSCODER'
     125 |          (tran) + POWER_DOMAIN_TRANSCODER_A)
         |          ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_irq.c:1700:10: error: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Werror,-Wenum-enum-conversion]
    1700 |                                                    POWER_DOMAIN_PIPE(pipe)))
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:120:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
     120 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   6 errors generated.
--
   In file included from drivers/gpu/drm/i915/display/intel_dpll_mgr.c:28:
   In file included from drivers/gpu/drm/i915/display/intel_de.h:9:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:15:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h:11:
   In file included from drivers/gpu/drm/xe/xe_bo.h:9:
   In file included from include/drm/ttm/ttm_tt.h:30:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/i915/display/intel_dpll_mgr.c:188:19: error: arithmetic between different enumeration types ('enum tc_port' and 'enum intel_dpll_id') [-Werror,-Wenum-enum-conversion]
     188 |         return TC_PORT_1 + id - DPLL_ID_ICL_MGPLL1;
         |                ~~~~~~~~~ ^ ~~
   2 errors generated.
--
   In file included from drivers/gpu/drm/i915/display/intel_hotplug.c:26:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:15:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h:11:
   In file included from drivers/gpu/drm/xe/xe_bo.h:9:
   In file included from include/drm/ttm/ttm_tt.h:30:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/i915/display/intel_hotplug.c:92:20: error: arithmetic between different enumeration types ('enum hpd_pin' and 'enum port') [-Werror,-Wenum-enum-conversion]
      92 |         return HPD_PORT_A + port - PORT_A;
         |                ~~~~~~~~~~ ^ ~~~~
   2 errors generated.
--
   In file included from drivers/gpu/drm/i915/display/intel_tc.c:6:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:15:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h:11:
   In file included from drivers/gpu/drm/xe/xe_bo.h:9:
   In file included from include/drm/ttm/ttm_tt.h:30:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/i915/display/intel_tc.c:251:41: error: arithmetic between different enumeration types ('enum intel_display_power_domain' and 'enum tc_port') [-Werror,-Wenum-enum-conversion]
     251 |         return POWER_DOMAIN_PORT_DDI_LANES_TC1 + tc_port - TC_PORT_1;
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~
   2 errors generated.
--
   In file included from drivers/gpu/drm/i915/display/intel_vdsc.c:12:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:15:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h:11:
   In file included from drivers/gpu/drm/xe/xe_bo.h:9:
   In file included from include/drm/ttm/ttm_tt.h:30:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/i915/display/intel_vdsc.c:369:10: error: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Werror,-Wenum-enum-conversion]
     369 |                 return POWER_DOMAIN_PIPE(pipe);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:120:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
     120 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   2 errors generated.
..


vim +314 drivers/gpu/drm/i915/display/intel_cursor.c

99ce270a1ec154 Dave Airlie 2020-12-21  305  
99ce270a1ec154 Dave Airlie 2020-12-21  306  static bool i845_cursor_get_hw_state(struct intel_plane *plane,
99ce270a1ec154 Dave Airlie 2020-12-21  307  				     enum pipe *pipe)
99ce270a1ec154 Dave Airlie 2020-12-21  308  {
99ce270a1ec154 Dave Airlie 2020-12-21  309  	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
99ce270a1ec154 Dave Airlie 2020-12-21  310  	enum intel_display_power_domain power_domain;
99ce270a1ec154 Dave Airlie 2020-12-21  311  	intel_wakeref_t wakeref;
99ce270a1ec154 Dave Airlie 2020-12-21  312  	bool ret;
99ce270a1ec154 Dave Airlie 2020-12-21  313  
99ce270a1ec154 Dave Airlie 2020-12-21 @314  	power_domain = POWER_DOMAIN_PIPE(PIPE_A);
99ce270a1ec154 Dave Airlie 2020-12-21  315  	wakeref = intel_display_power_get_if_enabled(dev_priv, power_domain);
99ce270a1ec154 Dave Airlie 2020-12-21  316  	if (!wakeref)
99ce270a1ec154 Dave Airlie 2020-12-21  317  		return false;
99ce270a1ec154 Dave Airlie 2020-12-21  318  
99ce270a1ec154 Dave Airlie 2020-12-21  319  	ret = intel_de_read(dev_priv, CURCNTR(PIPE_A)) & CURSOR_ENABLE;
99ce270a1ec154 Dave Airlie 2020-12-21  320  
99ce270a1ec154 Dave Airlie 2020-12-21  321  	*pipe = PIPE_A;
99ce270a1ec154 Dave Airlie 2020-12-21  322  
99ce270a1ec154 Dave Airlie 2020-12-21  323  	intel_display_power_put(dev_priv, power_domain, wakeref);
99ce270a1ec154 Dave Airlie 2020-12-21  324  
99ce270a1ec154 Dave Airlie 2020-12-21  325  	return ret;
99ce270a1ec154 Dave Airlie 2020-12-21  326  }
99ce270a1ec154 Dave Airlie 2020-12-21  327  

:::::: The code at line 314 was first introduced by commit
:::::: 99ce270a1ec1540d2517bac646a552c0199ae226 drm/i915: refactor cursor code out of i915_display.c

:::::: TO: Dave Airlie <airlied@redhat.com>
:::::: CC: Jani Nikula <jani.nikula@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
