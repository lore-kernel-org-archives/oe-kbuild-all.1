Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B832066D0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 09:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733392727; cv=none; b=mtg3kbtxkpO4WvtBwkyxkiYQQma/oiCUya690qbBvm6IKVjd02awXneXKUd3zX5NPECv4gdKA37iuQFDmuvurcwUwk8b+qNs9eVasisdNRYFg/kSlEqnlQsDq491V/ZurVsthoSbrKfMovme8d6oAdlFk1hpXr1e2IJ/SgEGTPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733392727; c=relaxed/simple;
	bh=d2hRN6bugTHS4LP8ehRJgSru7OT6l0Sj0Ihp+G/Zw58=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=INI+PwEB/qYzISQS78lObNGcbreXosm0r7tIGC5oK9GO0t8/CIC0PRiMYWu4VSAAKce3OussWR0HOCD/vGFYxWtX/iIXXThw4aj/0QMxdSwGr5dphW7g5UWl1OGBzBWgIfqqImXEz7naAjowonpu7OJ0VCz0howL5fzbxA5wUNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oEb7D8qB; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oEb7D8qB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733392725; x=1764928725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d2hRN6bugTHS4LP8ehRJgSru7OT6l0Sj0Ihp+G/Zw58=;
  b=oEb7D8qB/jfZ+aa8Y18lyQxlB6irDt7fIXdGoMLS0RS2w1I+JjRlF960
   tyfDsbnCt5LvHADU6ku0YKrfSxdwngL6EuU2R9nyiWDjI8NY7Ou8cyK/S
   hN0sXGZdzug+e2sjKBVnMI63vUhPSdmD++HlT2A/A0JX0QftKNXTxyr+V
   /aDp7U3n0ODaU9QZ9G7PW6OYqxCGoQRIyYQREGyVLyKuWh+30Ii7B6GTx
   Vyjd7Xu2PRG2YLeazEFFbYGypja2LpKX9NddPFGWNITkbUFe1iF9lNDql
   pXRsTjdD6eHzu9VP1cRnRgtYOvuZXPRsKakprUIz8Xmad0nyin5SGPQti
   A==;
X-CSE-ConnectionGUID: 6hAiouKaQ7eJq+Zd3g+kJg==
X-CSE-MsgGUID: IOVMs0L4Qi+rrpHf14ZXqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="56174615"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="56174615"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 01:58:44 -0800
X-CSE-ConnectionGUID: ZPwPMryEQveldUrO5jG6rg==
X-CSE-MsgGUID: Gmh3GftgQruyE18OXZARag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="99125974"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 05 Dec 2024 01:58:43 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ8d2-00043H-2c;
	Thu, 05 Dec 2024 09:58:38 +0000
Date: Thu, 5 Dec 2024 17:57:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wei Li <liwei391@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2546/2546] net/netfilter/nft_set_pipapo.o:
 warning: objtool: nft_pipapo_remove()+0x65f: unreachable instruction
Message-ID: <202412051737.2B7Mf0Ys-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Florian,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   fdc4bca5e9e486a894194c2b6a956492b11d8cc5
commit: 6da9c2b3be7f43cb2dc8c55be00b80bcdc27dba1 [2546/2546] netfilter: nft_set_pipapo: do not free live element
config: x86_64-buildonly-randconfig-004-20241205 (https://download.01.org/0day-ci/archive/20241205/202412051737.2B7Mf0Ys-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412051737.2B7Mf0Ys-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412051737.2B7Mf0Ys-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/nft_set_pipapo.o: warning: objtool: nft_pipapo_remove()+0x65f: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
