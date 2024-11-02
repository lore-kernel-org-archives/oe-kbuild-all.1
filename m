Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED10433B9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 15:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730561986; cv=none; b=inyeJzhhV9bvUEk2WiHgvWtlJLgGinZRGo6qcjAuZ9u8DFkesvD39fAxrGEJ3kybxsEiCXdVpmgNOxSkTA46HmcWzcoSZ5k8D5EcKpiY9r1yYQWrfbCx6fH8OTfwrtpKWVRcayUC42SiFSWgo5smV8QOpaLqIogOhsq1s0ySrCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730561986; c=relaxed/simple;
	bh=xIHZ3TP4g6Or3+7whsA9plLBWXJO5w8IjRkxYXHKqoE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KA7fbk29DP3TuNcVVorDeD98JBkmEjwzmJl1U7bsm2aKxpIrxZQstqZ1EyNjGApCSpl9i5ML/cvLkmlvBPustvABEmJEeRFG0MZ33s34h1pZrvtYrZ5eAb0H8AiilUNE8loEau/DiD9l5mGW0MuIEd09YL6PluQ/vDczGy6ipok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mwn80Osr; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mwn80Osr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730561984; x=1762097984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xIHZ3TP4g6Or3+7whsA9plLBWXJO5w8IjRkxYXHKqoE=;
  b=Mwn80OsrTubbma41D7JrRwCtKrR7ePYsEncqWBE/n6xnCzKdjoSFghPT
   lrVN3QVUjSRiX+P09f1qNkrq0Es2aA4faEcx9quw1tWK9d/87yZJcaD9/
   iXwZYJl6ch6YI3Oz1sjklfonRBGtEPZbLZk5TH+1lSQBSWiZ0GRfsQVJ4
   t/yiYCmOBKD2qmbAagPNTNJHi2DZ6lVfzCfyLqU7kfYDtqbJwSCJL0rwe
   AnpiFke8crAPyW8CFgoOxEw0eX3QjvCJ6arLV2KApd7EH33MpHgDhB68R
   kF/O9jyRaxRTOrhInMbSC+1d7dHTxFpao+q9k1eaO++SZwlNwsUglc69i
   Q==;
X-CSE-ConnectionGUID: tsld28zJS2izuMWoGvBUMw==
X-CSE-MsgGUID: vBkcZPBbS5CAK7oFX88hmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11244"; a="30188248"
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="30188248"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 08:39:43 -0700
X-CSE-ConnectionGUID: c/YlisflR5qizFANGhMkkA==
X-CSE-MsgGUID: BuEHfrEsSzOXq5r4su+3aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="84058112"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Nov 2024 08:39:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7GE0-000j7r-11;
	Sat, 02 Nov 2024 15:39:40 +0000
Date: Sat, 2 Nov 2024 23:39:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-arm-ci 1/19] drivers/of/property.c:53:34: error: expected
 statement before ')' token
Message-ID: <202411022340.ZuKi5Tkd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-arm-ci
head:   507503e336db5bc3e47ee6a4d79e9d883f3fc824
commit: 09adca1c46b0c6e6ee7b3a5041326060bb29af09 [1/19] properties: Split property reading bool and present test
config: arc-tb10x_defconfig (https://download.01.org/0day-ci/archive/20241102/202411022340.ZuKi5Tkd-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411022340.ZuKi5Tkd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411022340.ZuKi5Tkd-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/of/property.c: In function 'of_property_read_bool':
>> drivers/of/property.c:53:34: error: expected statement before ')' token
      53 |         if (prop && prop->length))
         |                                  ^


vim +53 drivers/of/property.c

    33	
    34	/**
    35	 * of_property_read_bool - Find a property
    36	 * @np:		device node from which the property value is to be read.
    37	 * @propname:	name of the property to be searched.
    38	 *
    39	 * Search for a boolean property in a device node. Usage on non-boolean
    40	 * property types is deprecated.
    41	 *
    42	 * Return: true if the property exists false otherwise.
    43	 */
    44	bool of_property_read_bool(const struct device_node *np, const char *propname)
    45	{
    46		struct property *prop = of_find_property(np, propname, NULL);
    47	
    48		/*
    49		 * Boolean properties should not have a value. Testing for property
    50		 * presence should either use of_property_present() or just read the
    51		 * property value and check the returned error code.
    52		 */
  > 53		if (prop && prop->length))
    54			pr_warn("%pOF: Read of boolean property '%s' with a value.\n", np, propname);
    55	
    56		return prop ? true : false;
    57	}
    58	EXPORT_SYMBOL(of_property_read_bool);
    59	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
