Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AFE4A34
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Feb 2024 16:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707237555; cv=none; b=I+RlkiOIyJ/afGWXq4D3sVrhCJ/sWaYmYuxFs8h0V26Co64tlhJ/51bPNBLmOzL++gL7cHxS8q/KLQGdmcGlEfF+fg55mgRte4MSB56QbEV0+v7wA3DZRx8Z9fzlvqbLdCdEFHHRYDBFqXiBpjsIWfc3Esi3fyuf+NwqB17PXc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707237555; c=relaxed/simple;
	bh=s64gmbL0jGs0a4Apl2CV+hn7r9K+KlJu+RRzPcJbGuo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NBI87SP4VMKlZXKcWUp5hMgRKni1alc509BLi0HTbiAOZHjjOxHVZNh/MYZErHwnaFgbWO4HxVSwqC53AJKdi5pKA7bEYdUswTbznQQAh3qbBe1e3SciSYgR8UahFfsq82E2GULC8bTpH5kt9J6uKwhRCpl7Ahdbdnnw5IrZ0QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f0mkE7xT; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f0mkE7xT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707237554; x=1738773554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s64gmbL0jGs0a4Apl2CV+hn7r9K+KlJu+RRzPcJbGuo=;
  b=f0mkE7xT89O5ujew/H8LXiaXLvAhvpGLGoYTvbdSf/qPoPgf/X74F2KA
   zful3hDeqnyDBcibSLqSJZJ/6Q/7OOedrcP5lOiwPFJBccAVxcPFmXP2Z
   yyM+ITeNiSUbEQDiuQVuyIxsAzzTZn5V2IJPc7wjEQSwK5a+1vQspqIMw
   cWVtPfukCrHgiRNpgAXaxlDgSkWxrR+PqO2fO9DaZu2SOXblPGO8WJ1LD
   iHO8PMgSyS8dXzK241NeEX4Lg2VXS2JMP7y3IjNfhf4q5zzBtonBEq53m
   /4grws+Xeuw8RqL1lsk9NrTdIjBSQzawgRi1UrbWh60ata6jQCUbhnuk9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="680535"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="680535"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 08:39:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="5833022"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Feb 2024 08:39:12 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXOTV-0001bc-1F;
	Tue, 06 Feb 2024 16:39:09 +0000
Date: Wed, 7 Feb 2024 00:38:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:djwong-wtf 549/554] lib/time_stats.c:330:21: warning:
 unused variable 'i'
Message-ID: <202402070056.jTVXioIe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git djwong-wtf
head:   db62619dd8bf6e12f1c37302dbabfe2f4b64cf08
commit: 6aa4cb2ea523f605886b3b3d7b254c7133821cf5 [549/554] time_stats: report information in json format
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20240207/202402070056.jTVXioIe-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240207/202402070056.jTVXioIe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402070056.jTVXioIe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/time_stats.c: In function 'time_stats_to_json':
>> lib/time_stats.c:330:21: warning: unused variable 'i' [-Wunused-variable]
     330 |                 int i = eytzinger0_first(NR_QUANTILES);
         |                     ^


