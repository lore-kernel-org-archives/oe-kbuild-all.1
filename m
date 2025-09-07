Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5026C191F84
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Sep 2025 02:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757211485; cv=none; b=EOuHwkGiLV+CVIhNqTzJXaHm7AZYu3UzZMjHF4mAfl1d+nN2URdDjSmnWuQdKxgn4EurYe+MhUvSqaQU2Pxp6Zq9e7ffCNXBhiHGAEdciswfG/MtLTqmiMr5KGNgRwWl5OVtxofm+EikB//ZV57xgq1AYWJlpZuSQ5hIIjY+gVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757211485; c=relaxed/simple;
	bh=cm4G7KoIwtQuhL6NLnCWALNLTdV6r+4o7J4FRio5OcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=spHcFX8YIWECnzfS16gzBYI3yFdQU5U2gVjZdCeMNwYenSEOVAi0wifSjd1dy0HJ31n4cjOqp1mV357vNmk6fose9WKXZcfJsx6zwY9v03RfYYEESuY0+NaJr3wSfJRa9tZEMqtjIqH+cQg2uBnk8IOOdTXzTr+WPtZx7X5dH9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VYMtPDsW; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VYMtPDsW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757211485; x=1788747485;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cm4G7KoIwtQuhL6NLnCWALNLTdV6r+4o7J4FRio5OcE=;
  b=VYMtPDsW7XZnmNkV+alxrdcLZKfSXhC+grVq3Ffb85V+fECAXEdVdjZ+
   DKFCVs1TWQn+cd18ax9pUFziBHM/1tP3fWnZ23q7H7QiVFHy5i6KQYieU
   0MUoYIOjRp1xIkGvrU6ROC+EFOOGF0Ol315U9j5sF89fwmdbz2NOZS0nK
   o/qp+HYRLi2UwZKufwiDUex9PW4CX88m7EiWbtcDUWSubdDWq2m0RNWbl
   J3n8UobkXvvM1XQEz+uQXzG/Yx5ecEVTY7AVPd2iOfRq3YDVLoPSkVo0e
   nvtVdihHPDm53cHcEgtGO3WuU9Hp8cQqwN9DBdGKmbT/4SdgNqQkc75Lq
   w==;
X-CSE-ConnectionGUID: 1+iCdrg5Rn2O6MiD6JpDfA==
X-CSE-MsgGUID: ZqJ459IxQ36shCexWlef3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11545"; a="70128570"
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="70128570"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 19:18:01 -0700
X-CSE-ConnectionGUID: AUCl7j+ySPGIuKkJm/WOLA==
X-CSE-MsgGUID: yHmN+5CRQtCtt7eHPaszlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="172044037"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Sep 2025 19:17:59 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uv4yb-0001x7-0o;
	Sun, 07 Sep 2025 02:17:57 +0000
Date: Sun, 7 Sep 2025 10:17:00 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neilb@ownmail.net>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 5/6] VFS/audit: introduce kern_path_parent() for audit
Message-ID: <202509070916.8uBFTDCH-lkp@intel.com>
References: <20250906050015.3158851-6-neilb@ownmail.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250906050015.3158851-6-neilb@ownmail.net>

Hi NeilBrown,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on pcmoore-audit/next viro-vfs/for-next linus/master v6.17-rc4 next-20250905]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/NeilBrown/fs-proc-Don-t-look-root-inode-when-creating-self-and-thread-self/20250906-130248
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20250906050015.3158851-6-neilb%40ownmail.net
patch subject: [PATCH 5/6] VFS/audit: introduce kern_path_parent() for audit
config: x86_64-buildonly-randconfig-001-20250907 (https://download.01.org/0day-ci/archive/20250907/202509070916.8uBFTDCH-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250907/202509070916.8uBFTDCH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509070916.8uBFTDCH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/namei.c:2804 function parameter 'path' not described in 'kern_path_parent'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
