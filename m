Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204637;
	b=yQ2LKY23hDjMBvwQ2N9vn+OFIhect4TdDYXSn8qkQoG2i3svT/xnBBJ58Jj1kPMyNlIF
	 I4NeZe8KKf2qxEaNoHFxq93XmvazIDaWBPg4mDDZ65UZAj6sDO0oHXlFIvADeu7KTFgYA
	 xIYrscLMB6r8y4f8u2/F4ta2rzZh/x/+iZc+RudjeDHMna8ZazurN5djbhWcwLss3Uutu
	 K5CIoF1Me2ikYSsMnU3X5nsmOC5ddzc+UoGoq7DX1MIN8eT+rUHotJHmY6KBza7Wk+Wof
	 WWeSnI5tzVHe6Mkr0wYvmBhndiNmZ5azaA0jOR/3KlElXl5DmVchKyYyLdsY0pDeGAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204637;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=LkMRA3LjWkgJvdo1ooQR5+mYNTquFMsoTJDzim4uMXc=;
	b=c5yYr2Ou2cew0bXguc0wkiBnMo7hqfy4/avw2jh87JjiYZUzRTMD5F4gZ8NpEfxMXF/4
	 CZA0YQt1dAtItEpMZSNL+7TU7JANTIkbI9Rcj/ZxJZ8oWWTlC0Y+rtkhqB9B9hSIRYByL
	 mhsFiLkeFD40JeNkFX7DpAVsTV26cHZzH66RHl2VgpWGCyWflpMqLOyIgngxrqo+N8Oxr
	 0DhI2e/hyy7xuji+YpXnsCLm4BOdkchcZg76DLuOMiTB+4OdnzatkdOu9fut8JbtbRD5o
	 Wopyk+lWr49RknS4RrEP3Xyj/FvkX1i5AdM8lFEtcf/8S9dNVUCJkEBPzzsV/E9oO1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QxjiwfA7;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87E9606A31C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Nov 2026 06:10:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C87E9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QxjiwfA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794204634; x=1825740634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NFGanD7xlFdK1ogEh6jVd5izH3KhARoCR4mEgphDLE4=;
  b=QxjiwfA771fNdVkmiMPbWWSKHnxwqo0k/TUc+0kP14XLt8mezNPcO4ls
   uuIkdxqYSdtJS9ExyHYsBsktLhhyQcgsSY/Rpb4d0/5qj265ZUh+diHk2
   xAZn30eatRPRfuQBu6q2lp15gGzpQC8QIMWot5lvfAVIdCKcu7NTGMe2o
   LaZM3pF0wPgQ3U5n0YxzSM592nV9C3U1WYXfWQTy5Rt46qdkIzgFdVi3U
   Mpnfl0/DlgqpreW1Ct2YYdPp31rViFCZeZdsQxUjr6MosN/DpaoxSRO22
   CRly91TsvzlsfHHyBysY00snYcbYJ5xUU1f+WldVA2cGquZ79I8QO91Ss
   A==;
X-CSE-ConnectionGUID: QBaVvXsxSL2MrNfDL9wlVg==
X-CSE-MsgGUID: ZUurR2NpSqK9xXkEQWKAjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2790770"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2790770"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 22:10:33 -0800
X-CSE-ConnectionGUID: xOdGDXC3S1mQxOwiqLAg2Q==
X-CSE-MsgGUID: W9Tde90oQeGPr3wXG79/yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="9543673"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 08 Nov 2026 22:10:31 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQIaL-000000000Ex-2tNV;
	Mon, 09 Nov 2026 06:10:29 +0000
Date: Mon, 09 Nov 2026 07:09:50 +0100
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyndbg-maple-clean 47/50]
 ld:arch/powerpc/kernel/vdso/vdso32.lds:456: syntax error
Message-ID: <202611090700.BmliCL2N-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dyndbg-maple-clean
head:   5f7782a41d4ca319992609b6589a592f87e83006
commit: af718ee6a3256d73ee276d2c2bbbae9df0da6bfb [47/50] dyndbg: Save _ddebug_site fields into a maple-tree
config: powerpc-randconfig-2200-20261109 (https://download.01.org/0day-ci/archive/20261109/202611090700.BmliCL2N-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611090700.BmliCL2N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611090700.BmliCL2N-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld:arch/powerpc/kernel/vdso/vdso32.lds:456: ignoring invalid character `#' in expression
>> ld:arch/powerpc/kernel/vdso/vdso32.lds:456: syntax error
   collect2: error: ld returned 1 exit status
   make[3]: *** [arch/powerpc/kernel/vdso/Makefile:86: arch/powerpc/kernel/vdso/vdso32.so.dbg] Error 1 shuffle=3868076583
   make[3]: Target 'include/generated/vdso32-offsets.h' not remade because of errors.
   make[2]: *** [arch/powerpc/Makefile:395: vdso_prepare] Error 2 shuffle=3868076583
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3868076583
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3868076583
   make: Target 'prepare' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
