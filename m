Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3343F2080C1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Oct 2025 01:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760317405; cv=none; b=clIKyx4xJHkWR1BChjuW13reutkjU7mmFuA5YxDOY6VLwhkMzfjIy5JCtW+QTPKnfEV7nMEpk2kvCzz5JQY6qu0WSpi6/5zdJY3HRSWxa95twohfs+JWLMdKLLZCZFLuVx2yKTdwDdsreX60jUNI0CtMbBw9VKl49ozmNUDVmRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760317405; c=relaxed/simple;
	bh=4IN80XIHmIh5QWyQCCa234y1l+QOeHsYpsAoSftQ5ts=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jehMqCOi4xYHxfIaVVyzIYqBvPtT0Yu77PQNJOqycxn8PrRLPsPj4GsLwZ4ndmuzkGovSJz886a6JOPc0ODHqmsyds2QOfZqV4V567U5V+TDUBv4dTJd0xUXMdiLb8SjABO4Bf5lm2RxH3KG8wuaDRVbofVD5FsCkK8mZbfafjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n7ffkLa+; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n7ffkLa+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760317403; x=1791853403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4IN80XIHmIh5QWyQCCa234y1l+QOeHsYpsAoSftQ5ts=;
  b=n7ffkLa+VHUend5BcpaTD/BbRDQN5alDdZoVUOHY7J8p6TCBRpodA6Ms
   IqYWWSClEORVlVWb3jcKMJgr1B0CwaaBp72WQogVZRnNdQKAEDLJRdtFt
   0yiC3MrZBnNY7v1gRCxm1W+WXSwV0tIKPOuvu/1lSAQ8ADB9ekUbbAx9E
   NAWSkXD1PaqaVLOT4YyZETs+9LHRLmeNO1lAZuAPN5RfgyFXF7+9bIOlb
   3Xa85z6GVk4FoCtiAgMmNNJk30sj4/oH8rMjfBINzuLHmJpXs9GNMHGLC
   y5P3LsymFh+0n1w3p4SB9VWYASbWJ/KoJBXmasF1mqvukQM/A1e4VjhWM
   g==;
X-CSE-ConnectionGUID: OYo8VKavRn6UfJo24wIaYw==
X-CSE-MsgGUID: TT1eBfkZR56B1YWIKbmd/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="80091874"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; 
   d="scan'208";a="80091874"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2025 18:03:22 -0700
X-CSE-ConnectionGUID: TbwemPGKRnm289cv20J0cA==
X-CSE-MsgGUID: Fwdpb3scSOWn7qDyVLmdmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; 
   d="scan'208";a="185482456"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 12 Oct 2025 18:03:21 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v86y1-000046-0v;
	Mon, 13 Oct 2025 01:03:14 +0000
Date: Mon, 13 Oct 2025 08:55:15 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/uml-remove-32bit-pseudo-vdso 1/12]
 usr/init.c:1:10: fatal error: sys/auxv.h: No such file or directory
Message-ID: <202510130717.yAOMXCk5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/uml-remove-32bit-pseudo-vdso
head:   ee58d0b817f435c1a73fc417102cb8aefe1b4099
commit: e6c28772c4759c29d7a326dd3cfc43a791d84670 [1/12] testing
config: arc-randconfig-001-20251013 (https://download.01.org/0day-ci/archive/20251013/202510130717.yAOMXCk5-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251013/202510130717.yAOMXCk5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510130717.yAOMXCk5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> usr/init.c:1:10: fatal error: sys/auxv.h: No such file or directory
    #include <sys/auxv.h>
             ^~~~~~~~~~~~
   compilation terminated.


vim +1 usr/init.c

   > 1	#include <sys/auxv.h>
     2	#include <stdio.h>
     3	#include <sys/reboot.h>
     4	#include <time.h>
     5	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
