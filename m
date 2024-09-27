Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B10B82488
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 11:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727435718; cv=none; b=NnNaR2ypw5IaGWbYGyyYGagJ3kAiWQ9YzEpbrzBmlxIuqKaIdT4ai0k3VGXwi3DeB3dSEIpXQknNAjQ8IP6uaPNBBmNPDHbgwDK+sfsTgwd2Pbqn2IRN+8TKNwi3LEBGwYiw5SH/Gd90L8p3648oAxC45KyZorVCTqYvdqKL7c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727435718; c=relaxed/simple;
	bh=jAkKgdAtBNcQiX83QeIMCoMfATOcQJe5H5bCsSvQaMY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SzXkaFVn0eRkV4nNyDvS6dg0tu0Ag8WSBS/9cz4ZjVc7rTCKcV+acOMPkqkeJT/GOY5v0OCP7IrG/djGMYbNnbEh0bozK9c+AhwKTCwo0F8K8URMbzyB70V1qnu2MfbsXbf0uuNWlxeDpsGBn0S1sf1p8UZAhF+JeWMX8L38W5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eg+hDvL1; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eg+hDvL1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727435716; x=1758971716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jAkKgdAtBNcQiX83QeIMCoMfATOcQJe5H5bCsSvQaMY=;
  b=Eg+hDvL1mDDPNOkClQzI5hnFim83jfxfFScOyFG11tQR7kOffaJOHJHw
   B0vlm4ea1Lxqc8EwzLuiJTuDzDiyyoygn6g+IckMzPyR+o7bqERpfAlXQ
   Q2oWJQMFeX5Q5Q7sl/CG1Sl8hxOXVExdVH0UDtIzVhafv4G70941bMDwt
   rlA3U8Qlxr/Xkb4L7ng8bqUjeylut7EewKs1xdsoGdQu8M1uhdXkSuLLW
   fG01LjveU38Yes0vlTMy79i0pEIZ16YFPsOkD6TyuBprTObyDCA8z993w
   fKkPXpvRjTl9xgBqtLYsk4X8oDtCbBk9xrnNDTyRhfiWlrqxjv2QJcZ//
   g==;
X-CSE-ConnectionGUID: +8omlJ+2RJOok7X65gZZ5A==
X-CSE-MsgGUID: XceOmK33QQCPSuXs/ejmYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="29458524"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="29458524"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 04:15:15 -0700
X-CSE-ConnectionGUID: simHxccaTrGdVVcmG6nFnQ==
X-CSE-MsgGUID: 4FIqH6UlQBe+/7gVHXl60A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="77448964"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Sep 2024 04:15:15 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su8wI-000Lqp-2r;
	Fri, 27 Sep 2024 11:15:10 +0000
Date: Fri, 27 Sep 2024 19:14:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ma Wupeng <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 12771/30000]
 drivers/hwtracing/coresight/coresight-core.c:26:1: sparse: sparse: symbol
 '__pcpu_scope_csdev_sink' was not declared. Should it be static?
Message-ID: <202409271902.PwZin66T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   bef6f06e039b8929481350d15d6d8c3ba81c6fd2
commit: 078577fd8d76863149a3e8c7588ed0b457a095e9 [12771/30000] coresight: core: Add support for dedicated percpu sinks
config: arm64-randconfig-r131-20240925 (https://download.01.org/0day-ci/archive/20240927/202409271902.PwZin66T-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240927/202409271902.PwZin66T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409271902.PwZin66T-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwtracing/coresight/coresight-core.c:26:1: sparse: sparse: symbol '__pcpu_scope_csdev_sink' was not declared. Should it be static?

vim +/__pcpu_scope_csdev_sink +26 drivers/hwtracing/coresight/coresight-core.c

    24	
    25	static DEFINE_MUTEX(coresight_mutex);
  > 26	DEFINE_PER_CPU(struct coresight_device *, csdev_sink);
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
