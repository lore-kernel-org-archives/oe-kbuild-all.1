Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A5C199BC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 05:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726290764; cv=none; b=VWluWJSsC+90kPLkYP/bk/odiHzLlHh+bcs9G6rCyeO698D8oOvW2jN7mOSdLPZ6i0h500ke7HHaRIcmThotS1J0afnJiAyBvS51HHwvn9dhdinSZGc0Z1GDVpu/zhihh5sOIM8JHADLbnFphMTA5ijDS180cSV79NHLmY+KPgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726290764; c=relaxed/simple;
	bh=wWAAlNH6jjTzCrhNYly76lMB+CBkBKi0aqydBWjmgSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FFCmwJ2FtfUXb2ynTwFXZDd6jJ9ZYU9fzkankuch6UrfaPfkfz5VKHLLQfIBHUGf+dytY/S1tlO8NIMGv4Bv7hNR5IfR+L4f4sGKaIczJkvmnMCW1TlWnOl6S9royVArcbFEiVH4ogZE9vXsqnIIMIhV8oLnJmeoEDN/zWMUWiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P4TThjdc; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P4TThjdc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726290763; x=1757826763;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wWAAlNH6jjTzCrhNYly76lMB+CBkBKi0aqydBWjmgSg=;
  b=P4TThjdcWbVsh74cdofpzZD6KoNj5dwMkOcdVZ4l4PtLAn7Vtvkavp9v
   jxYfbhjFM4C8rBI3wnjvmecjCKIL+LSdUXtEmirDYeUlMWMgS5nxx6UAV
   59epEwlMRYbCmIvyZlB0O7SfHyQsp32DiPqaRnnw708bwNZO3iDHawDRQ
   Dc3fOCPH3W+0Kh+Ut3/pdoK1E0ELH3wsRhY2sHa2reAwHGeBUdgRAgMzA
   N+S+g1FFYu4lbl0K3+VxErxkNH6CJ1nJe7r8VepjBvkSrtaHgkqWb2b9J
   +Vk2jx3DdVxwfeJ0ZLDoaezu29Z60i+pojerhEINtyCfmJj4/r156ST+5
   A==;
X-CSE-ConnectionGUID: DiE63Yr3SKiHNex26Nkh9Q==
X-CSE-MsgGUID: OU99O8MbSqONXgQtcle+Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="35783614"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="35783614"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 22:12:42 -0700
X-CSE-ConnectionGUID: IQjxA0m8Q9e5M9wFevWUxA==
X-CSE-MsgGUID: /XXeYh1FSrGs+rMyF3n5hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="68815645"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Sep 2024 22:12:41 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spL5K-0007Oo-2Q;
	Sat, 14 Sep 2024 05:12:38 +0000
Date: Sat, 14 Sep 2024 13:12:19 +0800
From: kernel test robot <lkp@intel.com>
To: Ojaswin Mujoo <ojaswin@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 5/5] ext4: Add extsize hint support
Message-ID: <202409141200.iYqpFPsP-lkp@intel.com>
References: <d906230bd4a1bc414926f6e9e38b75d41f2a6f47.1726034272.git.ojaswin@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d906230bd4a1bc414926f6e9e38b75d41f2a6f47.1726034272.git.ojaswin@linux.ibm.com>

