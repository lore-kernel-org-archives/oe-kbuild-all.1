Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4559BEAF6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 21:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731791773; cv=none; b=uyEcZzOdTHCHkfxydCGL20aVeQYZpjskDXpjsWDPPD+6QzRKgVTxf+paiWD+RPg0tVScY8pQWD1HDiLifCnlAJYYj9p2XqpJRTrWahsLTb6Z9yMGrUxCLZq+rMMpc3BnWIpt+TRpSaPm3X+EJ2jE8m3A4fw+d05nbP1rANIW22U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731791773; c=relaxed/simple;
	bh=S+qRADWNZygsuF+7PpOJ2/9lw6FLRKK2hwER19HzyjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FrbJKYj00BB35Hlw8uaB09IBaFbOh1PB06VG0yAFlt39gDDuIBcI5TuIQkgGQIuTTnCPh/FM9gKPEKQUoOOcKa74pqWmo03j8t1NBVHGXbSr6lZ8HV/7OY0jyPn/Wq6T1NpMBK6zs5QFXTZ4OemJsHyp3JuM+7/VSrRIFSYq2ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NpXhbDeP; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NpXhbDeP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731791771; x=1763327771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S+qRADWNZygsuF+7PpOJ2/9lw6FLRKK2hwER19HzyjQ=;
  b=NpXhbDeP2Ubd7+W/STBOmuRb694H7OjGN3wvtGEdf7lZxZMTAy6cHCk7
   yDhqTvCnZTWo/NcWywxP+paaOJ3xyz4qmE4/QKhcCvvdQUb6JYWc/VGr9
   5YdLJacjALaiHOXDvFuZ71Q7/dte/fIlDa53fkdYeYGZNd9cJbjP5i/z7
   qyfGt+QDO/QwQj0Mblubg7maSe5/9YbW6O9c72hl85tSPC49yEPjW6l6+
   fSHO/WBxuC+5iOyUs/b+JNkIAKqY5umXUxebzmsfS/7uamDCdwYPRAD9/
   ky8DzqXn+qBYReOE89PWAoHJvocSsm4huv/MMOYrKfFZbmOQY7PO2+gwR
   Q==;
X-CSE-ConnectionGUID: syrS9XorTViV1UB1m/kbgA==
X-CSE-MsgGUID: PdKy0QhdQSmWqwdTFFu4qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="19384584"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="19384584"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 13:16:10 -0800
X-CSE-ConnectionGUID: MvSdYtPDTFG0iklVVqpu4A==
X-CSE-MsgGUID: xLdNgoxmQZGHJfcLziQ3BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="126406575"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Nov 2024 13:16:09 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCQ9H-00017r-0h;
	Sat, 16 Nov 2024 21:16:07 +0000
Date: Sun, 17 Nov 2024 05:15:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 79/115]
 fs/bcachefs/btree_trans_commit.o: warning: objtool:
 bch2_trans_commit_write_locked.isra.0+0x1100: return with modified stack
 frame
Message-ID: <202411170504.YANy82Ev-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   21a5aa40972310f58b352b602a010f3a1c61f57e
commit: aa4f2856097289a5d571be3a20c26454f284c720 [79/115] bcachefs: bch2_trans_verify_not_unlocked_or_in_restart()
config: loongarch-randconfig-002-20241116 (https://download.01.org/0day-ci/archive/20241117/202411170504.YANy82Ev-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170504.YANy82Ev-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170504.YANy82Ev-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/btree_trans_commit.o: warning: objtool: bch2_trans_commit_write_locked.isra.0+0x1100: return with modified stack frame
   fs/bcachefs/btree_trans_commit.o: warning: objtool: __bch2_trans_commit+0x68: stack state mismatch: reg1[25]=-1+0 reg2[25]=-2-40

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
