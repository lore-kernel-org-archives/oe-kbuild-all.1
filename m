Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7E9130A57
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 11:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712317126; cv=none; b=C/I2eMHrARW9w0hQC6FAeZLL38j+O/sRHY8DQ495ZeDDvjUKiy0F8LwvqB6OSHqhmcxfSRNseK1qUNZLVqjGjiPebv2cNU+cZLJpeQFeOIBQzgQd9WimUvb7qQ1ghxXZ0wYNHNNAsjP6mx3OwEu8mpgrKKalqA9qNaTiWLa1HnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712317126; c=relaxed/simple;
	bh=CLr7byU1d8n7DVHbrWcSxvFRc7eDLpTQKFwiUJt9Jlg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jwePDwqws7BWUBvUmXvF7ddgpnNckye1PIXI0HWEedMZUCu+SaWDj44c41ZvXHxGI/dhkL4QPky0CR0f6DC41gWmmUTiMUGxY9u5XNZ8UgdN8VsL2qxyLTv9R7tElpnMQBce8FJ6o2E35gjsPoR6dJcga+4At8dn0jp0wAM9tcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZIn7A7cF; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZIn7A7cF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712317124; x=1743853124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CLr7byU1d8n7DVHbrWcSxvFRc7eDLpTQKFwiUJt9Jlg=;
  b=ZIn7A7cFWeRrEHPUAkelNKJ5inhdBmxbWwXF94wer5+LyyJBzFVTDPaq
   x5qhqVEd2XXasBqATLp2+BOX4fsarIKu6obW9vtKItyABHLtbGC78XLTv
   K7e3MphFOtxeKr7cftg6oE65Vd6XNmQ92sPAzPAI8ekEqDvYA8zHp4HgK
   nVbTQRqSTVgiSWXqjRg8pea0bK1t/TNdxE7YfVh5AChK7l2bTEPfRQwK3
   0XmPF526wXqnHwRssZjKZoQ3yyxuFSBICHyOZ632QJZg7nksJWbKb7BrR
   H5ZkfrG3UvmCLJ6Nsv2WQcNEgAk+Ca1zNPANscFCBgDb3SLCH16YaYH1t
   A==;
X-CSE-ConnectionGUID: xHGOcSO5RA6eS7FDC72WRg==
X-CSE-MsgGUID: TXtJqeVVT1aeTggrQzlmIw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7540459"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7540459"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 04:38:44 -0700
X-CSE-ConnectionGUID: GUhG0R2cSJW0KdHcplX8iA==
X-CSE-MsgGUID: 1aDqVFS2SAGWLsBFkSYXaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="56602747"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Apr 2024 04:38:43 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rshu4-0002Dc-1w;
	Fri, 05 Apr 2024 11:38:40 +0000
Date: Fri, 5 Apr 2024 19:37:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 21/37] security/lockdown/lockdown.c:118:36:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202404051902.JBQPiwGU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   449fd46baa282dd51ed0f757f111cd2cb11d03d9
commit: 8ec52318b596220147871102d352e5f996b5d82a [21/37] security: convert to read/write iterators
config: nios2-randconfig-r131-20240405 (https://download.01.org/0day-ci/archive/20240405/202404051902.JBQPiwGU-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240405/202404051902.JBQPiwGU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404051902.JBQPiwGU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   security/lockdown/lockdown.c:79:21: sparse: sparse: symbol 'lockdown_lsmid' was not declared. Should it be static?
>> security/lockdown/lockdown.c:118:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got char * @@
   security/lockdown/lockdown.c:118:36: sparse:     expected void const [noderef] __user *from
   security/lockdown/lockdown.c:118:36: sparse:     got char *

vim +118 security/lockdown/lockdown.c

    78	
  > 79	const struct lsm_id lockdown_lsmid = {
    80		.name = "lockdown",
    81		.id = LSM_ID_LOCKDOWN,
    82	};
    83	
    84	static int __init lockdown_lsm_init(void)
    85	{
    86	#if defined(CONFIG_LOCK_DOWN_KERNEL_FORCE_INTEGRITY)
    87		lock_kernel_down("Kernel configuration", LOCKDOWN_INTEGRITY_MAX);
    88	#elif defined(CONFIG_LOCK_DOWN_KERNEL_FORCE_CONFIDENTIALITY)
    89		lock_kernel_down("Kernel configuration", LOCKDOWN_CONFIDENTIALITY_MAX);
    90	#endif
    91		security_add_hooks(lockdown_hooks, ARRAY_SIZE(lockdown_hooks),
    92				   &lockdown_lsmid);
    93		return 0;
    94	}
    95	
    96	static ssize_t lockdown_read(struct kiocb *iocb, struct iov_iter *to)
    97	{
    98		char temp[80];
    99		int i, offset = 0;
   100	
   101		for (i = 0; i < ARRAY_SIZE(lockdown_levels); i++) {
   102			enum lockdown_reason level = lockdown_levels[i];
   103	
   104			if (lockdown_reasons[level]) {
   105				const char *label = lockdown_reasons[level];
   106	
   107				if (kernel_locked_down == level)
   108					offset += sprintf(temp+offset, "[%s] ", label);
   109				else
   110					offset += sprintf(temp+offset, "%s ", label);
   111			}
   112		}
   113	
   114		/* Convert the last space to a newline if needed. */
   115		if (offset > 0)
   116			temp[offset-1] = '\n';
   117	
 > 118		return simple_copy_to_iter(temp, &iocb->ki_pos, strlen(temp), to);
   119	}
   120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
