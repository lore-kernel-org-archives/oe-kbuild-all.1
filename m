Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B52B22A7E4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 15:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766418025; cv=none; b=P0OPGF40Q6KPvfhGEr2XVTBylFbDcf625qZoEjWtwgfBdDUj4CBFnwIwS2K4uBgi7qS6VJowuPjzwrQjzPdQhPyRwAwQmsgyA2SAOpKpPWrI24iZrFPfk6WJEp9HSpJO7uzA4GioRhIY434xUd5+8Y/ndo9lSjl6IdIkS0a4d1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766418025; c=relaxed/simple;
	bh=TpOZb9Ula88X8E67IHKfQuIuJTY6DADi+wVJyD1yhUc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ABeAP8QREGmn5UkFzLMH6VBNR3MZ4kxzigx3IkBOFy1z4TGGzDkEWy4JrsPUr0/kr6sX1uR812Kqw3aXnbLYsoMVgelD8a5Ydw75bD0nkUzYLCfQayQ1p3HY1fMjEr9TZmbLXPgwPfJTDz+0RMocWp5geibM1f6R3pdRqu1/65c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bFttlJWG; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bFttlJWG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766418023; x=1797954023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TpOZb9Ula88X8E67IHKfQuIuJTY6DADi+wVJyD1yhUc=;
  b=bFttlJWGYw7uhAJUwNEt8/B9OeZY4NWhk6Pi5FA9xR257BE5sC/PaYqQ
   BNvKOw9rs0Cg6OC6Yj+eLuaErXF0UZT+GJjM1b0LVG+1MhCsxVEEuTaZo
   rB0q9a2+zNiTA2g6jh+xZEPTZ9LSdl8dBIuoQyxtqgysBRo4zzvuXXINm
   7O+JTmAF+l4V3luOrOL7ILvwww5GnBG7cIE1dYBI++Axa2KM30wjUoi6a
   H+ejrUn+oi25wilcOI/0mida6m5r5sNvhd+H/ExkWdDKBvT2n8REVQ8a9
   HWbZFpRwjRZQHl/NxVszBlEE1HvXiiDYnvbT/Cf4IRuRCDk6zUlUMUXPw
   A==;
X-CSE-ConnectionGUID: FDe9SISRQOqlLlX5w1UhRQ==
X-CSE-MsgGUID: +H1Cjz66SZ6CTVLB5OW2uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79726545"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="79726545"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 07:40:23 -0800
X-CSE-ConnectionGUID: OwTv2z1WTJSwMAqwnsAcsQ==
X-CSE-MsgGUID: PbpC0UMRRXGGnFdT9m3EQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="200053541"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 22 Dec 2025 07:40:22 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXi1D-000000005Y8-3n6V;
	Mon, 22 Dec 2025 15:40:19 +0000
Date: Mon, 22 Dec 2025 16:40:09 +0100
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [sashal:spec 57/131] htmldocs: Documentation/filesystems/splice:22:
 ./fs/pipe.c:1186: WARNING: Block quote ends without a blank line; unexpected
 unindent. [docutils]
Message-ID: <202512221640.OsojlLOw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git spec
head:   d34c22a9d280338fc8a0f12fd5577e62f345503e
commit: bd9f37decec6a41e77b2e9432155529859a72285 [57/131] kernel/api: add API specification for sys_pipe2
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512221640.OsojlLOw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221640.OsojlLOw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ERROR: Cannot find file ./include/linux/pipe_fs_i.h
   WARNING: No kernel-doc for file ./include/linux/pipe_fs_i.h
   Documentation/filesystems/splice:22: ./fs/pipe.c:1118: ERROR: Unexpected indentation. [docutils]
   Documentation/filesystems/splice:22: ./fs/pipe.c:1175: ERROR: Unexpected indentation. [docutils]
   Documentation/filesystems/splice:22: ./fs/pipe.c:1183: ERROR: Unexpected indentation. [docutils]
>> Documentation/filesystems/splice:22: ./fs/pipe.c:1186: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/filesystems/splice:22: ./fs/pipe.c:1192: ERROR: Unexpected indentation. [docutils]
   Documentation/filesystems/splice:22: ./fs/pipe.c:1195: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/filesystems/splice:22: ./fs/pipe.c:1201: ERROR: Unexpected indentation. [docutils]
   Documentation/filesystems/splice:22: ./fs/pipe.c:1203: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/filesystems/splice:22: ./fs/pipe.c:1209: ERROR: Unexpected indentation. [docutils]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
