Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E345C1BC41
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Sep 2024 05:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726550812; cv=none; b=SvU5xlXAKGr3oxKGdnSpJQMhiHI3mstjY26wNvvQMWuQnN4cEIuDMderUA1Hc5WBxBfqrDw32f7O7c0BBcmdROKKeJnePnyOJJ8zTELv9SxF+hAf7ZO7BQ/Xc/8DEHBiShsv9eob4Fuji96mHmezWCjCp1ow0EsviN5XNo9BfwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726550812; c=relaxed/simple;
	bh=EJen3csKdtQB6t0diPmmLIS6XV9f0+3qh56vgai8udM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WPgWiY3WRr394B3zwT4EdgCzwqw0YoGeGemIaDseVHhExkNp9K6abYT6DyE4WljuGpdwlyKInKxrSWmvT6c0sp3+zG6t7TJrB+dBxYiK9ARzGnowhxItyE1FsPBDtmlHEuze08oLKj3/VRTQEdTzEG2qYFIoJKEWYWt5apwFR5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j3dl5R6D; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j3dl5R6D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726550810; x=1758086810;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=EJen3csKdtQB6t0diPmmLIS6XV9f0+3qh56vgai8udM=;
  b=j3dl5R6Ddcrx2jrC0kd0HmK7Hyr42O+yw1ZrawpQgn+FPYmiR/Cfkhhb
   EwK/12Ztb8DR4A1XR3keDGXkBxM1ajzqttWK6h/Ak8SyjeEXKpow2wdHz
   UtHphMuUF5v4Z30jQn//01rBKKWPOsgMjcqKMdyuRRHNoQkE8gIM7hz5B
   EfoS3tnfQ2c/taUr1+juOvzHUXqcZ1cr8BmJTWFj8njNY/xAFBE3P3wS5
   OSH0uJa5w8eVV8EKuWc/1mudaG76AqKzn+/0ajGHdiw1oealG4o1DRcOF
   1D53V0YSyDivkOb2x87QCVkp2XrMuoqDoX69mSEKT4iFXVc1SDuUxJiDe
   A==;
X-CSE-ConnectionGUID: peOsiDltT5OnkoaBTQlZaw==
X-CSE-MsgGUID: nM3NloWGRHqNvi2+aF2ZtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="24931755"
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="24931755"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 22:26:49 -0700
X-CSE-ConnectionGUID: pMzmqdmpQZG+wisuCeMNlA==
X-CSE-MsgGUID: FKAH6BXxSUW5BexFc4iv1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="68959015"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Sep 2024 22:26:48 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqQje-000Ap4-0V;
	Tue, 17 Sep 2024 05:26:46 +0000
Date: Tue, 17 Sep 2024 13:26:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 185/447]
 drivers/platform/x86/intel/intel_plr_tpmi.c:255:29: error:
 'plr_status_write' undeclared here (not in a function); did you mean
 'plr_status_fops'?
