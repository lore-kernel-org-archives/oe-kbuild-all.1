Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9B83264FB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 20:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784408319; cv=none; b=f4L+CiWAFhedrI29LcGruU2VwM7nZognLfXrWM2kFum+F+CD6XdRRYPTd3H8hd6hCUSjx8wA5oWjzZ0FC3VSuQ4c9lJ9lt7rr3UUrRtp/5P7uk3SH/Yd1U3V62tvW2ERSTQq9JcmTKRy7m5PGM1KmbKeHflZ9FL6MzcgatX1odk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784408319; c=relaxed/simple;
	bh=aDivy4d6K68WhooYYO+ZQsu4xyJzsJ6IsEGu9w4l+JM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CnEujlOywj9UydlJflb4QUPesHlxOFf5LUYJYfkszvnX2+F5EKVmFyvrG8fIhV+qM3S683mQYk9FblWw0j2y9yaOgf0QBrrISDUJ7p8x2GgORu7q8b8df1lJs9geEpaO38trpJNO03AyZmr6vvmBAZxUjy5Eo96QPvKUKx92W1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rd1+YH/v; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rd1+YH/v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784408315; x=1815944315;
  h=date:from:to:cc:subject:message-id;
  bh=aDivy4d6K68WhooYYO+ZQsu4xyJzsJ6IsEGu9w4l+JM=;
  b=Rd1+YH/v/gZPqXdHQE4vzrG89SnHURZZd7ZD0Odz0rXDgGdqvy9qNtkV
   EcRubwhRSqy/db7RGdp3u6VVgdYydR6GUVTzXTKpYivLAOhwO5T1dUPVX
   A2Sodyqn4ApaFPE6QEVMLZ+0ae3BhI8SsoYZZrxtWEZFlA9JygiND+VTc
   IeeWkh3jVlK00dkpFFGUgWj/IcplSj0eSx0rRTMH5LNWZNpGN6UqaGXd5
   GMyfP9Me8OgtU49aHSOKjRYUeBe6VKNyZXhbwT238dSWgg0nbw4ai458q
   yJkavktceuJ0KLAfnZSNVgJrnsICxLeU/v2lxGIk4d0ex45tKp71Q6ZHS
   g==;
X-CSE-ConnectionGUID: x9V01ksPQkCN37vJD54gjg==
X-CSE-MsgGUID: mchtSJrESwiosXK34nH9BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11850"; a="87581473"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="87581473"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 13:58:34 -0700
X-CSE-ConnectionGUID: lpCDTdfRQIGOUa7RwbCK1g==
X-CSE-MsgGUID: a8AYrgt2QK+0RKUFn0UCgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="257722066"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 18 Jul 2026 13:58:33 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlC6M-00000000V6n-0cSQ;
	Sat, 18 Jul 2026 20:57:59 +0000
Date: Sun, 19 Jul 2026 04:56:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 32/33] {standard input}:18: Error: symbol
 `__export_symbol_tty_kclose' is already defined
Message-ID: <202607190444.eqFhKqQk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   59ff18fb9ed34a7d03e8dc75c448a35fd8949ba1
commit: a81a24b4431ee452c72fc8aa523bf6c3afde386b [32/33] unexport tty_lock CHECKME
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260719/202607190444.eqFhKqQk-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260719/202607190444.eqFhKqQk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607190444.eqFhKqQk-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:18: Error: symbol `__export_symbol_tty_kclose' is already defined

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
