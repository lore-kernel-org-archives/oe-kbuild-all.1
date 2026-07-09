Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA46226738C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 07:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783582866; cv=none; b=LoSa0d05Y/UC9nuNqaBnfO1nCtZW2tq7+M79gKNs+VRvv73fS5G0/QbsTujehCMmJHP+26KAf8qDlUJOaiWXq/1KKRikodf0UuPoqGzmVUU9dhKpBosG+9DQ0206VvYlndFSrjZY0YoHdDg2N1KgyHTRsGd9BZMQjuKX0Y0hG3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783582866; c=relaxed/simple;
	bh=Q7sv7zcr5kr/Xbi8tagZ3sMpLFFSFDLim/PA2jCQ39U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gd57lK0YjULPzQ7Uq8xQ5pzCYaFi309KRyrttZ++eDqqrafgAD1VTJjVmA4ixykackrwAKpeODWpYl0ODff+mosIZO2mgu1xElrQLnHNNHlzpsh2bBcGMKxwTrI2Hv8Zihnh74qmYT/B+xn73GwYS/r5gO4/HuHTo2EjeIqkM3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ddOQfPcj; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ddOQfPcj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783582865; x=1815118865;
  h=date:from:to:cc:subject:message-id;
  bh=Q7sv7zcr5kr/Xbi8tagZ3sMpLFFSFDLim/PA2jCQ39U=;
  b=ddOQfPcj1q2gpDLdRf8rn17B9oxsLVxJQgTRsQ5VQ7HBI38UQxm116rf
   12/5MH4q2+PHbuwoZmp3JPh0uFTBYh0t20BI69SzBRX9yrxmuOykOBN59
   3zRs+5FF9UPqoxgSD3YgQ+4RqprxuW0J+6l3C+sDOSY+CAPh4ffJN04fJ
   HdP3RaLFrFPHvizgTXG+Je2+7/HMHKcB//PaBOJcfez9L/f7QI1zAiSb6
   wfCAHUPOqaFzyiJJouheybNOTgaRVpf5VlQc3JUMh7vl4FNZKijAKuCXg
   gxHofXej8QSva/SUu2VkowAP9yXddTJ+OcrC4qdAoIEPkcxk32rN12ov5
   g==;
X-CSE-ConnectionGUID: 77vjLW73QyeShAq6cJ2QNA==
X-CSE-MsgGUID: JxoRRJRuQmafp5PYD4HivQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94863078"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="94863078"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 00:40:02 -0700
X-CSE-ConnectionGUID: w6QkXM9YRB2ZEBsrxUH55w==
X-CSE-MsgGUID: kpR41yMbTc6YSmwpt0F9yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="253418687"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 09 Jul 2026 00:39:59 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whjMJ-00000000HOx-31y8;
	Thu, 09 Jul 2026 07:39:48 +0000
Date: Thu, 09 Jul 2026 15:38:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vbabka:objext_split 11/14] mm/slub.c:1201:13: error:
 implicit declaration of function 'obj_exts_in_object'; did you mean
 'obj_exts_in_slab'?
Message-ID: <202607091514.vb217Kmc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vlastimil,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git objext_split
head:   8bd682e28958694beba958e2a3af94c6e1789819
commit: 0923358e166406daf2533102ff371c4ba7f93bf3 [11/14] mm/slab: replace stride with obj_exts_in_object flag
config: xtensa-allnoconfig (https://download.01.org/0day-ci/archive/20260709/202607091514.vb217Kmc-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607091514.vb217Kmc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607091514.vb217Kmc-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/slub.c: In function 'print_trailer':
>> mm/slub.c:1201:13: error: implicit declaration of function 'obj_exts_in_object'; did you mean 'obj_exts_in_slab'? [-Wimplicit-function-declaration]
    1201 |         if (obj_exts_in_object(slab))
         |             ^~~~~~~~~~~~~~~~~~
         |             obj_exts_in_slab


vim +1201 mm/slub.c

  1166	
  1167	static void print_trailer(struct kmem_cache *s, struct slab *slab, u8 *p)
  1168	{
  1169		unsigned int off;	/* Offset of last byte */
  1170		u8 *addr = slab_address(slab);
  1171	
  1172		print_tracking(s, p);
  1173	
  1174		print_slab_info(slab);
  1175	
  1176		pr_err("Object 0x%p @offset=%tu fp=0x%p\n\n",
  1177		       p, p - addr, get_freepointer(s, p));
  1178	
  1179		if (s->flags & SLAB_RED_ZONE)
  1180			print_section(KERN_ERR, "Redzone  ", p - s->red_left_pad,
  1181				      s->red_left_pad);
  1182		else if (p > addr + 16)
  1183			print_section(KERN_ERR, "Bytes b4 ", p - 16, 16);
  1184	
  1185		print_section(KERN_ERR,         "Object   ", p,
  1186			      min_t(unsigned int, s->object_size, PAGE_SIZE));
  1187		if (s->flags & SLAB_RED_ZONE)
  1188			print_section(KERN_ERR, "Redzone  ", p + s->object_size,
  1189				s->inuse - s->object_size);
  1190	
  1191		off = get_info_end(s);
  1192	
  1193		if (s->flags & SLAB_STORE_USER)
  1194			off += 2 * sizeof(struct track);
  1195	
  1196		if (slub_debug_orig_size(s))
  1197			off += sizeof(unsigned long);
  1198	
  1199		off += kasan_metadata_size(s, false);
  1200	
> 1201		if (obj_exts_in_object(slab))
  1202			off += sizeof(struct slabobj_ext);
  1203	
  1204		if (off != size_from_object(s))
  1205			/* Beginning of the filler is the free pointer */
  1206			print_section(KERN_ERR, "Padding  ", p + off,
  1207				      size_from_object(s) - off);
  1208	}
  1209	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
