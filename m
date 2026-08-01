Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4093B345ED3
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Aug 2026 22:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785624663; cv=none; b=WoMQoY2ArMJHHNJ+DvLlf3CZTHt2rdOna1XvAsYhmNUzRUPyEbgRgOLAjU5sbIAOm0Hhn7sUMxWGuBkx8AMrPOdQjZIhj/3Z6PfYbYi0Na1ld4KY6eiKoWf5+mqes1OOzRqiJzwNYO4wECnpTQO9L2v+uD7NujWFLS0Ecx1Ul5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785624663; c=relaxed/simple;
	bh=tLW5rV4d4taOg/+CVQp4P1jERnQF89Kk0ZxZd7bD6r4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RVVh2t4kKjJEVaipHvpWjKS/TBA6oCZYXcS5bASDDfMEq7CbyvUmNNl4X29ajwRpJMA/ybcKWWoAEJGAarvyWm07icTBsXc+RPB2RI0wo6PnXjCTxu/wxrkNgCLGM2xnVzYo5j/Tugtt4lPMxBafaE55FsNFFhK9CJ2V4Mox5zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hqh/4+Bl; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hqh/4+Bl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785624662; x=1817160662;
  h=date:from:to:cc:subject:message-id;
  bh=tLW5rV4d4taOg/+CVQp4P1jERnQF89Kk0ZxZd7bD6r4=;
  b=hqh/4+BlKBMyQk2ajl63gju5ArJorvXlCeGiXxWA87ThPLdTrTCgEzLO
   hBUc+Vzxtotr2ZtufrsOid5J9Ed8R8wi3jAyxt3aY7VpT7T34gEUQbrYE
   TsuVGiXdQ1lDmCpp3kU2xjLdSgLuUzNlI3qoIVSUI4QbkIxhOkDn6SKgq
   MGrufg2RFK1+sp6BJo0w4778r78aYgcophUXIam9g92bnAVmHQEBPS5Me
   y2T32V4kXUOB8EjSCLKvi8jKUgXbKCMx+Gl1XoDwZ+eisgj3toChQs+8H
   FwSht6jzhFQY7rBpzze8+aDU9gVlbgcmGAshKXSXXAQzSBSqdtABjTJcY
   w==;
X-CSE-ConnectionGUID: GWp2Zw3UTUywU8zEjp3M4A==
X-CSE-MsgGUID: sxGbTBbiReGA+9+/hIzD9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11862"; a="86162822"
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="86162822"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 15:51:01 -0700
X-CSE-ConnectionGUID: JIkKYd/XTvyBv3yi1O9sig==
X-CSE-MsgGUID: shJbBwEWS1qyx62sqraPHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="265143620"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Aug 2026 15:51:00 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqIXh-000000003zx-0HR1;
	Sat, 01 Aug 2026 22:50:57 +0000
Date: Sun, 02 Aug 2026 06:50:54 +0800
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jj-apparmor:apparmor-next 10/10]
 security/apparmor/apparmorfs.c:586:12: warning: 'decompress_zstd' defined but
 not used
Message-ID: <202608020618.2lGgpHxJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git apparmor-next
head:   b0c2e98d291b9db03dcbaddd38d3a33428b098a8
commit: b0c2e98d291b9db03dcbaddd38d3a33428b098a8 [10/10] apparmor: fix implicit declaration of function 'decompress_zstd'
config: xtensa-randconfig-002-20260802 (https://download.01.org/0day-ci/archive/20260802/202608020618.2lGgpHxJ-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260802/202608020618.2lGgpHxJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608020618.2lGgpHxJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/apparmor/apparmorfs.c:586:12: warning: 'decompress_zstd' defined but not used [-Wunused-function]
     586 | static int decompress_zstd(char *src __always_unused,
         |            ^~~~~~~~~~~~~~~


vim +/decompress_zstd +586 security/apparmor/apparmorfs.c

   522	
   523	/**
   524	 * aa_get_data_from_compressed - common routine for getting compressed policy
   525	 * from user and get both compressed and uncompressed version.
   526	 * @userbuf: user buffer to copy data from  (NOT NULL)
   527	 * @buffer_size: size of user buffer
   528	 * @pos: position write is at in the file (NOT NULL)
   529	 * @compressed_data: Ptr on compressed data. *compressed_data is allocated there
   530	 *
   531	 * Returns: kernel buffer containing copy of user buffer data or an
   532	 *          ERR_PTR on failure.
   533	 */
   534	
   535	static struct aa_loaddata *aa_get_data_from_compressed(const char __user *userbuf,
   536							  size_t buffer_size,
   537							  loff_t *pos,
   538							  char **compressed_data)
   539	{
   540		struct aa_loaddata *data;
   541		zstd_frame_header header;
   542		int error;
   543	
   544		if (!userbuf || !pos)
   545			return ERR_PTR(-EINVAL);
   546		if (*pos)
   547			return ERR_PTR(-ESPIPE);
   548	
   549		*compressed_data = kvmalloc(buffer_size, GFP_KERNEL);
   550		if (!*compressed_data)
   551			return ERR_PTR(-ENOMEM);
   552		error = copy_from_user(*compressed_data, userbuf, buffer_size);
   553		if (error)
   554			goto fail;
   555	
   556		error = zstd_get_frame_header(&header, *compressed_data, buffer_size);
   557		if (error || header.frameContentSize == ZSTD_CONTENTSIZE_UNKNOWN ||
   558		    header.frameContentSize == ZSTD_CONTENTSIZE_ERROR) {
   559			error = -EINVAL;
   560			goto fail;
   561		}
   562	
   563		data = aa_loaddata_alloc(header.frameContentSize);
   564		if (IS_ERR(data)) {
   565			error = PTR_ERR(data);
   566			goto fail;
   567		}
   568	
   569		// We then decompress the data
   570		error = decompress_zstd(*compressed_data, buffer_size, data->data,
   571					header.frameContentSize);
   572		if (error)
   573			goto fail_decompress;
   574	
   575		data->size = header.frameContentSize;
   576		return data;
   577	
   578	fail_decompress:
   579		aa_put_i_loaddata(data);
   580	fail:
   581		kvfree(*compressed_data);
   582		return ERR_PTR(error);
   583	
   584	}
   585	#else
 > 586	static int decompress_zstd(char *src __always_unused,
   587				   size_t slen __always_unused,
   588				   char *dst __always_unused,
   589				   size_t dlen __always_unused)
   590	{
   591		return -EINVAL;
   592	}
   593	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
