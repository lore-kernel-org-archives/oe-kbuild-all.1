Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC39246BCD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Oct 2025 07:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761376472; cv=none; b=nWrC55x56+htVCazMq5DdFgK3XbqJXs5E4FTGFTaLoucyt+ugY5pog3VoR+uTqZcpjl18WjamAswuVvkyyDDU3WzYAdDx4D05YEkHcjTyaDVRGSfGmdtVPCLEZjj4u3jb8M3k5yBSSm4Xw3/TJqw2t9ci5xRvOAPJESeBMmM2rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761376472; c=relaxed/simple;
	bh=X6YoMpQgSgZAZKvggDwcha+QMleffEi+3c3WT17AgYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NYEDOWH4qJ8aINkJ/pyxcdpT7B1ZFmYrdVGetHZb8sDrbAV4buLlg3a8y6bKHAhVnnJbprxLEzlIu32g/tV/xFOmqMbtTvBIIVws7/G66RmcLwikxIULROcqjvHFalV+IoroG9wtCvq544lb4A+c3CnvuP6m9hdcYSUJ/ql60zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TX6loH0Y; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TX6loH0Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761376471; x=1792912471;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X6YoMpQgSgZAZKvggDwcha+QMleffEi+3c3WT17AgYg=;
  b=TX6loH0YByWnHFPWO2mGsrGWSbzum0sL0IFedfUxIMGT1JBQ+vIBajIE
   yDlu/1r6DegPYfQWi7MnHqVUhfv1F0ac6XOf2lIuOsSba4BsUs1yLLn0S
   PQQaqPRtHM/7bSh8+L2msmWT5whtVaJbqmCdEpNBlZzDSYq9eouhHozYK
   ychItGFFFvI3LquasEQoEpNIk+Bg1G8N3uRaZvLADI5pRBCOTX3fM6Ybs
   F4xaLaWqLCvU7/oLvxXo9Xaq/Hn5BfczYe0d6rp7o5JPM1kzfnpwvgNMp
   Uk63doc6VaZ61zUg7D0zbN2MzpCwVAsamIWPt5XQbTLMKq36jE8Vf2T4r
   Q==;
X-CSE-ConnectionGUID: QrivX6orShCXeXvW7mNDrg==
X-CSE-MsgGUID: e3uiSPETSY+wyjZ8TzDD9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63245979"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="63245979"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 00:14:29 -0700
X-CSE-ConnectionGUID: Au+FxXoGS0mCzXf++6NWnA==
X-CSE-MsgGUID: lXvVQI1AQvmV+X31d+pIWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="184968492"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 25 Oct 2025 00:14:27 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCYTp-000FAV-09;
	Sat, 25 Oct 2025 07:14:25 +0000
Date: Sat, 25 Oct 2025 15:14:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v3 6/8] docs: move kernel-doc to tools/docs
Message-ID: <202510251428.mk24iI0r-lkp@intel.com>
References: <20251024200834.20644-7-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024200834.20644-7-corbet@lwn.net>

Hi Jonathan,

kernel test robot noticed the following build errors:

[auto build test ERROR on lwn/docs-next]
[also build test ERROR on next-20251024]
[cannot apply to drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master v6.18-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Corbet/docs-Move-the-features-tools-to-tools-docs/20251025-041303
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/20251024200834.20644-7-corbet%40lwn.net
patch subject: [PATCH v3 6/8] docs: move kernel-doc to tools/docs
config: parisc-randconfig-r071-20251025 (https://download.01.org/0day-ci/archive/20251025/202510251428.mk24iI0r-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510251428.mk24iI0r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510251428.mk24iI0r-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/sh: 1: tools/docs/kernel-doc.py: not found
   make[3]: *** [scripts/Makefile.build:287: scripts/mod/empty.o] Error 127
   make[3]: *** Deleting file 'scripts/mod/empty.o'
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1279: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
