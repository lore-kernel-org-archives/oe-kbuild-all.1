Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5637B1C3F36
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 18:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765649353; cv=none; b=pFw9CWs7RrALmdtP/+B3Weuy40ObaJ1MTzz9QE+7jPVlXBjuFk71aQVkXXnxwWLKHje3A4NazUia16S59lFy1jpRo8kPJ5QoagHFKNafYJhEcpjGlq9A3cET0djzzMsCnQ2lq6vRX6QFujvtplV6glMgUyA6C9TaRibt/fqQ63o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765649353; c=relaxed/simple;
	bh=SIP2upM3Ll/1J/WWGmOWoGKsZtUx/AbGnkbTe/WohkU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LMr7qYHQyJMH1JsjYavDC439Vo1IBMrua3HzSqBjqNFCbcYJBpGdTx/Qy/SoCA1huI4pCKoTBAVtcS9JCnri2SBVY2A3l3dHnP6r865gAWTs2sjeORqSLigvrqNMsMn4N0chZ7F4kO0yP7rn0CsqTwdjUHBXWqKi4KmECZBreq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fK8En9tL; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fK8En9tL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765649351; x=1797185351;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SIP2upM3Ll/1J/WWGmOWoGKsZtUx/AbGnkbTe/WohkU=;
  b=fK8En9tLfvS4+Z4Pd1zQ5/y/+8EIqUU6k3knkJZk+Pe9V6f7a7PfPwmi
   nn4X88OaNGuRu5P1360cYFGDBP6RB2WNExJFjvp+qeIESHTx/NwvhcCBR
   HgcwdcM7FljfMmLvVFayZWgnzBMqqWMT2OsFYqpHdmdSe9qy3A+TN1lZ6
   rZLDIT5JLO4olVJmLc1c7PHmpfPMDxQbACW+mEqb/squr/lZhs+vq9yYy
   OVKseC0pD5z93+GN+8NpkBlXQLW5NMxfUwYeR5fK1KQE80h83gpGNJyQF
   GsFTxs+ZPizkaBzBjuxtkP9fpKX82SE9OorS+gdYxD+W5TOdGUGwxn4rp
   A==;
X-CSE-ConnectionGUID: FEA5L8xPTp6SxR5GKleEVg==
X-CSE-MsgGUID: 0ngC59fqTN+LYKFHZ/aN0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67774999"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67774999"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 10:09:10 -0800
X-CSE-ConnectionGUID: M5X3tj0mQ/mbtyaVP23MZg==
X-CSE-MsgGUID: id+PLOWOR+yF8lTwm4eWCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197344296"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Dec 2025 10:09:10 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUU3H-00000000821-1j5D;
	Sat, 13 Dec 2025 18:09:07 +0000
Date: Sun, 14 Dec 2025 02:08:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/2] security/selinux/nlmsgtab.c:228:
 warning: This comment starts with '/**', but isn't a kernel-doc comment.
 Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202512140148.YGSW0p6F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lee,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5580efd2c7e4791254a0c26f9791aaa33dd70484
commit: 756151494432e57155135c9af08956a93d43a68e [0/2] Merge commit e7c6e405e171f ("Fix misc new gcc warnings") into android-mainline
config: i386-randconfig-006-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140148.YGSW0p6F-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140148.YGSW0p6F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140148.YGSW0p6F-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/selinux/nlmsgtab.c:228: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Use nlmsg_readpriv as the permission for RTM_GETLINK messages if the


vim +228 security/selinux/nlmsgtab.c

6ea234c74a6064 Jeff Vander Stoep 2020-01-22  226  
6ea234c74a6064 Jeff Vander Stoep 2020-01-22  227  /**
6ea234c74a6064 Jeff Vander Stoep 2020-01-22 @228   * Use nlmsg_readpriv as the permission for RTM_GETLINK messages if the

:::::: The code at line 228 was first introduced by commit
:::::: 6ea234c74a606475a0a16e20c4e471dedab4f399 ANDROID: selinux: modify RTM_GETLINK permission

:::::: TO: Jeff Vander Stoep <jeffv@google.com>
:::::: CC: Alistair Delva <adelva@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