Message-ID: <202409171304.anQXvmBr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   78e9603229ee010d330a9ca61ef1a62ee7317352
commit: 6eae7e5f0ef67708fc104dcec9ff84257d6a2b74 [185/447] drivers/platform: convert to ->read_iter and ->write_iter
config: x86_64-randconfig-006-20240917 (https://download.01.org/0day-ci/archive/20240917/202409171304.anQXvmBr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240917/202409171304.anQXvmBr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409171304.anQXvmBr-lkp@intel.com/

Note: the axboe-block/rw_iter HEAD 78e9603229ee010d330a9ca61ef1a62ee7317352 builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/debugfs.h:16,
                    from drivers/platform/x86/intel/intel_plr_tpmi.c:12:
>> drivers/platform/x86/intel/intel_plr_tpmi.c:255:29: error: 'plr_status_write' undeclared here (not in a function); did you mean 'plr_status_fops'?
     255 | DEFINE_SHOW_STORE_ATTRIBUTE(plr_status);
         |                             ^~~~~~~~~~
   include/linux/seq_file.h:230:27: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     230 |         .write          = __name ## _write,                             \
         |                           ^~~~~~
>> drivers/platform/x86/intel/intel_plr_tpmi.c:224:16: warning: 'plr_status_write_iter' defined but not used [-Wunused-function]
     224 | static ssize_t plr_status_write_iter(struct kiocb *iocb, struct iov_iter *from)
         |                ^~~~~~~~~~~~~~~~~~~~~


vim +255 drivers/platform/x86/intel/intel_plr_tpmi.c

811f67c51636d4 Tero Kristo 2024-05-27  223  
6eae7e5f0ef677 Jens Axboe  2024-04-04 @224  static ssize_t plr_status_write_iter(struct kiocb *iocb, struct iov_iter *from)
811f67c51636d4 Tero Kristo 2024-05-27  225  {
6eae7e5f0ef677 Jens Axboe  2024-04-04  226  	struct seq_file *s = iocb->ki_filp->private_data;
811f67c51636d4 Tero Kristo 2024-05-27  227  	struct tpmi_plr_die *plr_die = s->private;
6eae7e5f0ef677 Jens Axboe  2024-04-04  228  	size_t count = iov_iter_count(from);
811f67c51636d4 Tero Kristo 2024-05-27  229  	bool val;
811f67c51636d4 Tero Kristo 2024-05-27  230  	int ret;
811f67c51636d4 Tero Kristo 2024-05-27  231  
6eae7e5f0ef677 Jens Axboe  2024-04-04  232  	ret = kstrtobool_from_iter(from, count, &val);
811f67c51636d4 Tero Kristo 2024-05-27  233  	if (ret)
811f67c51636d4 Tero Kristo 2024-05-27  234  		return ret;
811f67c51636d4 Tero Kristo 2024-05-27  235  
811f67c51636d4 Tero Kristo 2024-05-27  236  	if (val != 0)
811f67c51636d4 Tero Kristo 2024-05-27  237  		return -EINVAL;
811f67c51636d4 Tero Kristo 2024-05-27  238  
811f67c51636d4 Tero Kristo 2024-05-27  239  	plr_write(0, plr_die, PLR_DIE_LEVEL);
811f67c51636d4 Tero Kristo 2024-05-27  240  
9e9397a41b7b1d Tero Kristo 2024-05-27  241  	guard(mutex)(&plr_die->lock);
9e9397a41b7b1d Tero Kristo 2024-05-27  242  
9e9397a41b7b1d Tero Kristo 2024-05-27  243  	for (int cpu = 0; cpu < nr_cpu_ids; cpu++) {
9e9397a41b7b1d Tero Kristo 2024-05-27  244  		if (plr_die->die_id != tpmi_get_power_domain_id(cpu))
9e9397a41b7b1d Tero Kristo 2024-05-27  245  			continue;
9e9397a41b7b1d Tero Kristo 2024-05-27  246  
9e9397a41b7b1d Tero Kristo 2024-05-27  247  		if (plr_die->package_id != topology_physical_package_id(cpu))
9e9397a41b7b1d Tero Kristo 2024-05-27  248  			continue;
9e9397a41b7b1d Tero Kristo 2024-05-27  249  
9e9397a41b7b1d Tero Kristo 2024-05-27  250  		plr_clear_cpu_status(plr_die, cpu);
9e9397a41b7b1d Tero Kristo 2024-05-27  251  	}
9e9397a41b7b1d Tero Kristo 2024-05-27  252  
811f67c51636d4 Tero Kristo 2024-05-27  253  	return count;
811f67c51636d4 Tero Kristo 2024-05-27  254  }
811f67c51636d4 Tero Kristo 2024-05-27 @255  DEFINE_SHOW_STORE_ATTRIBUTE(plr_status);
811f67c51636d4 Tero Kristo 2024-05-27  256  

:::::: The code at line 255 was first introduced by commit
:::::: 811f67c51636d43791995bf483c5c1904900b531 platform/x86/intel/tpmi: Add new auxiliary driver for performance limits

:::::: TO: Tero Kristo <tero.kristo@linux.intel.com>
:::::: CC: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
