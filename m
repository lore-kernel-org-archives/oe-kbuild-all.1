Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E63437F8B0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206025; cv=none; b=JvJS5+jodwqi7ytYwOIglOtZZ72DBVc+yEVPXVR7GAVvyV385BKugcYUUCtZFxyOR8vIZ8gqX1T8nz6laVdU9YZbKbGVMyqdGeSIWLseFurBpLsA3xwXM3xRX/hYcoPtWYLjaMhnouTAx/H5UkTmDKfDX+o/nz8SweoTb1wIG2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206025; c=relaxed/simple;
	bh=Lfka4wRcIM9Lzx2LOqAOAIzl3tNzI5DU5r43qi52bOI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ya7ZyzxOuSuZTqmwTb69BquLE7pkA/Dz8bD4oArLHQOyxD9ESptOgcCUTAIGX0KFA/Lx1N+Nh0n2xgie4+f7O/5TmXbHl1Xz7RDXcQcxHf53OVRATGdmEpeyx7sM3F2OFNJ+et/AgqOBmCTziuPkKVLMcfjaQudn0uFLx3Y5IJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WCcU240U; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WCcU240U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775206024; x=1806742024;
  h=date:from:to:cc:subject:message-id;
  bh=Lfka4wRcIM9Lzx2LOqAOAIzl3tNzI5DU5r43qi52bOI=;
  b=WCcU240Uo6IfDdK3CNRO2MckCtxWupsC5Aaml4ERDBWXsIftvvHV7wCr
   d6oQOtC/gjH0h1jfbJNaGa1ZindiHAcT3Es7zVGiu5HN1BmWXbetdauT2
   V+sEnyAstZfC4bvVolH7SeTvVJ6Ch56kiNI4aH+JZOOJqh6/7rOW3y/FZ
   XlCiek445wYx4vZ+drpyCoDDNf7A+s5oy0SF519Fcb42XiK0/Ry0BN76c
   YHXpa2eyu/KhK6shShNZF+7w8KfByodxRvmwLWa88dpuS6X3aDXGjyjTa
   /JoGZlxSjj754QvlCaFBWPutakag2c0JAnJ4Nv43IMNotaTa3hKBPw+Ts
   g==;
X-CSE-ConnectionGUID: e4jTDAP3TtSOX4/xdIu7sw==
X-CSE-MsgGUID: gHiJe3PnQ1OZQgrJwzsJwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75312105"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="75312105"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:47:01 -0700
X-CSE-ConnectionGUID: nh+kkF8AR32R+sOjqMRdIQ==
X-CSE-MsgGUID: vNKQfNrhRe6U7AC2kIGinA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="250287312"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Apr 2026 01:46:59 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8aB6-0000000016w-49iK;
	Fri, 03 Apr 2026 08:46:56 +0000
Date: Fri, 03 Apr 2026 16:46:19 +0800
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, fuse-devel@lists.sourceforge.net,
 linux-doc@vger.kernel.org
Subject: [mszeredi-fuse:for-next 35/53] Warning: fs/fuse/dev.c:524
 This comment starts with '/**', but isn't a kernel-doc comment. Refer to
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202604031126.BGSurGYv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git for-next
head:   e0d07024fdb2588cd6afcc1b1f1e4bc62ba2c886
commit: ca520dba20d4472694a1895fb4de513be8dab3eb [35/53] fuse: don't access transport layer structs directly from the fs layer
config: i386-randconfig-141-20260403 (https://download.01.org/0day-ci/archive/20260403/202604031126.BGSurGYv-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604031126.BGSurGYv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604031126.BGSurGYv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/fuse/dev.c:524 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Checks if @fc matches the one installed in @fud

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
