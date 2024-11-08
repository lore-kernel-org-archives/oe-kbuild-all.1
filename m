Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F931E376B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Nov 2024 11:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731064504; cv=none; b=YxjSKz3GEKi8tMfjJ1iy/O+zJQNf4tgFaoXE7YW1KbXZbHWV5Afezm6SK7llLadvUVlj4jJ86ckEuw3vtMoNU54ppOHLeRaml1g/dG1c2o8ksUVa3+o/uFW+9IsLEr8zfo5jI1TlsQouDDLreDkxqM9EixgB5yIPbV70NEaa3cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731064504; c=relaxed/simple;
	bh=hIL0dTcWwIXToMQftEsGpJ5AyiFwNP0xmB9FP2gGw1g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BxUWZs/JQTq9519+o79tGzUiNQBm4xPEMoPUIRZrpNfRzA7v7TShZ6KTHgh2XT3XE00YPg/J18/LMcR9wogctxhgN+GEojJVbfIhOM2uB1FDqvwbKiUYk893YiYl5tNDzHvpVHCSiir1uAiVS+MJPa2hbrDIM/Erdhk6dpFWy/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UQYLP+78; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UQYLP+78"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731064502; x=1762600502;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hIL0dTcWwIXToMQftEsGpJ5AyiFwNP0xmB9FP2gGw1g=;
  b=UQYLP+784JY0NARV421/6bPJTCXD9U3YNKMNY+77N999C5hY+QYlLgva
   4Ug35xWWMlqjU5XRyoO6SFPNJwfqwnjfgaIViAiMo9sE+BxvCyF9X2PiQ
   gATQHIym2kqdTEgDF8XLoKxQm6u3q9AwM6mm4lnKyGnmLojKfV9MKqkWa
   jQdivlVbKw2owj9KOdf/U5s5GgcaZ2dV/DXCaZBPCuqWY0dl8FmgU1+/d
   R/LdZU6pEInMERKcvzhQDVKprmW34ZkyqMZJmifYqZZeOcOzrWficopzR
   sF8bEisjDx7IeQ5ZgqCWwdI94PERo6Km2fcaqQm/EQzjc4KxVPWzOkKWZ
   Q==;
X-CSE-ConnectionGUID: vQ7DJSrDQnSmnRNDHlwGBg==
X-CSE-MsgGUID: +9X8OkIXTS+StruQV6CAFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="33803566"
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="33803566"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 03:15:01 -0800
X-CSE-ConnectionGUID: 9k4clr6tTd6yXN4TxK93ZA==
X-CSE-MsgGUID: MM7+0HBiRKmvf5AbZsQEig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="85615949"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Nov 2024 03:15:01 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9Mx8-000rMA-0c;
	Fri, 08 Nov 2024 11:14:58 +0000
Date: Fri, 8 Nov 2024 19:14:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <liuyongqiang13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1219/1219]
 security/integrity/ima/ima_crypto.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202411082127.QOmYE79P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   bafa65a8c91fb9c99706d2d22210690199f95779
commit: d073934a1ceae819057c8e1a98d384cb506b1806 [1219/1219] ima: Remove __init annotation from ima_pcrread()
config: x86_64-buildonly-randconfig-001-20241025 (https://download.01.org/0day-ci/archive/20241108/202411082127.QOmYE79P-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411082127.QOmYE79P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411082127.QOmYE79P-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/integrity/ima/ima_crypto.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
