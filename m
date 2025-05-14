Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D748A1482E7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 12:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747225584; cv=none; b=dolCNdbEXjYMnhLs1aEmZcTm6rQOCthkvhmOBiuvWHMyLBGGBUbogAxJPqq3F3oKs2UKW7+qguYjhdGjUzDPz7ct1q2twj8rwtB8wASmfaPqq9bF/d13jSVadqzaxmwSQs7JPh1lxuneokmK/gqGqer53PEQpOvvDyCIfq1E6Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747225584; c=relaxed/simple;
	bh=VKdunYHzNsljWxUwfUcsx0oDa4lnDPzauJNrYuQNlnM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EmoyRgfCuKx0iLAMyRuTegVOcggdTvrKaOGPQvtUPbOnTauTxvH++iOYKblTIQjD7xWCC3P8v83AH0U2GIfgAfL5tw1Vwqh7rEb686Ah+sVAS+z77HqE9VKlXi/hUbtfbxWy/wScdw5rLJFirRhWWNmV0yDLiWbS0VBU2bSJ10k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JHJdrD7i; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JHJdrD7i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747225583; x=1778761583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VKdunYHzNsljWxUwfUcsx0oDa4lnDPzauJNrYuQNlnM=;
  b=JHJdrD7ix5jQRMf1HmZIltQbxS2vwx41Qs82Ay8/ZWztceugVNEbJud4
   ZhzFUQhaWGBOz03SyLZFQh2TQxy5G5w4q9FD4XWiOQ1wQXaQYtaHQnYOK
   kM4BWZ7IHX7j4OzR4DZtazburk5hBW+3LWpprj9boM6ghsld9Um0Xjvpl
   WqTBVN9rB3UKqKVlwcHik5PmaWn42cWnyT5QYhKV7ytUmWHzeSk99mJri
   YACCsiEnrVz01Tpo01/Rf0O2KCLiftGY/qv415SEe/C6C2f3GUGnOOGT4
   PkRU1fNp5cjf1rfIIIuTrcFyZvYU+Sz7H6PTqez6aDN10YuilKjBeX8jG
   A==;
X-CSE-ConnectionGUID: VSEHVggHS56QGVzMf/tMSg==
X-CSE-MsgGUID: G35DSX5OQE6moMOaWdBGTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="60519718"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="60519718"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 05:26:22 -0700
X-CSE-ConnectionGUID: GCUwWwtKQhmljC7kHTDRVg==
X-CSE-MsgGUID: pUYVW33JRU6XlME1/BiXGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="137732899"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 May 2025 05:26:21 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFBBi-000H6V-2Y;
	Wed, 14 May 2025 12:26:18 +0000
Date: Wed, 14 May 2025 20:25:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, WenChen <chenwen54@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2894/2894]
 drivers/ub/urma/ubcore/ubcore_tp.c:392:5: sparse: sparse: symbol
 'ubcore_modify_tp_state' was not declared. Should it be static?
Message-ID: <202505142017.QGHM5TBg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   731227d05f54b13300b28332fabd3f3aaf0950eb
commit: 329bf7f331286ee5d571d374e31ed50d2877b110 [2894/2894] ubcore: fix the bug of tp negotiation concurrency
config: x86_64-randconfig-r121-20250514 (https://download.01.org/0day-ci/archive/20250514/202505142017.QGHM5TBg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505142017.QGHM5TBg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505142017.QGHM5TBg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/ub/urma/ubcore/ubcore_tp.c:392:5: sparse: sparse: symbol 'ubcore_modify_tp_state' was not declared. Should it be static?

vim +/ubcore_modify_tp_state +392 drivers/ub/urma/ubcore/ubcore_tp.c

   391	
 > 392	int ubcore_modify_tp_state(struct ubcore_device *dev, struct ubcore_tp *tp,
   393		enum ubcore_tp_state new_state, struct ubcore_tp_attr *attr, union ubcore_tp_attr_mask mask)
   394	{
   395		if (ubcore_modify_tp_state_check(tp, new_state) != 0)
   396			return -1;
   397	
   398		if (tp->state == UBCORE_TP_STATE_ERR && new_state == UBCORE_TP_STATE_ERR) {
   399			ubcore_log_info("tp is already in ERR state and tpn = %u",
   400				tp->tpn);
   401			return 0;
   402		}
   403	
   404		if (dev->ops->modify_tp(tp, attr, mask) != 0) {
   405			/* tp->peer_ext.addr will be freed when called ubcore_destroy_tp */
   406			ubcore_log_err("Failed to modify tp to %u from state %u and tpn = %u",
   407				(uint32_t)new_state, (uint32_t)tp->state, tp->tpn);
   408			return -1;
   409		}
   410		tp->state = new_state;
   411		ubcore_log_info("tp state:(%u to %u) with tpn %u, peer_tpn %u",
   412			(uint32_t)tp->state, (uint32_t)new_state, tp->tpn, tp->peer_tpn);
   413		return 0;
   414	}
   415	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
