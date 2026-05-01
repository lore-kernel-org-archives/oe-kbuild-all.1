Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9F81FD4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 May 2026 07:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777621903; cv=none; b=h+6RLPU8ru4IKNkSXY0bGEpD0zEt6KY5mF2ejFofrcXoMb/awgh3RcMCtz4zbbrfQErNtRabxKKA42Bhb9jy7BWEubnoF6IAf+ha7QZ9sUlKQIt2smrV5HBT62rzawoXkQbSDqu84RzuPYL0oggykPY7DBDlOgTIChTHVD89bUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777621903; c=relaxed/simple;
	bh=l7JRvPETpO1puQZk5wHm/9Dw0HtEyalL8je+g7u1BOI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Qym0MrzMXvJFvFV+Z9DJuwUg/hnsBDQ1EhE89sBmaKEzRilDDZQM7Iwjxj6N2LZX4I7mwtJh6wPn466Xbp17RVWA9Lzxw0hi/XkJ5FTND/+dYSPSv+G0npHS81EamcUBs4sIqgvz5iFWKKPP8pZcJEectod2k0bjYwkRHUFxVUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fULymyZs; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fULymyZs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777621901; x=1809157901;
  h=date:from:to:cc:subject:message-id;
  bh=l7JRvPETpO1puQZk5wHm/9Dw0HtEyalL8je+g7u1BOI=;
  b=fULymyZsYVC/rmg0uQKFak4bWxfBk5yEPSTKesp9Qjw/SVDFgYQ+mdWy
   IjRSZ0VBtZTDLa9EIskq+FAFI4mLrLjyzh6HYqrwsUFozsVzxZuwAc50Y
   mah0G4iFucSQsyZ7gfFai8aeLnTtwBhvu4s/wZH1zQEbRHI8uiCys0ZPp
   xjM0c3c+eQbfe3eO7AiFqh3f1StJoo1xdS1WLs1LeQ8sBs7Fyb4rWETW4
   DyyXNEFpqmKvKa4fgLKYz9LbhttKQ21fzFHV5NVO0H1opFKgAlUsOZvWY
   Y3gZMzCyDlsTIuCeFXmWVkWQ8+as0qkPWrna1WFWnwZ1RvrQtR5jpdgk6
   g==;
X-CSE-ConnectionGUID: rdRS/nbZR6y9voRwu3rJ5g==
X-CSE-MsgGUID: Gv+JjSqeTxCn7lKw2rAI3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="89959752"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="89959752"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 00:51:41 -0700
X-CSE-ConnectionGUID: nvKaByBgTraGBpAeKInUHg==
X-CSE-MsgGUID: h7bGYXNCQl6gBQyfsKRWQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="239791617"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 01 May 2026 00:51:40 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIiev-000000000L3-483M;
	Fri, 01 May 2026 07:51:37 +0000
Date: Fri, 01 May 2026 15:50:48 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/glink 52/56] Warning:
 drivers/rpmsg/qcom_glink_native.c:130 struct member 'open_work' not described
 in 'qcom_glink'
Message-ID: <202605011559.2YZ8gwH8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/glink
head:   5d897d0f6b0bbd170ef332eeae9a8329ec812a5e
commit: 3124b00c0ce66420e8a52272570b42bc9eef5e24 [52/56] rpmsg: glink: auto-open channels listed in device tree
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260501/202605011559.2YZ8gwH8-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605011559.2YZ8gwH8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605011559.2YZ8gwH8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/rpmsg/qcom_glink_native.c:130 struct member 'open_work' not described in 'qcom_glink'
>> Warning: drivers/rpmsg/qcom_glink_native.c:130 struct member 'open_work' not described in 'qcom_glink'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
