Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AF820127A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 06:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730185148; cv=none; b=PLYvMqGWC7GU8YipVywjDuyO87jkQ4OuS3DDOSwy6VNYknTG1pAkV4hIx6LRj8aQodY6ZFb7ZoDRJsArOJK7yHMFIiUVmE5SVCwdj1HLtvkup5o5Ctmh0wfrvjPasRKN7/cgiHCiWf/tDAd105fGsZs9b+/dpTpdxz/zmGrPde8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730185148; c=relaxed/simple;
	bh=7+ojUeBl5KNqkiN1PPd9SHjzKNffR7fFYtJbqDwg1bU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SneAJ/7F1Zf4Xt57du5tPH52Yu8QUkP5jjT9Ez0lEZUWTySa8js4NbtIRjuvRGmkDd1Ky15Td7fSlkbKmQxnYG4zO4aY2QOUsymNElz7KtlGaJuD5+8N0fxsgt/jBL78nTLBKCsouYGOVJbyvcPPYytl2BsOpfuUscg0viIhinQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YLUsIbJS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YLUsIbJS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730185146; x=1761721146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7+ojUeBl5KNqkiN1PPd9SHjzKNffR7fFYtJbqDwg1bU=;
  b=YLUsIbJSj3ffVpYlmEVmM5inZb1p0ou1b7YpngRNL7iNKEOUtUYDt601
   n4oDffZLFt9jO7g1qKzli7Fzt+wPisWGOPsmOzjm0PtWpaXK7Ly81OdAX
   QiO9eWpe6EgfsB1x2eO8A3S6WZPLQyV7VVrBF2BWcJs5OQ8Va+NkZqexc
   BRGuE8c8EhQG33B/ocL1DkzoKJ9qkgbAKLTp7DkB+pIAddrCwUzBtN9ar
   QAHFrDP4un0fuajZR8Coqsr/uNFX3OcdJ55MyVkg1eNDLH0qTqYTME9z3
   wbSMng7229TaFJBSfZT0LEMf0gbVpQHsV44E7zjhRdaYVGXMj9LG8UZrK
   A==;
X-CSE-ConnectionGUID: treASJwwT72CLYJ7RrnCSg==
X-CSE-MsgGUID: 5WjHDVoQQSyW+16vczKC5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="40426369"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="40426369"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 23:59:03 -0700
X-CSE-ConnectionGUID: qNvCpxvDROixTa3KgzdeFA==
X-CSE-MsgGUID: NMngHv6HTmG0Ix6mkwOA+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="82283294"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Oct 2024 23:58:46 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5gBf-000dM0-1H;
	Tue, 29 Oct 2024 06:58:43 +0000
Date: Tue, 29 Oct 2024 14:58:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 18634/30000]
 drivers/ub/urma/ubcore/ubcore_umem.c:227:21: warning: no previous prototype
 for 'ubcore_umem_get'
Message-ID: <202410291451.4EuMUHij-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yizhen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   c0e2b3247172ef46c6a75823867d668ad1c84e0c
commit: f6206cf05e28a7f455850a4e2de8162890f50073 [18634/30000] ub: add memory map api in ubcore
config: arm64-randconfig-003-20241029 (https://download.01.org/0day-ci/archive/20241029/202410291451.4EuMUHij-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410291451.4EuMUHij-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410291451.4EuMUHij-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/urma/ubcore/ubcore_umem.c:227:21: warning: no previous prototype for 'ubcore_umem_get' [-Wmissing-prototypes]
     227 | struct ubcore_umem *ubcore_umem_get(struct ubcore_device *dev, uint64_t va, uint64_t len,
         |                     ^~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_umem.c:245:6: warning: no previous prototype for 'ubcore_umem_release' [-Wmissing-prototypes]
     245 | void ubcore_umem_release(struct ubcore_umem *umem)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/ubcore_umem_get +227 drivers/ub/urma/ubcore/ubcore_umem.c

   226	
 > 227	struct ubcore_umem *ubcore_umem_get(struct ubcore_device *dev, uint64_t va, uint64_t len,
   228					    union ubcore_umem_flag flag)
   229	{
   230		struct page **page_list;
   231		int ret;
   232	
   233		ret = umem_verify_input(dev, va, len, flag);
   234		if (ret < 0)
   235			return ERR_PTR(ret);
   236	
   237		page_list = (struct page **)__get_free_page(GFP_KERNEL);
   238		if (page_list == 0)
   239			return ERR_PTR(-ENOMEM);
   240	
   241		return ubcore_get_target_umem(dev, va, len, flag, page_list);
   242	}
   243	EXPORT_SYMBOL(ubcore_umem_get);
   244	
 > 245	void ubcore_umem_release(struct ubcore_umem *umem)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
