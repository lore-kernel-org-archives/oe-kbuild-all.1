Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BF848125A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 14:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778853864; cv=none; b=o4qnwDGhmC0Nbc5XH/LyAvDIGY8ZFV48ITBjTSTI8nYBd6cCAUDba8sb4EZ4R8qxQAqt/hQSS24JCexxOaInxfqpwlzfRXIXl7pjN4uQSL+G/ijegFij940Nl0GAgP/OI0DmWluw0RfkS0kl9Ayo2jEC9mPZ65DlLMmNpS34RCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778853864; c=relaxed/simple;
	bh=WJDXvIo5JwHekD5o9gi1MA5hZCnttedv4rfKtJCZPts=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lJgaLEJ0OlbPuSoD27uEuivrgdBpO32pYcaoCj/mMaoivba301cLOiCEZ7cu/FcM3XGZsadQdGVE/i81SXs8SOxSA25/fHm/jjrShinGxwXZO60jryQ9noO7xS6ReIATCz2ND/hQ5lN2bETzXuZCOQXstYKKtaoWtnIFQHyfMaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LYhSmOS4; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LYhSmOS4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778853861; x=1810389861;
  h=date:from:to:cc:subject:message-id;
  bh=WJDXvIo5JwHekD5o9gi1MA5hZCnttedv4rfKtJCZPts=;
  b=LYhSmOS4AJSAv6oMgKqQoAq4RjeZaBOXqG4dxSQPjIcJsaaTr2Frb2Xz
   G5v6AujNwdIrhmNjNd5CvZdVqkOkasD+LApXDO/q2jHjm4CgwfBgCbBmd
   uvnicd70pkM+RyqQ0MaRuwfZ/hBLABs8IJLMlQLmy6FRSO2O4Cg+KQ29H
   OumfjFzYV4sySFIqw7utn2qFzs2tp6+HiGoD/7WMk+DkLJpGClgReBC2T
   8wwupPOr6nuprn41xJmQOyakJqn2bFf227CYjAvRN0uECFoqf0t7YxpFA
   g/Wk+jchYakCwF/v8MSKYe0R1aaYbC4r3kvlhxxwzzKnG4HZpjhTNjWgQ
   g==;
X-CSE-ConnectionGUID: 1O7xguDCS9mMUQB+4ZnUCQ==
X-CSE-MsgGUID: 1sIHYd1ISpuZvqqlsgWbVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79770512"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="79770512"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 07:03:59 -0700
X-CSE-ConnectionGUID: if2jnJEtSSu5gGASXnIgTQ==
X-CSE-MsgGUID: 8qmvwjY6QfCEPp0lQOdUgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="234261186"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 15 May 2026 07:03:58 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNt8t-000000001m1-1tyz;
	Fri, 15 May 2026 14:03:55 +0000
Date: Fri, 15 May 2026 22:02:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 drivers/tty/serial/pkvm-pl011/hyp/pl011-hyp.c:38:5: sparse: sparse: symbol
 'pl011_hyp_init' was not declared. Should it be static?
Message-ID: <202605152156.pYzvC9Vj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   e336797b451265ccc15f8162549b2ba98a9e70a2
commit: 069b706b122edd75104eae172b165047a1900935 [1/1] ANDROID: drivers: misc: Add an example pl011 driver for pKVM
config: arm64-randconfig-r121-20260515 (https://download.01.org/0day-ci/archive/20260515/202605152156.pYzvC9Vj-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605152156.pYzvC9Vj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605152156.pYzvC9Vj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/tty/serial/pkvm-pl011/hyp/pl011-hyp.c:38:5: sparse: sparse: symbol 'pl011_hyp_init' was not declared. Should it be static?

vim +/pl011_hyp_init +38 drivers/tty/serial/pkvm-pl011/hyp/pl011-hyp.c

    37	
  > 38	int pl011_hyp_init(const struct pkvm_module_ops *ops)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
