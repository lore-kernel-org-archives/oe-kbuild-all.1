Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56CF28B7EA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Aug 2026 16:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786377824; cv=none; b=j5VZc6xs87ay34GFzFTXpjfzReTaIOOJYJKplTaU5peMMqFrL59eCTCffNsrITbE5Q8iNCLv7HC041kfOG2La6nbpTsr5TQBqrZ6xl9XCAq8Isd97jrFMyduXEukQJW5AiQsAUgSEECF/fof9SUq+qFLs9wSLXe1PGDAwoASEUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786377824; c=relaxed/simple;
	bh=8WbCUogRFRI5Vg2IpcgfWdVxQyI6Ic3IJRLSEUxRJuE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HlooFgJnRaQq5SvAxOaTUy2/Pc5w3YqLTZh3gPam06OhwfXfokJwBcW/aBZufg7/sMHPG5M4scNGCvnreTsVD9WDE48jcW/dZXf/xDAKtwTZxUT9CDGIzjG7Aab7JqjAipuIg4h/P/BVNSCpwHV+AbFuu1FPYOy04erBe68lE1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L95XVKzd; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L95XVKzd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786377823; x=1817913823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8WbCUogRFRI5Vg2IpcgfWdVxQyI6Ic3IJRLSEUxRJuE=;
  b=L95XVKzdz9Hcu/eKOvZ4C8ahUpAkVZj0YTjz1IRM6Md6gTHYBfxcy9dR
   XOKSPhSd5lnIBhBvc5mj2TxHyuemVVG9bQ6zTFmu8bmPM0n34Zm5jhVkI
   Tl1Y9JdldtxRtq9QRjqAhgWHRcDa2fGsseLmnsecKBmrNg+8Viud+wnXb
   AF0z85alxfSlw/OMKknEkuWFikn79eRf74SvoAfDExPHKY7mDQ1624c/C
   2xDCGH2UhEg6KCmEt6ZAuTy8jOkdA04O7LrUxV3eQlOix2RKsXIXoIxM3
   4YQouUT1oeEN5afXNuQOqqFHl/N/2DokI1L9kVJJmZUEbWnNyMd1qu/CB
   A==;
X-CSE-ConnectionGUID: x6Zm2wKRRw+QS3uxZ6bCpA==
X-CSE-MsgGUID: /lqCcGfGSHK1C0rIaWyXtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="85864435"
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; 
   d="scan'208";a="85864435"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 09:03:42 -0700
X-CSE-ConnectionGUID: 9qQHxv5uQv2TbMhW1MvAjg==
X-CSE-MsgGUID: J40jWi0xTBCyVuY8O0gnyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; 
   d="scan'208";a="293002459"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Aug 2026 09:03:41 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtSTS-00000000NUE-2emo;
	Mon, 10 Aug 2026 16:03:38 +0000
Date: Tue, 11 Aug 2026 00:02:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Maxime =?utf-8?Q?B=C3=A9lair"?= <maxime.belair@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev,
 John Johansen <john.johansen@canonical.com>
Subject: [jj-apparmor:apparmor-next 3/14]
 security/apparmor/apparmorfs.c:519:undefined reference to
 `zstd_get_frame_header'
Message-ID: <202608102327.CqRygLiZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git apparmor-next
head:   1555a0e2a149cba4578f5270e7fb9efb420b985f
commit: 17b5758bf35c7a113363cd7a350b7e6a251b80f4 [3/14] apparmor: Initial support for compressed policies
config: x86_64-randconfig-004-20260810 (https://download.01.org/0day-ci/archive/20260810/202608102327.CqRygLiZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260810/202608102327.CqRygLiZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608102327.CqRygLiZ-lkp@intel.com/

Note: the jj-apparmor/apparmor-next HEAD 1555a0e2a149cba4578f5270e7fb9efb420b985f builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   ld: security/apparmor/apparmorfs.o: in function `aa_get_data_from_compressed':
>> security/apparmor/apparmorfs.c:519:(.text+0x2c21): undefined reference to `zstd_get_frame_header'
   ld: security/apparmor/apparmorfs.c:533:(.text+0x2cac): undefined reference to `decompress_zstd'


