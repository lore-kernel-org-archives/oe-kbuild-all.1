Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6731C217F3D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Sep 2025 19:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758310840; cv=none; b=ditYtc9kLnZi/XTAl7EPXfd3vxtA+NOolqV5udaOx4XovTy/9rK1p9WgvP5Yeht8zPALAen5AR1FGjVihO8WPPsPwWt2CmwTD9weQrliDXguemQs/YwN472bZHVJFdd7+777sbw/DB5bD1ye2nePokoYJKLpU4vtZVCmiwLbfdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758310840; c=relaxed/simple;
	bh=UWNgJhEGJyCX9u3igvMj7htnj5b06x18y2d0K94+mvk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uLYJrE44T59B+h7aRcmydUtD57YwRiLwACcr80iN/kk6Voj7qWAJFYmESB5gyYNlI+j2WF6Qt19Qvufda3h+RpCpVrnJEGrHI6OWUDocNABiY8ndgU7+2x7eER+xNtPaMCgWzXwP2IXt0lzPyRcOJg4JTYmAJlZ7vADAaCHIdXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b1IKAtsS; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b1IKAtsS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758310840; x=1789846840;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UWNgJhEGJyCX9u3igvMj7htnj5b06x18y2d0K94+mvk=;
  b=b1IKAtsSuAZjMiFlWyyJmE57P+sqHL23vAQ0R6AzACQGmbbT6XkEjDQO
   n1eVtUWcV3cpDE/ltJmC85M7WAjI7B7TSZMqm7Z1VkT0fCSf03PKsLmC1
   +5hz0+o06ClyF93Wt2dZFypIdeEQk+pFY295Vu+aGt41mz5fddHg8iBW6
   APrdZzfpcEJmyTj3tA2zqxkcPPqZ8afzlZ+C1bgPAj5tKErOlMZp9d3sN
   g3WnEtBM3VWX45CGBYL0jGxX2CMhBeXpiqrxGX5W3fWu9ob5MYhKGqWGU
   8xAnB5XFz4dkfM56H/oRvaMLxdHkMUAsYpPGyC4U4+4ldPbB31AotZYlz
   A==;
X-CSE-ConnectionGUID: q3DGuInhR8+ce/n5ZpS45g==
X-CSE-MsgGUID: 5/zhCLSiSJ6c+mDx3C0PEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="63295427"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="63295427"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 12:40:39 -0700
X-CSE-ConnectionGUID: 76pOLYBoQU+KNrpAApe6xA==
X-CSE-MsgGUID: dKUz0fbXSCmDJwXiyTG/bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="175836776"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa006.fm.intel.com with ESMTP; 19 Sep 2025 12:40:38 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1uzgyB-000000003NR-3xAV;
	Fri, 19 Sep 2025 19:40:35 +0000
Date: Fri, 19 Sep 2025 21:39:55 +0200
From: kernel test robot <lkp@intel.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: [linux-next:master 9459/11136] htmldocs: Warning:
 Documentation/dev-tools/lkmm/docs/herd-representation.rst references a file
 that doesn't exist: tools/memory-model/Documentation/herd-representation
Message-ID: <202509192138.fx3H6NzG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   846bd2225ec3cfa8be046655e02b9457ed41973e
commit: 1e9ddbb2cd346e42256c5ede2cc40439f2f99bb7 [9459/11136] docs: Pull LKMM documentation into dev-tools book
reproduce: (https://download.01.org/0day-ci/archive/20250919/202509192138.fx3H6NzG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509192138.fx3H6NzG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/dev-tools/lkmm/docs/herd-representation.rst references a file that doesn't exist: tools/memory-model/Documentation/herd-representation
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/gpio/gpio-dsp-keystone.txt
   Warning: Documentation/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/trace/rv/da_monitor_instrumentation.rst references a file that doesn't exist: Documentation/trace/rv/da_monitor_synthesis.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
