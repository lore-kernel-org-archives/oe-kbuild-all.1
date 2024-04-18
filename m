Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADE954907
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Apr 2024 23:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713482173; cv=none; b=Lyfhn9t5drtkSQrEk7E8xiOrNFDMcbt33kFmxizsR1/DbARalsT1BStOUlRL3rzYWg9mxOrK+OOUqghz5Ftw8fxhHBpiJraJvEIDePq3iRFlXV3o2L/Qw+Z6ddNUWVI4iAbohgWf/3kLj2FnDeIRZSCJ3sxX7UT2rxWUUz7hRKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713482173; c=relaxed/simple;
	bh=1rWLYHV0zUj/Fx711/ObTap/j9pb0AG4KCzZQI6/zPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bH5O9po6YomZTzyK3rGJSReadFBMwOpztjzyIZ4pfcJWhZm5I7RrWt132gUREzsMnnePEFQE6S9EfvVBnaat3HmCVDIQoCv1GTKqVZJbRlS/Ylyxt9LITFcqy3Ev7psI7efCLEfHdxB+QvSigvrQxuQqEf512WhhJi43RXpnwW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GPWCC7+V; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GPWCC7+V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713482172; x=1745018172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1rWLYHV0zUj/Fx711/ObTap/j9pb0AG4KCzZQI6/zPk=;
  b=GPWCC7+VuHqlaJ/d3UQGwwUs8OsR27mrfzOEg+wrRa2fTSoF+vYJj/gE
   jYKqzZfCcaAHpbak24Kv2Mo1WdaKDyJFb8o8UCCVi/nrJmDDRK7zpOwub
   WjuTHV1B+XRv6isICQYGqzpaoF3dif71I5NcX4Xk/51O/aYOvJicY5Yrn
   5ncOjQ2rqfJpqhYtK2EjJ9gqNWNN9yk2rHQ1gXMIH9hA2We9qxZWyDx9D
   Nd4erbNsKB63XuJyKRFNQlWOitANx9gezCr0bEXKGbx9Bhr4JrkxcguRC
   JUnorlKUx9ljiMd+9ubXVB48HcEjfFtH1HhqFjJ7p7gf2fIcyHGFV0Bxu
   A==;
X-CSE-ConnectionGUID: bIDKLqEaScWzQpF7bP2r1w==
X-CSE-MsgGUID: 6/Tuhi0PQi2y0M2imbPwDQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12845137"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="12845137"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 16:16:10 -0700
X-CSE-ConnectionGUID: k7csaCpDRU+9UVNwSU5dVw==
X-CSE-MsgGUID: Q94hqoxHTDmpDeiccLRQ2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="27601095"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 18 Apr 2024 16:16:09 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxaz8-0009Kk-1j;
	Thu, 18 Apr 2024 23:16:06 +0000
Date: Fri, 19 Apr 2024 07:15:32 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Baokun Li <libaokun1@huawei.com>
Subject: [linux-next:master 5767/6937] fs/erofs/super.c:775:2-7: WARNING:
 NULL check before some freeing functions is not needed.
Message-ID: <202404190747.REAcTK1e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7b4f2bc91c15fdcf948bb2d9741a9d7d54303f8d
commit: e4f586a41748b6edc05aca36d49b7b39e55def81 [5767/6937] erofs: reliably distinguish block based and fscache mode
config: i386-randconfig-052-20240419 (https://download.01.org/0day-ci/archive/20240419/202404190747.REAcTK1e-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404190747.REAcTK1e-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/erofs/super.c:775:2-7: WARNING: NULL check before some freeing functions is not needed.

vim +775 fs/erofs/super.c

   763	
   764	static void erofs_fc_free(struct fs_context *fc)
   765	{
   766		struct erofs_fs_context *ctx = fc->fs_private;
   767		struct erofs_sb_info *sbi = fc->s_fs_info;
   768	
   769		erofs_free_dev_context(ctx->devs);
   770		kfree(ctx->fsid);
   771		kfree(ctx->domain_id);
   772		kfree(ctx);
   773	
   774		if (sbi)
 > 775			kfree(sbi);
   776	}
   777	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
