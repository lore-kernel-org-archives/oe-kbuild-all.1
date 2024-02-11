Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAE55D462
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Feb 2024 12:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707655201; cv=none; b=mFl4NvbRYNly5nxwmFnrUEgmI404CYrrxI4gUfVEuT9PunP1IXsT/wms4y2zZI8XwjrO85kx2dlTS9WvmrkOgY2agniv8uOraMXeVWromZtDa+E+8tyATcGC4GIl+i0eFXdklxjDs6JL2xUN/PqRdF0uH0K1PZLyGLDP+JDWmCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707655201; c=relaxed/simple;
	bh=lZq3RI3/rLgGCXOWvhIdIxdrUBjuNiWxCmMwoCv9x+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tYoKMoRNmCOiNeMnB9Cwf3E6nKURpewzg5sOjNSHZQqsXHcbFztQZTkC+1cSBvQYB8Y4a7uQI4wsVtFyP53e3EvPNr1oqCdgIdLaje3iBJLe7r/Oa3J8oQgx8zYG/nddUpLET79hURecdJbFtORtHv4k09wV5Kj9rLpNYmj5KDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZFb7WNED; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZFb7WNED"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707655200; x=1739191200;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lZq3RI3/rLgGCXOWvhIdIxdrUBjuNiWxCmMwoCv9x+o=;
  b=ZFb7WNEDtEwbucnl53JIh18DMfU3l+vUPQSg89hXLEF9ahuezi0eeiV7
   Vm1jWnWFtTRgn0sDaAVZJJ+BIElZfGcgFUb4pTul2qImrF9YaYIACye7K
   sQ7qTw00brpPGFxrBHZnfAe6LgJB/fwkEfMFysBWDc2cOjcE3td+ZMFDa
   aMQMXsSVQ4m9j7z31OJ97NVaQhjNoX+MbcZPv9yWIDNFYQyXFH2K5Spwl
   BzXXrvSfJGw/HcVJFEOC4mF0OGGdvoB+FHeBHOHDRe4vh3LyUViSUuGvE
   ltr9gl6/JJwOwz7DroM9+/wzKcFAwDtnrQcB9ANnqFGHg5zvZQGw+Fq4n
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10980"; a="1532260"
X-IronPort-AV: E=Sophos;i="6.05,261,1701158400"; 
   d="scan'208";a="1532260"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2024 04:39:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,261,1701158400"; 
   d="scan'208";a="2324126"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Feb 2024 04:39:57 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZ97i-0006Yo-3D;
	Sun, 11 Feb 2024 12:39:54 +0000
Date: Sun, 11 Feb 2024 20:38:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 47/95] fs/bcachefs/util.c:715:28: error:
 passing argument 1 of 'bch2_prt_printf' from incompatible pointer type
Message-ID: <202402112057.2hIuIHUi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   647047cefc8436b9a1af76fce288061dddadd39d
commit: cfd401b15efdf17caa218d0a0402d204ae9b00b4 [47/95] bcachefs: bch2_time_stats_to_seq_buf()
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20240211/202402112057.2hIuIHUi-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240211/202402112057.2hIuIHUi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402112057.2hIuIHUi-lkp@intel.com/

Note: the bcachefs/bcachefs-testing HEAD 647047cefc8436b9a1af76fce288061dddadd39d builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from fs/bcachefs/util.c:28:
   fs/bcachefs/util.c: In function 'bch2_time_stats_to_seq_buf':
>> fs/bcachefs/util.c:715:28: error: passing argument 1 of 'bch2_prt_printf' from incompatible pointer type [-Werror=incompatible-pointer-types]
     715 |                 prt_printf(out, "quantiles (%s):\t", u->name);
         |                            ^~~
         |                            |
         |                            struct seq_buf *
   fs/bcachefs/util.h:222:57: note: in definition of macro 'prt_printf'
     222 | #define prt_printf(_out, ...)           bch2_prt_printf(_out, __VA_ARGS__)
         |                                                         ^~~~
   In file included from fs/bcachefs/util.h:219:
   fs/bcachefs/printbuf.h:104:54: note: expected 'struct printbuf *' but argument is of type 'struct seq_buf *'
     104 | __printf(2, 3) void bch2_prt_printf(struct printbuf *out, const char *fmt, ...);
         |                                     ~~~~~~~~~~~~~~~~~^~~
   cc1: some warnings being treated as errors


