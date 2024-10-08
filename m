Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE96918C910
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Oct 2024 23:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728431241; cv=none; b=Qe/xnwh+bYlvH5kmrPUwUT/4HWsCYFReprFX5ABmMKWzRXKdJ9Flx38lZNGjZ4JTAT1jBJ6qPjgLPIpEaq2YJd4xXEdorgxBp/THMByYsilFsNg2rM988YqD4hiNQV4Ec50JpQDfFgB/7OjbgiW57DVvKZwMiDYCj45TGU3Pn5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728431241; c=relaxed/simple;
	bh=uoyoRmSeIpRyBvg71l+dImLqx4Z6EJEfKkDAZyLH+IA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NwOFp6XnnDgN24j9pDz2amsI8Hwn4/o8iiEf9CYveggJaUAwQumjVT5EfseXxeGcnRoE/p3Mhllw7SWQI8Oi0PQHIo2fRMNIAoLELqzKgZWAzquKtjK4w0U6OE8k7OBv0lBLyUZLA9rtcdaYVCru2Iqqt/y99DPDF3ZjIUFlhqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lUS6HIdZ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lUS6HIdZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728431240; x=1759967240;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uoyoRmSeIpRyBvg71l+dImLqx4Z6EJEfKkDAZyLH+IA=;
  b=lUS6HIdZwO7im1PMeDIqOExndjnQAUar3JnH4aaYpYImwQR4d17xnN4a
   tlk64vk4Rns3jK2C9Y0c9B6PjD+WDmJJYH5DScAmq5Rr6Bg2Vj9T2z3tL
   qyUEwCyUL4uiiMfv2j7UBiDBLAJI0OUaUR8s/48PvqbHxyFaanTlO/OEf
   qJPfgqjBq27+8gY1A5Q8r5Fuf/Hbgfe/i28U7Qg7ZpnxpI8skHbJYM6xI
   O7Yoqm5U3kaD/iggD5qG9/i2Mas/S4RmgJlm+fRLQJ0SveLyzlBgvYBRc
   HXKgzg7OEBZQ9lHKXAPY0aDcXpKYRL2B1LIfQyAwMcKgWE1N6RJ0xiK80
   Q==;
X-CSE-ConnectionGUID: W664M811SSeE8HArq8w9vA==
X-CSE-MsgGUID: XvRgfDZgT4qRsiDsGI6w4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="31472208"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; 
   d="scan'208";a="31472208"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 16:47:18 -0700
X-CSE-ConnectionGUID: layQw/CGQ9WM6paYfzH0+w==
X-CSE-MsgGUID: D2AKmKHSQ/yL8oGMfUXpog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; 
   d="scan'208";a="106870962"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Oct 2024 16:47:16 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syJv7-0008VE-37;
	Tue, 08 Oct 2024 23:47:13 +0000
Date: Wed, 9 Oct 2024 07:46:20 +0800
From: kernel test robot <lkp@intel.com>
To: Filipe Manana <fdmanana@suse.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Sterba <dsterba@suse.com>, Qu Wenruo <wqu@suse.com>
Subject: [linux-next:master 2662/2853] fs/btrfs/qgroup.c:2014:13: error:
 'bytenr' undeclared
Message-ID: <202410090702.KpvUQde2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   33ce24234fca4c083e6685a18b460a18ebb5d5c1
commit: 5c0ea18d992fffc948e087c0002560d747e6edd9 [2662/2853] btrfs: use sector numbers as keys for the dirty extents xarray
config: powerpc-randconfig-r071-20241009 (https://download.01.org/0day-ci/archive/20241009/202410090702.KpvUQde2-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410090702.KpvUQde2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410090702.KpvUQde2-lkp@intel.com/

Note: the linux-next/master HEAD 33ce24234fca4c083e6685a18b460a18ebb5d5c1 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   fs/btrfs/qgroup.c: In function 'btrfs_qgroup_trace_extent_nolock':
>> fs/btrfs/qgroup.c:2014:13: error: 'bytenr' undeclared (first use in this function)
    2014 |         if (bytenr >= MAX_LFS_FILESIZE) {
         |             ^~~~~~
   fs/btrfs/qgroup.c:2014:13: note: each undeclared identifier is reported only once for each function it appears in


vim +/bytenr +2014 fs/btrfs/qgroup.c

  1991	
  1992	/*
  1993	 * Inform qgroup to trace one dirty extent, its info is recorded in @record.
  1994	 * So qgroup can account it at transaction committing time.
  1995	 *
  1996	 * No lock version, caller must acquire delayed ref lock and allocated memory,
  1997	 * then call btrfs_qgroup_trace_extent_post() after exiting lock context.
  1998	 *
  1999	 * Return 0 for success insert
  2000	 * Return >0 for existing record, caller can free @record safely.
  2001	 * Return <0 for insertion failure, caller can free @record safely.
  2002	 */
  2003	int btrfs_qgroup_trace_extent_nolock(struct btrfs_fs_info *fs_info,
  2004					struct btrfs_delayed_ref_root *delayed_refs,
  2005					struct btrfs_qgroup_extent_record *record)
  2006	{
  2007		struct btrfs_qgroup_extent_record *existing, *ret;
  2008		const unsigned long index = (record->bytenr >> fs_info->sectorsize_bits);
  2009	
  2010		if (!btrfs_qgroup_full_accounting(fs_info))
  2011			return 1;
  2012	
  2013	#if BITS_PER_LONG == 32
> 2014		if (bytenr >= MAX_LFS_FILESIZE) {
  2015			btrfs_err_rl(fs_info,
  2016	"qgroup record for extent at %llu is beyond 32bit page cache and xarray index limit",
  2017				     bytenr);
  2018			btrfs_err_32bit_limit(fs_info);
  2019			return -EOVERFLOW;
  2020		}
  2021	#endif
  2022	
  2023		lockdep_assert_held(&delayed_refs->lock);
  2024		trace_btrfs_qgroup_trace_extent(fs_info, record);
  2025	
  2026		xa_lock(&delayed_refs->dirty_extents);
  2027		existing = xa_load(&delayed_refs->dirty_extents, index);
  2028		if (existing) {
  2029			if (record->data_rsv && !existing->data_rsv) {
  2030				existing->data_rsv = record->data_rsv;
  2031				existing->data_rsv_refroot = record->data_rsv_refroot;
  2032			}
  2033			xa_unlock(&delayed_refs->dirty_extents);
  2034			return 1;
  2035		}
  2036	
  2037		ret = __xa_store(&delayed_refs->dirty_extents, index, record, GFP_ATOMIC);
  2038		xa_unlock(&delayed_refs->dirty_extents);
  2039		if (xa_is_err(ret)) {
  2040			qgroup_mark_inconsistent(fs_info);
  2041			return xa_err(ret);
  2042		}
  2043	
  2044		return 0;
  2045	}
  2046	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
