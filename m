Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022B528A1F4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 10:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753095072; cv=none; b=cDPnoOLMED9fJmlTK6+FC0nAkz3KJiwYXHYtWAJSd9lK55q9vbfhhSeqcaIFW4rQ78wBoztKumvqG7D6jVBvVFWL73FFiGxpIbWEJdRxUo/zr1L+mu2P4iv8crDEssmw4Jk2ePk5ZvL7hoUd/gx0xy56gu2ImcYyr6p+d9hSInw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753095072; c=relaxed/simple;
	bh=ZTngdbuD6+f7rakIwtz36A706796unybmNLnf6DhpAc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q7/aEZ03RCy3DwyL3AtnlSIZHPe8H5PrvV38JXHErN+w8BeDZ9BxCSH4Yk1f6wkMH1l2/eSnHplCUOFVyHuxEzWIkR69yUmiNF4+3G84I8difFjdGqjsFOXu8LKWc9XJfZSKOl/NQvo9Q9JLF8SsP39hoN+trBnxBGkaBegrh/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OlEKun3P; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OlEKun3P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753095072; x=1784631072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZTngdbuD6+f7rakIwtz36A706796unybmNLnf6DhpAc=;
  b=OlEKun3PRcM1lXhy9Dx6eVtOLZ+2Mq3BkOOWUFfHKEXOCpNL+X90KfzK
   qIIPMl9RBqc+s3Dv+3sRfFof2zQzuZCS92/TebeeLOwAzukIUwXECAyr9
   B6YyY6w4M8/evCoYGLk2FCoY4foEH0bwmaOnX7BGyDZ9kSeta21RrraaF
   WfH02T3wt7Fou7ejKyu1Qa8YJuF7SB2XydTqvlS0lR634nGMmB7QYamAK
   mzlvJ7dTB9f/GJjRlJHld/wEnuAEjA5Irbo6/glg81LZypq+kULUW1fMG
   efreb+q/28uPrkm67QDEUNuj/4Ev5P+dvixMu//SOasN6agXHm+kX7zP3
   g==;
X-CSE-ConnectionGUID: K0hCsySBTP6Lau5LUkllZQ==
X-CSE-MsgGUID: G67X0hDZRACpUK1xI2Gjaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="55015386"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="55015386"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 03:51:11 -0700
X-CSE-ConnectionGUID: matKsRpTQve8EiQkQqv8SA==
X-CSE-MsgGUID: cTjkiPw4Su6Oeh+biQjFsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="163353294"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Jul 2025 03:51:10 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udo6s-000Gin-2K;
	Mon, 21 Jul 2025 10:51:06 +0000
Date: Mon, 21 Jul 2025 18:50:14 +0800
From: kernel test robot <lkp@intel.com>
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 111/126] WARNING: modpost: vmlinux: section mismatch
 in reference: kasan_init+0x3b (section: .ltext) -> kasan_init_generic
 (section: .init.text)
Message-ID: <202507211807.ZEFVLJ7e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   1b0686bd18c1aa9d7f01943829faa5befe6ab3d1
commit: 27a653bc6bbf595a1ed3817ecf37239cbb768ba7 [111/126] kasan/um: select ARCH_DEFER_KASAN and call kasan_init_generic
config: um-randconfig-r132-20250721 (https://download.01.org/0day-ci/archive/20250721/202507211807.ZEFVLJ7e-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250721/202507211807.ZEFVLJ7e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507211807.ZEFVLJ7e-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: kasan_init+0x3b (section: .ltext) -> kasan_init_generic (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
