Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E0418870F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 07:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732261864; cv=none; b=Tz2oL7eM+KnQIKqoxQE0j9d5KEmCvS1PtzA2DZzkaJO4pigjBJlmZOm91yZ5H2cbP2NHS2u1XLawyEm+KBjz8jHoZc6ghEpmBQiZ1S3a465/f2IHgi38w2r8bumAycRwwEi0E4phW6rgr/F48LRD7963DFxuFNyQA9CCpqPLj30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732261864; c=relaxed/simple;
	bh=bLSOwz/RUGNYoCAPEAIyUPNe5QElJxvX7KVNHPSWshE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mi5fSvt92/h/n9jP9Iwguj3JqYfjU2cfRgwuN6V8rkzOsF3lclXWlGjYk+1N0WCL2IRAbhh8qANano2EItvuyXEvsbR0F7te2jHlV8gXktIS6bzfUnUNQGHmUxxXM3iWISyZcoLa85Oulf0FNBsr168V3X/zvZPeWaztqhMJnp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TfqXFfO/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TfqXFfO/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732261862; x=1763797862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bLSOwz/RUGNYoCAPEAIyUPNe5QElJxvX7KVNHPSWshE=;
  b=TfqXFfO/i2gSMyI+gQshxraxrGmb9m8O4cM9AMGlRJY0CTsbRmMGhYei
   X+OIn+ASoHDEbIufMqfYR94HvB7JIVuph1rVQ7RGtsPsNPhpXnv1gJfa/
   T+PtcYNuO4J8avq0iHD0YgNGXIKmRWwYFhahCGj9Wh0pyY9YDvYR2uM7B
   zg3PsM+jnm/xXUG3tGKtmWjLfJIXsXzQbkMdrtD0GLB73B4RNJkRCo1pb
   CEO1x9ofMpnJIVyciUtOpAWviRf3ctllbb3gFSOmBIJNtBiyZdplQNeRp
   RLwkWc1LbMRxMNekfN2juTSB/KNtRYTvNiOBvwjquy4oqrPIgbFT1FRzs
   Q==;
X-CSE-ConnectionGUID: siydYqAgQeGgUfztjP4uXQ==
X-CSE-MsgGUID: K4tHBeivQjCFOoIE25L+qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32338863"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="32338863"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 23:51:01 -0800
X-CSE-ConnectionGUID: MX7dNzxXRV6MaAu4Twm0Jg==
X-CSE-MsgGUID: YJoCD09yQg+a2NWqbX+U4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="90440335"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Nov 2024 23:51:01 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEORN-0003m1-2x;
	Fri, 22 Nov 2024 07:50:57 +0000
Date: Fri, 22 Nov 2024 15:50:36 +0800
From: kernel test robot <lkp@intel.com>
To: Laura Abbott <labbott@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Justin M. Forbes" <jforbes@fedoraproject.org>,
	linux-doc@vger.kernel.org
Subject: [snitzer:snitm-kernel-6.12/delstid-localio 108/4957] htmldocs:
 Warning: redhat/kernel.spec.template references a file that doesn't exist:
 linux-%{KVERREL}/tools/perf/Documentation/examples.txt
Message-ID: <202411221549.rpyb1lPy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git snitm-kernel-6.12/delstid-localio
head:   f102a32db07d849c674ad967119239239a8730f8
commit: ca6d0d838cc43107728a2f2f373fed003e6d935f [108/4957] [initial commit] Add files for generating the kernel.spec
reproduce: (https://download.01.org/0day-ci/archive/20241122/202411221549.rpyb1lPy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411221549.rpyb1lPy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>> Warning: redhat/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
