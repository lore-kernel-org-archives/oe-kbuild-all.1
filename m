Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794865773;
	b=TqCwTSMvnpf5wu2ggaSxZcxMaZJnDiDgEtCH+UAnKAzrJJXzoJneL9cO2+loiJ4tNk2T
	 yBkeEwBy1dBjY9AhAgUM1XwFUyyy5lYwUnnZIHOkajO3C20blWWX+vBrSMFISYRONOvFC
	 BbTXihzYa0wObRV5yNJKx1h7PLjCSFlr0mhWofTU2fh8Y4R6VRIjgo89Qnz/60Z/TwW/K
	 l+P+XoZnLdWXNTqtPXNpLh9YHnIkoU2PETvWiXkA5eTl0MJ6P/Pa3XyCTTS981t6rBnz+
	 hhf2mbaD2QNVqU+T75C1Abu5ma1cA11eog1SR/2dqDgGTSSLgi++dz1FAb+QiQPjJrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794865773;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=wT5N+IRhpq9AJ6TwGBqN9ZuzHB+gRVohc6vy3meAP5Q=;
	b=CKUhZ24DrwJcSGyMx+I1dxgXCl7cAlbYF3rO/J4HXietoTgJ71Qn8F/9ksGF42xWykBo
	 xstrI3NH75WDl+8wjTlqdqiLEoqeM+0EZK8gq89K39t6X+10tvjmBg/8xFc9oA+JBNPrd
	 rk2h/oSatbmYcK8s3LxPqhwPmjHI7799cdcRWcnhvO8yCSManJDTVWpuozClsFkvbx+uu
	 wwooE/UHaF6TKRHnm+pEFHS605CZazMgwtNiSBA+O1okr/eMMtptphcyqxOZ94qYdRu8r
	 eT9ppBgIXISKge5fyFnfDGKlUQCnoJTQON+golMfLb+9OE1C2DZOjvnrrHPv9+l0bow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S3hkfwad;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2578606A323
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 21:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2578606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S3hkfwad
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794865773; x=1826401773;
  h=date:from:to:cc:subject:message-id;
  bh=LAAePUNsKB9L20ZXpjCry9I0wkQK+3GCG6xJwZ1T52Y=;
  b=S3hkfwadnQeii6JbGPnoroFhRyMYoKUJm5wqUUtUOfY355X3vNS/I6m2
   48OI5SsBzr2Lg045Q4B+K0nwoJ5tlBQ1xTqy3e7FaryIYFsvmXmRQMLB9
   FwisVRBN/HLhu8LHs5VmvhTM3OgOETOHZUEm2WvDqytwDVP5alQ0DYw+C
   wlPcY4MrwyfVJ2cl/hgaXABUPKTC67WJn8uAeisDpGhfUdt0Owjjfp8k0
   gWYkpvbnQNm/IUM843KDfs+9mzjqCnsVu9Nx522OP5jjzw8AdUJ2L2QHc
   KZ5l92ynIgnUOVst2f8nx1Fd2alCXAI6XTqHoSduPDByUcAx/rVn43QDc
   A==;
X-CSE-ConnectionGUID: 3mTVNjalSLSvovphRILleQ==
X-CSE-MsgGUID: HV8PRSbkTOCVS/m0V0FUJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3724475"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3724475"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:49:33 -0800
X-CSE-ConnectionGUID: iUv6rSQaSHuKLIqInT5e7w==
X-CSE-MsgGUID: AA2l1M3CRAO4FXiYEJ6J1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9635591"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 16 Nov 2026 13:49:31 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT4Zr-000000002oc-2msv;
	Mon, 16 Nov 2026 21:49:27 +0000
Date: Mon, 16 Nov 2026 22:48:39 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 152/152] htmldocs:
 ./include/uapi/linux/dpll.h:103: warning: Enum value
 'DPLL_CLOCK_QUALITY_LEVEL_ITU_OPT1_PRC' not described in enum
 'dpll_clock_quality_level'
