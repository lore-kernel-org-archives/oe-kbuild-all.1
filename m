Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF352F12AD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 06:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781333057; cv=none; b=UYHpLlyESVrgSCLgJ224XybwzbF1+8hd2ZZ1Ny9WtNiYYWYXn7V7eKQKGB6VUFTUF8dOOuKUU48bi/XvR/U9cE/FmFzZ2jjB04vWAjf3cJNFsTWNspKAx+4vaXEIH0ciHBAYP+TH78dsrR4ab1IOkrknxJLlW1wwrkpfmKAII/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781333057; c=relaxed/simple;
	bh=D7xoDq5TNCTnR2IcT/tj/MJYXHYl/EFtY1h2c8ajA28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r77EVmG3XWKmK+rpXiiBPyBOnThqpDPZmOIx1lfA5JUF7lvqI987b3nXIPFQ2G1VuogqJNhlvMJ9CQxBlditN6v1GyvrKPGUpET2st3VpxFpRk1VDzmU6wIcRPPoaLwwthIkYNaaZr5CPpxezEddc0nWaRiYRrNA1Suu3w1Cm/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fuMXqPzB; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fuMXqPzB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781333055; x=1812869055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D7xoDq5TNCTnR2IcT/tj/MJYXHYl/EFtY1h2c8ajA28=;
  b=fuMXqPzB+KvR5+L6RLOW+IHkPF7lObO4gaGQAYYlSziyjyPZ9xtPiFJc
   6kg06hLkTzQ3NWsL7m3QbsLdSK/UPVDaPjqrk9zn8rUV6ksxBNPreqec9
   +zJk6vAox2h558EW8NBMcyqrSkBX6LNKXblcGY56DSBvQalbh4UH80aP9
   9BeU2uvBnBw189d0AuZCgW3UBE8dlKom+g6LZrbdMd9+MOOL4dWKwmQxv
   f6gnD9gkAJHdu/pbERmUtJn7l6tzEtyDVXphTzmq4wkIjQp3QS9+Zyvvi
   nefQNuVvaAXbbRNxpZpfBy1h7VY7Owq8wyoRGMqg0O8KVmLS2ssp8ql5p
   A==;
X-CSE-ConnectionGUID: CPXngla+SOyt1jcXmcAhEg==
X-CSE-MsgGUID: +gonslNqTnynz8hQ6A3rog==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="85790829"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="85790829"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 23:44:13 -0700
X-CSE-ConnectionGUID: UXdb7n/zQv2idfoIWffOHA==
X-CSE-MsgGUID: E6wlnbsCShSmpTOy5jhN0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="250921908"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Jun 2026 23:44:12 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYI6C-00000000Pk6-2lOd;
	Sat, 13 Jun 2026 06:44:08 +0000
Date: Sat, 13 Jun 2026 14:44:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kyle Zeng <kylebot@openai.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jan Kara <jack@suse.com>,
	outbounddisclosures@openai.com, Kyle Zeng <kylebot@openai.com>
Subject: Re: [PATCH v2] udf: validate extent partition references in
 udf_current_aext()
Message-ID: <202606131413.F3K2CzIv-lkp@intel.com>
References: <20260612225846.97678-1-kylebot@openai.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612225846.97678-1-kylebot@openai.com>

Hi Kyle,

kernel test robot noticed the following build errors:

