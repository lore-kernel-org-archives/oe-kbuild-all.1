Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF57386567
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Aug 2026 15:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786460655; cv=none; b=YWxNvi4mj2sIf3JN089OXfIms0a6Drs7OUEqmkC1o43MKDuWoM24liwMMS/PCp1/5xC3lGZXumzhdFLT5Z7aW0sDSi5cK4LjG69g/wiGkbE6rK3V4YFIZzw3jn5nSct/FPnpCKereSPD3aL43N17cYIMDKvfOUX4egBNmbMBU2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786460655; c=relaxed/simple;
	bh=24mRB29PumQOmbLTiuGqPfiqALaKLrKKs+8nf21qk68=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=r7CCosFKj73gu8heShAUh+JEDN/RbsbDqFQXLaO/7fq9kxxx05b65p/A9Qdw1kcjPVQUvA03sFYeQJFkUlXnctJ2WvZvU+ZCURmlfTyfUzTH5iwAInrRvuEIE77Hf/KF0kXl8gkT/LflFwJM6RPzSDRkjdMFGRSXGelX3gK9UP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iyjQvzW9; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iyjQvzW9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786460654; x=1817996654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=24mRB29PumQOmbLTiuGqPfiqALaKLrKKs+8nf21qk68=;
  b=iyjQvzW9aXrcpc4KtdYzYIwp5EB00h+KvmU/YDFSzVWR7VlgPHoipA20
   I4ERQTPaxowuKUcWn7E9LXJvAz7I6MtHjUFQKGelyI1R/yQfjxnuTfMfL
   h5c5QXCRbp0VhAFKtP1ca69RwuNrVMgQwm2DuOFujCkyKZt7sqc3cKVa9
   DbM3g+jMlsk37B9OrmiwMVJ2M1oIVtGC64UWvjSaBxi6r4CIKgK+tka8e
   dI5s8zhVv60A2pG31UsJKC/ILo+sLAn9WdP3wk69S097OUT94cJa0TtOu
   CpDf3MNy+hujGx/berNa0d8b96VRJ3fvzQTf3Idf+SW39qQeyPqmlnc30
   A==;
X-CSE-ConnectionGUID: 0+FoKOtSTM6SDZdQ8pfJlw==
X-CSE-MsgGUID: bChrUVUVTYe8F/HWR8pgMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86924783"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="86924783"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 08:04:14 -0700
X-CSE-ConnectionGUID: XLzPbVnIROWasuCh+P96zQ==
X-CSE-MsgGUID: lXRmG7WsQoCcYAD5mHs/ZA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Aug 2026 08:04:11 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wto1R-00000000OtB-3uuI;
	Tue, 11 Aug 2026 15:04:09 +0000
Date: Tue, 11 Aug 2026 23:03:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 35/64] Warning:
 kernel/time/timekeeping.c:210 function parameter 'aux' not described in
 'ktime_aux_to_mono'
Message-ID: <202608112220.DiiW0RMD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   3e8fc6d2f17abed506fb832160ecd7c7e5fdd222
commit: 60b76d2c62bb7a5a95a2141f4d894620b87ed201 [35/64] timekeeping: Add facilities to convert between monotonic and auxiliary clock timestamps
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20260811/202608112220.DiiW0RMD-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260811/202608112220.DiiW0RMD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608112220.DiiW0RMD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/time/timekeeping.c:210 function parameter 'aux' not described in 'ktime_aux_to_mono'
>> Warning: kernel/time/timekeeping.c:210 expecting prototype for ktime_mono_to_aux(). Prototype was for ktime_aux_to_mono() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
