Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6703C1EE022
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 14:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730297475; cv=none; b=MFqraRWaxdHkuhY8vvDYLllMn9WP9Fzgi9hEeMo1ZzuByWRMsqCa0+QIdowjE3+tanaSL2F532OlISWedULJBca0BQvKGUkKyda6Umw45EnUdVzvYgOoJH6uRxpPXx6Lc3T5AH4GnbEJgpq4wM1h+Z2OMU7mdSKdfeXRCkFVBOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730297475; c=relaxed/simple;
	bh=f9noJD+cMYezjZAXGuV8FP1Wf0WcWRgKvLgMgSZdVZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q2UZ+nAx5l+MebqsO+pgNv2Eqo45kX0CB5l58PyiKy9CMOWBTg8cQkwE969fBfAeER8btqtTPC5huBn4NhI3G11lSBxZDT4b2W/FtNWaRnWQ46SkkruNVAi6wRVM3h1yHNumegoMEGHH+ZIAdqrsNmFqVdtoo2se78dA8kIM9Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KFDiYyu3; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KFDiYyu3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730297474; x=1761833474;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f9noJD+cMYezjZAXGuV8FP1Wf0WcWRgKvLgMgSZdVZ8=;
  b=KFDiYyu3sLe7hZoQksn8JD70J+b/6FeC4p21lT1+eKCzijzHyX6zBahL
   GlJVciRT6Bw7+V3ciAypMs5MhmobHdNqra7XqcLXMUY0JcWDqaRq8taye
   Fzlp2qToQ8nU5fDr3vEg526Gp94+HGxlZeE34Bn8lnhrrGjGUXSSUz5Ug
   uufqLE/jddBR7gDXS0aO3D9jBjBWKD41P72KfTicDpLGob2J480rXqivy
   WmU0uiKIIrn9rQwBbYf00Y1xef9iwPQG9D3N+3vGLzcYWW0LV7A4xDesF
   Ovb4R/U6QMAGUrY8JxStQQCE8UUV9QLbiLftbr0+SXPVlla6mebiHMd8c
   g==;
X-CSE-ConnectionGUID: 7ssrfnKSQZWSanTaejX7XA==
X-CSE-MsgGUID: rnrz3SdzTzq5CuYWslctyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29959015"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29959015"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 07:11:13 -0700
X-CSE-ConnectionGUID: yp+6+/0WQyWfUpaPaXJ3eQ==
X-CSE-MsgGUID: +8svoB2aTDyU/UDMdv8aPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="83140535"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Oct 2024 07:11:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t69Ph-000evA-2T;
	Wed, 30 Oct 2024 14:11:09 +0000
Date: Wed, 30 Oct 2024 22:11:04 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Nemanov <michael.nemanov@ti.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 17/17] wifi: cc33xx: Add Kconfig, Makefile
Message-ID: <202410302116.Z9Ut9ZJd-lkp@intel.com>
References: <20241029172354.4027886-18-michael.nemanov@ti.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029172354.4027886-18-michael.nemanov@ti.com>

Hi Michael,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main net-next/main net/main robh/for-next linus/master v6.12-rc5 next-20241030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Nemanov/dt-bindings-net-wireless-cc33xx-Add-ti-cc33xx-yaml/20241030-013401
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20241029172354.4027886-18-michael.nemanov%40ti.com
patch subject: [PATCH v4 17/17] wifi: cc33xx: Add Kconfig, Makefile
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241030/202410302116.Z9Ut9ZJd-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410302116.Z9Ut9ZJd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410302116.Z9Ut9ZJd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/ti/cc33xx/event.c: In function 'deffer_event':
>> drivers/net/wireless/ti/cc33xx/event.c:91:14: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      91 |         bool ret;
         |              ^~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/ret +91 drivers/net/wireless/ti/cc33xx/event.c

a34749533e99fd Michael Nemanov 2024-10-29   86  
a34749533e99fd Michael Nemanov 2024-10-29   87  void deffer_event(struct cc33xx *cc,
a34749533e99fd Michael Nemanov 2024-10-29   88  		  const void *event_payload, size_t event_length)
a34749533e99fd Michael Nemanov 2024-10-29   89  {
a34749533e99fd Michael Nemanov 2024-10-29   90  	struct event_node *event_node;
a34749533e99fd Michael Nemanov 2024-10-29  @91  	bool ret;
a34749533e99fd Michael Nemanov 2024-10-29   92  
a34749533e99fd Michael Nemanov 2024-10-29   93  	if (WARN_ON(event_length != sizeof(event_node->event_data)))
a34749533e99fd Michael Nemanov 2024-10-29   94  		return;
a34749533e99fd Michael Nemanov 2024-10-29   95  
a34749533e99fd Michael Nemanov 2024-10-29   96  	event_node = kzalloc(sizeof(*event_node), GFP_KERNEL);
a34749533e99fd Michael Nemanov 2024-10-29   97  	if (WARN_ON(!event_node))
a34749533e99fd Michael Nemanov 2024-10-29   98  		return;
a34749533e99fd Michael Nemanov 2024-10-29   99  
a34749533e99fd Michael Nemanov 2024-10-29  100  	memcpy(&event_node->event_data,
a34749533e99fd Michael Nemanov 2024-10-29  101  	       event_payload, sizeof(event_node->event_data));
a34749533e99fd Michael Nemanov 2024-10-29  102  
a34749533e99fd Michael Nemanov 2024-10-29  103  	llist_add(&event_node->node, &cc->event_list);
a34749533e99fd Michael Nemanov 2024-10-29  104  	ret = queue_work(cc->freezable_wq, &cc->irq_deferred_work);
a34749533e99fd Michael Nemanov 2024-10-29  105  }
a34749533e99fd Michael Nemanov 2024-10-29  106  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
