Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EEE18E2A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 00:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739321310; cv=none; b=f+044oV/kzNe/Ua0IX+ZZVNcl2j1OJckTJzDgAq7S9uw8ag0AM2jo2gZd2PLaQnz8Ps3w71gPxy3kU2QRgz1TVsJi0+MYDVztUiZ1atwqSjn0BetJ/Lki+GZVBGEWNdY16OxucxuC0kopDOFIgdgcoltwbqiOMzMSaIloTZ6mpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739321310; c=relaxed/simple;
	bh=dZW5eJRzfi6YGgN4kvXaZTtlkeoVCNXyBM2JirJnPOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rwRVp1xrnNb6S3Vx2fC4HKf3rEUgMzJGwKLEwAUBFosJPPW86SvAuKZRJMUoISxlxY25YH8bAY59OqMKdTtPzQh/pMZZdVITi6L/lSt3jiVhjREXstvR+tgXPKEyShEMgWrOyZuuUKcpu3t1EkDI+pP9SyZhCmyB+flTsvOkFAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MNClYd4v; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MNClYd4v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739321309; x=1770857309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dZW5eJRzfi6YGgN4kvXaZTtlkeoVCNXyBM2JirJnPOQ=;
  b=MNClYd4veK1Ad3ViDyrQMFfkd7vCMeQQwzUWdMeMAXk9cBJJ0MuDPRZw
   t3ywewkT+Gr5vWeEywzPOiVDaZ3S+eVngSP48/WRR/qSAVvxXJsT/w7X+
   QYqGSrvvm0Nekjauz90Nbj0zEOAb5tfikB0PZPIEBPXiU5WZ1pifCfgMH
   +Yid/4A+YR1EzuJ7QxQR9zWOY23krVjD66XYEyoZOV4xSiDnOp1JNtFpY
   /7KI8dR1d+wSzRKtTD19rqj7tXEPAnkgFKRNd0W4WTtVMoUn3Kq+TNd22
   hndf6BQ73oGzLZbiQP8yCVaEiex5TgVFAVpN/LMEvCCehBZJp96ILG13Q
   A==;
X-CSE-ConnectionGUID: 2pTCKCMaRfuRF97ckwUn8Q==
X-CSE-MsgGUID: wpqhP7BRSWuBvE55hdlTmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="50602910"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="50602910"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 16:48:29 -0800
X-CSE-ConnectionGUID: FVfaPvsNTO2sY8nplGqRlg==
X-CSE-MsgGUID: +M02PKaMR/KOIjoemiWCYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="112658794"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Feb 2025 16:48:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti0vR-0014uB-1s;
	Wed, 12 Feb 2025 00:48:25 +0000
Date: Wed, 12 Feb 2025 08:48:01 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rostedt-trace:pmem-on-reserve-mem-fail 2/10]
 kernel/trace/ring_buffer.c:1943:34: warning: variable 'bmeta' set but not
 used
Message-ID: <202502120851.VulVvSyg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git pmem-on-reserve-mem-fail
head:   d877ee1b587be39c141df16a6f92efb0e90b30fd
commit: 04e1e84239466de5fe5310ddc8899b8b404a5ccc [2/10] ring-buffer: Add buffer meta data for persistent ring buffer
config: i386-buildonly-randconfig-002-20250212 (https://download.01.org/0day-ci/archive/20250212/202502120851.VulVvSyg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120851.VulVvSyg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120851.VulVvSyg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/ring_buffer.c: In function 'rb_range_meta_init':
>> kernel/trace/ring_buffer.c:1943:34: warning: variable 'bmeta' set but not used [-Wunused-but-set-variable]
    1943 |         struct ring_buffer_meta *bmeta;
         |                                  ^~~~~


vim +/bmeta +1943 kernel/trace/ring_buffer.c

  1939	
  1940	static void rb_range_meta_init(struct trace_buffer *buffer, int nr_pages)
  1941	{
  1942		struct ring_buffer_cpu_meta *meta;
> 1943		struct ring_buffer_meta *bmeta;
  1944		unsigned long delta;
  1945		void *subbuf;
  1946		bool valid = false;
  1947		int cpu;
  1948		int i;
  1949	
  1950		if (rb_meta_init(buffer))
  1951			valid = true;
  1952	
  1953		bmeta = buffer->meta;
  1954	
  1955		for (cpu = 0; cpu < nr_cpu_ids; cpu++) {
  1956			void *next_meta;
  1957	
  1958			meta = rb_range_meta(buffer, nr_pages, cpu);
  1959	
  1960			if (valid && rb_cpu_meta_valid(meta, cpu, buffer, nr_pages)) {
  1961				/* Make the mappings match the current address */
  1962				subbuf = rb_subbufs_from_meta(meta);
  1963				delta = (unsigned long)subbuf - meta->first_buffer;
  1964				meta->first_buffer += delta;
  1965				meta->head_buffer += delta;
  1966				meta->commit_buffer += delta;
  1967				buffer->kaslr_addr = meta->kaslr_addr;
  1968				continue;
  1969			}
  1970	
  1971			if (cpu < nr_cpu_ids - 1)
  1972				next_meta = rb_range_meta(buffer, nr_pages, cpu + 1);
  1973			else
  1974				next_meta = (void *)buffer->range_addr_end;
  1975	
  1976			memset(meta, 0, next_meta - (void *)meta);
  1977	
  1978			meta->nr_subbufs = nr_pages + 1;
  1979			meta->subbuf_size = PAGE_SIZE;
  1980	
  1981			subbuf = rb_subbufs_from_meta(meta);
  1982	
  1983			meta->first_buffer = (unsigned long)subbuf;
  1984			rb_meta_init_text_addr(meta);
  1985	
  1986			/*
  1987			 * The buffers[] array holds the order of the sub-buffers
  1988			 * that are after the meta data. The sub-buffers may
  1989			 * be swapped out when read and inserted into a different
  1990			 * location of the ring buffer. Although their addresses
  1991			 * remain the same, the buffers[] array contains the
  1992			 * index into the sub-buffers holding their actual order.
  1993			 */
  1994			for (i = 0; i < meta->nr_subbufs; i++) {
  1995				meta->buffers[i] = i;
  1996				rb_init_page(subbuf);
  1997				subbuf += meta->subbuf_size;
  1998			}
  1999		}
  2000	}
  2001	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
