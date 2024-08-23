Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9060E4A01
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Aug 2024 03:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724385258; cv=none; b=Aa1Id4PsF3w95Bi1As8GUpJ6XOomrXmbR7AVkt0phJO1PWNWhHkOS3BW/RWUpdcLq7AQuzaBNKIJMPaxinIUwUvlHiq5u49jrRdNwKwIeB0f+0krI0JXMdZBY2feehKgqudz16gLv1gEAVbQkMC9z+h/5qoUKmw1LjQgqEUfLCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724385258; c=relaxed/simple;
	bh=KqSfmuiDZA7uuAy4eylv1OZRpMvzWcqYPJY+Bfl1r8M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TWTahEwvUdPkJR+GjhmhIe+KEqE9BNxDbQEO6kEKAH/dyB1a+c7pmrf/g3ryh8WKdKGz2ha1MVCAXOSy5zlAXlwk0DOx2APdBi3xsa3dpvarA6e6J1f/YDsjminkG3ePcBwALua8KqWWuSJq1lyTQzpTNqImT/vzRmpwZOyTCQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hpbjwIrE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hpbjwIrE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724385257; x=1755921257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KqSfmuiDZA7uuAy4eylv1OZRpMvzWcqYPJY+Bfl1r8M=;
  b=hpbjwIrEIx3v305yV0jLA9NIh52LUfv+Dvp2+vcwovuY26Y0Dy20yeYU
   MgC0BUU1tdvue9ijt0LCddMFH/0pt0Fp9QMnG/j/8zvOuM3YZo8sdVuRC
   Ejt3h9ZnLS7EaMI3gJLoVTLdk2HrnjkxTaNme2amihUeI8LWxD/Bi1/0g
   f4cT1xN8WFGBuFYlciK2hx/fnQixsosAYy40vXB3w8Qiap96cYfOaL0nZ
   U1EP6DXuh1NLxlVkVJoYgVNYvySeg2u/8n92Xu9JmZyOPfUewVUouq6by
   +Aw2S0mIhgNJXter6JD38VYp6DQvMz5VAPQJxLTtrw7NM1pGvFH/dNiwb
   A==;
X-CSE-ConnectionGUID: hcZnRvnhTVysxRpyvJDaqA==
X-CSE-MsgGUID: VXlmGBH5Q8SjMWig9vXHug==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22716028"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="22716028"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 20:54:16 -0700
X-CSE-ConnectionGUID: pK3wwPYcReG6CsesC8sG/Q==
X-CSE-MsgGUID: Az3BT56/Rf+hDggzLp7C/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="99188000"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Aug 2024 20:54:15 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shLNL-000DT8-32;
	Fri, 23 Aug 2024 03:54:11 +0000
Date: Fri, 23 Aug 2024 11:53:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, chriszhou <zhouqin@3snic.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7228/13476] ld.lld: error: undefined symbol:
 msi_domain_first_desc
Message-ID: <202408231150.d9tyFM1M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   eccf28eefc9db7799534bd84bb958f3ecf978e2d
commit: 165b3cc224374728856b5584455d7ae7f054fbe5 [7228/13476] SCSI: SSSRAID: Support 3SNIC 3S5XX serial RAID/HBA controllers
config: x86_64-randconfig-001-20240823 (https://download.01.org/0day-ci/archive/20240823/202408231150.d9tyFM1M-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408231150.d9tyFM1M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408231150.d9tyFM1M-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: msi_domain_first_desc
   >>> referenced by sssraid_os.c:1553 (drivers/scsi/sssraid/sssraid_os.c:1553)
   >>>               vmlinux.o:(sssraid_map_queues)
--
>> ld.lld: error: undefined symbol: msi_next_desc
   >>> referenced by sssraid_os.c:1553 (drivers/scsi/sssraid/sssraid_os.c:1553)
   >>>               vmlinux.o:(sssraid_map_queues)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
