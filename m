Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB021E1A17
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 03:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790740524; cv=none; b=bzR7DZ1hRB2QFYVzXKRtzWo8Nd3EEyWjJZWU0YZce6nFZ4KYJnCNmbCzwmP9620rjkFn9DNPIbOH3CC3kFh2e/TzLHeZLHysiUKiBaNzTw4mXaTan+wZ1bcORIIrEaIQMhuZmYQ8py1VGWHZp95nEMlyZGfXJXB1nOMINWInbag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790740524; c=relaxed/simple;
	bh=B9lmfi0dIJA3h322WMeT0wEYYHamQ1JMw6G7f592Ess=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nihUkF49QWUfNWCUASQ3VWX+XNLFw/n3vBOyazGMtmnu/idR67Iiqy+uiNtow95+lnNqYmeZ1ncpRZH2cnOdo1shslmMkI3tw3agiKKm/byePi6DCsCPPr8vm9uEsh2+gUnTv7oL+EkIwctmPq4rJZsks2X7fur+cFzoKRhOKzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GO0uSCEQ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GO0uSCEQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790740523; x=1822276523;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B9lmfi0dIJA3h322WMeT0wEYYHamQ1JMw6G7f592Ess=;
  b=GO0uSCEQTbBITaf3Hg3K+/82YTJuCxSrs0hWKoCWc22z1xfR9Ph+0zHP
   +Dbw21Oe+SE6a+Ed0f9azI7Fmmf9RhP0vfWx5LOxekEbjOTxt8wH7vZA5
   U9rwAeuo0swkfIhZBrRpWw+ofT83AeLdaXE0beuveBnvodWrgvjAcn/Wu
   1YxzvuEzekdjBI++FB+pxpk3ol6ROAl8Pjpz4CLyttFWGzoYMAnEm+pqZ
   fVk0dt4g8wLA/ly2ys0kgRh1H0WSHWP5jUosSFl+IYEr5fljZf3bDlf+4
   RM7YqqQJT4AiGKjo2cOppRped8l32RQztWRCRg6WFMRRMuMN7YGEw8nuN
   A==;
X-CSE-ConnectionGUID: jWF4JT4TSQWoaW8YIZfW6A==
X-CSE-MsgGUID: UgUi1f+ZTOqBh+fAWlfuew==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="91488891"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="91488891"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 20:55:22 -0700
X-CSE-ConnectionGUID: gutxBHhlQ5S8A63IvjYGZw==
X-CSE-MsgGUID: T6R0Axi6TGiv8kjhoFGl/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="278776509"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 29 Sep 2026 20:55:21 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBlPa-000000001jb-28Ph;
	Wed, 30 Sep 2026 03:55:18 +0000
Date: Wed, 30 Sep 2026 05:54:45 +0200
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Andr=C3=A9?= Almeida" <andrealmeid@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: 
 ./arch/openrisc/include/generated/asm/syscall_table_32.h:474:16: error:
 'sys_set_robust_list2' undeclared here (not in a function); did you mean
 'sys_set_robust_list'?
Message-ID: <202609300522.u7Az3KJs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/futex-Skip-test_futex_robust_unlock-if-not-supported/20260925-145324
head:   0a151b703cae864a3bab66cc7fb5b8dc983658d3
commit: 4a65a4cd39e3503f745931231c0ba9a518c3b91a futex: Wire up set_robust_list2 syscall
date:   4 days ago
config: openrisc-randconfig-r2100-20260930 (https://download.01.org/0day-ci/archive/20260930/202609300522.u7Az3KJs-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609300522.u7Az3KJs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609300522.u7Az3KJs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ./arch/openrisc/include/generated/asm/syscall_table_32.h:474:16: error: 'sys_set_robust_list2' undeclared here (not in a function); did you mean 'sys_set_robust_list'?
     474 | __SYSCALL(473, sys_set_robust_list2)
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/openrisc/kernel/sys_call_table.c:19:37: note: in definition of macro '__SYSCALL'
      19 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                     ^~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
