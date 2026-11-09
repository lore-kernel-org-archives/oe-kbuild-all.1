Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794244024;
	b=l5hzRqF0uktxnZw8F/fgUBBT2gHzw7II+PORJ6cYluVwqgg5DxE2tDC7h16XHe7hfqfQ
	 VU4wx91VooDFpTknatFeG2dUF8ER4FG6RsmEVq+GemIOLhFv+azruiHo9vtsP2BeW+W7c
	 AwdHbztmknaTR30aW2bYmpitcdxe0VCOrzpqirhQ+nGXOdWLCqY1ZvIRSv+nwE9WHX2WB
	 8+S8eiM2h4bZ8dolGvlfb1AhvUtnKdYgoF/7qH2dk17rJXnuRBQWF8eCh+fjBeIZ/qe2H
	 6HfaaqhoskDU/23nqtJP27R9bfbB1Q/yfWW3JEH2Js2Hstiz58XhJnypX3GFKfHEILg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794244024;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=06Zv0znhLmg5OavWY3OXVPPVdfJNKAX6s75bovII1PY=;
	b=qw/86XD+cMh22GTWnur7HyI/Tdu2AdQcs3ufuEVdsGQkoQpGkcXJC08sle3weeCH1KZ8
	 McQQ7QkqQU27WvKXkz5OdYjmDUJQ1TBMM1wX19bLuB41jPc07q79xf0faECzzcJVuqs/c
	 zPCziEHTA7dBjd+ngmcE4VGRMFzk/bupt+Qa3dbENi8Sllw+SRC/LvuvnsU1WPMluk4+B
	 Tqb8HB+L1qIqKV0TucyPdMOAA+e4OPBUTZLw8bnjmaWicCwcYXDoCbskLpLLvbnAOCjPJ
	 fLXPRuXYG3gf6kxQX4Z5Y3CWXzdqHG9rrBdKEzlx2F4/S883rwSRd0g7fWhI7kv5VCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AHwK5PAK;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06290606A31C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Nov 2026 17:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06290606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AHwK5PAK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794244024; x=1825780024;
  h=date:from:to:cc:subject:message-id;
  bh=GlHId5VbgqE/lXAPcIftpZWFIfHmatBERgf8idEpWrQ=;
  b=AHwK5PAKt7kVqi38DCVOqRPcNO2KLYzLYoVgs7Xj+xVKFKKgk0/RuduT
   mrrPBHK3pQRbX2lcpxXwzILUwoA9nc6YK6qppTSrs16z3XF7B+ikQNDAB
   j3AqQoH5hYiP0u32ldEA89SfFcMcWvJ1ZypQBHB1kOwl4GitTWI1KFLVf
   +Nv6ZEopd6QqZQVsyjjh6VUWQdVJSxt7umn3g042QtF/QhQlTLjaJkEsu
   O3Ut+VrfZuQ/01WaJJf91DzK4/Rv1plU2hCT75Xf6sahVSHJABz/e8giO
   A4g3/mSMy5lhSZM+WRa+KvwuQvJ63Q0WKXOqdNb5vs8fRY69hDjTcPJkn
   Q==;
X-CSE-ConnectionGUID: yLpXdsgkSQiwCo7iuRqQtg==
X-CSE-MsgGUID: Rj3qbP+NTl2H/0eZPbJUUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2853082"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2853082"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 09:07:03 -0800
X-CSE-ConnectionGUID: +unzSewUTUqL1uQCg1XoBQ==
X-CSE-MsgGUID: mkt3bj2xRUeVf0P9ByaceA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8346753"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 09 Nov 2026 09:07:00 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQSpd-000000000Pj-3O4U;
	Mon, 09 Nov 2026 17:06:57 +0000
Date: Mon, 09 Nov 2026 18:06:33 +0100
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Philip Radford <philip.radford@arm.com>, linux-doc@vger.kernel.org
Subject: [cris:scmi_telemetry_ng_V15 33/35] htmldocs:
 Documentation/userspace-api/stlm.rst:538: WARNING: duplicate label
 userspace-api/stlm:example, other instance in
 Documentation/userspace-api/stlm.rst [autosectionlabel.userspace-api/stlm]
Message-ID: <202611091845.fKYoQV7e-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git scmi_telemetry_ng_V15
head:   d51f22cab86f4ad2f08b4e88803f85fdffd81a62
commit: 1e746acbc11600662c1d751ca799c60bfcb2fd02 [33/35] Documentation: Add SCMI System Telemetry documentation
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.23, Python 3.13.5, on linux)
sphinx: sphinx-build 9.2.0
reproduce: (https://download.01.org/0day-ci/archive/20261109/202611091845.fKYoQV7e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611091845.fKYoQV7e-lkp@intel.com/

All warnings (new ones prefixed by >>):

   return 0;
   } [docutils]
>> Documentation/userspace-api/stlm.rst:538: WARNING: duplicate label userspace-api/stlm:example, other instance in Documentation/userspace-api/stlm.rst [autosectionlabel.userspace-api/stlm]
   WARNING: Unparseable C cross-reference: 'return'
   Invalid C declaration: Expected identifier in nested name, got keyword: return [error at 6]
   return
   ------^
   Documentation/gpu/rfc/gpusvm:70: ./drivers/gpu/drm/drm_gpusvm.c:70: WARNING: Lexing literal_block 'struct driver_range {\n        struct drm_gpusvm_range base;\n        unsigned int num_pages; // 1: inline_pages, >1: pages[]\n        union {\n                struct drm_gpusvm_pages inline_pages;\n                struct drm_gpusvm_pages *pages;\n        };\n};\n\nstatic struct drm_gpusvm_pages *\ndriver_pages(struct driver_range *drange)\n{\n        return drange->num_pages == 1 ? :c:type:`drange->inline_pages <drange>` :\n                                        drange->pages;\n}' as "c" resulted in an error at token: '`'. Retrying in relaxed mode. [misc.highlighting_failure]


vim +538 Documentation/userspace-api/stlm.rst

   528	
   529	 - SCMI_TLM_GET_SHMTI_LIST: Gather a list of open file descriptors, one for
   530	   each SHMTI memory area defined for this instance, that can be used to
   531	   memory-map such areas in the calling process address space so as to be
   532	   able to directly access the SCMI Telemetry SHMTI areas shared by the
   533	   platform firmware, and parse the TDCF format.
   534	   The SCMI Telemetry TDCF format is defined in the specification at [1].
   535	
   536	
   537	Example
 > 538	=======
   539	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
