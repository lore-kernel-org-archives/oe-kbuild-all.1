Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028A3451049
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 23:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769039844; cv=none; b=ivBCC786no9o4BY+0LVAzcjmJTP/i0JhMRmJa2tg4YKR2W3+ARBVi8GgHaTeGf7PsEFJlrdphQxFKqq+CgcvzOuzB77bNAlBtFIi5SMoYPfABc4UTWtuN1epLIem7DeHrnba8vQvM9jtZa615tx3SQe4BTKe7cA2HekOnPRUcbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769039844; c=relaxed/simple;
	bh=jRsccQn6+ydSvvfm82E2TNwESINFXUo7HBfz3cDR3yY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jJOPqrv2SfWCwTUVSh5y42uzaeN7sMcZkYg4uLGWCYINONoULzi30lh8G9mAzE6WgRTlhLJIX7nsDlLEpTV6NZ5i72gVzQmPlY2v2D9c0JXnYyEcQeSSykZL15gAZXSX8ZpgS3vHqD0ScXlkkXiFHb/GLSXq3Ne4jl0oDtpo+Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ClQjSdFj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ClQjSdFj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769039842; x=1800575842;
  h=date:from:to:cc:subject:message-id;
  bh=jRsccQn6+ydSvvfm82E2TNwESINFXUo7HBfz3cDR3yY=;
  b=ClQjSdFj4szJ8K7JJpuWymawdUFzOV1t+i/yxvmEmqPPBMrNgFIL2l1k
   F1/hTGhD91n7/iho6VZ4DKxze1s0rO0xDSILX3/lqgeXDOurX1HzmaAJS
   wY1nAkjobL2GtsM38kLELT8ijyZ/OIrqzCV0l8gwSUQWdNleqJpSsWUPE
   fEHoyVlYGLcqnbz1uL7tciXZS5NqE1XDt8qpQhhA+iP8zmtTrqT0I5uHi
   9Ja/FDUUJBPyv6lSBJkpCvOyxJT/aYJtoIuDpLTkbuC7uYmb8uCH1duHg
   NDEBwCFaAtG1nd/V34iaCBokbI5HEXTX/tUC5TY3yUTdXi5x6zAPiNDlF
   w==;
X-CSE-ConnectionGUID: qsnCkHqGTuiI2XgKCz1VKw==
X-CSE-MsgGUID: BDwBEfWES+CurDVpLaenKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="74131016"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="74131016"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 15:57:21 -0800
X-CSE-ConnectionGUID: 3dc4opW2TYeU8ang5oFatg==
X-CSE-MsgGUID: QznjsgFWSN25GvNj0XyeSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="206635549"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 Jan 2026 15:57:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vii4b-00000000SB9-3yho;
	Wed, 21 Jan 2026 23:57:17 +0000
Date: Thu, 22 Jan 2026 07:57:09 +0800
From: kernel test robot <lkp@intel.com>
To: Brendan Jackman <jackmanb@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bjackman:lkp/page_alloc-unmapped 8/19] Warning:
 mm/page_alloc.c:486 expecting prototype for get_pfnblock_migratetype().
 Prototype was for get_pfnblock_freetype() instead
Message-ID: <202601220705.hktLVgls-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/bjackman/linux lkp/page_alloc-unmapped
head:   e3d15ba96c69587b064e8334327d0a581ff9a747
commit: 921fbc8aef7b569f5845a775c1e1bd9dcb1c1fdf [8/19] mm: introduce freetype_t
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260122/202601220705.hktLVgls-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601220705.hktLVgls-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601220705.hktLVgls-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/page_alloc.c:486 expecting prototype for get_pfnblock_migratetype(). Prototype was for get_pfnblock_freetype() instead
>> Warning: mm/page_alloc.c:3275 function parameter 'freetype' not described in '__putback_isolated_page'
>> Warning: mm/page_alloc.c:3275 function parameter 'freetype' not described in '__putback_isolated_page'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