Hi Ojaswin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tytso-ext4/dev]
[also build test WARNING on next-20240913]
[cannot apply to linus/master v6.11-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ojaswin-Mujoo/ext4-add-aligned-allocation-hint-in-mballoc/20240911-170427
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
patch link:    https://lore.kernel.org/r/d906230bd4a1bc414926f6e9e38b75d41f2a6f47.1726034272.git.ojaswin%40linux.ibm.com
patch subject: [RFC 5/5] ext4: Add extsize hint support
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240914/202409141200.iYqpFPsP-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141200.iYqpFPsP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141200.iYqpFPsP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ext4/inode.c: In function 'ext4_map_blocks':
>> fs/ext4/inode.c:711:22: warning: variable 'orig_mlen' set but not used [-Wunused-but-set-variable]
     711 |         unsigned int orig_mlen, extsize_mlen;
         |                      ^~~~~~~~~
--
>> fs/ext4/inode.c:607: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Extsize hint will change the mapped range and hence we'll end up mapping more.


vim +/orig_mlen +711 fs/ext4/inode.c

   605	
   606	/**
 > 607	 * Extsize hint will change the mapped range and hence we'll end up mapping more.
   608	 * To not confuse the caller, adjust the struct ext4_map_blocks to reflect the
   609	 * original mapping requested by them.
   610	 *
   611	 * @cur_map:		The block mapping we are working with (for sanity check)
   612	 * @orig_map:		The originally requested mapping
   613	 * @extsize_map:	The mapping after adjusting for extsize hint
   614	 * @flags		Get block flags (for sanity check)
   615	 *
   616	 * This function assumes that the orig_mlblk is contained within the mapping
   617	 * held in extsize_map. Caller must make sure this is true.
   618	 */
   619	static inline unsigned int ext4_extsize_adjust_map(struct ext4_map_blocks *cur_map,
   620						   struct ext4_map_blocks *orig_map,
   621						   struct ext4_map_blocks *extsize_map,
   622						   int flags)
   623	{
   624		__u64 map_end = (__u64)extsize_map->m_lblk + extsize_map->m_len;
   625	
   626		BUG_ON(cur_map != extsize_map || !(flags & EXT4_GET_BLOCKS_EXTSIZE));
   627	
   628		orig_map->m_len = min(orig_map->m_len, map_end - orig_map->m_lblk);
   629		orig_map->m_pblk =
   630			extsize_map->m_pblk + (orig_map->m_lblk - extsize_map->m_lblk);
   631		orig_map->m_flags = extsize_map->m_flags;
   632	
   633		return orig_map->m_len;
   634	}
   635	
   636	/**
   637	 * ext4_error_adjust_map - Adjust map returned upon error in ext4_map_blocks()
   638	 *
   639	 * @cur_map: current map we are working with
   640	 * @orig_map: original map that would be returned to the user.
   641	 *
   642	 * Most of the callers of ext4_map_blocks() ignore the map on error, however
   643	 * some use it for debug logging. In this case, they log state of the map just
   644	 * before the error, hence this function ensures that map returned to caller is
   645	 * the one we were working with when error happened. Mostly useful when extsize
   646	 * hints are enabled.
   647	 */
   648	static inline void ext4_error_adjust_map(struct ext4_map_blocks *cur_map,
   649						 struct ext4_map_blocks *orig_map)
   650	{
   651		if (cur_map != orig_map)
   652			memcpy(orig_map, cur_map, sizeof(*cur_map));
   653	}
   654	
   655	/*
   656	 * This functions resets the mapping to it's original state after it has been
   657	 * modified due to extent size hint and drops the extsize hint. To be used
   658	 * incase we want to fallback from extsize based aligned allocation to normal
   659	 * allocation
   660	 *
   661	 * @map:		The block mapping where lblk and len have been modified
   662	 *			because	of extsize hint
   663	 * @flags:		The get_block flags
   664	 * @orig_mlblk:		The originally requested logical block to map
   665	 * @orig_mlen:		The originally requested len to map
   666	 * @orig_flags:		The originally requested get_block flags
   667	 */
   668	static inline void ext4_extsize_reset_map(struct ext4_map_blocks *map,
   669						  int *flags, ext4_lblk_t orig_mlblk,
   670						  unsigned int orig_mlen,
   671						  int orig_flags)
   672	{
   673		/* Drop the extsize hint from original flags */
   674		*flags = orig_flags & ~EXT4_GET_BLOCKS_EXTSIZE;
   675		map->m_lblk = orig_mlblk;
   676		map->m_len = orig_mlen;
   677		map->m_flags = 0;
   678	}
   679	
   680	/*
   681	 * The ext4_map_blocks() function tries to look up the requested blocks,
   682	 * and returns if the blocks are already mapped.
   683	 *
   684	 * Otherwise it takes the write lock of the i_data_sem and allocate blocks
   685	 * and store the allocated blocks in the result buffer head and mark it
   686	 * mapped.
   687	 *
   688	 * If file type is extents based, it will call ext4_ext_map_blocks(),
   689	 * Otherwise, call with ext4_ind_map_blocks() to handle indirect mapping
   690	 * based files
   691	 *
   692	 * On success, it returns the number of blocks being mapped or allocated.
   693	 * If flags doesn't contain EXT4_GET_BLOCKS_CREATE the blocks are
   694	 * pre-allocated and unwritten, the resulting @map is marked as unwritten.
   695	 * If the flags contain EXT4_GET_BLOCKS_CREATE, it will mark @map as mapped.
   696	 *
   697	 * It returns 0 if plain look up failed (blocks have not been allocated), in
   698	 * that case, @map is returned as unmapped but we still do fill map->m_len to
   699	 * indicate the length of a hole starting at map->m_lblk.
   700	 *
   701	 * It returns the error in case of allocation failure.
   702	 */
   703	int ext4_map_blocks(handle_t *handle, struct inode *inode,
   704			    struct ext4_map_blocks *orig_map, int flags)
   705	{
   706		struct extent_status es;
   707		int retval;
   708		int ret = 0;
   709	
   710		ext4_lblk_t orig_mlblk, extsize_mlblk;
 > 711		unsigned int orig_mlen, extsize_mlen;
   712		int orig_flags;
   713	
   714		struct ext4_map_blocks *map = NULL;
   715		struct ext4_map_blocks extsize_map = {0};
   716	
   717		__u32 extsize = ext4_inode_get_extsize(EXT4_I(inode));
   718		bool should_extsize = false;
   719	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
