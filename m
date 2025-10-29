Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2452750E6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 15:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761752207; cv=none; b=NUi927wUFocO5UKTgdNK+2waO1SQIaodWjsCzcSMrqpOlLLD81FtFiQcDmLXuirCm3oGM5rUqw/oWfjFYdPyrSmUm/PCwkTrEaNPU2Njc6HpMiTewzKB8tDDQJq6YHG3RDBQDtqpvCUxhkS19GXfceDP1UPbNUJo9F40NhhXtQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761752207; c=relaxed/simple;
	bh=uTVXoOCRFPUMsxk4qt71HyVWVsokl7MLDvG9SuiWEvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MRM2WEvTUaIeWM1jafvNfGUrp+gX1hk9edT4uY1NZKTLNztMMo6ziF5l+a6VYhYJBUYNfGbGT2PRMibqu9+IccwyTLPf1/Q2y0rv+kBm6KVNn0ZxOBa0ov7XsCNzeTpuhm4pZmYAXGyjfLnXHXWo3O7LTScXyjVZkNHDHO+axaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i8MvEuKk; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i8MvEuKk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761752206; x=1793288206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uTVXoOCRFPUMsxk4qt71HyVWVsokl7MLDvG9SuiWEvs=;
  b=i8MvEuKkAn7/RQPRy2f6DjK0O6tKHIdqpsW0CNlvAUHjdGTpT3RwBN50
   1ArMPwXFCIMn8EralwRF+JOrGBb53mSo+zJNDxtOaWR1nxBimP+BOYrax
   YeyNzE0nq3Me+SUfQV7ZmjCKkr6fbeAG0DSxdcPI9Gw3/t3TlAZpkt8bX
   la6Hk+xTcfn/d2w0A1s/3zPMfFaXoApmpicIElGADzuYRssxTPd1c5sqz
   pTWk/h7uQoL88FI8tSKonqNunsK4rSADtyhdJFZ9+o0pKb3OUubgdJL7m
   wL4M390vSMi/Fihg5fdm8/IpwLo83qdC8u+NObTBRqk9a3TdWhYxtxPmc
   g==;
X-CSE-ConnectionGUID: zomfvx/NS0ivoO/qV1zdPw==
X-CSE-MsgGUID: d2usWXtQQQayQnXaFJBvXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63761507"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="63761507"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 08:36:46 -0700
X-CSE-ConnectionGUID: SHFmCnRORAeDj818vrlhrQ==
X-CSE-MsgGUID: asAsXrclTQyd2yDYo++UEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="186152959"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 29 Oct 2025 08:36:43 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE8DV-000Kjb-0L;
	Wed, 29 Oct 2025 15:36:13 +0000
Date: Wed, 29 Oct 2025 23:34:27 +0800
From: kernel test robot <lkp@intel.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [brauner-github:vfs-6.19.inode 6/6] Warning: fs/inode.c:1609
 function parameter 'isnew' not described in 'ilookup5_nowait'
Message-ID: <202510292317.UP4H55Pm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs-6.19.inode
head:   f5608fff035ae2310a647984998060546c3ec6dd
commit: f5608fff035ae2310a647984998060546c3ec6dd [6/6] fs: rework I_NEW handling to operate without fences
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20251029/202510292317.UP4H55Pm-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510292317.UP4H55Pm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510292317.UP4H55Pm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/inode.c:1609 function parameter 'isnew' not described in 'ilookup5_nowait'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
