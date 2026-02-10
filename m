Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BDD29BDAB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 05:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770699967; cv=none; b=CC5hjPwgsE7YRpxFd0UAYON6NKbJeChILZV9OlD60ZZ8/wEFawJOV8pRLftOQvKXcyvfQiXIbIwpfCMJEhRkyv21ZW4UmlF1krVu9vCvv03l8s/Vt161H8M8dD6rQEfGBRwQbUh8dt57zKYviZ08RgUdxbAgizF/Suqi8qcpGkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770699967; c=relaxed/simple;
	bh=wsFWYXI5M9XTGdQT7AK9qnWu+ADArM/+m3W51r+oPyQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tgE9AweaTDNBmhK6HP/rIYXcpauJeWbCgXg8dyW608H94mh80RMa9B2DCO1uaqIrW6oFd2E8B8tWZjptZ6csNoPuWmnFKKao0zPeCAIWdTcNip1DK34wrt8FT9+oM96qb41dN6xAwitMODOkp8NhBcuY0TIQEhrO9bSGZMlTEzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F/z1e2nQ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F/z1e2nQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770699967; x=1802235967;
  h=date:from:to:cc:subject:message-id;
  bh=wsFWYXI5M9XTGdQT7AK9qnWu+ADArM/+m3W51r+oPyQ=;
  b=F/z1e2nQgT/ii+wLIIHsRIId/xIMfN2DPORHjRaYQjVBj/DdDwp1Ao5x
   SpXjqjwwfR2a9y0qp7VvcYECKc7cg5Do5hSqQt1nQE3ziJvg8+cseXLOs
   JFsY6wt7jb2ldyQTK2uq54EmfUNgM+OJ3vgjDcxCfj+F9OWedRuI9v8Iw
   V4i5CHQKIbq3nVsE+612SoDDtI9p4mJSR5Qj9ls6mhUwzYTtbjBVkuEzj
   sQZJsWZmoopOJrieyn0UgQaKEw0N6uoWOn+9kztQMKiaJ1guDhe7l3hQs
   hBIjmQbLDxuk2oTAPiF4QDos4RmQTp/GRJF0PMfqMQAs4pAFA3Rgs6y9i
   g==;
X-CSE-ConnectionGUID: LCTRJJPQQqmmFcnDAFR9LQ==
X-CSE-MsgGUID: HNqoWKIURomWpaFV306DHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71862288"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71862288"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 21:06:06 -0800
X-CSE-ConnectionGUID: XaoJ+aqKQgqcfV3GvAYzYg==
X-CSE-MsgGUID: p62iUwq6RTGEPLqZ7h1w4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216775573"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 09 Feb 2026 21:06:06 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpfwp-000000000aH-0gNJ;
	Tue, 10 Feb 2026 05:06:03 +0000
Date: Tue, 10 Feb 2026 06:05:03 +0100
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:container 4/15] error:
 /kbuild/src/consumer/include/uapi/linux/container.h: missing "WITH
 Linux-syscall-note" for SPDX-License-Identifier
Message-ID: <202602100612.bZlj7wwD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git container
head:   f62d2a134716e021cfca8d7860048f9c71bd53c4
commit: fb9ff38678d37c68b7cb2a895999b4a26bbdc2e7 [4/15] containers: Introduce a container type
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce: (https://download.01.org/0day-ci/archive/20260210/202602100612.bZlj7wwD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100612.bZlj7wwD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: /kbuild/src/consumer/include/uapi/linux/container.h: missing "WITH Linux-syscall-note" for SPDX-License-Identifier
   make[3]: *** [/kbuild/src/consumer/scripts/Makefile.headersinst:63: usr/include/linux/container.h] Error 1
   make[3]: Target '__headers' not remade because of errors.
   make[2]: *** [/kbuild/src/consumer/Makefile:1412: headers] Error 2
   make[1]: *** [/kbuild/src/consumer/Makefile:248: __sub-make] Error 2
   make[1]: Target 'headers' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'headers' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
