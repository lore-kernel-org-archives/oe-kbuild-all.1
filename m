Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5DE21CA02
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Apr 2026 10:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777287046; cv=none; b=K/rcu86OuqEy+XARtNmrk7bWv7k9uj/n3vWBY2VnWHS/KjDNiWem8H/64aMmoTUbKZ131AEfLj96FJhhroYkpyx+dNIlfNRRXbnDygqGjl5whoy2sJI+mINbnSEGZ7dv5kLomN9Z0WnVWTVw+2RFDpXVLSenTrUI+JOIFIG8hWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777287046; c=relaxed/simple;
	bh=zl87Po6zv+ejdEpB80YZMFUZL+X0od7QrwVhwGH2On8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ntCYwXTq6Cf8AiF7MLbU6Daa/GtDm9ktlNREBR+Ic4uS9+5au2zO50bedwO1b/n9ri1PqznAB0cmmB+aSEvOaLdr8Iq6WMTLhu0BtwvyktfviWLJbnQDTNyUo8baLaRPx38qHwTJ9PJLZbBMrzUAtSQ2Ty8rjewoj8XdnN2iQ5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y7ha5gb9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y7ha5gb9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777287045; x=1808823045;
  h=date:from:to:cc:subject:message-id;
  bh=zl87Po6zv+ejdEpB80YZMFUZL+X0od7QrwVhwGH2On8=;
  b=Y7ha5gb9zzqJyGmTdw9gF53skhOehnubavl71mWeKUuXdT4lPqwFsTrm
   FwVYgvLI0pAsUPVNzb8jxAG6cdm1hL7Q/iLl4m0SZbCFeWyy3/kIv3rZW
   IBnc1dATQoAUm/DjjLLH7fabsflbFETjce6MM1iouAvOeHKG9UKDwgLPL
   oKTHTNwlExfrPqs0esLYevVmt1dPhLVYRev4hyFuiZL/8bUbNwlLtWl2c
   z62iFOP4CurT5OtUmvCHFXUPTiWgUOYz6AGA4NVMI/Q8LyB0C86Lf1cAX
   D68fQpvpmWfqqA2B7P93gKecjyBT001yKKt0xoLWPV13cOuleFSohblFr
   A==;
X-CSE-ConnectionGUID: VwpKXifqQ56PoLrGmNdP4w==
X-CSE-MsgGUID: tNucGKJpR/yWTeVGE+Kz3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="77329213"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="77329213"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 03:50:44 -0700
X-CSE-ConnectionGUID: Zqvemqv8RASQjj92OHuzxw==
X-CSE-MsgGUID: iAjEWndWSDGfnNCBAjmjkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="257128478"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 27 Apr 2026 03:50:43 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHJY0-0000000040z-3m8F;
	Mon, 27 Apr 2026 10:50:40 +0000
Date: Mon, 27 Apr 2026 12:49:45 +0200
From: kernel test robot <lkp@intel.com>
To: Sen Wang <sen@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 linux-doc@vger.kernel.org
Subject: [broonie-ci:asoc-7.2 29998/30000] htmldocs:
 Documentation/sound/codecs/tas675x.rst:659: WARNING: Title underline too
 short.
Message-ID: <202604271204.SpaDre2F-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git asoc-7.2
head:   a960faa424ae459a7843da2734fa51580814b89a
commit: ba46edca354e66d71d176bb88fe1c01594c45871 [29998/30000] Documentation: sound: Add TAS675x codec mixer controls documentation
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260427/202604271204.SpaDre2F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604271204.SpaDre2F-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Checksumming on output with GSO
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ [docutils]
   MAINTAINERS:40: WARNING: Inline strong start-string without end-string. [docutils]
>> Documentation/sound/codecs/tas675x.rst:659: WARNING: Title underline too short.
--
   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:45: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:50: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:559: ./include/uapi/linux/landlock.h:168: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:559: ./include/uapi/linux/landlock.h:191: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/sound/codecs/tas675x.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/networking/skbuff:36: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]


vim +659 Documentation/sound/codecs/tas675x.rst

   657	
   658	Overtemperature Shutdown (0x87)
 > 659	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   660	
   661	  ========  ==========================================
   662	  Bits      Description
   663	  ========  ==========================================
   664	  [4]       Global OTSD
   665	  [3:0]     CH1-CH4 OTSD respectively
   666	  ========  ==========================================
   667	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
