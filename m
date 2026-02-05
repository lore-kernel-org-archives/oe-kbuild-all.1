Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB30C72623
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Feb 2026 07:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770275757; cv=none; b=CfGfFAVRvWR9o3OWSBZ7awFRyNFfYjBdNVNk6qlRhrohk5JeEO6yB4dd3ktohf8ynrDiFJZCPkLBwb2F6XHfY6rpoXwCHdOCrDhFPCkzGJOIlgBcroI0PvGrpBgfa0f4GAuSmxxf9P0MV3IjK3Sxr3RSPfshYEBBDqD3FCUbPr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770275757; c=relaxed/simple;
	bh=dCtnkAyN27vcZqRTl5ulitQwiqPZpoFauZJB7og6IXg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MXX1I3J97Ccw4ejZ4eM+cSEbsWu8CFjwvDvhHuxUJYaoE8mkY9izcGMzZnW77NxEfDoPxGwwDiHFzbbndtz2QBo2xmtD60ZZijDkDeVvtHtEfTh6ZB+K0DEMBxHZk07e1A+JpkJoYAL7Ll1UneZxGjX/qBLf7F4zd3avrG+rmUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cSuKFG88; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cSuKFG88"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770275757; x=1801811757;
  h=date:from:to:cc:subject:message-id;
  bh=dCtnkAyN27vcZqRTl5ulitQwiqPZpoFauZJB7og6IXg=;
  b=cSuKFG88g+2YL9P8lMo6CrgWKSQO/NNJEVOcvpOIaXZ8X2vq5bZVH7EV
   K0OE6ZULxI2SITEVq067mX3cGeeNt0pRaO3uATXry/JXQQntuVRS3MFl9
   HA0VYZyaI6wvBYlCkwndPqHfDdrpkkZL25+rSMAiYnxcGQhILdOZZyPsr
   k/cpOgVCChfPPZytq7Sgncdk8HyqYHQNxwB1cn+xBv+U9e61pKrm2UEAv
   bGPJzWSJh0tQLWOJNeQCP3uKPIHjipTGNk8bHMo68GSDe07H7PzW+pNfc
   Gt2jgE7qrSz/0C4s/BRwewoH5lHTDV6ZUtIWNOfT6gC7LlJap8GOlRNsR
   g==;
X-CSE-ConnectionGUID: mdpMVIkyT8GLbTkupcYnPQ==
X-CSE-MsgGUID: PdcjlOK0TJOZMOFIduB/Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71642245"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="71642245"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 23:15:56 -0800
X-CSE-ConnectionGUID: KFTAPkTVSUy8bd7LYzeqng==
X-CSE-MsgGUID: HmxJqPRxRYCq6xayc9f7Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="215393059"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Feb 2026 23:15:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vntah-00000000jXs-3uJp;
	Thu, 05 Feb 2026 07:15:51 +0000
Date: Thu, 05 Feb 2026 15:15:28 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Amir Goldstein <amir73il@gmail.com>,
 Christoph Hellwig <hch@lst.de>
Subject: [linkinjeon-ntfs:ntfs-next 15/17] fs/ntfs/runlist.c:746
 ntfs_mapping_pairs_decompress() warn: unsigned
 '(attr->data.non_resident.lowest_vcn)' is never less than zero.