Message-ID: <202611162241.5h3xWVdS-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   c5e3d3a3d3b60eb95c36e3c49dbfe7a34c220c5a
commit: 65fbd20d67de214c64a7e658f50adc30e5fbd73e [152/152] dpll: add clock quality level attribute and op
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.23, Python 3.13.5, on linux)
sphinx: sphinx-build 9.2.0
reproduce: (https://download.01.org/0day-ci/archive/20261116/202611162241.5h3xWVdS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611162241.5h3xWVdS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Using alabaster theme
>> ./include/uapi/linux/dpll.h:103: warning: Enum value 'DPLL_CLOCK_QUALITY_LEVEL_ITU_OPT1_PRC' not described in enum 'dpll_clock_quality_level'
>> ./include/uapi/linux/dpll.h:103: warning: Enum value 'DPLL_CLOCK_QUALITY_LEVEL_ITU_OPT1_SSU_A' not described in enum 'dpll_clock_quality_level'
>> ./include/uapi/linux/dpll.h:103: warning: Enum value 'DPLL_CLOCK_QUALITY_LEVEL_ITU_OPT1_SSU_B' not described in enum 'dpll_clock_quality_level'
>> ./include/uapi/linux/dpll.h:103: warning: Enum value 'DPLL_CLOCK_QUALITY_LEVEL_ITU_OPT1_EEC1' not described in enum 'dpll_clock_quality_level'
>> ./include/uapi/linux/dpll.h:103: warning: Enum value 'DPLL_CLOCK_QUALITY_LEVEL_ITU_OPT1_PRTC' not described in enum 'dpll_clock_quality_level'
>> ./include/uapi/linux/dpll.h:103: warning: Enum value 'DPLL_CLOCK_QUALITY_LEVEL_ITU_OPT1_EPRTC' not described in enum 'dpll_clock_quality_level'
>> ./include/uapi/linux/dpll.h:103: warning: Enum value 'DPLL_CLOCK_QUALITY_LEVEL_ITU_OPT1_EEEC' not described in enum 'dpll_clock_quality_level'
>> ./include/uapi/linux/dpll.h:103: warning: Enum value 'DPLL_CLOCK_QUALITY_LEVEL_ITU_OPT1_EPRC' not described in enum 'dpll_clock_quality_level'
   ./drivers/firmware/stratix10-svc.c:180: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
   * svc_mem_lock protects access to the svc_data_mem list for
   ./include/linux/i3c/master.h:317: warning: Enum value 'I3C_ADDR_SLOT_EXT_STATUS_MASK' not described in enum 'i3c_addr_slot_status'
   ./drivers/base/core.c:1994: warning: Excess function parameter 'con' description in '__fw_devlink_relax_cycles'
   ./fs/eventpoll.c:2325: warning: Function parameter or struct member 'ep' not described in 'ep_get_upwards_depth_proc'


vim +103 ./include/uapi/linux/dpll.h

    81	
    82	/**
    83	 * enum dpll_clock_quality_level - level of quality of a clock device. This
    84	 *   mainly applies when the dpll lock-status is DPLL_LOCK_STATUS_HOLDOVER. The
    85	 *   current list is defined according to the table 11-7 contained in ITU-T
    86	 *   G.8264/Y.1364 document. One may extend this list freely by other ITU-T
    87	 *   defined clock qualities, or different ones defined by another
    88	 *   standardization body (for those, please use different prefix).
    89	 */
    90	enum dpll_clock_quality_level {
    91		DPLL_CLOCK_QUALITY_LEVEL_ITU_OPT1_PRC = 1,
    92		DPLL_CLOCK_QUALITY_LEVEL_ITU_OPT1_SSU_A,
    93		DPLL_CLOCK_QUALITY_LEVEL_ITU_OPT1_SSU_B,
    94		DPLL_CLOCK_QUALITY_LEVEL_ITU_OPT1_EEC1,
    95		DPLL_CLOCK_QUALITY_LEVEL_ITU_OPT1_PRTC,
    96		DPLL_CLOCK_QUALITY_LEVEL_ITU_OPT1_EPRTC,
    97		DPLL_CLOCK_QUALITY_LEVEL_ITU_OPT1_EEEC,
    98		DPLL_CLOCK_QUALITY_LEVEL_ITU_OPT1_EPRC,
    99	
   100		/* private: */
   101		__DPLL_CLOCK_QUALITY_LEVEL_MAX,
   102		DPLL_CLOCK_QUALITY_LEVEL_MAX = (__DPLL_CLOCK_QUALITY_LEVEL_MAX - 1)
 > 103	};
   104	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
