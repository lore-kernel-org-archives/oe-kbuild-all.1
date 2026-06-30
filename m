Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5FE36BCFB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 15:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782833994; cv=none; b=BBt+xy/C9ZVP8LaCD0bqZkIvnU/EbJ21qGPrknUicIn5empoDPISAKr4m0POC36a67ad7TMXzP+TdhlRJ/51DMX17QSbpiEnA/13RhN0jENsgr+9oxGy5isOnIAKmiaYRYjLqkzfhZSKK5YLHfTHTmqLU+L3WV1nXhTd8MkCJo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782833994; c=relaxed/simple;
	bh=MoBBrPSFeMkyM44bLojdBbT68YC6pAYSeMYfZv94U9A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tXLPbIXxAY+XoiseEC0dx2cAMw3tJGMcSvHzNvmzEWWGSzKItfF97+vbClj9gWKvuyRmaxsDpuu0VC3ftuISY1L5bBfuLD9FHSGzcwDLANmH2ZTdHiSYU6zduR8wZ83OR8uS0A3BfFR21KYoEzfqtykQbySEMMm1N371tEVzbDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A6k5ROlO; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A6k5ROlO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782833992; x=1814369992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MoBBrPSFeMkyM44bLojdBbT68YC6pAYSeMYfZv94U9A=;
  b=A6k5ROlOEqceLbh9P0GMjRJGoNIOTF9jwzd19v2ZU0nclMI4a7PO0s2o
   dXk+VuOJvQW5LLutSjKXftwOAvTskMhxo62xOeWtR/U7IWvAGKxpUjVWj
   KRPQYWgz7pUfB63Xd+48E3tK72tuS4ygNslHcQD/qZ3Gr2ooB61lNNWfW
   uH+sx7LRj6Rh1Hsj2Z+hHhap+q/dkvhq0sGLqfCTWoT4f27eWTUE1DfwB
   DflfE+B0h0QyZ51zaL8Ly26DLBUpRdj7/1qdh72wMiIhyFbn/+LNWwXet
   WUeOTcjt6V38uEUU3Khen/FRak8ypUfymTZUQorymn8C9o2+B1nOznD7p
   w==;
X-CSE-ConnectionGUID: s6qoG1ENRsy721USCu0nFg==
X-CSE-MsgGUID: n8V8sr4VQ36Huze9/mhjSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="82540576"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="82540576"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 08:39:51 -0700
X-CSE-ConnectionGUID: 4IL41NE1Sb+HaizbgujeBA==
X-CSE-MsgGUID: e01F2DhcROSE/AzvRLsGxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="248310404"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 30 Jun 2026 08:39:50 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weaYt-000000008SE-1gj0;
	Tue, 30 Jun 2026 15:39:47 +0000
Date: Tue, 30 Jun 2026 23:39:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Maxime =?utf-8?Q?B=C3=A9lair"?= <maxime.belair@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev,
 John Johansen <john.johansen@canonical.com>
Subject: [jj-apparmor:apparmor-next 3/4]
 security/apparmor/apparmorfs.c:533:undefined reference to `decompress_zstd'
Message-ID: <202606302325.2wJOujQi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git apparmor-next
head:   dda61023f976d7ab3bc7c8b46d26d6d23424f890
commit: 17b5758bf35c7a113363cd7a350b7e6a251b80f4 [3/4] apparmor: Initial support for compressed policies
config: x86_64-randconfig-103-20260630 (https://download.01.org/0day-ci/archive/20260630/202606302325.2wJOujQi-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606302325.2wJOujQi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606302325.2wJOujQi-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: security/apparmor/apparmorfs.o: in function `aa_get_data_from_compressed':
>> security/apparmor/apparmorfs.c:533:(.text+0x3d9c): undefined reference to `decompress_zstd'


vim +533 security/apparmor/apparmorfs.c

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
   519		error = zstd_get_frame_header(&header, *compressed_data, buffer_size);
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
 > 533		error = decompress_zstd(*compressed_data, buffer_size, data->data,
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
