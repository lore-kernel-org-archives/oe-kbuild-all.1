Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5EC1553B7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Apr 2024 09:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712741435; cv=none; b=k9VcJIPKaUvVK1sGn2Pf15u5v7Dux9By16tSdk6CqIt1OHBNkjKeIeVnbYWjytoO8AZcHIkgO/hFML91XMo4zshXG76OZeZhLM8YxSKzsizWcKHmJmn/Z+nFWSvAmG8pxZx3icmPoAUgB9wYS1QvdokuoRFxhDdWRxESFlDMSOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712741435; c=relaxed/simple;
	bh=xiPaz//5+rGT2R4UInsNQpP9vaQ+RSn8tE4iqC2hJ5E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MMaDqZBL8OEZxQQd73lJp4dJbkgrbIW/02NiWAGN/XcfaftULqbWbmMoXf/qWmnsAOIWEbExtUBl9XiVQn59X1+3ir7sQS2C5DAnADjv6tBy1Fhw8JRt+m4GEgX54gnrfbRvVzS78OVuAHTrvLnkdgOzfX8Qb3861ma2qEo+IyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Liyh3gdG; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Liyh3gdG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712741433; x=1744277433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xiPaz//5+rGT2R4UInsNQpP9vaQ+RSn8tE4iqC2hJ5E=;
  b=Liyh3gdGI1Y8tUpP4TKQAUCYtAkIOYTmKsgSGDKAyPokqobylqrqb3Bl
   KP/tuzALpyATN0jRTNH6gG96nE5jsmrQ3rlT0DH+xZvgLQ1WumFe8e+fd
   hKx8aK1SQInHjFgPTEtOmXuArF75PDvT2huMSlNuOhMa83Dt9yq5Q6/Qh
   oz5LJ463YmBVtR6yuJ4B0fgiyieRztIyALJJNVEI/4BqbyEK5VQbLkS3b
   JrWJVWgdu1d3D9KII3B3B5uSdIn/q/Ejca8KyFdPqddYHnqJQSWwUkHvu
   xQEVLpKsQEBv4671jGRSJC90H+ar30FQxkYcmyIbSGMBeWDnLUeo7nZb8
   g==;
X-CSE-ConnectionGUID: m1QWLCrGTmSY4B5jALzy3g==
X-CSE-MsgGUID: atSlrHfJSdKRpdrbgG8sUw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="25598444"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="25598444"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 02:30:33 -0700
X-CSE-ConnectionGUID: azAXyjzWTdG8iQKnP/GWdw==
X-CSE-MsgGUID: TFbAGSKsQ2+6GJe+i+qWYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="20539569"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Apr 2024 02:30:32 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruUHl-0007AO-2n;
	Wed, 10 Apr 2024 09:30:29 +0000
Date: Wed, 10 Apr 2024 17:29:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 99/367]
 drivers/firmware/tegra/bpmp-debugfs.c:380:19: error: too few arguments to
 function 'iterdup'
Message-ID: <202404101724.8NEc8oJz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   ad69a5a8c930e58537ce092334af08caaa412900
commit: e4cecff21f47925886bdbd4284641c18121420bb [99/367] firmware: tegra: convert to read/write iterators
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240410/202404101724.8NEc8oJz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404101724.8NEc8oJz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404101724.8NEc8oJz-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/tegra/bpmp-debugfs.c: In function 'bpmp_debug_store':
   drivers/firmware/tegra/bpmp-debugfs.c:380:31: error: expected ')' before 'count'
     380 |         databuf = iterdup(from count);
         |                          ~    ^~~~~~
         |                               )
>> drivers/firmware/tegra/bpmp-debugfs.c:380:19: error: too few arguments to function 'iterdup'
     380 |         databuf = iterdup(from count);
         |                   ^~~~~~~
   In file included from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:13,
                    from arch/arm64/include/asm/cpufeature.h:27,
                    from arch/arm64/include/asm/ptrace.h:11,
                    from arch/arm64/include/asm/irqflags.h:10,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/debugfs.h:15,
                    from drivers/firmware/tegra/bpmp-debugfs.c:5:
   include/linux/string.h:23:7: note: declared here
      23 | void *iterdup(struct iov_iter *, size_t);
         |       ^~~~~~~
   drivers/firmware/tegra/bpmp-debugfs.c: In function 'debugfs_store':
   drivers/firmware/tegra/bpmp-debugfs.c:666:38: error: 'buf' undeclared (first use in this function)
     666 |         if (copy_from_user(datavirt, buf, count)) {
         |                                      ^~~
   drivers/firmware/tegra/bpmp-debugfs.c:666:38: note: each undeclared identifier is reported only once for each function it appears in


vim +/iterdup +380 drivers/firmware/tegra/bpmp-debugfs.c

   365	
   366	static ssize_t bpmp_debug_store(struct kiocb *iocb, struct iov_iter *from)
   367	{
   368		struct inode *inode = file_inode(iocb->ki_filp);
   369		struct tegra_bpmp *bpmp = inode->i_private;
   370		size_t count = iov_iter_count(from);
   371		char *databuf = NULL;
   372		char fnamebuf[256];
   373		const char *filename;
   374		ssize_t err;
   375	
   376		filename = get_filename(bpmp, iocb->ki_filp, fnamebuf, sizeof(fnamebuf));
   377		if (!filename)
   378			return -ENOENT;
   379	
 > 380		databuf = iterdup(from count);
   381		if (IS_ERR(databuf))
   382			return PTR_ERR(databuf);
   383	
   384		err = mrq_debug_write(bpmp, filename, databuf, count);
   385		kfree(databuf);
   386	
   387		return err ?: count;
   388	}
   389	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
