Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87D2384245
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 18:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784313619; cv=none; b=mvO7pkFq/HnjCSkDOSmEAaWMJz0bRmDlK5qqteUBfzRsP/PyRq51MMYtzsTq5AGNFWSLCAgv8ZQ6aDEUciOEFs22fn7DVKGW5JYBdgnEhUztKXvRrQxyDi7UpmU0UR6zz94nGF9Szq/gdAxHG3AkRZ0WaAQ9P7ExQvjrniRlQ0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784313619; c=relaxed/simple;
	bh=/iRKI4rWpOftVZk1VavzFy4YA6VOTVg/VaMyUTL+zxs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ns0fsYmXG9xZ06aDgR6YGr72eYm9w/3UDC986Nc980NxqRSfHqxsH/2pvC03B1+MdplkGONJIp5+30qpHBNomREz7a9hI4hX/RhrgDi4XMBJYwr243ZGUQCTejcVJFQeI1yEhofZdbh/JcHZYE1X/34ZNH5MiaqU/f4ff5Bn4Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TXiHKvy+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TXiHKvy+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784313615; x=1815849615;
  h=date:from:to:cc:subject:message-id;
  bh=/iRKI4rWpOftVZk1VavzFy4YA6VOTVg/VaMyUTL+zxs=;
  b=TXiHKvy+/gtc4hHMMRZ8DkrAnoYvWeT/YnhxVAi3b3N7FfDpDyT55oT2
   jkuGmaETxryJXeHUvIhVGCObTc7onZNHOSFuo8gL0Sx5k9YBJZpgxBwnw
   x4MR+Qe0iEEoyw6s27xZgAtioRALQt7z0q3/sHa/xVCGZ0hIEuyKRgBSX
   yAgXie1FRGOLrzy3cYSlszcdNjLaPtQZly85349W3K+gho6i8ZGLnt9DW
   DmX3eX9nSr6BF8kBgJCb2yNaYP8VTZGoTXZ/RROL5czWpozmZcHeNtqe+
   PGvyiNxeeCfrpbAI2Qni/l8z3u5t2WLTFWIka8ZqbVxwl1sbsYZgzJdAZ
   w==;
X-CSE-ConnectionGUID: 4Bs2SNGaRR+o0dmpaX174w==
X-CSE-MsgGUID: hcumRXuGTmKTyVMiVR4Ufg==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="87535355"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="87535355"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 11:40:12 -0700
X-CSE-ConnectionGUID: p0tN9LYkQ7m/32rTaC39xA==
X-CSE-MsgGUID: BOG+KCNgRBKXU6X2jjpNUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="256302718"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 17 Jul 2026 11:40:11 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wknTk-00000000T1o-1jxs;
	Fri, 17 Jul 2026 18:40:08 +0000
Date: Sat, 18 Jul 2026 02:39:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-07-16 311/311]
 include/trace/events/asoc.h:31:114: error: invalid use of undefined type
 'struct snd_soc_component'
Message-ID: <202607180256.LSUXTVTR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-07-16
head:   e51d2e02d8d4c974132f00eec9d2215a476084f0
commit: e5cb44e887fc27a5ca0bcbcc673b11edb01174f8 [311/311] ASoC: soc-component: capsuling Component
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260718/202607180256.LSUXTVTR-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607180256.LSUXTVTR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607180256.LSUXTVTR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:132,
                    from include/trace/events/asoc.h:280,
                    from sound/soc/soc-core.c:43:
   include/trace/events/asoc.h: In function 'trace_event_get_offsets_snd_soc_dapm':
