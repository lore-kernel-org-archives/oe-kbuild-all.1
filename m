Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793644640;
	b=0ue5p/mOwDk8IhpZFK5CMzBjO5OmTBQJcnbArnh+SHLCtptdLdDqmosPdNM2dhaf8w/d
	 NklMJcXYL8XnOswSeQQHoXeHqSRIvgCdKVqb2fs4YZ7Ad296K0zuJho9cvfxtvcsHu3Yo
	 k2X3iglkoU6IC/NyUWwZ4Vqrnvr6EgD7AOp6DsfqD9Sgul+jHoAl/T40OxGfIkoe9FrWZ
	 edZG/Tx+qCuahVFCtieyXr2leBSjsFtKxTPLksx5VxTOn2tKXXUVQeWWOBZGCGdYfPHPd
	 s6UwteIUR8gnSBl7Ucfp0pnc4+ZBTF+cdqFmoqUvqzH1S86yIRkiWWEUaS3t6hTFYpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793644640;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=abqkswgtFQmiFmU7+ExKU8DN2+g3xHYN90rasaD8iGY=;
	b=rCv51upgZ+xCCe68r/5X/iPqWtQlliQf3UYalHvBqz5ky0NdVaLKvwU9xUcHZKUJo4Eh
	 V2hFrRhqzNbmNbn4oi5bqn/OvjxrGu+xuhreUMu/84HxsS5zuUZgC/6D3+keVHGDo87ym
	 eFUnbU36egDpLkXwt4YUqh16wKqQo+U0IBMwq6A0tTP8VCrJqBa6sHI/gOJuUcwM2Eocu
	 NyF3j/XjJlsPpleKsK7bkapwo/xC8qn70k2llgQGKLHr2VIXQ+Lqdf0bWsTlipHxYNHkL
	 GlHI50xHI4aW1XhrklcTEPxk1GKur1xoH9cAU8OLblmlOvkyM38shzeb/FXJSphetew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b5vfuRa1;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7062D606A327
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Nov 2026 18:37:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7062D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b5vfuRa1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793644639; x=1825180639;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XBBSxBJM4dbAmhw9qJHLVU5PGpaTLbyMmJayE5/gdWA=;
  b=b5vfuRa1YCBnl5GCe7xI9NJo265n/Y2WNPDyBu2GdKE2GRKo9IzWiloJ
   YQU7eNuV9wQpsKQIBurLJ9gDYIcu5gCC5DF5ni6ReJ7DDMY3GydoT0aeP
   t9UYx7Bph8STqeMfjrV99vvnpaJLI1DpfJH2nrgQSZ+3aSiOZqzBquwAu
   8Gu2hiDsXomd2nGevVB7iNKTQ7m8A/qJjf/K34KOXUEHKidMrPCdHz++k
   bl4Rnin7MRx7gq+Tb6jiJv6Eq5U0GMFfzpwgWpdpmu/0EGG3Wpc5gR/Hk
   t0Yd76r/52hwbawasen172aV7d9eo2URh/W2cQ/iQ+th9vwTEtuNf275L
   A==;
X-CSE-ConnectionGUID: CxQXD/L2QzSy7g4umfuLFA==
X-CSE-MsgGUID: NbuQFaqNRhOnSFSvc8RFlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2241906"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2241906"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 10:37:18 -0800
X-CSE-ConnectionGUID: PwC639boRYutcH2UfyYAcQ==
X-CSE-MsgGUID: tzPbWeIfSDu1ced30xPCeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="8035743"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 02 Nov 2026 10:37:16 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNwu9-00000000heW-2SzP;
	Mon, 02 Nov 2026 18:37:13 +0000
Date: Tue, 3 Nov 2026 02:36:56 +0800
From: kernel test robot <lkp@intel.com>
To: Edward Adam Davis <eadavis@sina.com>,
	syzbot+a31cda410a4ccd419712@syzkaller.appspotmail.com
Cc: oe-kbuild-all@lists.linux.dev, axboe@kernel.dk,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] loop: prohibit the use of sysfs as a backing file
Message-ID: <202611030239.QMvbuUI3-lkp@intel.com>
References: <20261102103354.427722-1-eadavis@sina.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102103354.427722-1-eadavis@sina.com>

Hi Edward,

kernel test robot noticed the following build errors:

[auto build test ERROR on axboe/for-next]
[also build test ERROR on linus/master v7.3 next-20261030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Edward-Adam-Davis/loop-prohibit-the-use-of-sysfs-as-a-backing-file/20261102-183354
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-next
patch link:    https://lore.kernel.org/r/20261102103354.427722-1-eadavis%40sina.com
patch subject: [PATCH] loop: prohibit the use of sysfs as a backing file
config: nios2-defconfig (https://download.01.org/0day-ci/archive/20261103/202611030239.QMvbuUI3-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261103/202611030239.QMvbuUI3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611030239.QMvbuUI3-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/block/loop.c: In function 'loop_check_backing_file':
>> drivers/block/loop.c:537:48: error: 'SYSFS_MAGIC' undeclared (first use in this function)
     537 |         if (file_inode(file)->i_sb->s_magic == SYSFS_MAGIC)
         |                                                ^~~~~~~~~~~
   drivers/block/loop.c:537:48: note: each undeclared identifier is reported only once for each function it appears in


vim +/SYSFS_MAGIC +537 drivers/block/loop.c

   528	
   529	static int loop_check_backing_file(struct file *file)
   530	{
   531		if (!file->f_op->read_iter)
   532			return -EINVAL;
   533	
   534		if ((file->f_mode & FMODE_WRITE) && !file->f_op->write_iter)
   535			return -EINVAL;
   536	
 > 537		if (file_inode(file)->i_sb->s_magic == SYSFS_MAGIC)
   538			return -EINVAL;
   539	
   540		return 0;
   541	}
   542	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
