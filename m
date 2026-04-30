Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A895C2F90E0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 08:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777538616; cv=none; b=uMMxcv0UuknfqDseJoYTJWUGgERpOjesdGmUPCBDEETuhlakGJ6TuRdNLiLhEj6P1g6BNViHb38hvndeCIHSecrqNiApY8lEysRjK62IiBwb7katZuVFmxbdRPUIMlk1+r6byAIEx2CzqE2T8Rfrlfy0J6ozAbV3OECWxBcbttg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777538616; c=relaxed/simple;
	bh=q4kOZFATkNKFZmJ89Cx3hTFSV2+pSrtGRybiI3W5d1M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WuBxcQZejqTd4lWaKKVjeDZ9U9+ofqkRyU6RITRLRipkNQzfXJqGAc+a4Pp0z+GAC/dak7CTWaZjD12XefDnm39EfJmeEv7ttL6ZMTFG+XAKKgONpqqrh7AYsoR2/Typf4+7TpL9dgygpsCML3Z/7wXY8QN+eps/3s24VBPtwkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=anUjzoKL; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="anUjzoKL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777538616; x=1809074616;
  h=date:from:to:cc:subject:message-id;
  bh=q4kOZFATkNKFZmJ89Cx3hTFSV2+pSrtGRybiI3W5d1M=;
  b=anUjzoKLFFWACel5obMEmJ3+YL3NmRyJgmb6VlPbPVTZDnaPiY1v8Y3Z
   6YmikD9NEi7XcbzrA4dqjzLoEcdoMe7FzabVj2G0pY0jb4nKNpIHhAYeq
   lB5u/uj/miIzuBl5el75JdipI6yTrWQJ8CHCxCzRocB8mtbAQRrIC+7bv
   tTVp+Ercra0xuYzw61h6e2GhSC40ET0Unz14V4FGNVeyoXxB1Qrr/8myw
   W/0u3y8VQPTC0aPMo7F0EhF+JBsRi5DETNzHsOH6tE4GS2OdiKJ/21Xjp
   W6RVLZuG62ZDmfpPtIERYOskQ26ST1u9SugLs1TXqugSK5GhRBURQLnRe
   A==;
X-CSE-ConnectionGUID: 7muykTzDQJW4vbJCraIlrA==
X-CSE-MsgGUID: mJk9KvlQToSWjj/bRNFNZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="95903798"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="95903798"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 01:43:35 -0700
X-CSE-ConnectionGUID: l+4BhTYYSSarT80iNJ1xZQ==
X-CSE-MsgGUID: MZi4kdc+SMS0gRLIsoNGpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="236298065"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 30 Apr 2026 01:43:34 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIMzb-000000004ml-46Xr;
	Thu, 30 Apr 2026 08:43:31 +0000
Date: Thu, 30 Apr 2026 10:43:17 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-mt7622 73/103]
 block/partitions/msdos.c:310:52: warning: operation on 'state->next' may be
 undefined
Message-ID: <202604301051.HaQzvAGE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-mt7622
head:   d8b6134553d0f268ed594061eba808fcb51257f4
commit: 7ba12f95aa40e90f9d5a619606e3fc98cdb91b65 [73/103] block: partitions: msdos: add OF node by partition number
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260430/202604301051.HaQzvAGE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301051.HaQzvAGE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301051.HaQzvAGE-lkp@intel.com/

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
