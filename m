Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37D71A2642
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 07:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744875507; cv=none; b=fxYPIA7HhlZiMeuUn2R8gBqcR8M+AAapfsLAQfb3WoFZcbBgpUHDygzW6p9LnlLPh5shK6E9HcGPbOvllUnreFVhzVewfG44gDh8mJzZjZcVn7xGOLQsIstYkXradj4mKOrDsK3wRTB06STX1DWkBlXAG2F3I/E2djuum4GE5ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744875507; c=relaxed/simple;
	bh=h87+bASu07IQHQH8DQLdiqqHkBZe5S69RV1bCTj8EOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hzj2llAUa59XYKnuT8mh9Ji0Xsieueu0OM7I+rZIAnIAwLTe62dImV2Ij1/ThWD6SL6vQSCYRW3zZZ547D6gQchz/9Frc8I7cAHEkacpzl300AIih5fvi58M2vio22r3hsS6u7JkFrCwCMRLaYDNFDqe1VmA3JurUuf0t6CtCSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kys+Hl54; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kys+Hl54"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744875506; x=1776411506;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h87+bASu07IQHQH8DQLdiqqHkBZe5S69RV1bCTj8EOY=;
  b=Kys+Hl54MzgVfAIQlIY7JybsuSUCWffwQ/ACbncAXBNv0dzrP6I72Ajg
   W115C6Sw9WWu6EpBJUiXby5amEiWS9dRpoO4Qrb7EDdjDH34X8t15zI1q
   Pxzyp6dk2hw+2T73Rzxf4OVcEdEiXbjYUZuEIGaUluLMuWwwSVsZtpww8
   aUiVm3c+FQsny7ETvywex8lT+x3AdeOROarVIpmAiQzqVtaq90hUt7uk+
   QoEuNHpUxzlsZPvfA/unHsYG4Ob0fZ9ibM4BvWdKgR7H7Shtkq8Bo5xra
   tCaE6pejdzGdKcfK9KGaSP9esjXsKQR8Nu5IqtMmXT0mX8eIvY1BrEjL1
   g==;
X-CSE-ConnectionGUID: f+udqFgWRP6Z2IKRPkFK6g==
X-CSE-MsgGUID: tZ+MaSUpS5ypt2U0ko4Yog==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="49146128"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="49146128"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 00:38:25 -0700
X-CSE-ConnectionGUID: p/1JL2bERuunDjb+nNBeXA==
X-CSE-MsgGUID: d6kb8W6UTdydZCpXO3MlUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="134823258"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Apr 2025 00:38:24 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5JpG-000Ln2-1Y;
	Thu, 17 Apr 2025 07:38:22 +0000
Date: Thu, 17 Apr 2025 15:38:12 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolas Pitre <nico@fluxnic.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 02/13] vt: move unicode processing to a separate file
Message-ID: <202504171521.imk8gOUP-lkp@intel.com>
References: <20250415192212.33949-3-nico@fluxnic.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415192212.33949-3-nico@fluxnic.net>

Hi Nicolas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-linus]
[also build test WARNING on linus/master v6.15-rc2]
[cannot apply to tty/tty-testing tty/tty-next next-20250416]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nicolas-Pitre/vt-minor-cleanup-to-vc_translate_unicode/20250416-142136
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-linus
patch link:    https://lore.kernel.org/r/20250415192212.33949-3-nico%40fluxnic.net
patch subject: [PATCH v2 02/13] vt: move unicode processing to a separate file
config: arc-randconfig-002-20250417 (https://download.01.org/0day-ci/archive/20250417/202504171521.imk8gOUP-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250417/202504171521.imk8gOUP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504171521.imk8gOUP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/vt/ucs.c:44: warning: Function parameter or struct member 'cp' not described in 'ucs_is_double_width'
>> drivers/tty/vt/ucs.c:44: warning: expecting prototype for Determine if a Unicode code point is double(). Prototype was for ucs_is_double_width() instead


vim +44 drivers/tty/vt/ucs.c

    36	
    37	/**
    38	 * Determine if a Unicode code point is double-width.
    39	 *
    40	 * @param cp: Unicode code point (UCS-4)
    41	 * Return: true if the character is double-width, false otherwise
    42	 */
    43	bool ucs_is_double_width(u32 cp)
  > 44	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
