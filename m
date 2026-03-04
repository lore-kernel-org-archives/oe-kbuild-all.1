Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA06F3542E1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Mar 2026 09:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772616851; cv=none; b=S/2bBmliWGpLoZ9CWH+6YixnZw5DhSMX3HBoykTC5d46DP3YzlMwNuZHWCI+ixWhM9Ta7BQU8ykMvGhYwvxS25YICQmUH9VxEiKH1k9nmnNhtBxhuURawn1HXoTS5K9qjBv8IQA0RMhsANQlqtKDEO3Bwv6srYzZPmhJb7J824Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772616851; c=relaxed/simple;
	bh=rVMSRZSBr2RGjah6QOgVXQGRMyVl5PilfMGyFJFslXw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K951hFcAU0SQiUSR5/qRpPfsozPMvHLIwUN4CLjhD/G+ohiE/hW4hwtxMkAj3G3ClZAfUTij2v5GNOL7V6rdmJeQwmKwqXlXElaWDK5elPZtp63qsvjRXwzooq4Fda2M4253yL0ucKNz8tQqzksNhxYjuUDN4nkzDEILwVx1vpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZyuWb6H8; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZyuWb6H8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772616849; x=1804152849;
  h=date:from:to:cc:subject:message-id;
  bh=rVMSRZSBr2RGjah6QOgVXQGRMyVl5PilfMGyFJFslXw=;
  b=ZyuWb6H8HE5dnIvQoZrdUAyIyH8J7TtCprJqyf6HvcN+979F9S6pf55i
   xcQbh3sTWp77cbgtEWD0ji6u0YsExrj3vRUsHS5API0OKZh8PlGaluUiJ
   BhiGz4fQLT+zK9HgsMpdb2QM0cPZbuj/AfP5w8p4+bJ4DtHvB85x76kIr
   QgbmVRKwFbybtMH9Hhq1Ti0h9UnS3UQKD+L+y7nw/FQmTe+vydaLp7Scx
   IJuXg6N5c6l36J9wIWPTOd0XZhm+PoEUCCK9btl13aM1Nl5467XqnYW3T
   5PSzI0Y51oSAsZUsph1v7cQl2XdnP4ClmnkEVQe5trJKsi+vYB5GLg0jZ
   Q==;
X-CSE-ConnectionGUID: UmOWuHAUTfaeUH38fbkw4g==
X-CSE-MsgGUID: bcni5BSDTaGUvPgHk16jhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73581162"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="73581162"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 01:33:29 -0800
X-CSE-ConnectionGUID: 52pyKQL2RLaXE9ZEHc+GJQ==
X-CSE-MsgGUID: yK1wucErStqNpcJEhuDZ/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="218239882"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 04 Mar 2026 01:33:27 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxibd-000000001f3-0iKg;
	Wed, 04 Mar 2026 09:33:25 +0000
Date: Wed, 04 Mar 2026 10:33:11 +0100
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [sashal:dedup-lsb128 1/11] htmldocs:
 Documentation/admin-guide/kallsyms-lineinfo.rst:3: WARNING: Title overline
 too short.
Message-ID: <202603041049.T1HfVEbS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git dedup-lsb128
head:   925cdd8d45fb4adec025cfe8e42abfa0dafa9a46
commit: 340fcb4bf8938a649242cde84aa7bafe17dd5325 [1/11] kallsyms: embed source file:line info in kernel stack traces
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260304/202603041049.T1HfVEbS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603041049.T1HfVEbS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/devicetree/dt-object-internal.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,^Documentation/scheduler/sched-pelt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,(Documentation/translations/[
   Using alabaster theme
>> Documentation/admin-guide/kallsyms-lineinfo.rst:3: WARNING: Title overline too short.


vim +3 Documentation/admin-guide/kallsyms-lineinfo.rst

     2	
   > 3	==================================
     4	Kallsyms Source Line Info (LINEINFO)
     5	==================================
     6	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
