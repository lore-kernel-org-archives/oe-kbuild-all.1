Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDC97464
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 16:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741453046; cv=none; b=NlgL7AoEwQb7Mm6yVB0cAMOHrTq0Tmtkir0iGi534vfzyj/hNFI6CUUfmJTdfpHGkG/iVBL3CFWAJZjOdxx0c7kYs/Np2JaffuUK0h1TwCT+DLs6/EDjaMPFT0nMaW7aEdAFESFOWT942vuh1gIYLUZ8zDsoBzq83gfIFu4Wacs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741453046; c=relaxed/simple;
	bh=BA2aeLzFFPBNgVJJOb3Xek3uvLxuzrPM+SZakjvJdJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uv5zYylk7KhZnhdk7qfoOf9frx/qnDV0tLiDPJIB77dnTDueGgC8ng7tVYvku/7z86c/+sMbe7iGijbaw6nSstJ9D+zVYm+zrwuQE43ysBWQV0H8ydF1+8YkrAzuAb/wBP6ZYtNld3mDvGFGdLn0r3z0Gy6/xknh+UjsXShAC10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DhTpYBxC; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DhTpYBxC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741453045; x=1772989045;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BA2aeLzFFPBNgVJJOb3Xek3uvLxuzrPM+SZakjvJdJ8=;
  b=DhTpYBxCKJCNZ5IDbvYdJLPZGG630miAUFCOQKawh3Fx1n/ogWS9xhDj
   Bz9LNAJCBxS5q8E4zz9EWOYVxyDpCAM0eAzpM/QEyj1WouraXiM2Gf+Yu
   y/+iXsvu8qhcZJXew+p6bQX2tiYD42aI/ELQYKgxxMUXkcF77PVvFC5VY
   EuwPaAu4IYsS0FJ7ZyT7aSNMaCuMe2XJec24jDi4bdr+8I/3zWmnxO/ys
   /ZziJ1fqxfgaSI7xIiMzLhm0BQoDchNkrbIbibRyHtX9JQs1gF+AYs8M6
   Asi9CWqp6t+IleZc0K6T3+DZoHYE6FEI7IfnqHgYUp5yVD7Z3yLDfJw+O
   Q==;
X-CSE-ConnectionGUID: CzhUoWlMQjq3XnlBNbp6tQ==
X-CSE-MsgGUID: 9Lc0ExTdRpSJeFiTJTP9PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="42194489"
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="42194489"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 08:57:24 -0800
X-CSE-ConnectionGUID: mZFmJZnJTTGsxXOpoRZaOw==
X-CSE-MsgGUID: xyPkvp4nQTaxDJnBSZ8DtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="119584982"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 08 Mar 2025 08:57:22 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqxUG-000270-22;
	Sat, 08 Mar 2025 16:57:20 +0000
Date: Sun, 9 Mar 2025 00:56:21 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fsnotify-fixes 1/1] fs/notify/fsnotify.c:653:55: warning:
 unused variable 'parent'