Message-ID: <202602051543.BUMl0e44-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Namjae,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntfs-next
head:   329d1d6055016dd5e19c888232c1c2bd7b4d9574
commit: a19f9aa64e837b4981a2e831ca44c88473dda89e [15/17] ntfs: add Kconfig and Makefile
config: csky-randconfig-r073-20260205 (https://download.01.org/0day-ci/archive/20260205/202602051543.BUMl0e44-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602051543.BUMl0e44-lkp@intel.com/

New smatch warnings:
fs/ntfs/runlist.c:746 ntfs_mapping_pairs_decompress() warn: unsigned '(attr->data.non_resident.lowest_vcn)' is never less than zero.

Old smatch warnings:
fs/ntfs/runlist.c:1666 ntfs_rl_insert_range() warn: variable dereferenced before check 'src_rl' (see line 1663)

vim +746 fs/ntfs/runlist.c

e905594a70eb537 Namjae Jeon 2025-12-30  710  
cec8df48d5aad24 Namjae Jeon 2026-02-04  711  /*
e905594a70eb537 Namjae Jeon 2025-12-30  712   * ntfs_mapping_pairs_decompress - convert mapping pairs array to runlist
cec8df48d5aad24 Namjae Jeon 2026-02-04  713   * @vol: ntfs volume
cec8df48d5aad24 Namjae Jeon 2026-02-04  714   * @attr: attribute record whose mapping pairs to decompress
cec8df48d5aad24 Namjae Jeon 2026-02-04  715   * @old_runlist: optional runlist to merge the decompressed runlist into
cec8df48d5aad24 Namjae Jeon 2026-02-04  716   * @new_rl_count: on success, set to the new runlist size
e905594a70eb537 Namjae Jeon 2025-12-30  717   *
e905594a70eb537 Namjae Jeon 2025-12-30  718   * It is up to the caller to serialize access to the runlist @old_rl.
e905594a70eb537 Namjae Jeon 2025-12-30  719   *
e905594a70eb537 Namjae Jeon 2025-12-30  720   * Decompress the attribute @attr's mapping pairs array into a runlist. On
e905594a70eb537 Namjae Jeon 2025-12-30  721   * success, return the decompressed runlist.
e905594a70eb537 Namjae Jeon 2025-12-30  722   *
e905594a70eb537 Namjae Jeon 2025-12-30  723   * If @old_rl is not NULL, decompressed runlist is inserted into the
e905594a70eb537 Namjae Jeon 2025-12-30  724   * appropriate place in @old_rl and the resultant, combined runlist is
e905594a70eb537 Namjae Jeon 2025-12-30  725   * returned. The original @old_rl is deallocated.
e905594a70eb537 Namjae Jeon 2025-12-30  726   *
e905594a70eb537 Namjae Jeon 2025-12-30  727   * On error, return -errno. @old_rl is left unmodified in that case.
e905594a70eb537 Namjae Jeon 2025-12-30  728   */
cec8df48d5aad24 Namjae Jeon 2026-02-04  729  struct runlist_element *ntfs_mapping_pairs_decompress(const struct ntfs_volume *vol,
cec8df48d5aad24 Namjae Jeon 2026-02-04  730  		const struct attr_record *attr, struct runlist *old_runlist,
cec8df48d5aad24 Namjae Jeon 2026-02-04  731  		size_t *new_rl_count)
e905594a70eb537 Namjae Jeon 2025-12-30  732  {
cec8df48d5aad24 Namjae Jeon 2026-02-04  733  	s64 vcn;		/* Current vcn. */
cec8df48d5aad24 Namjae Jeon 2026-02-04  734  	s64 lcn;		/* Current lcn. */
e905594a70eb537 Namjae Jeon 2025-12-30  735  	s64 deltaxcn;		/* Change in [vl]cn. */
cec8df48d5aad24 Namjae Jeon 2026-02-04  736  	struct runlist_element *rl, *new_rl;	/* The output runlist. */
e905594a70eb537 Namjae Jeon 2025-12-30  737  	u8 *buf;		/* Current position in mapping pairs array. */
e905594a70eb537 Namjae Jeon 2025-12-30  738  	u8 *attr_end;		/* End of attribute. */
e905594a70eb537 Namjae Jeon 2025-12-30  739  	int rlsize;		/* Size of runlist buffer. */
cec8df48d5aad24 Namjae Jeon 2026-02-04  740  	u16 rlpos;		/* Current runlist position in units of struct runlist_elements. */
e905594a70eb537 Namjae Jeon 2025-12-30  741  	u8 b;			/* Current byte offset in buf. */
e905594a70eb537 Namjae Jeon 2025-12-30  742  
e905594a70eb537 Namjae Jeon 2025-12-30  743  #ifdef DEBUG
e905594a70eb537 Namjae Jeon 2025-12-30  744  	/* Make sure attr exists and is non-resident. */
cec8df48d5aad24 Namjae Jeon 2026-02-04  745  	if (!attr || !attr->non_resident ||
cec8df48d5aad24 Namjae Jeon 2026-02-04 @746  	    le64_to_cpu(attr->data.non_resident.lowest_vcn) < 0) {
e905594a70eb537 Namjae Jeon 2025-12-30  747  		ntfs_error(vol->sb, "Invalid arguments.");
e905594a70eb537 Namjae Jeon 2025-12-30  748  		return ERR_PTR(-EINVAL);
e905594a70eb537 Namjae Jeon 2025-12-30  749  	}
e905594a70eb537 Namjae Jeon 2025-12-30  750  #endif
e905594a70eb537 Namjae Jeon 2025-12-30  751  	/* Start at vcn = lowest_vcn and lcn 0. */
cec8df48d5aad24 Namjae Jeon 2026-02-04  752  	vcn = le64_to_cpu(attr->data.non_resident.lowest_vcn);
e905594a70eb537 Namjae Jeon 2025-12-30  753  	lcn = 0;
e905594a70eb537 Namjae Jeon 2025-12-30  754  	/* Get start of the mapping pairs array. */
cec8df48d5aad24 Namjae Jeon 2026-02-04  755  	buf = (u8 *)attr +
cec8df48d5aad24 Namjae Jeon 2026-02-04  756  		le16_to_cpu(attr->data.non_resident.mapping_pairs_offset);
e905594a70eb537 Namjae Jeon 2025-12-30  757  	attr_end = (u8 *)attr + le32_to_cpu(attr->length);
e905594a70eb537 Namjae Jeon 2025-12-30  758  	if (unlikely(buf < (u8 *)attr || buf > attr_end)) {
e905594a70eb537 Namjae Jeon 2025-12-30  759  		ntfs_error(vol->sb, "Corrupt attribute.");
e905594a70eb537 Namjae Jeon 2025-12-30  760  		return ERR_PTR(-EIO);
e905594a70eb537 Namjae Jeon 2025-12-30  761  	}
cec8df48d5aad24 Namjae Jeon 2026-02-04  762  
e905594a70eb537 Namjae Jeon 2025-12-30  763  	/* Current position in runlist array. */
e905594a70eb537 Namjae Jeon 2025-12-30  764  	rlpos = 0;
e905594a70eb537 Namjae Jeon 2025-12-30  765  	/* Allocate first page and set current runlist size to one page. */
cec8df48d5aad24 Namjae Jeon 2026-02-04  766  	rl = kvzalloc(rlsize = PAGE_SIZE, GFP_NOFS);
e905594a70eb537 Namjae Jeon 2025-12-30  767  	if (unlikely(!rl))
e905594a70eb537 Namjae Jeon 2025-12-30  768  		return ERR_PTR(-ENOMEM);
e905594a70eb537 Namjae Jeon 2025-12-30  769  	/* Insert unmapped starting element if necessary. */
e905594a70eb537 Namjae Jeon 2025-12-30  770  	if (vcn) {
e905594a70eb537 Namjae Jeon 2025-12-30  771  		rl->vcn = 0;
e905594a70eb537 Namjae Jeon 2025-12-30  772  		rl->lcn = LCN_RL_NOT_MAPPED;
e905594a70eb537 Namjae Jeon 2025-12-30  773  		rl->length = vcn;
e905594a70eb537 Namjae Jeon 2025-12-30  774  		rlpos++;
e905594a70eb537 Namjae Jeon 2025-12-30  775  	}
e905594a70eb537 Namjae Jeon 2025-12-30  776  	while (buf < attr_end && *buf) {
e905594a70eb537 Namjae Jeon 2025-12-30  777  		/*
e905594a70eb537 Namjae Jeon 2025-12-30  778  		 * Allocate more memory if needed, including space for the
cec8df48d5aad24 Namjae Jeon 2026-02-04  779  		 * not-mapped and terminator elements. kvzalloc()
e905594a70eb537 Namjae Jeon 2025-12-30  780  		 * operates on whole pages only.
e905594a70eb537 Namjae Jeon 2025-12-30  781  		 */
cec8df48d5aad24 Namjae Jeon 2026-02-04  782  		if (((rlpos + 3) * sizeof(*rl)) > rlsize) {
cec8df48d5aad24 Namjae Jeon 2026-02-04  783  			struct runlist_element *rl2;
e905594a70eb537 Namjae Jeon 2025-12-30  784  
cec8df48d5aad24 Namjae Jeon 2026-02-04  785  			rl2 = kvzalloc(rlsize + PAGE_SIZE, GFP_NOFS);
e905594a70eb537 Namjae Jeon 2025-12-30  786  			if (unlikely(!rl2)) {
cec8df48d5aad24 Namjae Jeon 2026-02-04  787  				kvfree(rl);
e905594a70eb537 Namjae Jeon 2025-12-30  788  				return ERR_PTR(-ENOMEM);
e905594a70eb537 Namjae Jeon 2025-12-30  789  			}
e905594a70eb537 Namjae Jeon 2025-12-30  790  			memcpy(rl2, rl, rlsize);
cec8df48d5aad24 Namjae Jeon 2026-02-04  791  			kvfree(rl);
e905594a70eb537 Namjae Jeon 2025-12-30  792  			rl = rl2;
e905594a70eb537 Namjae Jeon 2025-12-30  793  			rlsize += PAGE_SIZE;
e905594a70eb537 Namjae Jeon 2025-12-30  794  		}
e905594a70eb537 Namjae Jeon 2025-12-30  795  		/* Enter the current vcn into the current runlist element. */
e905594a70eb537 Namjae Jeon 2025-12-30  796  		rl[rlpos].vcn = vcn;
e905594a70eb537 Namjae Jeon 2025-12-30  797  		/*
e905594a70eb537 Namjae Jeon 2025-12-30  798  		 * Get the change in vcn, i.e. the run length in clusters.
e905594a70eb537 Namjae Jeon 2025-12-30  799  		 * Doing it this way ensures that we signextend negative values.
e905594a70eb537 Namjae Jeon 2025-12-30  800  		 * A negative run length doesn't make any sense, but hey, I
e905594a70eb537 Namjae Jeon 2025-12-30  801  		 * didn't make up the NTFS specs and Windows NT4 treats the run
e905594a70eb537 Namjae Jeon 2025-12-30  802  		 * length as a signed value so that's how it is...
e905594a70eb537 Namjae Jeon 2025-12-30  803  		 */
e905594a70eb537 Namjae Jeon 2025-12-30  804  		b = *buf & 0xf;
e905594a70eb537 Namjae Jeon 2025-12-30  805  		if (b) {
e905594a70eb537 Namjae Jeon 2025-12-30  806  			if (unlikely(buf + b > attr_end))
e905594a70eb537 Namjae Jeon 2025-12-30  807  				goto io_error;
e905594a70eb537 Namjae Jeon 2025-12-30  808  			for (deltaxcn = (s8)buf[b--]; b; b--)
e905594a70eb537 Namjae Jeon 2025-12-30  809  				deltaxcn = (deltaxcn << 8) + buf[b];
e905594a70eb537 Namjae Jeon 2025-12-30  810  		} else { /* The length entry is compulsory. */
cec8df48d5aad24 Namjae Jeon 2026-02-04  811  			ntfs_error(vol->sb, "Missing length entry in mapping pairs array.");
e905594a70eb537 Namjae Jeon 2025-12-30  812  			deltaxcn = (s64)-1;
e905594a70eb537 Namjae Jeon 2025-12-30  813  		}
e905594a70eb537 Namjae Jeon 2025-12-30  814  		/*
e905594a70eb537 Namjae Jeon 2025-12-30  815  		 * Assume a negative length to indicate data corruption and
e905594a70eb537 Namjae Jeon 2025-12-30  816  		 * hence clean-up and return NULL.
e905594a70eb537 Namjae Jeon 2025-12-30  817  		 */
e905594a70eb537 Namjae Jeon 2025-12-30  818  		if (unlikely(deltaxcn < 0)) {
cec8df48d5aad24 Namjae Jeon 2026-02-04  819  			ntfs_error(vol->sb, "Invalid length in mapping pairs array.");
e905594a70eb537 Namjae Jeon 2025-12-30  820  			goto err_out;
e905594a70eb537 Namjae Jeon 2025-12-30  821  		}
e905594a70eb537 Namjae Jeon 2025-12-30  822  		/*
e905594a70eb537 Namjae Jeon 2025-12-30  823  		 * Enter the current run length into the current runlist
e905594a70eb537 Namjae Jeon 2025-12-30  824  		 * element.
e905594a70eb537 Namjae Jeon 2025-12-30  825  		 */
e905594a70eb537 Namjae Jeon 2025-12-30  826  		rl[rlpos].length = deltaxcn;
e905594a70eb537 Namjae Jeon 2025-12-30  827  		/* Increment the current vcn by the current run length. */
e905594a70eb537 Namjae Jeon 2025-12-30  828  		vcn += deltaxcn;
e905594a70eb537 Namjae Jeon 2025-12-30  829  		/*
e905594a70eb537 Namjae Jeon 2025-12-30  830  		 * There might be no lcn change at all, as is the case for
e905594a70eb537 Namjae Jeon 2025-12-30  831  		 * sparse clusters on NTFS 3.0+, in which case we set the lcn
e905594a70eb537 Namjae Jeon 2025-12-30  832  		 * to LCN_HOLE.
e905594a70eb537 Namjae Jeon 2025-12-30  833  		 */
e905594a70eb537 Namjae Jeon 2025-12-30  834  		if (!(*buf & 0xf0))
e905594a70eb537 Namjae Jeon 2025-12-30  835  			rl[rlpos].lcn = LCN_HOLE;
e905594a70eb537 Namjae Jeon 2025-12-30  836  		else {
e905594a70eb537 Namjae Jeon 2025-12-30  837  			/* Get the lcn change which really can be negative. */
e905594a70eb537 Namjae Jeon 2025-12-30  838  			u8 b2 = *buf & 0xf;
cec8df48d5aad24 Namjae Jeon 2026-02-04  839  
e905594a70eb537 Namjae Jeon 2025-12-30  840  			b = b2 + ((*buf >> 4) & 0xf);
e905594a70eb537 Namjae Jeon 2025-12-30  841  			if (buf + b > attr_end)
e905594a70eb537 Namjae Jeon 2025-12-30  842  				goto io_error;
e905594a70eb537 Namjae Jeon 2025-12-30  843  			for (deltaxcn = (s8)buf[b--]; b > b2; b--)
e905594a70eb537 Namjae Jeon 2025-12-30  844  				deltaxcn = (deltaxcn << 8) + buf[b];
e905594a70eb537 Namjae Jeon 2025-12-30  845  			/* Change the current lcn to its new value. */
e905594a70eb537 Namjae Jeon 2025-12-30  846  			lcn += deltaxcn;
e905594a70eb537 Namjae Jeon 2025-12-30  847  #ifdef DEBUG
e905594a70eb537 Namjae Jeon 2025-12-30  848  			/*
e905594a70eb537 Namjae Jeon 2025-12-30  849  			 * On NTFS 1.2-, apparently can have lcn == -1 to
e905594a70eb537 Namjae Jeon 2025-12-30  850  			 * indicate a hole. But we haven't verified ourselves
e905594a70eb537 Namjae Jeon 2025-12-30  851  			 * whether it is really the lcn or the deltaxcn that is
e905594a70eb537 Namjae Jeon 2025-12-30  852  			 * -1. So if either is found give us a message so we
e905594a70eb537 Namjae Jeon 2025-12-30  853  			 * can investigate it further!
e905594a70eb537 Namjae Jeon 2025-12-30  854  			 */
e905594a70eb537 Namjae Jeon 2025-12-30  855  			if (vol->major_ver < 3) {
cec8df48d5aad24 Namjae Jeon 2026-02-04  856  				if (unlikely(deltaxcn == -1))
e905594a70eb537 Namjae Jeon 2025-12-30  857  					ntfs_error(vol->sb, "lcn delta == -1");
cec8df48d5aad24 Namjae Jeon 2026-02-04  858  				if (unlikely(lcn == -1))
e905594a70eb537 Namjae Jeon 2025-12-30  859  					ntfs_error(vol->sb, "lcn == -1");
e905594a70eb537 Namjae Jeon 2025-12-30  860  			}
e905594a70eb537 Namjae Jeon 2025-12-30  861  #endif
e905594a70eb537 Namjae Jeon 2025-12-30  862  			/* Check lcn is not below -1. */
cec8df48d5aad24 Namjae Jeon 2026-02-04  863  			if (unlikely(lcn < -1)) {
cec8df48d5aad24 Namjae Jeon 2026-02-04  864  				ntfs_error(vol->sb, "Invalid s64 < -1 in mapping pairs array.");
cec8df48d5aad24 Namjae Jeon 2026-02-04  865  				goto err_out;
cec8df48d5aad24 Namjae Jeon 2026-02-04  866  			}
cec8df48d5aad24 Namjae Jeon 2026-02-04  867  
cec8df48d5aad24 Namjae Jeon 2026-02-04  868  			/* chkdsk accepts zero-sized runs only for holes */
cec8df48d5aad24 Namjae Jeon 2026-02-04  869  			if ((lcn != -1) && !rl[rlpos].length) {
cec8df48d5aad24 Namjae Jeon 2026-02-04  870  				ntfs_error(vol->sb, "Invalid zero-sized data run.\n");
e905594a70eb537 Namjae Jeon 2025-12-30  871  				goto err_out;
e905594a70eb537 Namjae Jeon 2025-12-30  872  			}
cec8df48d5aad24 Namjae Jeon 2026-02-04  873  
e905594a70eb537 Namjae Jeon 2025-12-30  874  			/* Enter the current lcn into the runlist element. */
e905594a70eb537 Namjae Jeon 2025-12-30  875  			rl[rlpos].lcn = lcn;
e905594a70eb537 Namjae Jeon 2025-12-30  876  		}
cec8df48d5aad24 Namjae Jeon 2026-02-04  877  		/* Get to the next runlist element, skipping zero-sized holes */
cec8df48d5aad24 Namjae Jeon 2026-02-04  878  		if (rl[rlpos].length)
e905594a70eb537 Namjae Jeon 2025-12-30  879  			rlpos++;
e905594a70eb537 Namjae Jeon 2025-12-30  880  		/* Increment the buffer position to the next mapping pair. */
e905594a70eb537 Namjae Jeon 2025-12-30  881  		buf += (*buf & 0xf) + ((*buf >> 4) & 0xf) + 1;
e905594a70eb537 Namjae Jeon 2025-12-30  882  	}
e905594a70eb537 Namjae Jeon 2025-12-30  883  	if (unlikely(buf >= attr_end))
e905594a70eb537 Namjae Jeon 2025-12-30  884  		goto io_error;
e905594a70eb537 Namjae Jeon 2025-12-30  885  	/*
e905594a70eb537 Namjae Jeon 2025-12-30  886  	 * If there is a highest_vcn specified, it must be equal to the final
e905594a70eb537 Namjae Jeon 2025-12-30  887  	 * vcn in the runlist - 1, or something has gone badly wrong.
e905594a70eb537 Namjae Jeon 2025-12-30  888  	 */
cec8df48d5aad24 Namjae Jeon 2026-02-04  889  	deltaxcn = le64_to_cpu(attr->data.non_resident.highest_vcn);
e905594a70eb537 Namjae Jeon 2025-12-30  890  	if (unlikely(deltaxcn && vcn - 1 != deltaxcn)) {
e905594a70eb537 Namjae Jeon 2025-12-30  891  mpa_err:
cec8df48d5aad24 Namjae Jeon 2026-02-04  892  		ntfs_error(vol->sb, "Corrupt mapping pairs array in non-resident attribute.");
e905594a70eb537 Namjae Jeon 2025-12-30  893  		goto err_out;
e905594a70eb537 Namjae Jeon 2025-12-30  894  	}
e905594a70eb537 Namjae Jeon 2025-12-30  895  	/* Setup not mapped runlist element if this is the base extent. */
e905594a70eb537 Namjae Jeon 2025-12-30  896  	if (!attr->data.non_resident.lowest_vcn) {
cec8df48d5aad24 Namjae Jeon 2026-02-04  897  		s64 max_cluster;
e905594a70eb537 Namjae Jeon 2025-12-30  898  
cec8df48d5aad24 Namjae Jeon 2026-02-04  899  		max_cluster = ((le64_to_cpu(attr->data.non_resident.allocated_size) +
e905594a70eb537 Namjae Jeon 2025-12-30  900  				vol->cluster_size - 1) >>
e905594a70eb537 Namjae Jeon 2025-12-30  901  				vol->cluster_size_bits) - 1;
e905594a70eb537 Namjae Jeon 2025-12-30  902  		/*
e905594a70eb537 Namjae Jeon 2025-12-30  903  		 * A highest_vcn of zero means this is a single extent
e905594a70eb537 Namjae Jeon 2025-12-30  904  		 * attribute so simply terminate the runlist with LCN_ENOENT).
e905594a70eb537 Namjae Jeon 2025-12-30  905  		 */
e905594a70eb537 Namjae Jeon 2025-12-30  906  		if (deltaxcn) {
e905594a70eb537 Namjae Jeon 2025-12-30  907  			/*
e905594a70eb537 Namjae Jeon 2025-12-30  908  			 * If there is a difference between the highest_vcn and
e905594a70eb537 Namjae Jeon 2025-12-30  909  			 * the highest cluster, the runlist is either corrupt
e905594a70eb537 Namjae Jeon 2025-12-30  910  			 * or, more likely, there are more extents following
e905594a70eb537 Namjae Jeon 2025-12-30  911  			 * this one.
e905594a70eb537 Namjae Jeon 2025-12-30  912  			 */
e905594a70eb537 Namjae Jeon 2025-12-30  913  			if (deltaxcn < max_cluster) {
cec8df48d5aad24 Namjae Jeon 2026-02-04  914  				ntfs_debug("More extents to follow; deltaxcn = 0x%llx, max_cluster = 0x%llx",
cec8df48d5aad24 Namjae Jeon 2026-02-04  915  						deltaxcn, max_cluster);
e905594a70eb537 Namjae Jeon 2025-12-30  916  				rl[rlpos].vcn = vcn;
e905594a70eb537 Namjae Jeon 2025-12-30  917  				vcn += rl[rlpos].length = max_cluster -
e905594a70eb537 Namjae Jeon 2025-12-30  918  						deltaxcn;
e905594a70eb537 Namjae Jeon 2025-12-30  919  				rl[rlpos].lcn = LCN_RL_NOT_MAPPED;
e905594a70eb537 Namjae Jeon 2025-12-30  920  				rlpos++;
e905594a70eb537 Namjae Jeon 2025-12-30  921  			} else if (unlikely(deltaxcn > max_cluster)) {
cec8df48d5aad24 Namjae Jeon 2026-02-04  922  				ntfs_error(vol->sb,
cec8df48d5aad24 Namjae Jeon 2026-02-04  923  					   "Corrupt attribute. deltaxcn = 0x%llx, max_cluster = 0x%llx",
cec8df48d5aad24 Namjae Jeon 2026-02-04  924  					   deltaxcn, max_cluster);
e905594a70eb537 Namjae Jeon 2025-12-30  925  				goto mpa_err;
e905594a70eb537 Namjae Jeon 2025-12-30  926  			}
e905594a70eb537 Namjae Jeon 2025-12-30  927  		}
e905594a70eb537 Namjae Jeon 2025-12-30  928  		rl[rlpos].lcn = LCN_ENOENT;
e905594a70eb537 Namjae Jeon 2025-12-30  929  	} else /* Not the base extent. There may be more extents to follow. */
e905594a70eb537 Namjae Jeon 2025-12-30  930  		rl[rlpos].lcn = LCN_RL_NOT_MAPPED;
e905594a70eb537 Namjae Jeon 2025-12-30  931  
e905594a70eb537 Namjae Jeon 2025-12-30  932  	/* Setup terminating runlist element. */
e905594a70eb537 Namjae Jeon 2025-12-30  933  	rl[rlpos].vcn = vcn;
e905594a70eb537 Namjae Jeon 2025-12-30  934  	rl[rlpos].length = (s64)0;
e905594a70eb537 Namjae Jeon 2025-12-30  935  	/* If no existing runlist was specified, we are done. */
cec8df48d5aad24 Namjae Jeon 2026-02-04  936  	if (!old_runlist || !old_runlist->rl) {
cec8df48d5aad24 Namjae Jeon 2026-02-04  937  		*new_rl_count = rlpos + 1;
e905594a70eb537 Namjae Jeon 2025-12-30  938  		ntfs_debug("Mapping pairs array successfully decompressed:");
e905594a70eb537 Namjae Jeon 2025-12-30  939  		ntfs_debug_dump_runlist(rl);
e905594a70eb537 Namjae Jeon 2025-12-30  940  		return rl;
e905594a70eb537 Namjae Jeon 2025-12-30  941  	}
e905594a70eb537 Namjae Jeon 2025-12-30  942  	/* Now combine the new and old runlists checking for overlaps. */
cec8df48d5aad24 Namjae Jeon 2026-02-04  943  	new_rl = ntfs_runlists_merge(old_runlist, rl, rlpos + 1, new_rl_count);
cec8df48d5aad24 Namjae Jeon 2026-02-04  944  	if (!IS_ERR(new_rl))
cec8df48d5aad24 Namjae Jeon 2026-02-04  945  		return new_rl;
cec8df48d5aad24 Namjae Jeon 2026-02-04  946  	kvfree(rl);
e905594a70eb537 Namjae Jeon 2025-12-30  947  	ntfs_error(vol->sb, "Failed to merge runlists.");
cec8df48d5aad24 Namjae Jeon 2026-02-04  948  	return new_rl;
e905594a70eb537 Namjae Jeon 2025-12-30  949  io_error:
e905594a70eb537 Namjae Jeon 2025-12-30  950  	ntfs_error(vol->sb, "Corrupt attribute.");
e905594a70eb537 Namjae Jeon 2025-12-30  951  err_out:
cec8df48d5aad24 Namjae Jeon 2026-02-04  952  	kvfree(rl);
e905594a70eb537 Namjae Jeon 2025-12-30  953  	return ERR_PTR(-EIO);
e905594a70eb537 Namjae Jeon 2025-12-30  954  }
e905594a70eb537 Namjae Jeon 2025-12-30  955  

:::::: The code at line 746 was first introduced by commit
:::::: cec8df48d5aad24a8cf0789ec75ba61ee6fc0a6e ntfs: update runlist handling and cluster allocator

:::::: TO: Namjae Jeon <linkinjeon@kernel.org>
:::::: CC: Namjae Jeon <linkinjeon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
