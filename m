Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597773438A2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 17:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783533131; cv=none; b=PvJB9LWML88fWlY5a2va8AHTB4hkZvyh1szf//0tpzfrm1HdZ9BCqRK5I4r0K3KLwThX0C07peaHrdN4Q5HBFdbjZqZI2QKoNJd3RMuOvDA+M+Z/In9b1vhxIPUPr8FcWPHv0EW0vQuC4ag4iR8IV8itBV0g/omPj1zloEa7hqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783533131; c=relaxed/simple;
	bh=wA/YdVUzkwafxWEwmcy/fgQX2Lri39DGr2ptD++h1U8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W3m44+piEay+MIrkbeGQqQkt8k7aOAaWOPuzWhKy39oCHn11NsDiTzdZXDyPBIQandQaRwwFI83ViBCIyL3YeUVy9CVCUwpfpoJIUhpvm5gIOpDrw3sLgQcQVroRuwjiqN3geO9/NH3G0gWZH1fZQa50kaUk6W/kOXSrw8/u1S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N3pTejEl; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N3pTejEl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783533129; x=1815069129;
  h=date:from:to:cc:subject:message-id;
  bh=wA/YdVUzkwafxWEwmcy/fgQX2Lri39DGr2ptD++h1U8=;
  b=N3pTejElwxGHAkaz6LB/ZLmts95IazpZ3T9UuyO6c9bU6pZPOpLGNvdT
   2GGY7yR0cyDKLtZHX7ytfIAFkDe6Y4QsoepWIq5KAbEo4TFDf3mwe9s1V
   AzFQ+dXlkGDAs4JhAA75kKbNCur1eauA/LLF1d2CUJdTZswghifSETpcp
   28xg3AoRB3Rb4a5wSLKugZXKRgWQpNT7o2cWPNiGP6QdL3Caye9OsD45/
   WzC5cagtkVvoQYEiK3A50wG9MIbjt4f7sxy2UwkgD+EOZeuK4yxglxLCN
   t+thIAYcVu1ou9BkeHTKaI+tBlwlmtx6LRDL56gbVEHidqM1wpWehKFvw
   g==;
X-CSE-ConnectionGUID: W8sHsJzqSki2KveOAKL37Q==
X-CSE-MsgGUID: lBYhRV3WTHmuHyaRQl89xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="109751810"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="109751810"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 10:52:08 -0700
X-CSE-ConnectionGUID: fk2bqTxYSz+OkuN+uu1FPg==
X-CSE-MsgGUID: a6YIslGgTVy9DxeMc5PPIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="277570274"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 08 Jul 2026 10:52:06 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whWRD-00000000Gh9-1lJd;
	Wed, 08 Jul 2026 17:52:00 +0000
Date: Thu, 09 Jul 2026 01:51:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kyle Zeng <kylebot@openai.com>
Cc: oe-kbuild-all@lists.linux.dev, Jan Kara <jack@suse.cz>
Subject: [jack-fs:for_next 1/4] fs/udf/inode.c:2302:44: error: 'sbi'
 undeclared
Message-ID: <202607090123.R8ME5MFP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git for_next
head:   b0961edc5667d36af3667a2ff07c4804dadecf99
commit: 107eb175cbc8115811b223f7ea63ca6afa607fe3 [1/4] udf: validate extent partition references in udf_current_aext()
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260709/202607090123.R8ME5MFP-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607090123.R8ME5MFP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607090123.R8ME5MFP-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/udf/inode.c: In function 'udf_current_aext':
>> fs/udf/inode.c:2302:44: error: 'sbi' undeclared (first use in this function)
    2302 |         if (eloc->partitionReferenceNum >= sbi->s_partitions) {
         |                                            ^~~
   fs/udf/inode.c:2302:44: note: each undeclared identifier is reported only once for each function it appears in


vim +/sbi +2302 fs/udf/inode.c

  2241	
  2242	/*
  2243	 * Returns 1 on success, -errno on error, 0 on hit EOF.
  2244	 */
  2245	int udf_current_aext(struct inode *inode, struct extent_position *epos,
  2246			     struct kernel_lb_addr *eloc, uint32_t *elen, int8_t *etype,
  2247			     int inc)
  2248	{
  2249		int alen;
  2250		uint8_t *ptr;
  2251		struct short_ad *sad;
  2252		struct long_ad *lad;
  2253		struct udf_inode_info *iinfo = UDF_I(inode);
  2254	
  2255		if (!epos->bh) {
  2256			if (!epos->offset)
  2257				epos->offset = udf_file_entry_alloc_offset(inode);
  2258			ptr = iinfo->i_data + epos->offset -
  2259				udf_file_entry_alloc_offset(inode) +
  2260				iinfo->i_lenEAttr;
  2261			alen = udf_file_entry_alloc_offset(inode) +
  2262								iinfo->i_lenAlloc;
  2263		} else {
  2264			struct allocExtDesc *header =
  2265				(struct allocExtDesc *)epos->bh->b_data;
  2266	
  2267			if (!epos->offset)
  2268				epos->offset = sizeof(struct allocExtDesc);
  2269			ptr = epos->bh->b_data + epos->offset;
  2270			if (check_add_overflow(sizeof(struct allocExtDesc),
  2271					le32_to_cpu(header->lengthAllocDescs), &alen))
  2272				return -1;
  2273	
  2274			if (alen > epos->bh->b_size)
  2275				return -1;
  2276		}
  2277	
  2278		switch (iinfo->i_alloc_type) {
  2279		case ICBTAG_FLAG_AD_SHORT:
  2280			sad = udf_get_fileshortad(ptr, alen, &epos->offset, inc);
  2281			if (!sad)
  2282				return 0;
  2283			*etype = le32_to_cpu(sad->extLength) >> 30;
  2284			eloc->logicalBlockNum = le32_to_cpu(sad->extPosition);
  2285			eloc->partitionReferenceNum =
  2286					iinfo->i_location.partitionReferenceNum;
  2287			*elen = le32_to_cpu(sad->extLength) & UDF_EXTENT_LENGTH_MASK;
  2288			break;
  2289		case ICBTAG_FLAG_AD_LONG:
  2290			lad = udf_get_filelongad(ptr, alen, &epos->offset, inc);
  2291			if (!lad)
  2292				return 0;
  2293			*etype = le32_to_cpu(lad->extLength) >> 30;
  2294			*eloc = lelb_to_cpu(lad->extLocation);
  2295			*elen = le32_to_cpu(lad->extLength) & UDF_EXTENT_LENGTH_MASK;
  2296			break;
  2297		default:
  2298			udf_debug("alloc_type = %u unsupported\n", iinfo->i_alloc_type);
  2299			return -EINVAL;
  2300		}
  2301	
> 2302		if (eloc->partitionReferenceNum >= sbi->s_partitions) {
  2303			udf_debug("invalid partition reference %u (partitions %u)\n",
  2304				  eloc->partitionReferenceNum, sbi->s_partitions);
  2305			return -EFSCORRUPTED;
  2306		}
  2307	
  2308		return 1;
  2309	}
  2310	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