>> include/trace/events/asoc.h:31:114: error: invalid use of undefined type 'struct snd_soc_component'
      31 |                 __string(       comp_name,      snd_soc_dapm_to_component(dapm) ? snd_soc_dapm_to_component(dapm)->name : "(none)")
         |                                                                                                                  ^~
   include/trace/trace_events.h:285:9: note: in definition of macro 'DECLARE_EVENT_CLASS'
     285 |         tstruct;                                                        \
         |         ^~~~~~~
   include/trace/events/asoc.h:29:9: note: in expansion of macro 'TP_STRUCT__entry'
      29 |         TP_STRUCT__entry(
         |         ^~~~~~~~~~~~~~~~
   include/trace/stages/stage5_get_offsets.h:59:29: note: in expansion of macro '__dynamic_array'
      59 | #define __string(item, src) __dynamic_array(char, item,                 \
         |                             ^~~~~~~~~~~~~~~
   include/trace/events/asoc.h:31:17: note: in expansion of macro '__string'
      31 |                 __string(       comp_name,      snd_soc_dapm_to_component(dapm) ? snd_soc_dapm_to_component(dapm)->name : "(none)")
         |                 ^~~~~~~~
>> include/trace/events/asoc.h:31:114: error: invalid use of undefined type 'struct snd_soc_component'
      31 |                 __string(       comp_name,      snd_soc_dapm_to_component(dapm) ? snd_soc_dapm_to_component(dapm)->name : "(none)")
         |                                                                                                                  ^~
   include/trace/trace_events.h:285:9: note: in definition of macro 'DECLARE_EVENT_CLASS'
     285 |         tstruct;                                                        \
         |         ^~~~~~~
   include/trace/events/asoc.h:29:9: note: in expansion of macro 'TP_STRUCT__entry'
      29 |         TP_STRUCT__entry(
         |         ^~~~~~~~~~~~~~~~
   include/trace/events/asoc.h:31:17: note: in expansion of macro '__string'
      31 |                 __string(       comp_name,      snd_soc_dapm_to_component(dapm) ? snd_soc_dapm_to_component(dapm)->name : "(none)")
         |                 ^~~~~~~~


vim +31 include/trace/events/asoc.h

a8b1d34f3ee1bc Mark Brown              2010-11-03  24  
6ef46a69ec32fe Luca Ceresoli           2024-03-06  25  	TP_PROTO(struct snd_soc_dapm_context *dapm, int val),
84e909303dbd3c Mark Brown              2010-11-04  26  
6ef46a69ec32fe Luca Ceresoli           2024-03-06  27  	TP_ARGS(dapm, val),
84e909303dbd3c Mark Brown              2010-11-04  28  
84e909303dbd3c Mark Brown              2010-11-04  29  	TP_STRUCT__entry(
8855eb7d29400f Kuninori Morimoto       2025-11-11  30  		__string(	card_name,	snd_soc_dapm_to_card(dapm)->name)
8855eb7d29400f Kuninori Morimoto       2025-11-11 @31  		__string(	comp_name,	snd_soc_dapm_to_component(dapm) ? snd_soc_dapm_to_component(dapm)->name : "(none)")
84e909303dbd3c Mark Brown              2010-11-04  32  		__field(	int,		val)
84e909303dbd3c Mark Brown              2010-11-04  33  	),
84e909303dbd3c Mark Brown              2010-11-04  34  
84e909303dbd3c Mark Brown              2010-11-04  35  	TP_fast_assign(
2c92ca849fcc6e Steven Rostedt (Google  2024-05-16  36) 		__assign_str(card_name);
2c92ca849fcc6e Steven Rostedt (Google  2024-05-16  37) 		__assign_str(comp_name);
84e909303dbd3c Mark Brown              2010-11-04  38  		__entry->val = val;
84e909303dbd3c Mark Brown              2010-11-04  39  	),
84e909303dbd3c Mark Brown              2010-11-04  40  
6ef46a69ec32fe Luca Ceresoli           2024-03-06  41  	TP_printk("card=%s component=%s val=%d",
6ef46a69ec32fe Luca Ceresoli           2024-03-06  42  		  __get_str(card_name), __get_str(comp_name), (int)__entry->val)
84e909303dbd3c Mark Brown              2010-11-04  43  );
84e909303dbd3c Mark Brown              2010-11-04  44  

:::::: The code at line 31 was first introduced by commit
:::::: 8855eb7d29400fb7b2882da33725db2801c410e4 ASoC: asoc.h: convert to snd_soc_dapm_xxx()

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
