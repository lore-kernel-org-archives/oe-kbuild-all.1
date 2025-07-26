Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D6B7B3E1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Jul 2025 09:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753521326; cv=none; b=JHsrP1OgIT2IPmJ+eSv3bNgBFwQQea8MWS2oIyRlkf4lAZruKcPuHSJvH0rRB1C4x5BhMYfPTi9Km2FYHJXPC597CI9ABGefQeW3a352TrhIyHKHZ5FuZTCc1mrexl9cmSsASTXL8Ap0b2E4LD1zaxqOKvgUctbl0ll+d8Tz1l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753521326; c=relaxed/simple;
	bh=cRWlYCFkKroxSXlQOuOPzYSTQr/3t/NB9wG/x9kRJzg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i4MzVCFsdtB/pQmQoyx1xv2Xh8VM87Y8JcBEXfL0CZCAqlwjcOOpxsQ3/8RcEjHOGh+DiYNJkcNcyZap/pWUisdpS6Go0FKqm5FMIeYU0wDHyqOwzOIo5qaFZZNa0o4AWFNe5HBhnrscSD78pJdR57/kEZ2+hjmfJeDC0tFCV8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PbFQnSvI; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PbFQnSvI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753521325; x=1785057325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cRWlYCFkKroxSXlQOuOPzYSTQr/3t/NB9wG/x9kRJzg=;
  b=PbFQnSvIKQp5aVU1rOAC827hJv9YZcgN9FOeIiyiIIiuBQ8nnjaamqxf
   oF+q/u5F9uxkI7APc62GmNd7/5TCa1tsO/9LxA2hRn09txTsSvYUzJGnZ
   oG5VRvwJ6cn1Pyvq8gXS7lrWbC2bYCIBNHSg4Cyfe1S9j5j2lKFsGnE6V
   H1Kbw5RkvO63gLiFerc2ZlBS+VJkbshjJYG+cdcrizaFKprip20AQ3mQx
   OwSNEn7c1KOjKxLAtKFh598EVKZjrLKtI1QKGZJ+rDKlWWwvbDnz5y6SL
   S70Y7uAy8wgLWOK77DTSHzaRPN2ljBVc2NTB/R/2H7dtp7BWlBjKe6j/o
   w==;
X-CSE-ConnectionGUID: /II3ro4DSVGgcFbq5UA81Q==
X-CSE-MsgGUID: ACB2ll79Sj6XOUEWNSzyIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="55927361"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55927361"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 02:15:24 -0700
X-CSE-ConnectionGUID: 5tS3dQoSRC2HhX/yTj8tAA==
X-CSE-MsgGUID: Vt1qQmdsTWOeMd39sw0l5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="165680936"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jul 2025 02:15:23 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufazw-0000GB-39;
	Sat, 26 Jul 2025 09:15:20 +0000
Date: Sat, 26 Jul 2025 11:15:20 +0200
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-doc@vger.kernel.org
Subject: [linux-next:master 9877/12319] htmldocs: Warning:
 Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
 references a file that doesn't exist:
 Documentation/devicetree/bindings/gpio/gpio-dsp-keystone.txt
Message-ID: <202507261101.QSZzq6zo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d7af19298454ed155f5cf67201a70f5cf836c842
commit: aff0a1701b020c8e6b172f28828fd4f3e6eed41a [9877/12319] dt-bindings: gpio: Convert ti,keystone-dsp-gpio to DT schema
reproduce: (https://download.01.org/0day-ci/archive/20250726/202507261101.QSZzq6zo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507261101.QSZzq6zo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
>> Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/gpio/gpio-dsp-keystone.txt
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
