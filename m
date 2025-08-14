Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D645D321444
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 15:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755184083; cv=none; b=GC+RojNV88YgtgqNJMpYOi3oFSzby1iNlWDeUuaBzev0OwS70xHtChNNbtdRSkuq4WPefCPRDFP185n3AGfK1qeq86DEJhf2WKWS/F8AGt94zCB5JCP3WuIo9IP5XA08af4FUkJAX4sTHvTXYI/EtwQJKARy7/PlOuy2kWGvDb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755184083; c=relaxed/simple;
	bh=xyl5fGlDXvcSW46BMJtCy1zmBcJ7J53TNaspKtIH8S0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A78WCrXGQHyd9A29rF03cD89X9olKQ4TQJseke40/lfsedDeNllBE/G4atWMizDHJC+BUvfLK8Ud3bEa//V8+6f+mQ/foWSEB23RFLGUupNtER5qOKrYeRMjgwblPlKVPg/pPhwGVyE8I6rkasiDebuyJzjvUvSgdAeXEeHuS8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eGDzfhvY; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eGDzfhvY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755184082; x=1786720082;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xyl5fGlDXvcSW46BMJtCy1zmBcJ7J53TNaspKtIH8S0=;
  b=eGDzfhvYcyp3irN+X8jSIlXvibGC3E3C8zUaFxKmOOiN5/o10FxSa8vv
   MXG5Lpka2GHFZSVrJdwlSkEMwkHT5RzXN1vh/LSgwyuG4RkL7DCAory1L
   U0+O5QkoI/AkYKHbuReZdzEPt8ZGcWVIaGVHQlYK4FGHz+98/5lrHO8k4
   wbbxEuza+/czvOOkTHQw6Gg2nGs22jNyRd9qHpsq0GZeS/Z3qEx/b55Kt
   Jzkb+kF5Rl6BA83Zd9f1lIJKK4+CSLaWc3nHzNhgb0pAQtLwIXUeYiLZa
   PjYW612Hzjp0oSBsh1O6RWowqRCa384rbcCI7Vj2vhemGv30DI9gkIEgx
   Q==;
X-CSE-ConnectionGUID: pAWMzl5eRbukL1aJlxE2ng==
X-CSE-MsgGUID: BrwPqcARRaqKrinPBpL1SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68202612"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="68202612"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 08:08:01 -0700
X-CSE-ConnectionGUID: qeNbOqULT466SS8FXtd2SQ==
X-CSE-MsgGUID: ZXKPtFaJQ+uBTOEOAzhcXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="172005388"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 14 Aug 2025 08:08:00 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umZYN-000B4K-0E;
	Thu, 14 Aug 2025 15:07:47 +0000
Date: Thu, 14 Aug 2025 23:07:27 +0800
From: kernel test robot <lkp@intel.com>
To: Ethan Graham <ethan.w.s.graham@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 RFC 3/6] kfuzztest: implement core module and input
 processing
Message-ID: <202508142240.7YTLa3x9-lkp@intel.com>
References: <20250813133812.926145-4-ethan.w.s.graham@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813133812.926145-4-ethan.w.s.graham@gmail.com>

Hi Ethan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master linus/master v6.17-rc1 next-20250814]
[cannot apply to akpm-mm/mm-nonmm-unstable]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ethan-Graham/mm-kasan-implement-kasan_poison_range/20250813-214228
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20250813133812.926145-4-ethan.w.s.graham%40gmail.com
patch subject: [PATCH v1 RFC 3/6] kfuzztest: implement core module and input processing
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250814/202508142240.7YTLa3x9-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508142240.7YTLa3x9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508142240.7YTLa3x9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: lib/kfuzztest/main.c:43 struct member 'target_dir' not described in 'kfuzztest_debugfs_state'
>> Warning: lib/kfuzztest/main.c:43 Excess struct member 'test_dir' description in 'kfuzztest_debugfs_state'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
