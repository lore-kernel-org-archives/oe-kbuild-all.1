Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21353270573
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 May 2025 08:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746778248; cv=none; b=O371Sh961vTbJYR8WIl8Bes1ADXQ6IzfrVs990Ym7DvdRs3F/TPor5Nm8S/bsdhPLhA7e7TnnwpQc73msTOPRPoliR9kNr+gs5tsobB5cdm6qZKIB4VtgYiUxvZ5Xj+zK3BV+ZpSJpjxJb5ovWOZZH73waq6Qx5kDrCd9jW40uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746778248; c=relaxed/simple;
	bh=2DNmR+TH1qCCjaE1/SbrS25VNh8cE1emAmNfpETHcGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=on6VosZqWwp7WHMM2DCVk5BcvVuPwqUgyJ44MI+JCPuV6vQv8p7QiDTtgpmNy4DtSgjQUdxoV6ft5KdrlspjLdZqB7bQepYXt4gyWlV7kf7+ot9DjBVXnVCCB6VB3ZOKNjNkUp0lo8CWlE33PUxWlvUrCd6Y+rqSXFfna/6sigk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BJlbzn/P; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BJlbzn/P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746778247; x=1778314247;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2DNmR+TH1qCCjaE1/SbrS25VNh8cE1emAmNfpETHcGI=;
  b=BJlbzn/Pm7dWGZRAo7pFGYdEsPxg2Ccw1C2LdPtwG7lD3AmmfxmsI0Sg
   eoaPziUtr9+GD/EpvFqhEDVQUNv99Ufbuh8HvtUYq5yWT4K8svAGZFKi8
   1TPLrE8L83+L5IJcIjWbFGSo1MDzaLDIlR+NeyZlTe/9/K2yE85BcIzMO
   KYmzDDnqQfX89jvIwF3pvFdadH4K3WfjIeyH1OyVa+i2vYrRzayuXCjgV
   w5VNHXur+mzjbj4NKF1lF5+PJY67gVsgP4JhaW9pdn6xJ0xHWXxkLW5na
   fxp740YYKnNwbLZhgdRgvMsmAJEcw4vYLAQZIU+xRre1Z2rBHpidvjBN3
   Q==;
X-CSE-ConnectionGUID: FOxRBH6/QhmbHWV8iSrmKg==
X-CSE-MsgGUID: wHw4mhNeStaL7NV7LyM4Dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59259369"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="59259369"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 01:10:46 -0700
X-CSE-ConnectionGUID: fP9FKv08S2SiqoXFGLqCkA==
X-CSE-MsgGUID: 6yFUYbK6SJqE5Q0LoR/IYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="141325389"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 May 2025 01:10:43 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDIob-000Bo7-1E;
	Fri, 09 May 2025 08:10:41 +0000
Date: Fri, 9 May 2025 16:10:39 +0800
From: kernel test robot <lkp@intel.com>
To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
	linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, shashank.rebbapragada@nxp.com,
	Frank.Li@nxp.com, Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support
Message-ID: <202505091515.KKkEYL9A-lkp@intel.com>
References: <20250508045711.2810207-1-aman.kumarpandey@nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508045711.2810207-1-aman.kumarpandey@nxp.com>

Hi Aman,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.15-rc5 next-20250508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aman-Kumar-Pandey/drivers-i3c-Add-driver-for-NXP-P3H2x4x-i3c-hub-device/20250508-125929
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250508045711.2810207-1-aman.kumarpandey%40nxp.com
patch subject: [PATCH v2 1/2] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support
reproduce: (https://download.01.org/0day-ci/archive/20250509/202505091515.KKkEYL9A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505091515.KKkEYL9A-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/i3c/p3h2x4x_i3c_hub.yaml
   Can't build as 1 mandatory dependency is missing at ./scripts/sphinx-pre-install line 984.
   make[2]: *** [Documentation/Makefile:121: htmldocs] Error 255
   make[1]: *** [Makefile:1801: htmldocs] Error 2
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'htmldocs' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
