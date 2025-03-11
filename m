Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CCD1BDCF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Mar 2025 14:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741704729; cv=none; b=P7EZSB7GNgyzZ0XrrFhMXW0ePt5lX1KBepS4+kXmYaCgMs5quueGRrjRws8D0XeKO6fLkb1UR8Ze2Z8enM1Fn/U6mQGPrj9eBcmoHh4f3cfV7OOchUn+dphzuf0iBTQ0e4wAD+5l0PeTNJe+JzjStVxXVQq75FHlFyJ6iIjvzIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741704729; c=relaxed/simple;
	bh=jjTt3pQS/T5TBwcK+c1BNyfhy0Ht72joFk5RqouvWIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jxqrig/N6ks2Nm0DLBb6rA/Qn7RoAv0RwAs9WjOU9zX9jvS9RjTjOpQ24nc6Uk+rAj0YXNDQqZGqzy9vqeb188+1eW3eCggoe4zQ0twfnn/9NJsUdULpAxNfSA3r0aAzYtq1gEziuw820HwNMA79NMXdbqxXh52JcOWM4HwZGOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ndL35CI3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ndL35CI3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741704728; x=1773240728;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jjTt3pQS/T5TBwcK+c1BNyfhy0Ht72joFk5RqouvWIY=;
  b=ndL35CI3snBRdqQg4yAjjDU3wSOVpfEn6cv8CQL/yhqal2kEwnlU9418
   iHUBBEUKcwKcxxZIP+iBHiNjktz5/f425buUFHUDgeU8kAMUEhlg86gCR
   Y+AlUxwvQSjEjY6fp14NK09mIs4HbusjsYoymDkSw5OByYklm8cvkkN1Z
   ++8oOUP/9h6j5X99JHY0LLnw8lM5a8/l3cijoayJ+agHUOnWVJWzJE4kZ
   PdD7gvhpCJUPY7N8s5Nezy2+/DJVAERRM7j+lSq9zgKRmVDG+tPk5o9HS
   9KiTRIKUCjV5giml2A2vhEiEMCaXgqPNfUnLD/TrHm/52qocYiEs+kuzq
   g==;
X-CSE-ConnectionGUID: xNt6R1zVQxa/CG3lzkQc8A==
X-CSE-MsgGUID: TyE3sr86RHOS50SP98XMmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42930735"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="42930735"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 07:52:07 -0700
X-CSE-ConnectionGUID: BNQN/hbQT1CWPTI3g+t1IA==
X-CSE-MsgGUID: K8mu9x1RSl+oFV1yb6mssw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="121238865"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 11 Mar 2025 07:52:06 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ts0xg-0006jk-0G;
	Tue, 11 Mar 2025 14:52:04 +0000
Date: Tue, 11 Mar 2025 22:51:42 +0800
From: kernel test robot <lkp@intel.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <202503112248.4yP7WmdR-lkp@intel.com>
References: <20250310122305.209534-1-mehdi.djait@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310122305.209534-1-mehdi.djait@linux.intel.com>

Hi Mehdi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on sailus-media-tree/master v6.14-rc6 next-20250311]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mehdi-Djait/media-v4l2-common-Add-a-helper-for-obtaining-the-clock-producer/20250310-202543
base:   linus/master
patch link:    https://lore.kernel.org/r/20250310122305.209534-1-mehdi.djait%40linux.intel.com
patch subject: [RFC PATCH v2] media: v4l2-common: Add a helper for obtaining the clock producer
config: i386-randconfig-054-20250311 (https://download.01.org/0day-ci/archive/20250311/202503112248.4yP7WmdR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250311/202503112248.4yP7WmdR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503112248.4yP7WmdR-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/media/v4l2-core/v4l2-common.o: in function `devm_v4l2_sensor_clk_get':
>> drivers/media/v4l2-core/v4l2-common.c:667: undefined reference to `__clk_hw_register_fixed_rate'


vim +667 drivers/media/v4l2-core/v4l2-common.c

   642	
   643	struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
   644	{
   645		struct clk_hw *clk_hw;
   646		struct clk *clk;
   647		u32 rate;
   648		int ret;
   649	
   650		clk = devm_clk_get_optional(dev, id);
   651		if (clk)
   652			return clk;
   653	
   654		if (!is_acpi_node(dev_fwnode(dev)))
   655			return ERR_PTR(-ENOENT);
   656	
   657		ret = device_property_read_u32(dev, "clock-frequency", &rate);
   658		if (ret)
   659			return ERR_PTR(ret);
   660	
   661		if (!id) {
   662			id = devm_kasprintf(dev, GFP_KERNEL, "clk-%s", dev_name(dev));
   663			if (!id)
   664				return ERR_PTR(-ENOMEM);
   665		}
   666	
 > 667		clk_hw = devm_clk_hw_register_fixed_rate(dev, id, NULL, 0, rate);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
