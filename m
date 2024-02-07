Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B243425602
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Feb 2024 10:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707300893; cv=none; b=pvxVW7FQuVB7EVpu5lb45kkCRo47Ps11cbe6uBS88RQDi6zDvYWXmTF43SCJHcYxbgZYqNcIsVfvTxZCeC8OAPOwnyTko4qzcqlceTTOHYUgxUqeCYdlR8cRrwTSYiKbx+QnXH2QWpdwbybJX7ezadzjNzezIk79cSzlIvvapp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707300893; c=relaxed/simple;
	bh=71R6xk5Y0bB+8o3FwIfnzjv39K3CpTY7dw8H0lc8JQk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=niDfN34KUiCWKI06sLn3HyTx6sG0SpFCj8DQ+heShTtXQL+5e9M1jc+PG5i+554+JM7krvou5CbT3B+fo/teWSYTkWrHQnhJOB8NZMFDLK5tlyxF+DIeSugVTc//0QzFAt5rEQv6Q6g1cQZUvsIM0AQAVkWj77PYn32t/wkJlDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KGs209DU; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KGs209DU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707300892; x=1738836892;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=71R6xk5Y0bB+8o3FwIfnzjv39K3CpTY7dw8H0lc8JQk=;
  b=KGs209DU0Po6NaPFsRd+Y+BNJ5RmHQeSqBmt6wtyBBaKXlqo5pssxDTB
   ulBIV3KZWBY8eRGq15/wtqGwfTuUlM59omB+bewKFH7pDcBRXKb9F6CZa
   2Kb37k4MAoeULbrmKPJdxr61j+wGnBDt/2V1kFE+FlrNgZ1TnwbJ/K01s
   8G3L9N4byZAjwUtveeEMls7ubFPy09FhI9EmNxfZJWnHLAU7o2xUEB52o
   nNGjwY/uE/LQka9iGNFFbbCkm1GqtcoAT4WNB7PMM8vv/+wl3JS2RV5ub
   jOzuo+v8wDzzeTrUxKGECCK9Rbp8txGlK+BUUCKBIwXCCWVKVQ8siqpcu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="838428"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="838428"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 02:14:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1601081"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Feb 2024 02:14:49 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXex4-0002Tg-2z;
	Wed, 07 Feb 2024 10:14:46 +0000
Date: Wed, 7 Feb 2024 18:14:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 9264/21621]
 drivers/infiniband/core/.tmp_device.o: warning: objtool: missing symbol for
 section .exit.text
Message-ID: <202402071824.I0cPOlSO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   6f00368917623a29203f8459d5a62ccde333172b
commit: 3de2425716bfa05f2fe8786983d1b9834d7af88f [9264/21621] IB/core: Add an unbound WQ type to the new CQ API
config: x86_64-buildonly-randconfig-003-20240205 (https://download.01.org/0day-ci/archive/20240207/202402071824.I0cPOlSO-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240207/202402071824.I0cPOlSO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402071824.I0cPOlSO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/infiniband/core/device.c:471: warning: Function parameter or member 'port_callback' not described in 'ib_register_device'
   drivers/infiniband/core/device.c:957: warning: Function parameter or member 'nldev_cb' not described in 'ib_enum_all_devs'
   drivers/infiniband/core/device.c:957: warning: Function parameter or member 'skb' not described in 'ib_enum_all_devs'
>> drivers/infiniband/core/.tmp_device.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
