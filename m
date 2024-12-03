Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1F81D88C7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 12:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733227723; cv=none; b=P+jy+v0RIV6JJkteR9SmPIOV1so40Sj2CvbGH8kEhQGfZ8fpaRudIwlwychrkYn8C23zOB7eVSpYuyXF62AC3RKS5hg2vz5PyCD10W5k1eKapH9In+WPVe5E/LHjW6+e6CF9epe4ox0RBHL46ogOo/fjERIjdgrwPXXz7pl/+EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733227723; c=relaxed/simple;
	bh=DAFrNHinMWDA5gLC4UTbzMhAvRXhDs4VvsfT4RwAfgE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aYsp/HOAbarNemWsmMCCS48RiHXU5Yjjgq9Bt2oI7fJTcoQJ+btGiY3UKtZhd24sN6ORiiCUindFFB7XRTrlJUe9tXa7D5+o5WALSGBF+FOyKSVo5KoIJS8/ItrJfudfEMfe373bKLEuPF7Kvc7xkAYfYvWAupqtxFt68bZVHEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gef5gJgl; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gef5gJgl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733227722; x=1764763722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DAFrNHinMWDA5gLC4UTbzMhAvRXhDs4VvsfT4RwAfgE=;
  b=gef5gJglY3vd2wmTX/VLogf+478YLnTby1F0yP0dICnLD2BKtLpXDbq4
   mTf2ogqr6dfEieia53uiMj+kGi+vy9d0I7IDfHWPKQHoTnLMWl1CN1x1F
   3gOudlC5wpyNT7Qwlj8vqFtTeveW8u640sq4HLYecnBNaZYvGepA4wwiP
   LX+ZaIQ1fh8lLHanNcDHYMpd4bqNXKnxBXQauRVzE8HpXkwnhzxltHaox
   HCtL8I5WFSk2ViWrMjSWjBaa3a8KFKTtnvNql7zijuBpN6n/MANTI9oAZ
   Fxu7FaHdWVx7euAaa9F9dPKuCGFQ6vMyU3RFhpTkhjuy/pdDnXuRpq/UQ
   g==;
X-CSE-ConnectionGUID: UGWu3s9KT+ej81SgIT1A3Q==
X-CSE-MsgGUID: HDKZcQl2SeW3blQhKbooXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="50962019"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="50962019"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 04:08:41 -0800
X-CSE-ConnectionGUID: EDn/fLLkT7WyCmc9isszDA==
X-CSE-MsgGUID: pe2CF5TRTCWfjb5fMPYF4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="93819108"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Dec 2024 04:08:40 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIRhm-0000dR-0O;
	Tue, 03 Dec 2024 12:08:38 +0000
Date: Tue, 3 Dec 2024 20:08:16 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1297/1297]
 kernel/locking/.tmp_percpu-rwsem.o: warning: objtool: missing symbol for
 section .text
Message-ID: <202412032008.TV1mkLUs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   312efa97a54edf7e64f108312c4d8c6961a1abaf
commit: 96d4baaa81cce700eb801a0a9bf28b7fbbba3162 [1297/1297] tasks, sched/core: With a grace period after finish_task_switch(), remove unnecessary code
config: x86_64-buildonly-randconfig-002-20241117 (https://download.01.org/0day-ci/archive/20241203/202412032008.TV1mkLUs-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412032008.TV1mkLUs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412032008.TV1mkLUs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/locking/.tmp_percpu-rwsem.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
