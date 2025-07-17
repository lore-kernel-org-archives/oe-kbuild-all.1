Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B43333E7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Jul 2025 19:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752779184; cv=none; b=XgZiIKelyUp6udisLLaTAWFZPnJN+YzAXkG/JDL6aJaNzyznPM82dRPyg0VGmxECiUUMIYOucx2CyRFAlkzAma9PYUaIe0oU1iF6Y7GbBMplwkNrRpNYa2YgiObdQtSbZ0c8LHYP9PxxhNlOMzob/MmtLJRsxTlmDT7IJ3t+HPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752779184; c=relaxed/simple;
	bh=hMiC3+Ji7Crf6sccHxxqc6YQIl7afLlP7hPIHhbJgR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JrdRMRjUAHH24Ed0XIjW8uqThSKY+LAlBefRfdMYQsymTDAMqoeRia6QmoMADiqkoiAZqDZzYKZqb5KkxLyP2om3S3Mu3aV21evTjrCAqRhuywC0BTr9NuK2ZSjeo52x4YszkViZniDCkev+ZooKV36srlXipoTyJWUsItqsfjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=etPyIz4W; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="etPyIz4W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752779183; x=1784315183;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hMiC3+Ji7Crf6sccHxxqc6YQIl7afLlP7hPIHhbJgR4=;
  b=etPyIz4WzbmwF0nUyGQfW37dy6wuGdgk/VC3fo/WP7ZQwb4k2kA6LU3G
   42Uf49q2Wfo6eSo2Vs137P5lVABhGjwTK9wyQMv5Iz4HQipUtna4YueFd
   32k0JHcQtQWtuVl3EA9Qqjb5aDbhbNR3w3Mn0awdi5BsA1PBPLlmi8bro
   87lX+zoQBWvSwC8nBC2/IbgkoUEKJoXT0AmIqStrDE7qpcZvtv/0OewuP
   jBgGjHVozeQtBl0OrYQph27noaqvcckN/NB8KNK7dXFltRfN/J/WDYOGG
   2EVIewENYXWEXwy9ZsT/uEIOOq/MfnouowTnFdsQuYjv/hrIhtxPD43jS
   g==;
X-CSE-ConnectionGUID: CgzY3qCjR2WfDVAm8s6YZg==
X-CSE-MsgGUID: a3x3OzzfQXuKfoczCT6QPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="55193881"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="55193881"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 12:06:22 -0700
X-CSE-ConnectionGUID: 0eYiCsdHQQ6vVW6WuYkxeQ==
X-CSE-MsgGUID: CZT2/FCgRBWJSuKUAlG9nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="157551018"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Jul 2025 12:06:20 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucTvu-000Dwh-1R;
	Thu, 17 Jul 2025 19:06:18 +0000
Date: Fri, 18 Jul 2025 03:05:21 +0800
From: kernel test robot <lkp@intel.com>
To: Bo Liu <liubo03@inspur.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3] erofs: fix build error with
 CONFIG_EROFS_FS_ZIP_ACCEL=y
Message-ID: <202507180258.QfTh8tFp-lkp@intel.com>
References: <20250717053724.65995-1-liubo03@inspur.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717053724.65995-1-liubo03@inspur.com>

Hi Bo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on xiang-erofs/dev-test]
[also build test WARNING on xiang-erofs/fixes linus/master v6.16-rc6 next-20250717]
[cannot apply to xiang-erofs/dev]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bo-Liu/erofs-fix-build-error-with-CONFIG_EROFS_FS_ZIP_ACCEL-y/20250717-134251
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
patch link:    https://lore.kernel.org/r/20250717053724.65995-1-liubo03%40inspur.com
patch subject: [PATCH v3] erofs: fix build error with CONFIG_EROFS_FS_ZIP_ACCEL=y
config: nios2-kismet-CONFIG_CRYPTO_ACOMP2-CONFIG_EROFS_FS_ZIP_ACCEL-0-0 (https://download.01.org/0day-ci/archive/20250718/202507180258.QfTh8tFp-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250718/202507180258.QfTh8tFp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507180258.QfTh8tFp-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_ACOMP2 when selected by EROFS_FS_ZIP_ACCEL
   WARNING: unmet direct dependencies detected for CRYPTO_ACOMP2
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - EROFS_FS_ZIP_ACCEL [=y] && MISC_FILESYSTEMS [=y] && EROFS_FS_ZIP [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
