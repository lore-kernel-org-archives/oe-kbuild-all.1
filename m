Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE5C74BEC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 22:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709245000; cv=none; b=RV560fSK8Z37vpZaOYL+CI2R6qd60xYJIN5SN8aVPTUjFht+QQiKAKEdTdjRcwU3zNjT+YWfdR0HZNZdD8U9oJt+Yw3D4dU1GiOHPmVe5GQFtSXsrbU6jwjN/dgiyQ62U0nBULsB2msjNpH9DxOBCdGajF+DdAkqKRr38e0bQ8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709245000; c=relaxed/simple;
	bh=jiqt00X7oUC9r5jBAuWrgy+G+qWfqloukYVILMOed3I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GzxFxi0ysmkBKTsWAqMCFJyiDkBWPlPPOef6qNUgmo7QjvoQPLAJQBTVix6PkidADB0EK6mLIhrPsSnXIfo4ZqUYnYi4DOfDu6KnpOv2QFZLGRsOIi5jXfeyY6F8E5Wz2M6DUZ3Rd0+ia2O0EeYDKwKwv/+elUl1gRGf8i+f59c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I0rRNRAe; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I0rRNRAe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709244999; x=1740780999;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jiqt00X7oUC9r5jBAuWrgy+G+qWfqloukYVILMOed3I=;
  b=I0rRNRAe5LPHF77KMkfQM7U1Pt55JIEAKgLWtUWFwQesIRBy4/MOl/zZ
   gX6J1OlscmP3u9mhKHa+A/oWMKCv8YNGVWdLKGBpZFm3ZJOZl9ePq5jZR
   CVfoOACTrHFUXR+rSxy4K6pLwWwNErqguFY6R4kx+YOho3KgaJwGNLeTM
   my3duOC2RGW+80R69C0ruuNAzccm4SViANR2hhlT8CJSNSuzgudRCQhzw
   zPIpgcPuyi8PU0bcKKfZ5W2Yvbrc0AQ4qtvzY5xkXJHpjtDM9EYs0L4jx
   y1zXNRVLVRIVREmLm2gV7CtFxOmRb3HX6J7AnPooEVn1LwaMlc6gqUPLt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3610871"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3610871"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 14:16:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="45526053"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 29 Feb 2024 14:16:34 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfohc-000DJw-0R;
	Thu, 29 Feb 2024 22:16:32 +0000
Date: Fri, 1 Mar 2024 06:15:59 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>
Subject: [chao:feature/fs_param 1/1] fs/f2fs/super.c:4519:26: error: 'struct
 f2fs_fs_context' has no member named 's_qf_names'
Message-ID: <202403010628.MPk3eKKB-lkp@intel.com>
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
config: nios2-randconfig-001-20240301 (https://download.01.org/0day-ci/archive/20240301/202403010628.MPk3eKKB-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403010628.MPk3eKKB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403010628.MPk3eKKB-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/f2fs/super.c:191:1: warning: useless storage class specifier in empty declaration
     191 | };
         | ^
   fs/f2fs/super.c: In function 'f2fs_fill_super':
   fs/f2fs/super.c:3973:33: warning: unused variable 'ctx' [-Wunused-variable]
    3973 |         struct f2fs_fs_context *ctx = fc->fs_private;
         |                                 ^~~
   fs/f2fs/super.c: In function 'f2fs_fc_free':
>> fs/f2fs/super.c:4519:26: error: 'struct f2fs_fs_context' has no member named 's_qf_names'
    4519 |                 kfree(ctx->s_qf_names[i]);
         |                          ^~
   fs/f2fs/super.c: In function 'f2fs_parse_param':
   fs/f2fs/super.c:888:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
     888 |                 if (!f2fs_readonly(sbi->sb))
         |                    ^
   fs/f2fs/super.c:910:9: note: here
     910 |         case Opt_inlinecrypt:
         |         ^~~~


vim +4519 fs/f2fs/super.c

  4509	
  4510	static void f2fs_fc_free(struct fs_context *fc)
  4511	{
  4512		struct f2fs_fs_context *ctx = fc->fs_private;
  4513		int i;
  4514	
  4515		if (!ctx)
  4516			return;
  4517	
  4518		for (i = 0; i < MAXQUOTAS; i++)
> 4519			kfree(ctx->s_qf_names[i]);
  4520	
  4521		fscrypt_free_dummy_policy(&ctx->dummy_enc_policy);
  4522		kfree(ctx);
  4523	}
  4524	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
