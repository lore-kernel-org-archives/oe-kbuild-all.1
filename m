Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFB63C1083
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 08:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786523414; cv=none; b=ZpYqRNWqF4Kqfm3riDhde+Agj7cS1TSEaQ3syCO18+lvXg4eYEhbzpnqpfIOlKJpDrXZvOPcU+Jc+esGB4VCYMNUs+7M/jJUttqDaVc5ZPFkg/LlbC3LnAc733L1RGWPNwO63TsaBhSqm2tge90oeP/h9TxeNVYInDdHkCOD3Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786523414; c=relaxed/simple;
	bh=XUNL6TDNG84AxuJ3HxG+2jldv7AG+JQ934hUNs6Q/YM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NjPQqjUET9+pEqMAEp1V9yNeEkuV5ZtZNVd+ng6RpPzLtbOqJpvzzV/WRdZzuwMXcLClvmRKqIbpuULCgqEFB85Gs/1TXvFsFE8AwTsbE1wFR/WKsd28Tr4W0nj0OgXUS+A74viH0GaBYmfJEuB5wst6dERj/Fh4CI8aWNRMmIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c136LNF0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c136LNF0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786523413; x=1818059413;
  h=date:from:to:cc:subject:message-id;
  bh=XUNL6TDNG84AxuJ3HxG+2jldv7AG+JQ934hUNs6Q/YM=;
  b=c136LNF0bGqjE47pWWpP5LHG5i4O2QaWjKjSEHJI5OYZwYuA47b7MB2S
   RfD2jTQOhrXVYig0xqseW4t+aPkFmHNW+54TxuTYlKaVnHpR+lkxjT41u
   G21AAzQ7ca1v4LEX+bAaFNZke9aYlkPq9uP3tj8RH1J/iEG5gSE/MbyZP
   6q80XijkqpPl6PBIVODWOmvSCsBP3UYQraPNPQLfydbsTJACqZbVmLwBU
   YMFy/fO2zH5kb9gK88QI2UmM6XqtH8xsbkJbKaCerdOoyd89ryufFCE4n
   xDOA1rd4YJbkUgcbz1vqbJC2mzHNqoVZ/t7q7iU1ub4tV66quKCON4SES
   w==;
X-CSE-ConnectionGUID: 2coh9CSHSXKKBRU47R+IyA==
X-CSE-MsgGUID: satlhoGFSR+cQTKhWarZXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="98582550"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="98582550"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 01:30:13 -0700
X-CSE-ConnectionGUID: PTRezFpaRoKM4Rzv38FZeg==
X-CSE-MsgGUID: u3qQtrTgTNSZOE3/hHSpOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="267072048"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Aug 2026 01:30:12 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wu4Lh-00000000Q75-0977;
	Wed, 12 Aug 2026 08:30:09 +0000
Date: Wed, 12 Aug 2026 16:29:53 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>
Subject: fs/bpf_fs_kfuncs.c:377:26: sparse: sparse: symbol
 'bpf_real_data_inode' was not declared. Should it be static?
Message-ID: <202608121600.AhWHKX74-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d58772d8520c7ef247c4b95c9bd76d3a25da9ff5
commit: 3f8c65b06fafc3f779abda5f7b81707411d05d4c bpf: have bpf_real_data_inode() take a struct file
date:   6 weeks ago
config: mips-randconfig-r134-20260812 (https://download.01.org/0day-ci/archive/20260812/202608121600.AhWHKX74-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 12df34b8469b8095359de8c249cb1b2753fadeea)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260812/202608121600.AhWHKX74-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3f8c65b06faf ("bpf: have bpf_real_data_inode() take a struct file")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608121600.AhWHKX74-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/bpf_fs_kfuncs.c:377:26: sparse: sparse: symbol 'bpf_real_data_inode' was not declared. Should it be static?

vim +/bpf_real_data_inode +377 fs/bpf_fs_kfuncs.c

   361	
   362	/**
   363	 * bpf_real_data_inode - get the real inode hosting a file's data
   364	 * @file: file to resolve
   365	 *
   366	 * Resolve @file to the inode that hosts its data. For a regular file on a
   367	 * union/overlay filesystem this is the underlying (upper or lower) inode that
   368	 * stores the data, not the overlay inode.
   369	 *
   370	 * Data resolution only applies to regular files. For a non-regular file (e.g.
   371	 * a device node, fifo or socket) on a union/overlay filesystem the overlay
   372	 * inode itself is returned; for any file on a non-union filesystem the inode
   373	 * attached to @file is returned.
   374	 *
   375	 * Return: The inode hosting @file's data, or NULL.
   376	 */
 > 377	__bpf_kfunc struct inode *bpf_real_data_inode(struct file *file)
   378	{
   379		return d_real_inode(file_dentry(file));
   380	}
   381	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