[auto build test ERROR on brauner-vfs/vfs.all]
[also build test ERROR on linus/master v7.1-rc7 next-20260612]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kyle-Zeng/udf-validate-extent-partition-references-in-udf_current_aext/20260613-070817
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20260612225846.97678-1-kylebot%40openai.com
patch subject: [PATCH v2] udf: validate extent partition references in udf_current_aext()
config: m68k-randconfig-r072-20260613 (https://download.01.org/0day-ci/archive/20260613/202606131413.F3K2CzIv-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606131413.F3K2CzIv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606131413.F3K2CzIv-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/udf/inode.c: In function 'udf_write_aext':
>> fs/udf/inode.c:2154:22: warning: unused variable 'sbi' [-Wunused-variable]
     struct udf_sb_info *sbi = UDF_SB(inode->i_sb);
                         ^~~
   fs/udf/inode.c: In function 'udf_current_aext':
>> fs/udf/inode.c:2303:37: error: 'sbi' undeclared (first use in this function)
     if (eloc->partitionReferenceNum >= sbi->s_partitions) {
                                        ^~~
   fs/udf/inode.c:2303:37: note: each undeclared identifier is reported only once for each function it appears in


vim +/sbi +2303 fs/udf/inode.c

  2145	
  2146	void udf_write_aext(struct inode *inode, struct extent_position *epos,
  2147			    struct kernel_lb_addr *eloc, uint32_t elen, int inc)
  2148	{
  2149		int adsize;
  2150		uint8_t *ptr;
  2151		struct short_ad *sad;
  2152		struct long_ad *lad;
  2153		struct udf_inode_info *iinfo = UDF_I(inode);
> 2154		struct udf_sb_info *sbi = UDF_SB(inode->i_sb);
  2155	
  2156		if (!epos->bh)
  2157			ptr = iinfo->i_data + epos->offset -
  2158				udf_file_entry_alloc_offset(inode) +
  2159				iinfo->i_lenEAttr;
  2160		else
  2161			ptr = epos->bh->b_data + epos->offset;
  2162	
  2163		switch (iinfo->i_alloc_type) {
  2164		case ICBTAG_FLAG_AD_SHORT:
  2165			sad = (struct short_ad *)ptr;
  2166			sad->extLength = cpu_to_le32(elen);
  2167			sad->extPosition = cpu_to_le32(eloc->logicalBlockNum);
  2168			adsize = sizeof(struct short_ad);
  2169			break;
  2170		case ICBTAG_FLAG_AD_LONG:
  2171			lad = (struct long_ad *)ptr;
  2172			lad->extLength = cpu_to_le32(elen);
  2173			lad->extLocation = cpu_to_lelb(*eloc);
  2174			memset(lad->impUse, 0x00, sizeof(lad->impUse));
  2175			adsize = sizeof(struct long_ad);
  2176			break;
  2177		default:
  2178			return;
  2179		}
  2180	
  2181		if (epos->bh) {
  2182			if (!UDF_QUERY_FLAG(inode->i_sb, UDF_FLAG_STRICT) ||
  2183			    UDF_SB(inode->i_sb)->s_udfrev >= 0x0201) {
  2184				struct allocExtDesc *aed =
  2185					(struct allocExtDesc *)epos->bh->b_data;
  2186				udf_update_tag(epos->bh->b_data,
  2187					       le32_to_cpu(aed->lengthAllocDescs) +
  2188					       sizeof(struct allocExtDesc));
  2189			}
  2190			mmb_mark_buffer_dirty(epos->bh, &iinfo->i_metadata_bhs);
  2191		} else {
  2192			mark_inode_dirty(inode);
  2193		}
  2194	
  2195		if (inc)
  2196			epos->offset += adsize;
  2197	}
  2198	
  2199	/*
  2200	 * Only 1 indirect extent in a row really makes sense but allow upto 16 in case
  2201	 * someone does some weird stuff.
  2202	 */
  2203	#define UDF_MAX_INDIR_EXTS 16
  2204	
  2205	/*
  2206	 * Returns 1 on success, -errno on error, 0 on hit EOF.
  2207	 */
  2208	int udf_next_aext(struct inode *inode, struct extent_position *epos,
  2209			  struct kernel_lb_addr *eloc, uint32_t *elen, int8_t *etype,
  2210			  int inc)
  2211	{
  2212		unsigned int indirections = 0;
  2213		int ret = 0;
  2214		udf_pblk_t block;
  2215	
  2216		while (1) {
  2217			ret = udf_current_aext(inode, epos, eloc, elen,
  2218					       etype, inc);
  2219			if (ret <= 0)
  2220				return ret;
  2221			if (*etype != (EXT_NEXT_EXTENT_ALLOCDESCS >> 30))
  2222				return ret;
  2223	
  2224			if (++indirections > UDF_MAX_INDIR_EXTS) {
  2225				udf_err(inode->i_sb,
  2226					"too many indirect extents in inode %llu\n",
  2227					inode->i_ino);
  2228				return -EFSCORRUPTED;
  2229			}
  2230	
  2231			epos->block = *eloc;
  2232			epos->offset = sizeof(struct allocExtDesc);
  2233			brelse(epos->bh);
  2234			block = udf_get_lb_pblock(inode->i_sb, &epos->block, 0);
  2235			epos->bh = sb_bread(inode->i_sb, block);
  2236			if (!epos->bh) {
  2237				udf_debug("reading block %u failed!\n", block);
  2238				return -EIO;
  2239			}
  2240		}
  2241	}
  2242	
  2243	/*
  2244	 * Returns 1 on success, -errno on error, 0 on hit EOF.
  2245	 */
  2246	int udf_current_aext(struct inode *inode, struct extent_position *epos,
  2247			     struct kernel_lb_addr *eloc, uint32_t *elen, int8_t *etype,
  2248			     int inc)
  2249	{
  2250		int alen;
  2251		uint8_t *ptr;
  2252		struct short_ad *sad;
  2253		struct long_ad *lad;
  2254		struct udf_inode_info *iinfo = UDF_I(inode);
  2255	
  2256		if (!epos->bh) {
  2257			if (!epos->offset)
  2258				epos->offset = udf_file_entry_alloc_offset(inode);
  2259			ptr = iinfo->i_data + epos->offset -
  2260				udf_file_entry_alloc_offset(inode) +
  2261				iinfo->i_lenEAttr;
  2262			alen = udf_file_entry_alloc_offset(inode) +
  2263								iinfo->i_lenAlloc;
  2264		} else {
  2265			struct allocExtDesc *header =
  2266				(struct allocExtDesc *)epos->bh->b_data;
  2267	
  2268			if (!epos->offset)
  2269				epos->offset = sizeof(struct allocExtDesc);
  2270			ptr = epos->bh->b_data + epos->offset;
  2271			if (check_add_overflow(sizeof(struct allocExtDesc),
  2272					le32_to_cpu(header->lengthAllocDescs), &alen))
  2273				return -1;
  2274	
  2275			if (alen > epos->bh->b_size)
  2276				return -1;
  2277		}
  2278	
  2279		switch (iinfo->i_alloc_type) {
  2280		case ICBTAG_FLAG_AD_SHORT:
  2281			sad = udf_get_fileshortad(ptr, alen, &epos->offset, inc);
  2282			if (!sad)
  2283				return 0;
  2284			*etype = le32_to_cpu(sad->extLength) >> 30;
  2285			eloc->logicalBlockNum = le32_to_cpu(sad->extPosition);
  2286			eloc->partitionReferenceNum =
  2287					iinfo->i_location.partitionReferenceNum;
  2288			*elen = le32_to_cpu(sad->extLength) & UDF_EXTENT_LENGTH_MASK;
  2289			break;
  2290		case ICBTAG_FLAG_AD_LONG:
  2291			lad = udf_get_filelongad(ptr, alen, &epos->offset, inc);
  2292			if (!lad)
  2293				return 0;
  2294			*etype = le32_to_cpu(lad->extLength) >> 30;
  2295			*eloc = lelb_to_cpu(lad->extLocation);
  2296			*elen = le32_to_cpu(lad->extLength) & UDF_EXTENT_LENGTH_MASK;
  2297			break;
  2298		default:
  2299			udf_debug("alloc_type = %u unsupported\n", iinfo->i_alloc_type);
  2300			return -EINVAL;
  2301		}
  2302	
> 2303		if (eloc->partitionReferenceNum >= sbi->s_partitions) {
  2304			udf_debug("invalid partition reference %u (partitions %u)\n",
  2305				  eloc->partitionReferenceNum, sbi->s_partitions);
  2306			return -EFSCORRUPTED;
  2307		}
  2308	
  2309		return 1;
  2310	}
  2311	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
