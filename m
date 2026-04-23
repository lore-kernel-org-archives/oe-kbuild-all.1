Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1464A331A5B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Apr 2026 02:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776912348; cv=none; b=rTX+c61NmoMCcJX1/ke6SBbfsoh61IbVuDIbxtSVzbmuZTowvRL9LkL9TQbVxK0j+GoVWJeT5HVvI3alBfbL4vwSBilo3TCVAu77rPeLP2dT6Ri07uT5RiWzogk7iDhjIlDg1l9E3uMxkVdBgYP2XiEfB1x4GN1LOugrH6cxECM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776912348; c=relaxed/simple;
	bh=r8v/5zo3lxkP90RLurYLygG3hlJzqeP3nOV/lhbKs0c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sFkGicoLbdrfzLE6vc/LZnL0wouUcKGrKytq+exwML/XRlUlA7WLKk2BTN54vQPuotPbrbe6NP79ClLVVDFrQzHqfESorKEib1Mf8ECRAcpec/U99fZNt49lLCgD3R5zTcSUvM6sf0C4U5lu0FgzGYuQ1tGkiXjzaLd7z5PT3hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UzpgJ6Hl; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UzpgJ6Hl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776912346; x=1808448346;
  h=date:from:to:cc:subject:message-id;
  bh=r8v/5zo3lxkP90RLurYLygG3hlJzqeP3nOV/lhbKs0c=;
  b=UzpgJ6Hl95wagnoaVW8Vq/XSOp7q5Uqpj2xg8BnHGn3mTvNQhZhVl5wH
   J2L+vaMte8Vftn4hkPMU9qx2I2LSZo18eO5bahGl+xdEkf/GEaNUcxOLE
   EmkyqkHie1zdj9vGqgrDffEAADYzxQLaJLFcLk1rm/KQAnDkrjYBMxcLy
   mJvlcRbpuxdl7BvqKtFA0nNzkLXeo2sKbm9bRb6NPYtPpq+kNPxRdzEHp
   ftizCiNL84X2hX0jPHU/Paz/b3DYOfer8JPbttrVuKsLsUNu2fYE7I7Wd
   qZgHEt7ptn+beMN1pPcYJOLuKIpV2w+xzwaWu3LDrjJXbY4E/1ysG7vLf
   Q==;
X-CSE-ConnectionGUID: HJX321QyTA6wj/PSltQGbw==
X-CSE-MsgGUID: quPJjqxIRxCZ/w9SsqADLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="89339429"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="89339429"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 19:45:46 -0700
X-CSE-ConnectionGUID: mTs4k2QnSlKGS2cwHMjlQw==
X-CSE-MsgGUID: 1nD/VxUzQfqy705Wdz4j4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="255814564"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 22 Apr 2026 19:45:44 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFk4T-000000002wL-3YRX;
	Thu, 23 Apr 2026 02:45:41 +0000
Date: Thu, 23 Apr 2026 04:45:28 +0200
From: kernel test robot <lkp@intel.com>
To: Enzo Matsumiya <ematsumiya@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Steve French <stfrench@microsoft.com>
Subject: [linux-next:master 14382/14612]
 fs/smb/client/cifs_debug.c:395:30: warning: 'cifs_debug_dirs_proc_ops'
 defined but not used
Message-ID: <202604230427.fhOj2MEi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   70c8a7ec6715b5fb14e501731b5b9210a16684f7
commit: 63bff18d4aa02fa595f7e8582543c6f92c4f9fbc [14382/14612] smb: client: fix (remove) drop_dir_cache module parameter
config: i386-randconfig-2006-20250804 (https://download.01.org/0day-ci/archive/20260423/202604230427.fhOj2MEi-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260423/202604230427.fhOj2MEi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604230427.fhOj2MEi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/client/cifs_debug.c:395:30: warning: 'cifs_debug_dirs_proc_ops' defined but not used [-Wunused-const-variable=]
     395 | static const struct proc_ops cifs_debug_dirs_proc_ops = {
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/cifs_debug_dirs_proc_ops +395 fs/smb/client/cifs_debug.c

   394	
 > 395	static const struct proc_ops cifs_debug_dirs_proc_ops = {
   396		.proc_open	= cifs_debug_dirs_proc_open,
   397		.proc_read	= seq_read,
   398		.proc_lseek	= seq_lseek,
   399		.proc_release	= single_release,
   400		.proc_write	= cifs_debug_dirs_proc_write,
   401	};
   402	#endif /* CONFIG_CIFS_DEBUG */
   403	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