vim +/bch2_prt_printf +715 fs/bcachefs/util.c

   636	
   637	void bch2_time_stats_to_seq_buf(struct seq_buf *out, struct bch2_time_stats *stats)
   638	{
   639		s64 f_mean = 0, d_mean = 0;
   640		u64 f_stddev = 0, d_stddev = 0;
   641	
   642		if (stats->buffer) {
   643			int cpu;
   644	
   645			spin_lock_irq(&stats->lock);
   646			for_each_possible_cpu(cpu)
   647				__bch2_time_stats_clear_buffer(stats, per_cpu_ptr(stats->buffer, cpu));
   648			spin_unlock_irq(&stats->lock);
   649		}
   650	
   651		/*
   652		 * avoid divide by zero
   653		 */
   654		if (stats->freq_stats.n) {
   655			f_mean = mean_and_variance_get_mean(stats->freq_stats);
   656			f_stddev = mean_and_variance_get_stddev(stats->freq_stats);
   657			d_mean = mean_and_variance_get_mean(stats->duration_stats);
   658			d_stddev = mean_and_variance_get_stddev(stats->duration_stats);
   659		}
   660	
   661		seq_buf_printf(out, "count: %llu\n", stats->duration_stats.n);
   662	
   663		seq_buf_printf(out, "                       since mount        recent\n");
   664	
   665		seq_buf_printf(out, "duration of events\n");
   666	
   667		seq_buf_printf(out, "  min:                     ");
   668		seq_buf_time_units_aligned(out, stats->min_duration);
   669		seq_buf_printf(out, "\n");
   670	
   671		seq_buf_printf(out, "  max:                     ");
   672		seq_buf_time_units_aligned(out, stats->max_duration);
   673		seq_buf_printf(out, "\n");
   674	
   675		seq_buf_printf(out, "  total:                   ");
   676		seq_buf_time_units_aligned(out, stats->total_duration);
   677		seq_buf_printf(out, "\n");
   678	
   679		seq_buf_printf(out, "  mean:                    ");
   680		seq_buf_time_units_aligned(out, d_mean);
   681		seq_buf_time_units_aligned(out, mean_and_variance_weighted_get_mean(stats->duration_stats_weighted));
   682		seq_buf_printf(out, "\n");
   683	
   684		seq_buf_printf(out, "  stddev:                  ");
   685		seq_buf_time_units_aligned(out, d_stddev);
   686		seq_buf_time_units_aligned(out, mean_and_variance_weighted_get_stddev(stats->duration_stats_weighted));
   687		seq_buf_printf(out, "\n");
   688	
   689		seq_buf_printf(out, "time between events\n");
   690	
   691		seq_buf_printf(out, "  min:                     ");
   692		seq_buf_time_units_aligned(out, stats->min_freq);
   693		seq_buf_printf(out, "\n");
   694	
   695		seq_buf_printf(out, "  max:                     ");
   696		seq_buf_time_units_aligned(out, stats->max_freq);
   697		seq_buf_printf(out, "\n");
   698	
   699		seq_buf_printf(out, "  mean:                    ");
   700		seq_buf_time_units_aligned(out, f_mean);
   701		seq_buf_time_units_aligned(out, mean_and_variance_weighted_get_mean(stats->freq_stats_weighted));
   702		seq_buf_printf(out, "\n");
   703	
   704		seq_buf_printf(out, "  stddev:                  ");
   705		seq_buf_time_units_aligned(out, f_stddev);
   706		seq_buf_time_units_aligned(out, mean_and_variance_weighted_get_stddev(stats->freq_stats_weighted));
   707		seq_buf_printf(out, "\n");
   708	
   709		if (stats->quantiles_enabled) {
   710			int i = eytzinger0_first(NR_QUANTILES);
   711			const struct time_unit *u =
   712				pick_time_units(stats->quantiles.entries[i].m);
   713			u64 last_q = 0;
   714	
 > 715			prt_printf(out, "quantiles (%s):\t", u->name);
   716			eytzinger0_for_each(i, NR_QUANTILES) {
   717				bool is_last = eytzinger0_next(i, NR_QUANTILES) == -1;
   718	
   719				u64 q = max(stats->quantiles.entries[i].m, last_q);
   720				seq_buf_printf(out, "%llu ", div_u64(q, u->nsecs));
   721				if (is_last)
   722					seq_buf_printf(out, "\n");
   723				last_q = q;
   724			}
   725		}
   726	}
   727	#else
   728	void bch2_time_stats_to_text(struct printbuf *out, struct bch2_time_stats *stats) {}
   729	#endif
   730	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
