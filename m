Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935F3768E1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jul 2024 07:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721287714; cv=none; b=lZzY6ROre93YFDEb4mCVXi5180JTswV6mfDVaVHP5QeYa+PdCRm3fjbMA8QHRt633tDzVZJ5bOE50hoDB3XKZOJL5G9m5txRybwHA/0BirW/Tw3Y+vP30tagLG98g0CK0RZo8qg7FcnVvXbl9MSFcoTimwy4JgD3Z+yfNI0tRMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721287714; c=relaxed/simple;
	bh=MEeIAirB0M/y8Jo5xEZCzZErMzyC5pyvQonDByUoJHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h8ejoZuC7Zi/dLW3NqCKHdF/PSS+esr8yx6oOE4jIALytFbA+a7+dlVX9ndL4Y9nJClotS3X2HZBhzy+9vjw8MtiK4OFq7E7fTjILlnVQcWmq9XnoH30+LIv1cLeHD3JdUziNWBdvC1vN0waY6X7KXKWnvzOYiIw9kFWJf+PA5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zs770o5F; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zs770o5F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721287710; x=1752823710;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MEeIAirB0M/y8Jo5xEZCzZErMzyC5pyvQonDByUoJHQ=;
  b=Zs770o5F6rg5AbEQWDvq02n13gY2z3nJGwwCvXw3UmD6MKSlwoVwAZ34
   URJ698+dBGC+EK/Z15UBXayDGHLC/yjQCZnyp5kU4rvR5XlGqCK9Efd9j
   6E/bvAx+v94V0FK40Go/pU7hV4nJZV1V4++Pc1NOse2v2ocIOJEm+pQFP
   6VRdLUls2W6LMXMZvywxzc5krU6cucmZnERGqrhXIYhpVrNzxVcn+wd7q
   TJN5FSEmSaFpaWDDr/ftVQLC4DbrnANZFQkGGswSo1ucjduqK96DnK7kM
   vfXLZxtTd6HY7jWOZfxhBXTR0T6X7isZKWNfpfxljdGeWT9ytLqEY176R
   A==;
X-CSE-ConnectionGUID: LpbRQjCaREadc8OwbN+Brw==
X-CSE-MsgGUID: JV+w0g7PR1iLiMFiJjFDgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18788606"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="18788606"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 00:28:30 -0700
X-CSE-ConnectionGUID: ZyS1I7gGSESdJJrF7SihpQ==
X-CSE-MsgGUID: JtjXaVgrTKi/s0KKQMP4pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="81320636"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Jul 2024 00:28:29 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sULYx-000h3S-0D;
	Thu, 18 Jul 2024 07:28:27 +0000
Date: Thu, 18 Jul 2024 15:27:55 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-6.10.y 84/86]
 drivers/media/platform/qcom/venus/pm_helpers.c:875:15: error: implicit
 declaration of function 'devm_pm_domain_attach_list'; did you mean
 'dev_pm_domain_attach_list'?
Message-ID: <202407181508.VjPUz2Xl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.10.y
head:   22e716620cdb9912603edf51c8bee9f4fa5bb4a4
commit: 91ac04979220e4668960ebd896ab55b8b6f68633 [84/86] media: venus: use device managed APIs for power domains
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240718/202407181508.VjPUz2Xl-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240718/202407181508.VjPUz2Xl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407181508.VjPUz2Xl-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/qcom/venus/pm_helpers.c: In function 'vcodec_domains_get':
>> drivers/media/platform/qcom/venus/pm_helpers.c:875:15: error: implicit declaration of function 'devm_pm_domain_attach_list'; did you mean 'dev_pm_domain_attach_list'? [-Wimplicit-function-declaration]
     875 |         ret = devm_pm_domain_attach_list(dev, &vcodec_data, &core->pmdomains);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |               dev_pm_domain_attach_list


vim +875 drivers/media/platform/qcom/venus/pm_helpers.c

   859	
   860	static int vcodec_domains_get(struct venus_core *core)
   861	{
   862		int ret;
   863		struct device **opp_virt_dev;
   864		struct device *dev = core->dev;
   865		const struct venus_resources *res = core->res;
   866		struct dev_pm_domain_attach_data vcodec_data = {
   867			.pd_names = res->vcodec_pmdomains,
   868			.num_pd_names = res->vcodec_pmdomains_num,
   869			.pd_flags = PD_FLAG_NO_DEV_LINK,
   870		};
   871	
   872		if (!res->vcodec_pmdomains_num)
   873			goto skip_pmdomains;
   874	
 > 875		ret = devm_pm_domain_attach_list(dev, &vcodec_data, &core->pmdomains);
   876		if (ret < 0)
   877			return ret;
   878	
   879	skip_pmdomains:
   880		if (!core->res->opp_pmdomain)
   881			return 0;
   882	
   883		/* Attach the power domain for setting performance state */
   884		ret = devm_pm_opp_attach_genpd(dev, res->opp_pmdomain, &opp_virt_dev);
   885		if (ret)
   886			goto opp_attach_err;
   887	
   888		core->opp_pmdomain = *opp_virt_dev;
   889		core->opp_dl_venus = device_link_add(dev, core->opp_pmdomain,
   890						     DL_FLAG_RPM_ACTIVE |
   891						     DL_FLAG_PM_RUNTIME |
   892						     DL_FLAG_STATELESS);
   893		if (!core->opp_dl_venus) {
   894			ret = -ENODEV;
   895			goto opp_attach_err;
   896		}
   897	
   898		return 0;
   899	
   900	opp_attach_err:
   901		return ret;
   902	}
   903	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
