Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A52E22068F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Jul 2025 21:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753912220; cv=none; b=uKSayyGyoqC00lttJkAGqrZL45uWA6SuuiGZNVZk8ICJ6nGm6Kn1KqsD7+gx6T+7qSxpIqIHhj2SYYd7V/A0fOX7Hp60s9pZlatB+QrPCIee1RzAuLZ+gxfQEKAF6dgvDYYEkyLvUwdD8yCzkRvb3R22RPiyWM/Gb/OwweTZIb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753912220; c=relaxed/simple;
	bh=qOOuXLnMKvljsvZYYqK2Pb346l2h3lNBUJhxzJN2W8g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fokryJcES2U50AOn0p6fekdK35cj01wA/XssMecQGJNbPZifEkI27mzG1wthVxsf92/aqPScSkoBb8Um/NXX4LsLIQBZHS6720afLTDt8HxxThTLkIduLQhVRqMzEsUrBKjfl6sjTLICCchqu+t9jPEuJErvuB5Q+CJr2liv0EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IPq5GWZC; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IPq5GWZC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753912219; x=1785448219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qOOuXLnMKvljsvZYYqK2Pb346l2h3lNBUJhxzJN2W8g=;
  b=IPq5GWZC6UiKS7HeJU55Fc4hdV0W11fVZPQ5PlSp063B+pST2l2hCQ94
   PGqPZgpTBBALEzzRBeFDQ3RteYjJQBlAevw0gRjFGSJXf9UQmyNA11eOQ
   QeF5YwHDufpzlgLxZMw1hG34Zgs6sKXyERTqMNsO3R5V7bXgRSEOMKkhN
   uH4+g1YnkApD3W4HkV7V+68lS4W+imhDvI9865JXMzQRpkiUzwoS5ky9d
   mwExVuFq1iZwzpEysLOTcGb6zLlSNPKt/bHhy8B5SVJLz7vnqHGBGA3Jz
   5j+Y6lYJAMFI+ir7zV5Gbo9/cMmyRf2SkF66uIcs+W6IR3jh/4xigXWT1
   g==;
X-CSE-ConnectionGUID: iNe+g8N3QJW0id/KiIQbDw==
X-CSE-MsgGUID: V807JP/BS1GiYhQC1P3UXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="66792268"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="66792268"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 14:50:18 -0700
X-CSE-ConnectionGUID: ZuBlurvdQJOFXAdHsNV1OA==
X-CSE-MsgGUID: Bs0UsE5NSgCxw972IepRGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="162682309"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Jul 2025 14:50:17 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhEgh-0003Aa-1H;
	Wed, 30 Jul 2025 21:50:15 +0000
Date: Thu, 31 Jul 2025 05:49:50 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [masahiroy:kbuild 89/96] riscv32-linux-objcopy: vmlinux.unstripped:
 warning: empty loadable segment detected at vaddr=0xc29b4000, is this
 intentional?
Message-ID: <202507310505.tEYm1za7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
head:   dae742fa564b7f53de83c16dce033d547c84c0f3
commit: 4a4da806f1d632a05bb947be336388ffe523a5ab [89/96] kbuild: keep .modinfo section in vmlinux.unstripped
config: riscv-randconfig-002-20250731 (https://download.01.org/0day-ci/archive/20250731/202507310505.tEYm1za7-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250731/202507310505.tEYm1za7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507310505.tEYm1za7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> riscv32-linux-objcopy: vmlinux.unstripped: warning: empty loadable segment detected at vaddr=0xc29b4000, is this intentional?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
