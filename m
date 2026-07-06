Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A32225FA05
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jul 2026 04:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783312944; cv=none; b=kqZ245WPJm3eybp85rvO7Ce7wI+OxLQgfZsJKNPkNzqWxaPjb/7vcJYe4x+ddrKTJHuhXxIAfMU8AkSlU4I0hAHFflhMJIPlCa1yyEPAW/v/yc0dkHTP9jHmRH0W/cTo2T/5d2NyIK2Sz4V3BWY1XxnogMYXnWP23qdafdVW04Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783312944; c=relaxed/simple;
	bh=sDF5hupRtjEIGfN2GEmZrhFpFQBQmhyXJgwQyCGPf6s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p23PRV8Tf657i5FAEda8i0VdzRp8Cfod4rZMjd0s4Pn3Uiv45YtGjM4aqjySUyZg+Sc7+sgNUqn3/4p1xGYAno1Or5u7F/nOMFyBGkhorgSPD5t7ALosjsZQAHvqrjoRLkhHy/h1Q3QJfBHiXnLac0mVXwn/BgPrz/8vbcIO3eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D2WRsxGA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D2WRsxGA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783312942; x=1814848942;
  h=date:from:to:cc:subject:message-id;
  bh=sDF5hupRtjEIGfN2GEmZrhFpFQBQmhyXJgwQyCGPf6s=;
  b=D2WRsxGApo0DqtDPPBYli6Tm8UoA5B21RGmx7J/pQmwffX/cnPu4ZAEN
   jSM4AzzbHbyHx5yRNA/0gjVHWWVOGr6YMDYpktcw4NttO0A3+gqeJP/Ht
   QIdkgavRhOzVnJe6VznO3o9/WASAeyXN2cAZ4ScgtITQaYYuG7LY/Qeg6
   SW7wmt7ymh7SroY7Nh+5APYXYafcfA4mOATPFeKwgOSc6D+rsRXUB2oi5
   shpaibQ+g61JkvpgWGkFzAmWEXmQOsI3PvanQc7cAKJBHPRNTQ2VoBKvH
   uROz5uPD9ZdBmSf2k1l6wHXrOuUgzJctxGCtvxCQt5AvaVPdzJJQIftER
   g==;
X-CSE-ConnectionGUID: 5C8pgVW7T6aDrlb+lb7FRg==
X-CSE-MsgGUID: Hou5Pa/9SSy/dEbUz9psCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="101484016"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="101484016"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 21:42:19 -0700
X-CSE-ConnectionGUID: x/1ut/TcRAGju31OuUqBHg==
X-CSE-MsgGUID: eS2YKdl9S2e1jShZUnJoeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="251868804"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 05 Jul 2026 21:42:18 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgb9r-00000000277-2KhK;
	Mon, 06 Jul 2026 04:42:15 +0000
Date: Mon, 06 Jul 2026 06:41:45 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-dango 182/215]
 block/partitions/msdos.c:310:52: warning: operation on 'state->next' may be
 undefined
Message-ID: <202607060644.puG7rvrC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-dango
head:   d19514df7d0958e914bdb3435ea4d64d2fc5766a
commit: 1dcb4c65b71c8e3bde88037d6e9129de4228c79e [182/215] block: partitions: msdos: add OF node by partition number
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260706/202607060644.puG7rvrC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607060644.puG7rvrC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607060644.puG7rvrC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   block/partitions/msdos.c: In function 'parse_solaris_x86':
>> block/partitions/msdos.c:310:52: warning: operation on 'state->next' may be undefined [-Wsequence-point]
     310 |                 of_put_partition(state, state->next++,
         |                                         ~~~~~~~~~~~^~
   block/partitions/msdos.c: In function 'parse_bsd':
   block/partitions/msdos.c:415:52: warning: operation on 'state->next' may be undefined [-Wsequence-point]
     415 |                 of_put_partition(state, state->next++, bsd_start, bsd_size,
         |                                         ~~~~~~~~~~~^~
   block/partitions/msdos.c: In function 'parse_unixware':
   block/partitions/msdos.c:526:60: warning: operation on 'state->next' may be undefined [-Wsequence-point]
     526 |                         of_put_partition(state, state->next++,
         |                                                 ~~~~~~~~~~~^~
   block/partitions/msdos.c: In function 'parse_minix':
   block/partitions/msdos.c:573:68: warning: operation on 'state->next' may be undefined [-Wsequence-point]
     573 |                                 of_put_partition(state, state->next++,
         |                                                         ~~~~~~~~~~~^~


vim +310 block/partitions/msdos.c

   270	
   271	/* james@bpgc.com: Solaris has a nasty indicator: 0x82 which also
   272	   indicates linux swap.  Be careful before believing this is Solaris. */
   273	
   274	static void parse_solaris_x86(struct parsed_partitions *state,
   275				      sector_t offset, sector_t size, int origin)
   276	{
   277	#ifdef CONFIG_SOLARIS_X86_PARTITION
   278		struct device *ddev = disk_to_dev(state->disk);
   279		struct device_node *partitions_np = of_node_get(ddev->of_node);
   280		Sector sect;
   281		struct solaris_x86_vtoc *v;
   282		int i;
   283		short max_nparts;
   284	
   285		v = read_part_sector(state, offset + 1, &sect);
   286		if (!v)
   287			return;
   288		if (le32_to_cpu(v->v_sanity) != SOLARIS_X86_VTOC_SANE) {
   289			put_dev_sector(sect);
   290			return;
   291		}
   292		seq_buf_printf(&state->pp_buf, " %s%d: <solaris:", state->name, origin);
   293		if (le32_to_cpu(v->v_version) != 1) {
   294			seq_buf_printf(&state->pp_buf,
   295				       "  cannot handle version %d vtoc>\n",
   296				       le32_to_cpu(v->v_version));
   297			put_dev_sector(sect);
   298			return;
   299		}
   300		/* Ensure we can handle previous case of VTOC with 8 entries gracefully */
   301		max_nparts = le16_to_cpu(v->v_nparts) > 8 ? SOLARIS_X86_NUMSLICE : 8;
   302		for (i = 0; i < max_nparts && state->next < state->limit; i++) {
   303			struct solaris_x86_slice *s = &v->v_slice[i];
   304	
   305			if (s->s_size == 0)
   306				continue;
   307			seq_buf_printf(&state->pp_buf, " [s%d]", i);
   308			/* solaris partitions are relative to current MS-DOS
   309			 * one; must add the offset of the current partition */
 > 310			of_put_partition(state, state->next++,
   311					 le32_to_cpu(s->s_start)+offset,
   312					 le32_to_cpu(s->s_size),
   313					 find_partno_of_node(partitions_np, state->next));
   314		}
   315		put_dev_sector(sect);
   316		seq_buf_puts(&state->pp_buf, " >\n");
   317	#endif
   318	}
   319	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
