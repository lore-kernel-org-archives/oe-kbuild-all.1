Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF9E2D877D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 01:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778807712; cv=none; b=EZEMYGY0jecrX/o/Rb4ozFKg+CY5evhKnbN3L4+UDm/QiDUFevYGOKxaR1m4PTgaInF6dp9XZX2ZSiqGnc835F+JiAh3jHkfihNwuPrXkvVwsdUTL2hTuuuRgVo8t/K5OPm4S6Spp97Gz0TjfIR+9khoqs/cu6WeC7hWRYp/8Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778807712; c=relaxed/simple;
	bh=tMACmWoLq8u58uvkrIGeCRYJ0Wezh8rxawQ7QmEw7bM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BYkPcro2RgO9BX2YfyN8wPdJCiHxLFJWG+RqIwlBu4svRS6/ErV8JIz9pDAb04A9Kwvp4KTjyNly9u6LJ/wsB7adLFAuvMEvZK/vGRtYU8xk47a3643V553JPFiaGg7QLYRNbaQvHSOG2idNdZiObK1qUKcNAvCOWv87qCikYeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QCZjFuTi; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QCZjFuTi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778807711; x=1810343711;
  h=date:from:to:cc:subject:message-id;
  bh=tMACmWoLq8u58uvkrIGeCRYJ0Wezh8rxawQ7QmEw7bM=;
  b=QCZjFuTinluGn9V64RrjR6dw2tVO3491ILa1NrobP+pj9D63ZgrHn9Ao
   oL2+CNxTfJiUXMsyrTbL6tEi/r727iXZHHM8mHVFlueYeJmDPNs5rKzO6
   sB93XNMi6ysWBxWUd8V8Z0WtnZ262rV9gRtZYKyaLJD4BZQnhXPXQkIGH
   K0OSKorKobZM2pcB1Pg5ztqqjiqcNJgXSgWhaJghfEGELnnSd/JV1K/wS
   jIYPxUfZGzsBgNXuhBLgSy5+2ucKQuwNNgy/HKNrdL40KuNXQfGoTU6x/
   uSQPeUAd1HufZdf9MfrD+tb7MXLklWcyYbiwVi8Ugfd7sjoGF0/2Uda5k
   w==;
X-CSE-ConnectionGUID: 9wlA59OmRr+5QWXIdrjAEw==
X-CSE-MsgGUID: vzo/Fix3Seqr8N6W0BiUeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="90341724"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="90341724"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 18:15:06 -0700
X-CSE-ConnectionGUID: bdZ7iejDQgGMzqdJfoTsCg==
X-CSE-MsgGUID: ahMG5PbpQ3Oj0N+MLSPfTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="276635497"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 14 May 2026 18:15:05 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNh8o-000000008v3-2rPf;
	Fri, 15 May 2026 01:15:02 +0000
Date: Fri, 15 May 2026 03:14:30 +0200
From: kernel test robot <lkp@intel.com>
To: Joonwon Kang <joonwonkang@google.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: mm/percpu-stats.c:125:9: error: aggregate value used where
 an integer was expected
