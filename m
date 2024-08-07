Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB10163
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Aug 2024 00:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722989432; cv=none; b=aWyUT7PkQ6Gf4DzTkym1aJEXowoiZcPkEdMG950o1xya3IKOFuC8D9Fr3iH1yZRE8d1VAMFvAu9zi+6tWmauTWcTqDKiqUbsaUgsgIQb5o985jNY6JUV9sn8aWuMnf9oVoe7KotUoWIn69/GWAhfa/y2g8TPme8159Vvj894ZeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722989432; c=relaxed/simple;
	bh=Wajfn1pMcH86PNWa1cy5U8QY+h4CszNLkO3zU6QKQII=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CgQXhtgntn5rjv8JS6+W0D8fYwPm1iK/jo7rH50GORdiGtaEfzkLAHE+sDF9HBFcG9bMP0MxSbDIqw9MWqOtvdmZEx7jpbwEcL0qD2Dauo6UTvLoVs71BOojZhnO3M63+9yJZE1UpvIENT/9dSKo38DKmrjt3uyJwhv3RTIvF+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TAKaWmuu; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TAKaWmuu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722989430; x=1754525430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wajfn1pMcH86PNWa1cy5U8QY+h4CszNLkO3zU6QKQII=;
  b=TAKaWmuuo1IGMqtXLYc7z0qMGWjHrAGLWfCTIBPZ/tv0CxRcdX+/ssYS
   knhzuwWV3kF47jEt9/KJAxrBGnn5Q/+YV7V9e4VxQAFwPuHECkR4SGCmF
   PAxYsxvdJMNj0NEyKLwyaLHofACp+9D8IqwslawrRpXOluwWjQA008o1D
   Ydbb38z1qgya25lD09CBd3Vw8bDfuqnLCEU7MofF9W7AERWaLGKb3xwHf
   s54UpW9UmPKb0fJhOV52C3qekTWSVFGZ/vTokCCWPq6NJo+C5ft2EAEz7
   shAiEhcy4uRJeYazxgiZKKvO+1WhOe1naqMySYNWoweQYt9tcHkxrn7d/
   w==;
X-CSE-ConnectionGUID: W0IjMdt1TBuPETFzvcoqmg==
X-CSE-MsgGUID: FQz1G+rKSPiJRnO6UBWrlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="21201747"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="21201747"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:10:27 -0700
X-CSE-ConnectionGUID: X14QjaYiRhi0ne5vuJjwDQ==
X-CSE-MsgGUID: YLSimR7DRiWaPL5ai7/65Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="56334907"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 06 Aug 2024 17:10:26 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbUFz-0004yU-2N;
	Wed, 07 Aug 2024 00:10:23 +0000
Date: Wed, 7 Aug 2024 08:07:38 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Norris <briannorris@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Yury Norov <yury.norov@gmail.com>, Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [linux-next:master 3087/3348] arch/loongarch/kernel/machine_kexec.o:
 warning: objtool: kexec_shutdown_secondary+0x60: stack state mismatch:
 cfa1=3+0 cfa2=3+16
Message-ID: <202408070849.3yK6lFvN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Brian,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1e391b34f6aa043c7afa40a2103163a0ef06d179
commit: 5c69ad0491cd9b150223d0f5fbd7dc6785be88ba [3087/3348] cpumask: Switch from inline to __always_inline
config: loongarch-randconfig-002-20240807 (https://download.01.org/0day-ci/archive/20240807/202408070849.3yK6lFvN-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408070849.3yK6lFvN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408070849.3yK6lFvN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/loongarch/kernel/machine_kexec.o: warning: objtool: kexec_shutdown_secondary+0x60: stack state mismatch: cfa1=3+0 cfa2=3+16
   arch/loongarch/kernel/machine_kexec.o: warning: objtool: .text: unexpected end of section


objdump-func vmlinux.o kexec_shutdown_secondary:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