vim +/i +330 lib/time_stats.c

   267	
   268	void time_stats_to_json(struct seq_buf *out, struct time_stats *stats,
   269			const char *epoch_name, unsigned int flags)
   270	{
   271		struct quantiles *quantiles = time_stats_to_quantiles(stats);
   272		s64 f_mean = 0, d_mean = 0;
   273		u64 f_stddev = 0, d_stddev = 0;
   274	
   275		if (stats->buffer) {
   276			int cpu;
   277	
   278			spin_lock_irq(&stats->lock);
   279			for_each_possible_cpu(cpu)
   280				__time_stats_clear_buffer(stats, per_cpu_ptr(stats->buffer, cpu));
   281			spin_unlock_irq(&stats->lock);
   282		}
   283	
   284		if (stats->freq_stats.n) {
   285			/* avoid divide by zero */
   286			f_mean = mean_and_variance_get_mean(stats->freq_stats);
   287			f_stddev = mean_and_variance_get_stddev(stats->freq_stats);
   288			d_mean = mean_and_variance_get_mean(stats->duration_stats);
   289			d_stddev = mean_and_variance_get_stddev(stats->duration_stats);
   290		} else if (flags & TIME_STATS_PRINT_NO_ZEROES) {
   291			/* unless we didn't want zeroes anyway */
   292			return;
   293		}
   294	
   295		seq_buf_printf(out, "{\n");
   296		seq_buf_printf(out, "  \"epoch\":       \"%s\",\n", epoch_name);
   297		seq_buf_printf(out, "  \"count\":       %llu,\n", stats->duration_stats.n);
   298	
   299		seq_buf_printf(out, "  \"duration_ns\": {\n");
   300		seq_buf_printf(out, "    \"min\":       %llu,\n", stats->min_duration);
   301		seq_buf_printf(out, "    \"max\":       %llu,\n", stats->max_duration);
   302		seq_buf_printf(out, "    \"total\":     %llu,\n", stats->total_duration);
   303		seq_buf_printf(out, "    \"mean\":      %llu,\n", d_mean);
   304		seq_buf_printf(out, "    \"stddev\":    %llu\n", d_stddev);
   305		seq_buf_printf(out, "  },\n");
   306	
   307		d_mean = mean_and_variance_weighted_get_mean(stats->duration_stats_weighted, TIME_STATS_MV_WEIGHT);
   308		d_stddev = mean_and_variance_weighted_get_stddev(stats->duration_stats_weighted, TIME_STATS_MV_WEIGHT);
   309	
   310		seq_buf_printf(out, "  \"duration_ewma_ns\": {\n");
   311		seq_buf_printf(out, "    \"mean\":      %llu,\n", d_mean);
   312		seq_buf_printf(out, "    \"stddev\":    %llu\n", d_stddev);
   313		seq_buf_printf(out, "  },\n");
   314	
   315		seq_buf_printf(out, "  \"frequency_ns\": {\n");
   316		seq_buf_printf(out, "    \"min\":       %llu,\n", stats->min_freq);
   317		seq_buf_printf(out, "    \"max\":       %llu,\n", stats->max_freq);
   318		seq_buf_printf(out, "    \"mean\":      %llu,\n", f_mean);
   319		seq_buf_printf(out, "    \"stddev\":    %llu\n", f_stddev);
   320		seq_buf_printf(out, "  },\n");
   321	
   322		f_mean = mean_and_variance_weighted_get_mean(stats->freq_stats_weighted, TIME_STATS_MV_WEIGHT);
   323		f_stddev = mean_and_variance_weighted_get_stddev(stats->freq_stats_weighted, TIME_STATS_MV_WEIGHT);
   324	
   325		seq_buf_printf(out, "  \"frequency_ewma_ns\": {\n");
   326		seq_buf_printf(out, "    \"mean\":      %llu,\n", f_mean);
   327		seq_buf_printf(out, "    \"stddev\":    %llu\n", f_stddev);
   328	
   329		if (quantiles) {
 > 330			int i = eytzinger0_first(NR_QUANTILES);
   331			u64 last_q = 0;
   332	
   333			/* close frequency_ewma_ns but signal more items */
   334			seq_buf_printf(out, "  },\n");
   335	
   336			seq_buf_printf(out, "  \"quantiles_ns\": [\n");
   337			eytzinger0_for_each(i, NR_QUANTILES) {
   338				bool is_last = eytzinger0_next(i, NR_QUANTILES) == -1;
   339	
   340				u64 q = max(quantiles->entries[i].m, last_q);
   341				seq_buf_printf(out, "    %llu", q);
   342				if (!is_last)
   343					seq_buf_printf(out, ", ");
   344				last_q = q;
   345			}
   346			seq_buf_printf(out, "  ]\n");
   347		} else {
   348			/* close frequency_ewma_ns without dumping further */
   349			seq_buf_printf(out, "  }\n");
   350		}
   351	
   352		seq_buf_printf(out, "}\n");
   353	}
   354	EXPORT_SYMBOL_GPL(time_stats_to_json);
   355	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
