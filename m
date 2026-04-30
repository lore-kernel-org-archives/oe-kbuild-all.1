Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA25478E26
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 17:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777570800; cv=none; b=YVpaQCkKDZSUr6InjIIeaakQjlgJm6AAwoHLAVst+PB/KQAKeXVYtbRaLRw9FpmPN72hC25PGrbgvbgp7iMEBGnXit3r9MlgS+0D7RustmZyR+lrtDudOcTZ+9rdPZzhGm6Fnd8EmxtuQagUkpUmC/F3NvHEmtb+yLRQhsAg7tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777570800; c=relaxed/simple;
	bh=0NWGD8Y3heY49SLb04SY5BHOjHwbE6p6DkLAYURSe90=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sCqkfxKvKwV6jwI2+8Nw/7s9e1cpbVq130GrcMTUmnygLsfVKxRPg6R3UeKncjk+EM/1IaDBRQkAVXrK5JyQaC6kn006G2Lk6gGW3Ibvf7dNCSuFZ2cQoQmxm22F7vzAhKDF4tA+8RFwDOEXj3q/qwKSewjUKJSSDZhHEtoPlEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D2q0q6jv; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D2q0q6jv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777570797; x=1809106797;
  h=date:from:to:cc:subject:message-id;
  bh=0NWGD8Y3heY49SLb04SY5BHOjHwbE6p6DkLAYURSe90=;
  b=D2q0q6jvYVi9ybDorQJWDVBgWg6mkwgBpcQSPmqEifcog/btkLWxolBj
   8somZj1xTlydpq/FzGBqokElXdPDMzDpGbot3tcG4GZNKdorHdZnLuAyV
   FIRM+tVoBcF7+cKmVH2IAE6l3qqCpF0+TTX69AfGKfOhfdIsd6xJMBqyl
   shGCJk3Y/PUkhKOGbE1QryNit2BVO5whNSSt+DvzTZs9nRVO8DiwfWITK
   9PYopRNzDU1DYbeZZQu7aF3MVivXNyRfF8OcvMqCqevYj147qKMzO7IMf
   DAfu8bDSgXjbYIFlgksd1khureumDjEeuSqijGqt/4ZDTMhCxJoo7xL6q
   w==;
X-CSE-ConnectionGUID: alSYaLAmSpOW8BZyLs5ZBw==
X-CSE-MsgGUID: KXb83vC0TPu9KB0QR2n/XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="81110941"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="81110941"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 10:39:56 -0700
X-CSE-ConnectionGUID: IcqnseorRzOYwI5Tw0g7Jg==
X-CSE-MsgGUID: 6SC1i2gSQ8mXME+gBrF7KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="258231871"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Apr 2026 10:39:55 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIVMe-00000000Ck0-3V81;
	Thu, 30 Apr 2026 17:39:52 +0000
Date: Fri, 01 May 2026 01:38:54 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-mt7622 0/3]
 block/partitions/msdos.c:310:52: warning: operation on 'state->next' may be
 undefined
Message-ID: <202605010116.NuNB9l1N-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-mt7622
head:   d8b6134553d0f268ed594061eba808fcb51257f4
commit: 7ba12f95aa40e90f9d5a619606e3fc98cdb91b65 [0/3] block: partitions: msdos: add OF node by partition number
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260501/202605010116.NuNB9l1N-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605010116.NuNB9l1N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605010116.NuNB9l1N-lkp@intel.com/

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