Message-ID: <202503090008.XERPAjyn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fsnotify-fixes
head:   5653cb5c4b685aee55ccbb488b4b51603348f7d9
commit: 5653cb5c4b685aee55ccbb488b4b51603348f7d9 [1/1] fsnotify: avoid pre-content events when faulting in user pages
config: arc-randconfig-001-20250308 (https://download.01.org/0day-ci/archive/20250309/202503090008.XERPAjyn-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503090008.XERPAjyn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503090008.XERPAjyn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/notify/fsnotify.c: In function 'file_set_fsnotify_mode_from_watchers':
>> fs/notify/fsnotify.c:653:55: warning: unused variable 'parent' [-Wunused-variable]
     653 |         struct dentry *dentry = file->f_path.dentry, *parent;
         |                                                       ^~~~~~


vim +/parent +653 fs/notify/fsnotify.c

90586523eb4b349 Eric Paris     2009-05-21  643  
a94204f4d48e28a Amir Goldstein 2024-11-15  644  #ifdef CONFIG_FANOTIFY_ACCESS_PERMISSIONS
a94204f4d48e28a Amir Goldstein 2024-11-15  645  /*
a94204f4d48e28a Amir Goldstein 2024-11-15  646   * At open time we check fsnotify_sb_has_priority_watchers() and set the
a94204f4d48e28a Amir Goldstein 2024-11-15  647   * FMODE_NONOTIFY_ mode bits accordignly.
a94204f4d48e28a Amir Goldstein 2024-11-15  648   * Later, fsnotify permission hooks do not check if there are permission event
a94204f4d48e28a Amir Goldstein 2024-11-15  649   * watches, but that there were permission event watches at open time.
a94204f4d48e28a Amir Goldstein 2024-11-15  650   */
95101401bb50ae2 Amir Goldstein 2025-02-03  651  void file_set_fsnotify_mode_from_watchers(struct file *file)
a94204f4d48e28a Amir Goldstein 2024-11-15  652  {
318652e07fa5b17 Amir Goldstein 2024-11-15 @653  	struct dentry *dentry = file->f_path.dentry, *parent;
318652e07fa5b17 Amir Goldstein 2024-11-15  654  	struct super_block *sb = dentry->d_sb;
a94204f4d48e28a Amir Goldstein 2024-11-15  655  
a94204f4d48e28a Amir Goldstein 2024-11-15  656  	/* Is it a file opened by fanotify? */
a94204f4d48e28a Amir Goldstein 2024-11-15  657  	if (FMODE_FSNOTIFY_NONE(file->f_mode))
a94204f4d48e28a Amir Goldstein 2024-11-15  658  		return;
a94204f4d48e28a Amir Goldstein 2024-11-15  659  
a94204f4d48e28a Amir Goldstein 2024-11-15  660  	/*
a94204f4d48e28a Amir Goldstein 2024-11-15  661  	 * Permission events is a super set of pre-content events, so if there
a94204f4d48e28a Amir Goldstein 2024-11-15  662  	 * are no permission event watchers, there are also no pre-content event
a94204f4d48e28a Amir Goldstein 2024-11-15  663  	 * watchers and this is implied from the single FMODE_NONOTIFY_PERM bit.
a94204f4d48e28a Amir Goldstein 2024-11-15  664  	 */
a94204f4d48e28a Amir Goldstein 2024-11-15  665  	if (likely(!fsnotify_sb_has_priority_watchers(sb,
a94204f4d48e28a Amir Goldstein 2024-11-15  666  						FSNOTIFY_PRIO_CONTENT))) {
95101401bb50ae2 Amir Goldstein 2025-02-03  667  		file_set_fsnotify_mode(file, FMODE_NONOTIFY_PERM);
a94204f4d48e28a Amir Goldstein 2024-11-15  668  		return;
a94204f4d48e28a Amir Goldstein 2024-11-15  669  	}
a94204f4d48e28a Amir Goldstein 2024-11-15  670  
a94204f4d48e28a Amir Goldstein 2024-11-15  671  	/*
a94204f4d48e28a Amir Goldstein 2024-11-15  672  	 * If there are permission event watchers but no pre-content event
a94204f4d48e28a Amir Goldstein 2024-11-15  673  	 * watchers, set FMODE_NONOTIFY | FMODE_NONOTIFY_PERM to indicate that.
a94204f4d48e28a Amir Goldstein 2024-11-15  674  	 */
318652e07fa5b17 Amir Goldstein 2024-11-15  675  	if ((!d_is_dir(dentry) && !d_is_reg(dentry)) ||
318652e07fa5b17 Amir Goldstein 2024-11-15  676  	    likely(!fsnotify_sb_has_priority_watchers(sb,
a94204f4d48e28a Amir Goldstein 2024-11-15  677  						FSNOTIFY_PRIO_PRE_CONTENT))) {
95101401bb50ae2 Amir Goldstein 2025-02-03  678  		file_set_fsnotify_mode(file, FMODE_NONOTIFY | FMODE_NONOTIFY_PERM);
a94204f4d48e28a Amir Goldstein 2024-11-15  679  		return;
a94204f4d48e28a Amir Goldstein 2024-11-15  680  	}
318652e07fa5b17 Amir Goldstein 2024-11-15  681  
318652e07fa5b17 Amir Goldstein 2024-11-15  682  	/*
5653cb5c4b685ae Amir Goldstein 2025-03-07  683  	 * OK, there are some pre-content watchers on this fs, so
5653cb5c4b685ae Amir Goldstein 2025-03-07  684  	 * Enable pre-content events.
318652e07fa5b17 Amir Goldstein 2024-11-15  685  	 */
95101401bb50ae2 Amir Goldstein 2025-02-03  686  	file_set_fsnotify_mode(file, 0);
a94204f4d48e28a Amir Goldstein 2024-11-15  687  }
a94204f4d48e28a Amir Goldstein 2024-11-15  688  #endif
a94204f4d48e28a Amir Goldstein 2024-11-15  689  

:::::: The code at line 653 was first introduced by commit
:::::: 318652e07fa5b1743d08eeccd69a1f47f2c15710 fsnotify: check if file is actually being watched for pre-content events on open

:::::: TO: Amir Goldstein <amir73il@gmail.com>
:::::: CC: Jan Kara <jack@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
