Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E56134434
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 19:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709233750; cv=none; b=S/yeiB/0hZ+jYAzSeeF+SNwwino75iMQ1RnSHBJo62glhT84mpkGlRUK1jlYyM0opJu/KumlXGN4dAg5heQaOe9shf587XWoC0YqUCXJnzznejb09pfZQJOP1aES80m01OKPTgMJRXFsAPBUus7E5oENH5hOTYV9K9tYSB650YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709233750; c=relaxed/simple;
	bh=92ro0Q5Q/mY9FX9S/bI02Osh2fHYgw3QF0VsgIa/YW0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Etre8rfs9+w3vDXgfFqPJuR5tdNVtx1lfe4H4INvCvj8K8f4Ra4621X7w7Ds9C40ZQIe5ncFmU4y7/FyoPNFDNZFrGNttI7Xeu9gEUXMbXMiuLtBkL+Q0pdu7SBf15dWvrLxOb5OAC7TV+upv1A9UM9GTfQrpQOZoGNVV2EB14E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TCcv4597; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TCcv4597"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709233749; x=1740769749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=92ro0Q5Q/mY9FX9S/bI02Osh2fHYgw3QF0VsgIa/YW0=;
  b=TCcv4597Qs3I1y5D7B7hGBPq2VnosvtT0oTC6nE6IlekOmDXb42xc7Mg
   uJxXbRTPkzxchWZS5LpjFFclERIkFGmipfjNLZMx4xMKudB0uEcYA5jgh
   ZbKgmwt5Sty1AxSwibV14RU+RgFjN+AK/Paa1zIh2yVZ9HRBcINqWognB
   PuSJ/1X+/G875/9LeVh4UC2/fNtYrP/sMaR2ddpfngM6vKkk3M8h93W8N
   JzWaxMRP6CHGS5f5NyBld6YVC/xS/4eFLSfVLD504p8duiTB1CI6lSUuH
   42CLB+LsjxzgADOZEXXaJyiLj4Wmrg+x6f5YrlfZGoq2M8cr3tVXZi4/2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="21190643"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="21190643"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 11:08:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="12608355"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 29 Feb 2024 11:08:52 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfllx-000DDl-27;
	Thu, 29 Feb 2024 19:08:49 +0000
Date: Fri, 1 Mar 2024 03:08:20 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>
Subject: [chao:feature/fs_param 1/1] fs/f2fs/super.c:191:1: warning: useless
 storage class specifier in empty declaration
Message-ID: <202403010309.aFEdK2Lb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/fs_param
head:   d4eac172f8f9f4594056366859b67e589e6124c3
commit: d4eac172f8f9f4594056366859b67e589e6124c3 [1/1] [WIP] f2fs: use new fs_context interface
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20240301/202403010309.aFEdK2Lb-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403010309.aFEdK2Lb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403010309.aFEdK2Lb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/super.c:191:1: warning: useless storage class specifier in empty declaration
     191 | };
         | ^
   fs/f2fs/super.c: In function 'f2fs_fill_super':
>> fs/f2fs/super.c:3973:33: warning: unused variable 'ctx' [-Wunused-variable]
    3973 |         struct f2fs_fs_context *ctx = fc->fs_private;
         |                                 ^~~
   fs/f2fs/super.c: In function 'f2fs_parse_param':
>> fs/f2fs/super.c:888:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
     888 |                 if (!f2fs_readonly(sbi->sb))
         |                    ^
   fs/f2fs/super.c:891:9: note: here
     891 |         case Opt_usrjquota:
         |         ^~~~
   fs/f2fs/super.c: At top level:
>> fs/f2fs/super.c:808:12: warning: 'f2fs_set_zstd_level' defined but not used [-Wunused-function]
     808 | static int f2fs_set_zstd_level(struct f2fs_sb_info *sbi, const char *str)
         |            ^~~~~~~~~~~~~~~~~~~
>> fs/f2fs/super.c:770:12: warning: 'f2fs_set_lz4hc_level' defined but not used [-Wunused-function]
     770 | static int f2fs_set_lz4hc_level(struct f2fs_sb_info *sbi, const char *str)
         |            ^~~~~~~~~~~~~~~~~~~~
>> fs/f2fs/super.c:709:13: warning: 'is_compress_extension_exist' defined but not used [-Wunused-function]
     709 | static bool is_compress_extension_exist(struct f2fs_sb_info *sbi,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +191 fs/f2fs/super.c

   186	
   187	static const struct mount_opts {
   188		int	token;
   189		int	opt;
   190		int	flags;
 > 191	};
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
