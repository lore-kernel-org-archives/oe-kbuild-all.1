Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E0722D7B4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 May 2025 09:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746092238; cv=none; b=ija00uZY/3p/P3KYgSLwsA1JhOvVD456XM73afeDosXODrp81k2280pcJhYnssnts3ESMmgZy9EpHht0MCwGGZbs5Iav5j+PC9QlVWjnN9k08FGQWTsAS3K6/SCR3fv2GKkDxVHd7IpLL2qnC2ENdenVe+RnBeA3I6uvFgFOVV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746092238; c=relaxed/simple;
	bh=7HkpmBy4uOXtgP/kfZ+4ul+zjnVdkK+uvMav1IDO7GE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ffbcLbmge6Fx4kfzO8Vg+ubaqk8sUXBeyLfokfYdoohLOHSR3yzEQ+TIAI8LPOKBh3J4gIYwtepS8OF34odkNN923YlsYqgfxkQWXiXOAJ1jJVQrPDbghC4osCgLskgyfz7FbkjxApdgO6Fl1w2gAdUII9iBZ3eI6YtXsRjsRz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aK1Q1Mcd; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aK1Q1Mcd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746092236; x=1777628236;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7HkpmBy4uOXtgP/kfZ+4ul+zjnVdkK+uvMav1IDO7GE=;
  b=aK1Q1Mcdw884lCDiNc5dnvs39bceZSH/pIXSeAX5EjYBX8TJ04i7nVqp
   45FfuQ99lBBoPiPZPITb4a7mHskWyY+YeA0Rbrk6ddPMuWUc+EWX6lSnX
   dLIFxmbxoFEn+on6nJd8L5uMhN44miPaXAofKI+pQl48OCA8LXEAip4PP
   QiqQcVHrtxkmB4tk0vlSIPjzOkb+m+/pN7T8shpVAou4zpl78ff6qufJY
   19/10b5pFl75JpxJjX/iloPT4ylGuiudFx/sK/Yc/URbBKxRDSCOat7SG
   p/B1TonittlYSln2Lvw7WHrDtKJAJoK4fMlqn7oEkL3M+uOAnIOAxV2/9
   w==;
X-CSE-ConnectionGUID: cogVyflfTXWCIHpXRVQa3w==
X-CSE-MsgGUID: vTqS1uJOTuWRMOki8o9RBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="47672297"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="47672297"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 02:37:15 -0700
X-CSE-ConnectionGUID: +oETbooFSmyuPuIsABmWhA==
X-CSE-MsgGUID: A8hsURclRcGMFwsZ1uWTrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="171577908"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 May 2025 02:37:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAQLv-00045B-1z;
	Thu, 01 May 2025 09:37:11 +0000
Date: Thu, 1 May 2025 17:37:02 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Charkov <alchark@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
Subject: Re: [PATCH v2] dt-bindings: i2c: i2c-wmt: Convert to YAML
Message-ID: <202505011756.SZDFqCew-lkp@intel.com>
References: <20250430-vt8500-i2c-binding-v2-1-0cf22d0c2d42@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-vt8500-i2c-binding-v2-1-0cf22d0c2d42@gmail.com>

Hi Alexey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0af2f6be1b4281385b618cb86ad946eded089ac8]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Charkov/dt-bindings-i2c-i2c-wmt-Convert-to-YAML/20250430-183538
base:   0af2f6be1b4281385b618cb86ad946eded089ac8
patch link:    https://lore.kernel.org/r/20250430-vt8500-i2c-binding-v2-1-0cf22d0c2d42%40gmail.com
patch subject: [PATCH v2] dt-bindings: i2c: i2c-wmt: Convert to YAML
reproduce: (https://download.01.org/0day-ci/archive/20250501/202505011756.SZDFqCew-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505011756.SZDFqCew-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/i2c/i2c-wmt.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
   Can't build as 1 mandatory dependency is missing at ./scripts/sphinx-pre-install line 984.
   make[2]: *** [Documentation/Makefile:121: htmldocs] Error 255
   make[1]: *** [Makefile:1801: htmldocs] Error 2
   make: *** [Makefile:248: __sub-make] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
