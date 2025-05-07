Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E445A246787
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 09:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746609354; cv=none; b=buguKkei9PYd0yazqTVwkjmozVxOLI+LDr6iARejHzhA9MfLuUOcJSTsbh3dBF4X9O7Ni9KYxJitJQxdt9rx8waeYYRMmt3GsKhokFMlnY/fMtxy7z/i364NMJXiDbh+ewDvSZcCdI0q+B1uoku/1jM70fzvGBbl5tNrIiUbFUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746609354; c=relaxed/simple;
	bh=YbKBodxx3iHKU0sfYBgqX3V0p8EprrkpRpxCsiIA5co=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DIcSz5JL1dJK1TCoEvBNZfBfvKJ2xlbKBSPwYAfEXO2xSrYDK37pqgVv3c9qevwWeGyKArH6fZI5Rwa21sYJDw0qLDdCtY40BJes+WhKqT4Gm4vuh92R9ViIodB7kZBmVr+2aCN/qq+NA/us3fAsnENEIyYkanNTDBxGnOk9RgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J3Bm1EPu; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J3Bm1EPu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746609353; x=1778145353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YbKBodxx3iHKU0sfYBgqX3V0p8EprrkpRpxCsiIA5co=;
  b=J3Bm1EPuoP6u5BOlzIOxI8e9O5qdbtarO5aca2n2K5GQ5byruZzBnlz1
   wEvNi4CIntGnOzcsBD5BHm2cWYwb4La/W9NoIKk3Qx4mFsg4Ce6dQYY1q
   8bPC7+vFqT3qNWcrNTSHiTggmDit5e8Yb/YCCwVgXldvBKFQUQzcbzH1f
   Z57Uzc6umLXgJ9mKdzY2+nvrZof0D0hrCM8dVWNQdkiqyzF2nNkNrQ99U
   WTy7P5H+5DuAsGSnqzgpXsSimdrMr5+J0cdfnhMOzxkSoZK4h0F4TUjAH
   Ua8zHyhS6yvdG+VD7C+aivf8brXn/2PUX/g3FvFN52l1WxFACTIAwr7uP
   w==;
X-CSE-ConnectionGUID: BVR0vkw2Tgyk4MhVMM/ojA==
X-CSE-MsgGUID: g7/ddCSVQ+asgcA+4aXasA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="47426875"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="47426875"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 02:15:52 -0700
X-CSE-ConnectionGUID: eVaHyr1cQ0qSxUcrZpr7vw==
X-CSE-MsgGUID: 43KlySDtQ3qX6eOU4IRZpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="140739202"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 May 2025 02:15:51 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCasX-0007U5-0U;
	Wed, 07 May 2025 09:15:49 +0000
Date: Wed, 7 May 2025 17:15:45 +0800
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 2860/2907] Warning: security/apparmor/lsm.c:1129
 function parameter 'sk' not described in 'apparmor_unix_stream_connect'
Message-ID: <202505071706.i5Kntbro-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   08710e696081d58163c8078e0e096be6d35c5fad
commit: f817aa0658cbee38efe7d0a7128d34288cf85d05 [2860/2907] Merge branch 'apparmor-next' of git://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor
config: arm-randconfig-004-20250410 (https://download.01.org/0day-ci/archive/20250507/202505071706.i5Kntbro-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071706.i5Kntbro-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071706.i5Kntbro-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: security/apparmor/lsm.c:1129 function parameter 'sk' not described in 'apparmor_unix_stream_connect'
>> Warning: security/apparmor/lsm.c:1129 function parameter 'peer_sk' not described in 'apparmor_unix_stream_connect'
>> Warning: security/apparmor/lsm.c:1129 function parameter 'newsk' not described in 'apparmor_unix_stream_connect'
>> Warning: security/apparmor/lsm.c:1161 function parameter 'sock' not described in 'apparmor_unix_may_send'
>> Warning: security/apparmor/lsm.c:1161 function parameter 'peer' not described in 'apparmor_unix_may_send'
>> Warning: security/apparmor/lsm.c:1269 function parameter 'sock' not described in 'apparmor_socket_bind'
>> Warning: security/apparmor/lsm.c:1269 function parameter 'address' not described in 'apparmor_socket_bind'
>> Warning: security/apparmor/lsm.c:1269 function parameter 'addrlen' not described in 'apparmor_socket_bind'
--
>> Warning: security/apparmor/lib.c:92 function parameter 'size' not described in 'val_mask_to_str'
>> Warning: security/apparmor/lib.c:92 function parameter 'table' not described in 'val_mask_to_str'
>> Warning: security/apparmor/lib.c:92 Excess function parameter 'str_size' description in 'val_mask_to_str'
>> Warning: security/apparmor/lib.c:92 Excess function parameter 'chrs' description in 'val_mask_to_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
