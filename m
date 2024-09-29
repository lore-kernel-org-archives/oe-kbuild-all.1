Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A651774059
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 18:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727636394; cv=none; b=LUt9vdklQPPAqk8pEDXQ3SXWjBoZ4L79zorer58acdYNGPGIBtb7vFE78t03MQma9DGGJrcgn7E7zq+e4p4lc7ii8YTkZq3whdX5DXgzjbrHMQsX+zpyRsc2FYaHuTfCL1c5NlEAf4RALNBihrfmQFPYhp76oqEZjgMuhAvchh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727636394; c=relaxed/simple;
	bh=91/0o1aMnlne9rvshqZMs/nVcqJqNiVD5FHoHFocl1A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=alg0jfwjLn5wBOyH2EH9AJOKV/VIbQIuNqBXlZIhwUMQsM8tFjAON7V+zDCRvrAGsAo3Va/999TNFnN/mZiaUJc6Ar832skkdtFwS+bAftC2R3We/WK3Jx1oSwO01W6m92n9Y1u4zR/crlqqB6OCH1s8ui7LogHDMgTmn2WnDsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JWOZe1IF; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JWOZe1IF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727636392; x=1759172392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=91/0o1aMnlne9rvshqZMs/nVcqJqNiVD5FHoHFocl1A=;
  b=JWOZe1IFNpWcR7tgDQdXJGpSY8HofpwlYfQOkGVpGlGkLtui50vxbPf3
   lhgiEJztMJm67eqO2ihNnS0WbUjpnVlY668fzHXPdqKzinWJB+Q1GM8bR
   vtTMYfOAHYzy6OyjCrSZFZJAw3Q/22kLuyPQbUyVn00Xinu2MdhF8YYEI
   VqpNgGLqc4/VBcr2NvyXPvETZ+aia0bUVwMso9g1j8IOYRUZD+FQZIfi8
   NoWpZokC81KQft6Y7zbby+Y399i+PzG+u2rnwO0akrAixVFkn9FmGVezC
   WRYoFB0NWWPkrEZHYMWIZT0nQxKy3Q8KzqgZjoifG7rBCq+OuPAlIEUIV
   w==;
X-CSE-ConnectionGUID: T5cl/gyURwCQc3L4BOTWvA==
X-CSE-MsgGUID: Nan1bL2iTviDDd2iqf1AJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26881209"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="26881209"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 11:59:50 -0700
X-CSE-ConnectionGUID: 9YJ2RXDyRxqNbHaOpuoUDA==
X-CSE-MsgGUID: rluWNwLNS0GiN65MwOuZIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="77894014"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Sep 2024 11:59:49 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suz90-000OcN-1C;
	Sun, 29 Sep 2024 18:59:46 +0000
Date: Mon, 30 Sep 2024 02:59:08 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-6.11.y 46/107]
 drivers/base/power/common.c:288: warning: Function parameter or struct
 member '_list' not described in 'devm_pm_domain_detach_list'
Message-ID: <202409300234.7qq0QN57-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.11.y
head:   c096e56788fa6227120b84d46d39ffd522fb1ede
commit: 2ac0c3efc060c17e36d80d36b5d883092ae57ae8 [46/107] PM: domains: add device managed version of dev_pm_domain_attach|detach_list()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240930/202409300234.7qq0QN57-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300234.7qq0QN57-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300234.7qq0QN57-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/power/common.c:288: warning: Function parameter or struct member '_list' not described in 'devm_pm_domain_detach_list'
>> drivers/base/power/common.c:288: warning: expecting prototype for dev_pm_domain_detach_list(). Prototype was for devm_pm_domain_detach_list() instead
>> drivers/base/power/common.c:307: warning: Function parameter or struct member 'dev' not described in 'devm_pm_domain_attach_list'
>> drivers/base/power/common.c:307: warning: Function parameter or struct member 'data' not described in 'devm_pm_domain_attach_list'
>> drivers/base/power/common.c:307: warning: Function parameter or struct member 'list' not described in 'devm_pm_domain_attach_list'


vim +288 drivers/base/power/common.c

   278	
   279	/**
   280	 * dev_pm_domain_detach_list - devres-enabled version of dev_pm_domain_detach_list.
   281	 * @list: The list of PM domains to detach.
   282	 *
   283	 * This function reverse the actions from devm_pm_domain_attach_list().
   284	 * it will be invoked during the remove phase from drivers implicitly if driver
   285	 * uses devm_pm_domain_attach_list() to attach the PM domains.
   286	 */
   287	void devm_pm_domain_detach_list(void *_list)
 > 288	{
   289		struct dev_pm_domain_list *list = _list;
   290	
   291		dev_pm_domain_detach_list(list);
   292	}
   293	EXPORT_SYMBOL_GPL(devm_pm_domain_detach_list);
   294	
   295	/**
   296	 * devm_pm_domain_attach_list - devres-enabled version of dev_pm_domain_attach_list
   297	 *
   298	 * NOTE: this will also handle calling devm_pm_domain_detach_list() for
   299	 * you during remove phase.
   300	 *
   301	 * Returns the number of attached PM domains or a negative error code in case of
   302	 * a failure.
   303	 */
   304	int devm_pm_domain_attach_list(struct device *dev,
   305				       const struct dev_pm_domain_attach_data *data,
   306				       struct dev_pm_domain_list **list)
 > 307	{
   308		int ret, num_pds = 0;
   309	
   310		num_pds = dev_pm_domain_attach_list(dev, data, list);
   311	
   312		ret = devm_add_action_or_reset(dev, devm_pm_domain_detach_list, (void *)list);
   313		if (ret)
   314			return ret;
   315	
   316		return num_pds;
   317	}
   318	EXPORT_SYMBOL_GPL(devm_pm_domain_attach_list);
   319	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
