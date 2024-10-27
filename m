Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA1E17736
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 03:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729998910; cv=none; b=UyoCqUVSh4MdNeVK/spazm9oHqJmTFNAQh7vSy+DjqN5ORLYLA2LDzz23dQtEKk3cgIvDoIu2wJpmjdPBw32dH2Olf6KAgHtuqhanYIgmOHmDgYNmMZZP2VGNaagywe4bRyF+OYuUbBPCCYRBa+yojVgh8tcnd53GgqqJzHusnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729998910; c=relaxed/simple;
	bh=MBploa5XyqdGwgDyM6f/zIwsw5qlqAdTzzboceAh1QE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8Az4rdJQYzPDnWFaFyLWELjjuK3N1pMidNHU6+9c30ibL8rMlMjh8K9igwG/+aogwLSR42D6jAYMWYxIVm34lW1iWVWQdwqyaoazia+b2e0yI/ISTX2M3AC6UCtQWR+tSsnKwOpfwLifG3kPjCyhAvLRzIKcov5f3SnPEQ93Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Po+QDsM9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Po+QDsM9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729998908; x=1761534908;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MBploa5XyqdGwgDyM6f/zIwsw5qlqAdTzzboceAh1QE=;
  b=Po+QDsM9ylak7AsillnO4XLY138n8QOTsL8Rmnw+lDE+Qyq4LtxTt0fW
   1nEVQ/XFe8H4ls5kR2CCcPUsbTZPNmUkQuphqvdIVzcUrtHKQoDHKveLG
   j+Y3n/r5+futGd2l9HYPAyFb+H+0p2FFJlke0o/5e73fmJSIIqVYnENLB
   CEvleAp0FG9DYP+58HcK5mTRFLhoUSmmvgW/FYKkpwGnaD/E3pGuCsKTt
   nA+S/6NmXOwh00JrVfqztkPFpXQNJhBjNz7T93i5KTEtr0mdrc/97r76N
   CITgMHB6GilhLOG3bSK7+pqZWnt865pAW6J+YanLBpofXN2rFQA4lFMeV
   Q==;
X-CSE-ConnectionGUID: ns30BgboT5SpXRkeU29AuA==
X-CSE-MsgGUID: 7OUY2DJhSMWQiZYWMd4vOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52185091"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52185091"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 20:15:07 -0700
X-CSE-ConnectionGUID: GX4cRARCRK6pTnS8gsOz0Q==
X-CSE-MsgGUID: qgFuel6BQ5S12hYc+gJ7WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="85833078"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Oct 2024 20:15:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4tk7-000aJK-3A;
	Sun, 27 Oct 2024 03:15:03 +0000
Date: Sun, 27 Oct 2024 11:14:47 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [net-next RFC PATCH v2 2/3] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
Message-ID: <202410271113.eownoD7D-lkp@intel.com>
References: <20241023161958.12056-3-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023161958.12056-3-ansuelsmth@gmail.com>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/dt-bindings-net-dsa-Add-Airoha-AN8855-Gigabit-Switch-documentation/20241024-002325
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241023161958.12056-3-ansuelsmth%40gmail.com
patch subject: [net-next RFC PATCH v2 2/3] net: dsa: Add Airoha AN8855 5-Port Gigabit DSA Switch driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241027/202410271113.eownoD7D-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410271113.eownoD7D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410271113.eownoD7D-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: drivers/net/dsa/an8855.o: in function `an8855_port_vlan_add':
>> (.text+0x1d5c): undefined reference to `__ffsdi2'
>> alpha-linux-ld: (.text+0x1d8c): undefined reference to `__ffsdi2'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
