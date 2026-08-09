Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EDA1FB1
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Aug 2026 14:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786284984; cv=none; b=HHMKxXruI0E84OeFa1jJsEb0pbWgSEcSQtAZ5vfGKltFEWOFkmtsbe6cWpbHSoX2rujR2NSwpDEdkogptPwfrayAz++6xixy63a838wQtuRt85RiubvjntX9KXumCyMJFNoWSd19l1TWFiSWXHZRh64fYEKs5u9+o2OlOjIAu5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786284984; c=relaxed/simple;
	bh=6e5flQlFTMNI8b5WV/pVIAQf86ysXhID9hdEkUvW9E8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V4+heuAhe0ZVcvwxfH/MqhUXg1zcTr0hVtFwOKVHpijVotAxMKXvvkjYpPIXvPYKPAMQ6Bx48I0jPbCYzb9yR8DBtOKlBxqfaeS6+FJSTJGFUNg3rRLEOYnCWCfF6CRvdRUB2T4NaieoYCm2J27pZ1QfKeG4pvsgj1JME0qPU2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TGcM1slh; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TGcM1slh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786284982; x=1817820982;
  h=date:from:to:cc:subject:message-id;
  bh=6e5flQlFTMNI8b5WV/pVIAQf86ysXhID9hdEkUvW9E8=;
  b=TGcM1slhtfdq40xh17Ph8RRk4Q7dhPOYKawWV7oOCUOM+s4NBtzlJbwl
   2jLjN+TwRRHBst2MMk9I/2zFQk7YNujB4PcZGRmC6FDgmrFKW1FLxszm0
   mfPjlC3i55QSqlnRkmTzCNFHIbH75qDN+1B1W9OnnPSKbxaT3dufwG6Fh
   KYcd8j879JdXlGBWinjVcXXFTxwKDXbnc1+ZcgDdg/8iWjkwbhW7k5L9d
   4b7kUUxdkniOX5UclYM/JynL+h7SUWulL7Q8UlDEbiYO0JJYALwpJjc7A
   JSeUi65KxErbCGSDEVnL+V1FpAu+wB/X5TyzZMZt9HHP3KB8SXgEak+HL
   A==;
X-CSE-ConnectionGUID: J2LuNMMeQGC0QO2pqETqfg==
X-CSE-MsgGUID: YZhC6fmOQLy+kua+lAQSNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="85785593"
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="85785593"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2026 07:16:21 -0700
X-CSE-ConnectionGUID: Cywq5cL6TzeIln2B7qwI0g==
X-CSE-MsgGUID: JjNiDoknQpisWeefXx4Qjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="292728587"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Aug 2026 07:16:20 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wt4K1-00000000LvF-1lO2;
	Sun, 09 Aug 2026 14:16:17 +0000
Date: Sun, 09 Aug 2026 22:15:43 +0800
From: kernel test robot <lkp@intel.com>
To: sofus <sofus.c@icloud.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/240-isp 65/67]
 drivers/media/platform/apple/avd/avd-av1.c:586:47: warning: suggest
 parentheses around arithmetic in operand of '|'
Message-ID: <202608092125.rKg4nmH8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   6b01d08e5d4d33d4a7cdfb1ecea6f78e295bfd75
commit: 0d6dcb9b11b41af215b8a8443b0e3f7d5aa6c110 [65/67] media: apple: avd: add av1 support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260809/202608092125.rKg4nmH8-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260809/202608092125.rKg4nmH8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608092125.rKg4nmH8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/apple/avd/avd-av1.c:27:
   drivers/media/platform/apple/avd/avd-av1.c: In function 'set_refs':
   drivers/media/platform/apple/avd/avd-av1.c:115:33: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     115 | #define AV1_GM_TYPE(v)          FIELD_PREP(GENMASK(31, 30), v)
         |                                 ^~~~~~~~~~
   drivers/media/platform/apple/avd/avd-inst.h:195:41: note: in definition of macro 'push'
     195 | #define push(inst, name) push(avd, ctx, inst)
         |                                         ^~~~
   drivers/media/platform/apple/avd/avd-av1.c:315:30: note: in expansion of macro 'AV1_GM_TYPE'
     315 |                         push(AV1_GM_TYPE(gm->type[ref_idx]) |
         |                              ^~~~~~~~~~~
   drivers/media/platform/apple/avd/avd-av1.c: In function 'set_header':
>> drivers/media/platform/apple/avd/avd-av1.c:586:47: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
     586 |                         frame->upscaled_width - 1, "upscaled_width");
         |                         ~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/media/platform/apple/avd/avd-inst.h:195:41: note: in definition of macro 'push'
     195 | #define push(inst, name) push(avd, ctx, inst)
         |                                         ^~~~


vim +586 drivers/media/platform/apple/avd/avd-av1.c

   582	
   583		/* TODO: this is wrong, maybe has something to do with superres */
   584		push((frame->flags & V4L2_AV1_FRAME_FLAG_USE_SUPERRES ?
   585				(frame->superres_denom - 1) << 28 : 0) |
 > 586				frame->upscaled_width - 1, "upscaled_width");
   587		/* something superres related? test35 */
   588		push(0x200000, "flag_unk0");
   589		push(0x200000, "flag_unk1");
   590	
   591		u8 restoration_unit_size[V4L2_AV1_NUM_PLANES_MAX] = { 3, 3, 3 };
   592	
   593		if (lr->flags & V4L2_AV1_LOOP_RESTORATION_FLAG_USES_LR) {
   594			restoration_unit_size[0] = 1 + lr->lr_unit_shift;
   595			restoration_unit_size[1] =
   596				1 + lr->lr_unit_shift - lr->lr_uv_shift;
   597			restoration_unit_size[2] =
   598				1 + lr->lr_unit_shift - lr->lr_uv_shift;
   599		}
   600	
   601		push(AV1_LR_TYPE0(frame->loop_restoration.frame_restoration_type[0]) |
   602				AV1_LR_TYPE1(frame->loop_restoration.frame_restoration_type[1]) |
   603				AV1_LR_TYPE2(frame->loop_restoration.frame_restoration_type[2]) |
   604				AV1_LR_UNIT0(restoration_unit_size[0]) |
   605				AV1_LR_UNIT1(restoration_unit_size[1]) |
   606				AV1_LR_UNIT2(restoration_unit_size[2]), "lr");
   607	
   608		push(0, "cnst3");
   609		push(0, "cnst3");
   610		pusha(av1_ctx->bufs.pipe_state.addr, "pipe_state", 0);
   611		for (i = 0; i < 10; i++)
   612			pusha(av1_ctx->bufs.const_unk[i + 2].addr, "const_unk", i + 2);
   613	
   614		push(0, "mark_section");
   615	
   616		push_rvra(avd, ctx, run->addresses.rvra, ctx->rvra.offsets);
   617	
   618		push(0, "");
   619		push(0, "mark_section");
   620	
   621		bytesperline = ctx->decoded_fmt.fmt.pix_mp.plane_fmt[0].bytesperline;
   622		pusha(run->addresses.y, "y", 0);
   623		push(bytesperline, "bytesperline_y");
   624		pusha(run->addresses.uv, "uv", 0);
   625		push(bytesperline, "bytesperline_uv");
   626	
   627		push(0, "mark_section");
   628	
   629		push(AVD_HDR_HEIGHT(frame->frame_height_minus_1) |
   630				AVD_HDR_WIDTH(frame->frame_width_minus_1),
   631				"height_width_3");
   632		if (!intra_only || intrabc)
   633			set_refs(ctx, run);
   634	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
