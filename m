Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A3C1534E8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jul 2024 21:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719954915; cv=none; b=u1+zTfuwRzDmvHR+thinnxJ0Ocqrx8qQgfHoZjpt6gD6+5CYHq8tPcrSp1t6sgeBProW3jA6HlKI3318Vf1bzLXSxIenjMB9jUVJCm0rokvpeMxyLgUHJi2ZG5Q3FtjSBZo/xb2md9IVLmxC1czB0OVABsg1XAQwXcWYIob8Q/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719954915; c=relaxed/simple;
	bh=O5/IUH8Vqnc+L7rpppKezP2wYQsz+q0H3BGeO81eO0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ufIJJDeHWWKfMHP6ZaH4xFlXcPKNx2z5rEXPQYVd3loDhBC2pzYxDnWOAmAJpqhl56gx2hqBnhph6mwi8nTbxbDeObPYRQEpxPG0bG9cHj8cIhvKviIdvV+DGk5yUqpcdiqdbaRLOcABHhRJ7EgdMOy/ODRs5Jf7qio59bsES4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O9JO3W9P; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O9JO3W9P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719954913; x=1751490913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O5/IUH8Vqnc+L7rpppKezP2wYQsz+q0H3BGeO81eO0c=;
  b=O9JO3W9Py+0JiP8FCI7gHN1V/bawY0Ig7QIFyFfiuLQcv/9D7CMy8KCs
   WCkQA3sPTR81iHgIBBNCbEITAe1YKDO4rcOJhAox53+qH1YXmhuq3VBXs
   1YhnokxApegj8ze1ajhnlFbJ13BfDij0Q8TJ8dA5Hb2cw77+EtU/lXQWc
   iMC1LOGtu8tgN9nI/1Vrrl9gk5G3M3DzKPYLO2Q4ZIRFN4O40sTR4X7kA
   KFpvSECri9HHiPtnqDdfMu/uW78laZBWCeQOTvK6/ggCwSxLJ0FW++zIq
   99X2qFFq+temcP6YdKxaRSMa8D7V6T3nUE+VzZWogFRFX4u3y4qfD3FMe
   g==;
X-CSE-ConnectionGUID: bF6s+rIDQl+J/ZwKsACMZg==
X-CSE-MsgGUID: m+E/HES1Syyd3ENCULBBVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17031669"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="17031669"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 14:15:12 -0700
X-CSE-ConnectionGUID: /PYkdhWBSGSnEpZDVhMMDg==
X-CSE-MsgGUID: dtwbddYNSH6vDgj+FQd6+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="45945428"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Jul 2024 14:15:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOkqD-000Ogv-0r;
	Tue, 02 Jul 2024 21:15:09 +0000
Date: Wed, 3 Jul 2024 05:14:29 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 28/36] /usr/bin/ld: zcrx.c:undefined reference
 to `tcp_read_sock'
Message-ID: <202407030518.hrTuMGJT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next
head:   daa95af9ac26711b21e20be3c8d512d6de26bb11
commit: db28eb2f9cdc35a6dbf288322fc0da445a78b421 [28/36] io_uring: add io_recvzc request
config: um-randconfig-002-20240702 (https://download.01.org/0day-ci/archive/20240703/202407030518.hrTuMGJT-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407030518.hrTuMGJT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407030518.hrTuMGJT-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: io_uring/zcrx.o: in function `io_zcrx_recv':
   zcrx.c:(.text+0x13a2): undefined reference to `tcp_recvmsg'
>> /usr/bin/ld: zcrx.c:(.text+0x1406): undefined reference to `tcp_read_sock'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
