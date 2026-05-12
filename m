Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C770B492514
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 09:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778577147; cv=none; b=tApkFAo+bo2pmtMhKSMYEuZSRTqkyy3S6duMfdvTigtnGgJYTMPVpAy/pR/NBr+wYXyuYxI9piAh89QXSaatuGW+VV/JdVrkKilj+XuIOoXgz48IrXhoO1Q7bx1Ui0Er2ylp+VehClgpASUCX7rSNF2IfZxGubzV3uLnXOwWlgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778577147; c=relaxed/simple;
	bh=iekAxXkYLqBcJH8M0Wodx1mu/u2fO3FFSpAWfNRqN9E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ihvSCcSgWeufA5l5K4auVzX+nOA0i8S24mVWChmOq2IkxWIO/VX5TZCeJRn0YvYGH/VVtQ/5nYTxyD3iDQTCmIrzOIpdSy82inidy6tKxziyYPZC9U9zoDBB+0qJhm4LzU/ldshDshyexbB8spAp/2XH4F0LNQgE7heLj3IO5sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jTjr3u7a; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jTjr3u7a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778577146; x=1810113146;
  h=date:from:to:cc:subject:message-id;
  bh=iekAxXkYLqBcJH8M0Wodx1mu/u2fO3FFSpAWfNRqN9E=;
  b=jTjr3u7a69Y30hBkWvEpXNlxzikG2Cq1xYbY0teV1vHPXA49vQuTMq1y
   ZAvWTamhCMvSJBvWUVTGyRkeXwCiwKUwKabXxC/5AJSXJ7/HvRieEsci1
   9OuClRSZCkj6LLjFhsTuKUrjD0qnunmWlreY3blSHFO/CEZchBYDh3KrX
   PIrzooVa1SQ0vyp5XdK+GSJ32e4q57HBEb19M6tBkRbj3JBkAYEnC27ci
   CRfUPGdCUVK1eY6t8uIRRlnRJPS5Ek9qChCBv/Fazju8SHOFfFUpNIAAq
   SB5/ElKfeT9QhQs6p8Ie7PvFMKEz/sfA5NTe6tBCat5isQ3u3Vp755KPg
   w==;
X-CSE-ConnectionGUID: HlWErNCbSsGoucGwWbVETw==
X-CSE-MsgGUID: zayNwyUkRoi7fbRr/YOH5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79197970"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="79197970"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 02:12:25 -0700
X-CSE-ConnectionGUID: pD9Fvw+jQ9epXc7gSO+zpQ==
X-CSE-MsgGUID: fz6F6oBsSjCctYUzOOknDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="237804852"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 12 May 2026 02:12:24 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMjA5-000000008F5-47Ga;
	Tue, 12 May 2026 09:12:21 +0000
Date: Tue, 12 May 2026 11:11:39 +0200
From: kernel test robot <lkp@intel.com>
To: Antony Antony <antony.antony@secunet.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs:
 Documentation/networking/xfrm/xfrm_migrate_state.rst:16: WARNING: Inline
 emphasis start-string without end-string. [docutils]
Message-ID: <202605121137.SVAB7gcL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Antony-Antony/xfrm-remove-redundant-assignments/20260512-083513
head:   f4157abfb15003887443e17542963d7b2c96cab6
commit: f4157abfb15003887443e17542963d7b2c96cab6 xfrm: add documentation for XFRM_MSG_MIGRATE_STATE
date:   8 hours ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260512/202605121137.SVAB7gcL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605121137.SVAB7gcL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Checksumming on output with GSO
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ [docutils]
>> Documentation/networking/xfrm/xfrm_migrate_state.rst:16: WARNING: Inline emphasis start-string without end-string. [docutils]
   MAINTAINERS:40: WARNING: Inline strong start-string without end-string. [docutils]
   Documentation/userspace-api/landlock:504: ./security/landlock/errata/abi-4.h:5: ERROR: Unexpected section title.


vim +16 Documentation/networking/xfrm/xfrm_migrate_state.rst

    15	
  > 16	Because IKE daemons such as *wan manage policies independently of
    17	the kernel, this interface allows precise per-SA migration without
    18	requiring policy involvement. Optional netlink attributes follow an
    19	omit-to-inherit model: omitting an attribute preserves the value from
    20	the old SA. The ``flags`` field controls two exceptions: hardware offload
    21	is inherited by default and can be suppressed with
    22	``XFRM_MIGRATE_STATE_NO_OFFLOAD`` or overridden with ``XFRMA_OFFLOAD_DEV``;
    23	the new selector is taken from ``new_sel`` by default and can instead be
    24	derived from the new addresses with ``XFRM_MIGRATE_STATE_UPDATE_SEL``.
    25	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
