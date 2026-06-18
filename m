Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328E33DB960
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jun 2026 11:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781783665; cv=none; b=aN0nPSRBr7zaY1dZ040wImPgIRlg//05/iP9rqNjfPOjUbNbyZ4XMwzacunpRph1d97MPLDZGt7aJUpQVoxDVl6RNY6HgThg70UHs3y1ucWX5mB8Y1Udl7xu1LnncVGyDX4D8ghYmAg2A/qrTEtreWqykp48sKwZPtCIq7eDqX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781783665; c=relaxed/simple;
	bh=aiTjH8qBsejlW7U3Ys21CxXC2X5umQflOQf+5N7VbuA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=onXnOpKGCpbNaQA4IvTylGNMduhMISqi5daqjHadXrMosqqaJ9yMrNOOhHjrBW541gmr96+xmPWl6F2rNJW0XsQs7JXieVCKpBR8tJRgAjXvHH0WwGqjDTTYOhCSkIVb7wQf/jTXfb3PinbTlUIAu/wlCtcUZ57EXi3vhwP5pl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lXhw/UGG; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lXhw/UGG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781783663; x=1813319663;
  h=date:from:to:cc:subject:message-id;
  bh=aiTjH8qBsejlW7U3Ys21CxXC2X5umQflOQf+5N7VbuA=;
  b=lXhw/UGGsAbS8QbteuuHARIKPbCgQpyyfy/aHVYYim3ZdpHEQgaOOkR6
   lRsuozdPmhksiKGqs84TvJDhA9UiA9luS5DM/N9ehKj/9iRrerSDYxccg
   +XK5303quoHet1sxD9VT23L45mH3eJn0X6M/6/fEWbuGkbyZ5/YuegGSr
   tezq9OW7AFQXX22cBGJp+RN9g8KtHuJX6wheaX2B8sO9ksx6L4uPaprK9
   W0NC4OH1UZKJOBDI0b5OhPmGX6XeyJ2fENf1C4vrgIyiTj+JLR7BmxKpR
   VsPhqMn/dtJWnM3oE1S9lQeqReUnN9WibcsZpR8Bk2aWL/k8vHdopjX/W
   Q==;
X-CSE-ConnectionGUID: O+GOs3AGS+G0Cx+PhQel9w==
X-CSE-MsgGUID: Hmpj9mQ5TH2SmSTKbhX22g==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="81600054"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="81600054"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 04:54:22 -0700
X-CSE-ConnectionGUID: ghbNwit8T1KesZIFQGKpyQ==
X-CSE-MsgGUID: C9O7i/DMTACXfdm2jiJl4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="248413157"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 18 Jun 2026 04:54:21 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1waBK6-000000005Vp-41qi;
	Thu, 18 Jun 2026 11:54:18 +0000
Date: Thu, 18 Jun 2026 13:54:06 +0200
From: kernel test robot <lkp@intel.com>
To: Zhen Ni <zhen.ni@easystack.cn>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/mm/page_owner.rst:70: WARNING:
 Literal block expected; none found. [docutils]
Message-ID: <202606181325.BmDnZMdG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Zhen-Ni/mm-page_owner-add-print_mode-filter/20260618-120023
head:   a6203d6b795b685775fd5306dd11f9f3d96de65b
commit: a6203d6b795b685775fd5306dd11f9f3d96de65b mm/page_owner: document page_owner filter
date:   8 hours ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260618/202606181325.BmDnZMdG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606181325.BmDnZMdG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Non-Preserved Properties
   ======================== [docutils]
>> Documentation/mm/page_owner.rst:70: WARNING: Literal block expected; none found. [docutils]
   Documentation/networking/skbuff:36: ./include/linux/skbuff.h:48: ERROR: Unexpected section title.


vim +70 Documentation/mm/page_owner.rst

    69	
  > 70	To filter page_owner output:
    71	
    72		cd tools/mm
    73		make page_owner_filter
    74	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
