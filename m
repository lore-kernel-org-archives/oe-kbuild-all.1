Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948C1202963
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 02:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778725523; cv=none; b=IWY9OrdsC6QYccoR7KoDYar7NhXarSAFnzwq4bspu40e7JEzuy6tKMVsEqkMtQlRL+pSv/NxelnjnhOq5q8tzbtNan+/kYUWRlpjlMc6LpoNMpQw2sGRr27YP9vF3foqvv6PqzObLa2zo8RjEDvVMJ/uslyF1n5ff1EKLtZbqRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778725523; c=relaxed/simple;
	bh=fBTtNBNnhjnKg3JyxU/qupnIYkb9ochle2fgoJsNjhs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u++n03ttdh39whBf0NEDxKQubHG4dOLzakik7Bh5yoHsbAA88LQYIGSLqfw2XKkAZjpzLNl8Tl6TXXcVDMAM5zY+z6aagUwqidCL2zif2XEWuxMZKSQi6EnxQsBqYppwH3bNfeJ/ZQ1gzh8mjHcaibx+rSg26+E8qDcxcKyXMpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iRRXiCl7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iRRXiCl7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778725521; x=1810261521;
  h=date:from:to:cc:subject:message-id;
  bh=fBTtNBNnhjnKg3JyxU/qupnIYkb9ochle2fgoJsNjhs=;
  b=iRRXiCl7jYr0uPRlwBgoQYCo8v/H8l+dJrsNy0QL9giMLgAMFMs36bB9
   QAuJKNnATo66h7dT/BJwXtgpLAE7f9xW3Ute5zrqwKCGA/Z24GHqlKzn1
   pbmDcfZ+zQj9KXOQ1lvfuJcNoq6KQiGQxA5UaTxVDYZ2OM9Q97mFYmUcA
   bAGlbtYDb6zsthNBNh5ss9KYE/tEXvmhRjkcg9CpexIEeU/g2CAKcftUv
   mpUlIwnbKsMImGryQJdCngEu1AM2IXDgzSL+dXBSp1B6BtJWUuXl6Lq/P
   ErAROZWyUIHxv0DnE2lOim7pnNFPldMKc6t9am0Pr24Vt2V2UJOs/uI7W
   g==;
X-CSE-ConnectionGUID: Mc3ztRUGR22dAsKdeQOCeQ==
X-CSE-MsgGUID: vnUAHNpYTf6uL6EUoKoFSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79781476"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="79781476"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 19:25:21 -0700
X-CSE-ConnectionGUID: 3PA/1QYJRaqADLBVI0Gn2w==
X-CSE-MsgGUID: PD+zKVxrS+aUkaEoe3Ch7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="243217554"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 May 2026 19:25:19 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNLlF-000000005fT-036N;
	Thu, 14 May 2026 02:25:17 +0000
Date: Thu, 14 May 2026 10:25:01 +0800
From: kernel test robot <lkp@intel.com>
To: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Paul Moore <paul@paul-moore.com>
Subject: [linuxsecuritymodule:next 11/11] Warning:
 security/ipe/eval.c:334 Cannot find identifier on line:
Message-ID: <202605141037.VVorBhvP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/LinuxSecurityModule/kernel next
head:   7cd0da3c29d22e2a8dcbc995b12199bc3d2704a8
commit: 7cd0da3c29d22e2a8dcbc995b12199bc3d2704a8 [11/11] ipe: Add BPF program load policy enforcement via Hornet integration
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260514/202605141037.VVorBhvP-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141037.VVorBhvP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141037.VVorBhvP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: security/ipe/eval.c:334 Cannot find identifier on line:
    * @ctx: Supplies a pointer to the context to be evaluated.
   Warning: security/ipe/eval.c:335 Cannot find identifier on line:
    * @p: Supplies a pointer to the property to be evaluated.
   Warning: security/ipe/eval.c:336 Cannot find identifier on line:
    *
>> Warning: security/ipe/eval.c:337 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * This function Determines whether the specified @ctx

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