vim +519 security/apparmor/apparmorfs.c

   442	
   443	
   444	/*
   445	 * aa_fs - policy load/replace/remove
   446	 */
   447	
   448	/**
   449	 * aa_simple_write_to_buffer - common routine for getting policy from user
   450	 * @userbuf: user buffer to copy data from  (NOT NULL)
   451	 * @alloc_size: size of user buffer (REQUIRES: @alloc_size >= @copy_size)
   452	 * @copy_size: size of data to copy from user buffer
   453	 * @pos: position write is at in the file (NOT NULL)
   454	 *
   455	 * Returns: kernel buffer containing copy of user buffer data or an
   456	 *          ERR_PTR on failure.
   457	 */
   458	static struct aa_loaddata *aa_simple_write_to_buffer(const char __user *userbuf,
   459							     size_t alloc_size,
   460							     size_t copy_size,
   461							     loff_t *pos)
   462	{
   463		struct aa_loaddata *data;
   464	
   465		AA_BUG(copy_size > alloc_size);
   466	
   467		if (*pos != 0)
   468			/* only writes from pos 0, that is complete writes */
   469			return ERR_PTR(-ESPIPE);
   470	
   471		/* freed by caller to simple_write_to_buffer */
   472		data = aa_loaddata_alloc(alloc_size);
   473		if (IS_ERR(data))
   474			return data;
   475	
   476		data->size = copy_size;
   477		if (copy_from_user(data->data, userbuf, copy_size)) {
   478			/* trigger free - don't need to put pcount */
   479			aa_put_i_loaddata(data);
   480			return ERR_PTR(-EFAULT);
   481		}
   482	
   483		return data;
   484	}
   485	static int decompress_zstd(char *src, size_t slen, char *dst, size_t dlen);
   486	/**
   487	 * aa_get_data_from_compressed - common routine for getting compressed policy
   488	 * from user and get both compressed and uncompressed version.
   489	 * @userbuf: user buffer to copy data from  (NOT NULL)
   490	 * @buffer_size: size of user buffer
   491	 * @pos: position write is at in the file (NOT NULL)
   492	 * @compressed_data Ptr on compressed data. *compressed_data is allocated there
   493	 *
   494	 * Returns: kernel buffer containing copy of user buffer data or an
   495	 *          ERR_PTR on failure.
   496	 */
   497	
   498	static struct aa_loaddata *aa_get_data_from_compressed(const char __user *userbuf,
   499							  size_t buffer_size,
   500							  loff_t *pos,
   501							  char **compressed_data)
   502	{
   503		struct aa_loaddata *data;
   504		zstd_frame_header header;
   505		int error;
   506	
   507		if (!userbuf || !pos)
   508			return ERR_PTR(-EINVAL);
   509		if (*pos)
   510			return ERR_PTR(-ESPIPE);
   511	
   512		*compressed_data = kvmalloc(buffer_size, GFP_KERNEL);
   513		if (!*compressed_data)
   514			return ERR_PTR(-ENOMEM);
   515		error = copy_from_user(*compressed_data, userbuf, buffer_size);
   516		if (error)
   517			goto fail;
   518	
 > 519		error = zstd_get_frame_header(&header, *compressed_data, buffer_size);
   520		if (error || header.frameContentSize == ZSTD_CONTENTSIZE_UNKNOWN ||
   521		    header.frameContentSize == ZSTD_CONTENTSIZE_ERROR) {
   522			error = -EINVAL;
   523			goto fail;
   524		}
   525	
   526		data = aa_loaddata_alloc(header.frameContentSize);
   527		if (IS_ERR(data)) {
   528			error = PTR_ERR(data);
   529			goto fail;
   530		}
   531	
   532		// We then decompress the data
   533		error = decompress_zstd(*compressed_data, buffer_size, data->data,
   534					header.frameContentSize);
   535		if (error)
   536			goto fail_decompress;
   537	
   538		data->size = header.frameContentSize;
   539		return data;
   540	
   541	fail_decompress:
   542		aa_put_i_loaddata(data);
   543	fail:
   544		kvfree(*compressed_data);
   545		return ERR_PTR(error);
   546	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
