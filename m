Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72150154C15
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Mar 2025 03:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740887081; cv=none; b=cyoys8Ki63SalVznmB+i6p1P7IfQ9Lqn9YfvaYzyWT0OfwJm6UQ57M7UGhH9VgapsTXl9nODoehdH+aY77rwLjL0F9l1PeDfqy4a8dKTu+5uRkhLWaG1GY0gBR15EM6rF1FJuLCXKHJzHkyFDl4owR6peR7W8b1UaHrMXPocZ2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740887081; c=relaxed/simple;
	bh=D4Et02bRXR0uOioP/XLEhw+MuMyoAR1euqfr4n0RRXY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=paEP2w+SSQrC6oPgCjkbbFKkq65RtRh5XT0+WJ1zf3wirN6Rh9PUDNcmp1kJjgAKLmk27Zh+QvSLK368n/G1ndeO/lzn5UjfCIpEyIPg4lCUc9C6dj8rEkcPsxv979aZkT+PNiB0UosPxMHyZemWFbW+6E2sfPyjfXjM0qQFFM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O/5ImGGp; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O/5ImGGp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740887079; x=1772423079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D4Et02bRXR0uOioP/XLEhw+MuMyoAR1euqfr4n0RRXY=;
  b=O/5ImGGpF0MaMN/5BMbmYS31h6mSnYR+1gboWllHvrTRQKiOQlgUVj+0
   /dBL7rFMT/VRnpgGTf2ro48EYcPZq994KfOT09xgvDbeVriJ0lNnBbY1r
   mW4BwfKiuwH4VizzaCAyXv6rPLhjnKW3vIzIezUxik2X9Az3RjBIRcAri
   K8Q4fcV0JE4bEFFSTn2MMDMQrY7i/Doqajgr0dJZ85/BhTlhUUy+YqohA
   7VhRGnCHk8EEaDjR5d+esS8CWQjNlTC9md7nPnXxN+pEWDtL6MR/1sKEX
   PWRHBP/rsYCD4z1TWx93nN/4hpMMQgfuujKQ+ab2XafNxXA2O0x6mKuZ4
   Q==;
X-CSE-ConnectionGUID: sh2B1LD/SbCurhmEOpqhHg==
X-CSE-MsgGUID: LWLqTLUSSzWYcWyzAnrG9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="51987347"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="51987347"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 19:44:39 -0800
X-CSE-ConnectionGUID: TYZ4oIYyQ4u83zb6teyekw==
X-CSE-MsgGUID: 2g8lMpD8R1O7Em8RoUFkaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118220434"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 01 Mar 2025 19:44:37 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toaFQ-000H0e-0c;
	Sun, 02 Mar 2025 03:44:13 +0000
Date: Sun, 2 Mar 2025 11:42:51 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:res-lock-base 17/25] ld: locktorture.c:undefined
 reference to `rqspinlock_held_locks'
Message-ID: <202503021114.Q0EjYduS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux res-lock-base
head:   c6b97ff28d4cd12bd2b957513acb6bd5c220427a
commit: 86261c2424a935d6eaec2740140fccc18bf517f7 [17/25] rqspinlock: Add locktorture support
config: x86_64-buildonly-randconfig-003-20250302 (https://download.01.org/0day-ci/archive/20250302/202503021114.Q0EjYduS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503021114.Q0EjYduS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503021114.Q0EjYduS-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/locking/locktorture.o: in function `torture_raw_res_spin_write_unlock':
   locktorture.c:(.text+0x10c7): undefined reference to `rqspinlock_held_locks'
>> ld: locktorture.c:(.text+0x10d6): undefined reference to `rqspinlock_held_locks'
   ld: locktorture.c:(.text+0x1105): undefined reference to `rqspinlock_held_locks'
   ld: locktorture.c:(.text+0x1138): undefined reference to `rqspinlock_held_locks'
   ld: kernel/locking/locktorture.o: in function `torture_raw_res_spin_write_unlock_irq':
   locktorture.c:(.text+0x1f07): undefined reference to `rqspinlock_held_locks'
   ld: kernel/locking/locktorture.o:locktorture.c:(.text+0x1f16): more undefined references to `rqspinlock_held_locks' follow
   ld: kernel/locking/locktorture.o: in function `torture_raw_res_spin_write_lock':
   locktorture.c:(.text+0x21b7): undefined reference to `resilient_queued_spin_lock_slowpath'
   ld: kernel/locking/locktorture.o: in function `torture_raw_res_spin_write_lock_irq':
   locktorture.c:(.text+0x22fd): undefined reference to `rqspinlock_held_locks'
   ld: locktorture.c:(.text+0x232c): undefined reference to `rqspinlock_held_locks'
>> ld: locktorture.c:(.text+0x23cb): undefined reference to `resilient_queued_spin_lock_slowpath'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