Message-ID: <202605150328.mn2hv1fZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Joonwon-Kang/percpu-Do-not-trust-hint-starts-when-they-are-not-set/20260513-070153
head:   53a3f421840a59abecd38cc1be7c4f1d4516c3f1
commit: 27e83e031c0de38ffad3fe513474bff375c2a896 percpu: Introduce struct pcpu_region
date:   2 days ago
config: x86_64-randconfig-2005-20250721 (https://download.01.org/0day-ci/archive/20260515/202605150328.mn2hv1fZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605150328.mn2hv1fZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605150328.mn2hv1fZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/percpu-stats.c: In function 'chunk_map_stats':
>> mm/percpu-stats.c:125:9: error: aggregate value used where an integer was expected
     125 |         P("contig_bytes", chunk_md->contig_hint * PCPU_MIN_ALLOC_SIZE);
         |         ^


vim +125 mm/percpu-stats.c

30a5b5367ef9d5 Dennis Zhou            2017-06-19   44  
30a5b5367ef9d5 Dennis Zhou            2017-06-19   45  /*
30a5b5367ef9d5 Dennis Zhou            2017-06-19   46   * Prints out chunk state. Fragmentation is considered between
30a5b5367ef9d5 Dennis Zhou            2017-06-19   47   * the beginning of the chunk to the last allocation.
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   48)  *
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   49)  * All statistics are in bytes unless stated otherwise.
30a5b5367ef9d5 Dennis Zhou            2017-06-19   50   */
30a5b5367ef9d5 Dennis Zhou            2017-06-19   51  static void chunk_map_stats(struct seq_file *m, struct pcpu_chunk *chunk,
cd6a884d095580 Dennis Zhou (Facebook  2017-07-15   52) 			    int *buffer)
30a5b5367ef9d5 Dennis Zhou            2017-06-19   53  {
92c14cab432674 Dennis Zhou            2019-02-26   54  	struct pcpu_block_md *chunk_md = &chunk->chunk_md;
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   55) 	int i, last_alloc, as_len, start, end;
30a5b5367ef9d5 Dennis Zhou            2017-06-19   56  	int *alloc_sizes, *p;
30a5b5367ef9d5 Dennis Zhou            2017-06-19   57  	/* statistics */
30a5b5367ef9d5 Dennis Zhou            2017-06-19   58  	int sum_frag = 0, max_frag = 0;
30a5b5367ef9d5 Dennis Zhou            2017-06-19   59  	int cur_min_alloc = 0, cur_med_alloc = 0, cur_max_alloc = 0;
30a5b5367ef9d5 Dennis Zhou            2017-06-19   60  
30a5b5367ef9d5 Dennis Zhou            2017-06-19   61  	alloc_sizes = buffer;
30a5b5367ef9d5 Dennis Zhou            2017-06-19   62  
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   63) 	/*
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   64) 	 * find_last_bit returns the start value if nothing found.
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   65) 	 * Therefore, we must determine if it is a failure of find_last_bit
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   66) 	 * and set the appropriate value.
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   67) 	 */
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   68) 	last_alloc = find_last_bit(chunk->alloc_map,
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   69) 				   pcpu_chunk_map_bits(chunk) -
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   70) 				   chunk->end_offset / PCPU_MIN_ALLOC_SIZE - 1);
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   71) 	last_alloc = test_bit(last_alloc, chunk->alloc_map) ?
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   72) 		     last_alloc + 1 : 0;
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   73) 
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   74) 	as_len = 0;
2e08d20d777e99 Dennis Zhou            2017-09-27   75  	start = chunk->start_offset / PCPU_MIN_ALLOC_SIZE;
30a5b5367ef9d5 Dennis Zhou            2017-06-19   76  
30a5b5367ef9d5 Dennis Zhou            2017-06-19   77  	/*
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   78) 	 * If a bit is set in the allocation map, the bound_map identifies
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   79) 	 * where the allocation ends.  If the allocation is not set, the
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   80) 	 * bound_map does not identify free areas as it is only kept accurate
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   81) 	 * on allocation, not free.
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   82) 	 *
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   83) 	 * Positive values are allocations and negative values are free
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   84) 	 * fragments.
30a5b5367ef9d5 Dennis Zhou            2017-06-19   85  	 */
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   86) 	while (start < last_alloc) {
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   87) 		if (test_bit(start, chunk->alloc_map)) {
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   88) 			end = find_next_bit(chunk->bound_map, last_alloc,
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   89) 					    start + 1);
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   90) 			alloc_sizes[as_len] = 1;
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   91) 		} else {
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   92) 			end = find_next_bit(chunk->alloc_map, last_alloc,
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   93) 					    start + 1);
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   94) 			alloc_sizes[as_len] = -1;
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   95) 		}
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   96) 
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   97) 		alloc_sizes[as_len++] *= (end - start) * PCPU_MIN_ALLOC_SIZE;
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   98) 
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12   99) 		start = end;
30a5b5367ef9d5 Dennis Zhou            2017-06-19  100  	}
30a5b5367ef9d5 Dennis Zhou            2017-06-19  101  
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12  102) 	/*
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12  103) 	 * The negative values are free fragments and thus sorting gives the
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12  104) 	 * free fragments at the beginning in largest first order.
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12  105) 	 */
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12  106) 	if (as_len > 0) {
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12  107) 		sort(alloc_sizes, as_len, sizeof(int), cmpint, NULL);
30a5b5367ef9d5 Dennis Zhou            2017-06-19  108  
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12  109) 		/* iterate through the unallocated fragments */
30a5b5367ef9d5 Dennis Zhou            2017-06-19  110  		for (i = 0, p = alloc_sizes; *p < 0 && i < as_len; i++, p++) {
30a5b5367ef9d5 Dennis Zhou            2017-06-19  111  			sum_frag -= *p;
30a5b5367ef9d5 Dennis Zhou            2017-06-19  112  			max_frag = max(max_frag, -1 * (*p));
30a5b5367ef9d5 Dennis Zhou            2017-06-19  113  		}
30a5b5367ef9d5 Dennis Zhou            2017-06-19  114  
30a5b5367ef9d5 Dennis Zhou            2017-06-19  115  		cur_min_alloc = alloc_sizes[i];
30a5b5367ef9d5 Dennis Zhou            2017-06-19  116  		cur_med_alloc = alloc_sizes[(i + as_len - 1) / 2];
30a5b5367ef9d5 Dennis Zhou            2017-06-19  117  		cur_max_alloc = alloc_sizes[as_len - 1];
30a5b5367ef9d5 Dennis Zhou            2017-06-19  118  	}
30a5b5367ef9d5 Dennis Zhou            2017-06-19  119  
30a5b5367ef9d5 Dennis Zhou            2017-06-19  120  	P("nr_alloc", chunk->nr_alloc);
30a5b5367ef9d5 Dennis Zhou            2017-06-19  121  	P("max_alloc_size", chunk->max_alloc_size);
0cecf50cf00fbe Dennis Zhou (Facebook  2017-07-24  122) 	P("empty_pop_pages", chunk->nr_empty_pop_pages);
92c14cab432674 Dennis Zhou            2019-02-26  123  	P("first_bit", chunk_md->first_free);
40064aeca35c5c Dennis Zhou (Facebook  2017-07-12  124) 	P("free_bytes", chunk->free_bytes);
92c14cab432674 Dennis Zhou            2019-02-26 @125  	P("contig_bytes", chunk_md->contig_hint * PCPU_MIN_ALLOC_SIZE);
30a5b5367ef9d5 Dennis Zhou            2017-06-19  126  	P("sum_frag", sum_frag);
30a5b5367ef9d5 Dennis Zhou            2017-06-19  127  	P("max_frag", max_frag);
30a5b5367ef9d5 Dennis Zhou            2017-06-19  128  	P("cur_min_alloc", cur_min_alloc);
30a5b5367ef9d5 Dennis Zhou            2017-06-19  129  	P("cur_med_alloc", cur_med_alloc);
30a5b5367ef9d5 Dennis Zhou            2017-06-19  130  	P("cur_max_alloc", cur_max_alloc);
30a5b5367ef9d5 Dennis Zhou            2017-06-19  131  	seq_putc(m, '\n');
30a5b5367ef9d5 Dennis Zhou            2017-06-19  132  }
30a5b5367ef9d5 Dennis Zhou            2017-06-19  133  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
