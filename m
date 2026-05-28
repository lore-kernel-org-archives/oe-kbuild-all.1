Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289712F5468
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 May 2026 18:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779993842; cv=none; b=SCiy/f0xwlFgvFk7lVr6l4HulcgMIKkp0/fN8t0MRjSDedrDlYeu31N9Hxb760VykNMwcYPHO1cD8ZiR2KcyjK65g7szUVa9a/hGCarGKi8Tu/yz9t5l3jS6cx1sZ13sdgfa/B1uvuQDSmxhPxJIEMsHk6bZzGS6rXnT8zYUXY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779993842; c=relaxed/simple;
	bh=UWyysh0acMo11F3CCCXCFjxZa3BK5ioKX5VXk8AzqJ8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kHFIszF+xQcMdUOZQq0nF4gQlDBgQdDKOefllcsddTqlFpKTxMa9lA6waoYm1vV9VAv7c6aiUzn9E9oGo8wshed4NQbbQvznsO3mBMw10q8N2Q0ptQKAQgvlFLgJqpdmP0EKiGmOoR+1fcTpLl9FXDEmcPAz7UGyvMTg7DAKsFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HX4o8/z6; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HX4o8/z6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779993841; x=1811529841;
  h=date:from:to:cc:subject:message-id;
  bh=UWyysh0acMo11F3CCCXCFjxZa3BK5ioKX5VXk8AzqJ8=;
  b=HX4o8/z65Q4y4dh83b4x+XWUJm4Ak6Y+3OVc/MEal0UbiM8SpWRWy5uV
   8L2IzhM2pvKjKg7M24Rr0KqI0Mh7zqX50fsyPIQVGXa/M5Ct2/0HQoj1I
   jZDv/AX7VXpMWvIOHzq2tU9Mw6BdfL3ASuXaMwshZXuTYYkrrmq12sd/m
   eRriwFHxWdZiSL5KXqmab/mJstzv+KZng0IPV93d1JPHjae3ckGGBrARX
   a6ROks+Uf3CO17GSvjgNzkZr/vbl7yETj0RFlwrNnBYlJ682SWvEFZdX3
   a30s8Z6K243w94Kwum0zY6G22WN9Ilb3r6ElYJlc8gqlc0Szkyi2J40z6
   A==;
X-CSE-ConnectionGUID: 81eWhBxLT3eFpLueCPX03A==
X-CSE-MsgGUID: KuW2PF9yRduXGo+2KhDCAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="91533326"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="91533326"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 11:43:58 -0700
X-CSE-ConnectionGUID: R4tZOV7ARt+EWtT5ZQt+Cw==
X-CSE-MsgGUID: ajN12GH3RtKHz79gFTp2gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="242477403"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 May 2026 11:43:56 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSfhx-000000006JM-10TN;
	Thu, 28 May 2026 18:43:53 +0000
Date: Fri, 29 May 2026 02:43:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:rootns 17/23] <stdin>:1639:2: warning: syscall
 rootns_enter not implemented
Message-ID: <202605290225.KScfIZYB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git rootns
head:   0026164101f5eaeb1e2394b381d1c3863faeb79d
commit: 6116b89ac8a1d72dcad63ee3a2516ad73eea30c0 [17/23] rootns: Implement rootns_enter()
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20260529/202605290225.KScfIZYB-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9409c07de6378507397ecdb6f05f628f58110112)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605290225.KScfIZYB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605290225.KScfIZYB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   <stdin>:1630:2: warning: syscall rootns_create not implemented [-W#warnings]
    1630 | #warning syscall rootns_create not implemented
         |  ^
   <stdin>:1633:2: warning: syscall rootns_wait not implemented [-W#warnings]
    1633 | #warning syscall rootns_wait not implemented
         |  ^
   <stdin>:1636:2: warning: syscall rootns_kill not implemented [-W#warnings]
    1636 | #warning syscall rootns_kill not implemented
         |  ^
>> <stdin>:1639:2: warning: syscall rootns_enter not implemented [-W#warnings]
    1639 | #warning syscall rootns_enter not implemented
         |  ^
   4 warnings generated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
