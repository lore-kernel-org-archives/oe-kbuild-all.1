Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B086A8D2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Jul 2025 17:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752599784; cv=none; b=EiKnsdjTr+YN6/YlLihq8Bl/UIpU15fpzXSujKl/O/lFo/EENUUowLXqSh0fPRChMwecFm+mr8NE8GND5lR6g9Qoiv3mlGoOfNp0YOjUtFh3+yfk4DGIxsqPcXsI29+jx89ePUgfWAiAfdXVwHM/Q5BY+60jTdF7eoTT2mB3eqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752599784; c=relaxed/simple;
	bh=PrU3Yqi4UGcPg0ATgVv4HWuQWw0VsqMPP+ZbF6q5EoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rz/NESkl6lZgOeXp4I+hPmS4uvJUuajmvWvPxwkZqpaJmhnC1JBDTR6WY7+BSiYoPuYoeZs+2gxtmJDcZLbAW+Sf5Ov2VEMZd7zRy0W7WXTO2MUkDd/GOJHwgyZfE/9LIBBhmRH0rA9DvUGcTF7+n/ifePFxQ7XhRPNtHXMIVO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kh5TG3IX; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kh5TG3IX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752599782; x=1784135782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PrU3Yqi4UGcPg0ATgVv4HWuQWw0VsqMPP+ZbF6q5EoM=;
  b=kh5TG3IXXFiDf9yNtqJmoeoYigchTVPBq5E+byTQwZAaQhX7fNtbofbg
   w/0WJa1rIjtO4YfEi/eOXVo10aHFzEjYt/ZUt0u5PdzQlcPzVeBhiWHAp
   a8nhakxaPcEUjrcQA63X9aJqTGXwaZCgOQTYsM6NNvuxVhp9kSRtGtCJq
   by8OjRFDrAIALz4mXFuvSvyo2Jf+Y0+XuncnvMhNznRsb6vHkRnNOem8a
   JFgzOCaAhddC55j4Ymic7lSKnVtENXTKVaZka/1pIV6Ay4TMg4iT6RJ2n
   WKjP2zwXVQ+qsBSUrikdIbbSLnHR3iQ1r7w8EXtPcLd6HO+PEYMVic7QQ
   g==;
X-CSE-ConnectionGUID: bU8NZg/vTiKqnRliaXrBhw==
X-CSE-MsgGUID: IF7/wMRqS1Osafxth9MMlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65528356"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="65528356"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 10:16:21 -0700
X-CSE-ConnectionGUID: 2H01EHM8Q1qUqWJKtZJnbg==
X-CSE-MsgGUID: oiVvFcGoTEGmnUOT+PXSHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="161834218"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Jul 2025 10:16:20 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubjGM-000BNb-0e;
	Tue, 15 Jul 2025 17:16:18 +0000
Date: Wed, 16 Jul 2025 01:16:07 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 0/92] mm/vmscan.c:186:38: error: macro
 "get_total_swap_pages" passed 1 arguments, but takes just 0
Message-ID: <202507160133.BonSg8r7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   c71e88ad12bfbc44f855b681ef923e1acc2e984a
commit: 5291f45f705b03858f36c68bbdfdbdf7857e651b [0/92] bytedance: mm: add /proc knob for proactive swappiness
config: x86_64-buildonly-randconfig-001-20250715 (https://download.01.org/0day-ci/archive/20250716/202507160133.BonSg8r7-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507160133.BonSg8r7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507160133.BonSg8r7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/vmscan.c:186:38: error: macro "get_total_swap_pages" passed 1 arguments, but takes just 0
     186 | inline long get_total_swap_pages(void)
         |                                      ^
   In file included from mm/vmscan.c:20:
   include/linux/swap.h:565: note: macro "get_total_swap_pages" defined here
     565 | #define get_total_swap_pages()                  0L
         | 
>> mm/vmscan.c:187:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     187 | {
         | ^
   mm/vmscan.c: In function 'demote_page_list':
   mm/vmscan.c:761:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
     761 |         int err;
         |             ^~~


vim +/get_total_swap_pages +186 mm/vmscan.c

   185	
 > 186	inline long get_total_swap_pages(void)
 > 187	{
   188		return proactive_swappiness_enabled ? 0 : total_swap_pages;
   189	}
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
