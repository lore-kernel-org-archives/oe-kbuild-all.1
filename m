Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B0F315D5A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 19:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766345471; cv=none; b=M70hLRnmnxPSDlLs37E8oYBcsX8k3sWQDg6PpU7fk/i4Qhbqc8uSecr8OR8mtRuUanuBjUhYh06u64If2ahEGQPcfTKoVbEZr5VrQhvbNAgPoDfPcQPavZGHaz1+OKdztuSVIrSni7kBXh/gd9ZxtEu2XQl+hu1Po9FRnUs1ER0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766345471; c=relaxed/simple;
	bh=DKjmW1bukYDobQ06uuEc8wGhreYKXUH8Qxc35Hza860=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AuxZULj6wdF/pbykslyTzK80xMwZFsMkCt0T9+XnnL8SWjho9/moz/U+z1PtkuVdQq/QO66Rp7hiL5fTp/6h9g6E0F9HlURgYsCetC/t70Y+l9VNWnpRcBs9JOgMfU2o0eNSBqmRWvoNaRq7o2jKkMMS582QjAuAgULfFM/fOU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OEyPWwyz; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OEyPWwyz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766345468; x=1797881468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DKjmW1bukYDobQ06uuEc8wGhreYKXUH8Qxc35Hza860=;
  b=OEyPWwyz6Y0cjqn4qd7Acpw340puso/W39aEmeBHYnK5jgROAHV1xx9d
   3WiCoezzhIX0hEaG61l+mb7rbJlIZ6lnLcYdt98oZoLdQvSEvebjrsy0Z
   +4R2+EFAcZ99QqpF4E9AVzY4EVmJC8DJGDHg+WgTQt6DDgUPwmH8ydvvp
   zoA5TpY8Okm67oGc9HKrOouhQBpLWJS/nq3qyYqn2rD98VSC8C0QUWXlj
   2CUjJ1LNPcMQbDn2wDntyvfWMgFyTouQNLKdGEjCoiElHdrq6H6mIg/19
   xVVnqH/eDdvZXZWVFdEoboBJbA+ydNZ0SBF7P4nexX1+8JLQUE45S4E/C
   A==;
X-CSE-ConnectionGUID: l8aLgpuGRw6RYEzsp4g66w==
X-CSE-MsgGUID: EuPzu+YxSeONBXNJBR/Jkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="71850073"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="71850073"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 11:31:08 -0800
X-CSE-ConnectionGUID: ciB/9KAoSDGjnmRPqY3I/Q==
X-CSE-MsgGUID: Q01K6bHKQTOK1thCehhXog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="222844165"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 21 Dec 2025 11:31:07 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXP8y-000000005D6-2T3b;
	Sun, 21 Dec 2025 19:31:04 +0000
Date: Sun, 21 Dec 2025 20:30:20 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 5/5] fs/fs-writeback.c:138:6:
 warning: no previous prototype for 'wb_wakeup'
Message-ID: <202512212055.FqHvVmJI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   54e1389bda8399711722cd321abe212a2327e9a3
commit: 55cf94258af72fd493779ab2b7a4278d5c8d1d21 [5/5] ANDROID: writeback: export symbols to do a hierarchical writeback control
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251221/202512212055.FqHvVmJI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512212055.FqHvVmJI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512212055.FqHvVmJI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fs-writeback.c:138:6: warning: no previous prototype for 'wb_wakeup' [-Wmissing-prototypes]
     138 | void wb_wakeup(struct bdi_writeback *wb)
         |      ^~~~~~~~~
   fs/fs-writeback.c:1349:6: warning: no previous prototype for 'redirty_tail_locked' [-Wmissing-prototypes]
    1349 | void redirty_tail_locked(struct inode *inode, struct bdi_writeback *wb)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/wb_wakeup +138 fs/fs-writeback.c

   137	
 > 138	void wb_wakeup(struct bdi_writeback *wb)
   139	{
   140		spin_lock_irq(&wb->work_lock);
   141		if (test_bit(WB_registered, &wb->state))
   142			mod_delayed_work(bdi_wq, &wb->dwork, 0);
   143		spin_unlock_irq(&wb->work_lock);
   144	}
   145	EXPORT_SYMBOL_GPL(wb_wakeup);
   146	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
