Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE8E3C3BF4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 15:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772725760; cv=none; b=TO+VfYAWI7W5qvb9I7bZI4fBTkZzpMrbFrH0c4Fv+BCIGTsL/sK6+K/ybLh7BW+HFmhEYEdYa4h9hQpZ5nudaecrKVjfBsNMLn7lPCRwIjyshF6Iuykf/1BTNRhkvRZwak8MJQ8azpF+fIkbuwT2U9E47E8Y86QJOwsBUVuMY8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772725760; c=relaxed/simple;
	bh=smz1UkrhZt7UktF4rUBDdhRb0mXeNQ09+l8NyIywcHc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Zeb4UhlfikIM00pai2AVl8CT/rFKmRjDnd3aHJXUYrjVJXwY4MKbDgtjmxMHVn0koF4d9+IprAaqpyHvyix0o5KKkBQrSgr0MM8patnOGwoacVPvSLzAG+mosex4P+NtT1zv4V64Y7BRd8FUGFS1TdP7qnB919+Xq8tnuDn0SEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BEhnEijM; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BEhnEijM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772725759; x=1804261759;
  h=date:from:to:cc:subject:message-id;
  bh=smz1UkrhZt7UktF4rUBDdhRb0mXeNQ09+l8NyIywcHc=;
  b=BEhnEijMs2sNA0Qg4agqgFioaZOYT1Aqqv3LDPtWS5b4SohG3MaQlGEQ
   KfUmoqb3t9wU8N4NNeViuxoAXNg5z6a3WfI2CYj/zLQLWpJydCEr7V1Ij
   Y+8+V6nLnNX4dK1YhzXH/dQVOWVzqP7jjmjN4PGoWOS2TflUu9Eh8zMOC
   3hyj5MvQmiYRBfKZ+WWN0A4vVDmwBZS71vK0/eSr3vAS6LvSOa0ti4QGJ
   huhSkR9Qxa5hUzr552RJjc6WMWF0DHcxY43zt+wBaUHvez50vAbu7z4Vx
   2JlJRt1MicvWy/FrNQMnrRD9HEQUrEisEuUWYdKZB1bvz3rTyDIgSd2O9
   Q==;
X-CSE-ConnectionGUID: mEm3J60pQ0ygkMM/vNUcKw==
X-CSE-MsgGUID: YNDAwDTAQ0WQ7z/GVN3DkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73889910"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73889910"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 07:49:17 -0800
X-CSE-ConnectionGUID: sCka4QG5Qtag484uhqoSXQ==
X-CSE-MsgGUID: hodujwGsToC0nMkb8u7UGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="215936831"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Mar 2026 07:49:16 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyAwr-000000000rA-3Utf;
	Thu, 05 Mar 2026 15:49:13 +0000
Date: Thu, 05 Mar 2026 23:48:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:rw_iter 85/467] Warning:
 security/tomoyo/securityfs_if.c:101 function parameter 'iocb' not described
 in 'tomoyo_read_self'
Message-ID: <202603052347.YmLBhbQj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   9d549a35a0c4585bfc4ff24185c5d8cb7485078e
commit: 22036594654f902f323f6b659eb563a257e7aed1 [85/467] tomoyo: convert to read/write iterators
config: m68k-randconfig-r071-20260305 (https://download.01.org/0day-ci/archive/20260305/202603052347.YmLBhbQj-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603052347.YmLBhbQj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603052347.YmLBhbQj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: security/tomoyo/securityfs_if.c:101 function parameter 'iocb' not described in 'tomoyo_read_self'
>> Warning: security/tomoyo/securityfs_if.c:101 function parameter 'to' not described in 'tomoyo_read_self'
>> Warning: security/tomoyo/securityfs_if.c:101 function parameter 'iocb' not described in 'tomoyo_read_self'
>> Warning: security/tomoyo/securityfs_if.c:101 function parameter 'to' not described in 'tomoyo_read_self'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
