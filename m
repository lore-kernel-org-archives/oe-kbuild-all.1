Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AC4143C4D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Apr 2024 10:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714128409; cv=none; b=ZJMuZLU125W8h1gvIzaEj2NJV92dhGPJ9q9C2qlMA2bdRoV7p6KxMdtABt2+g8QT7uVW7GIKLL/1lgj1YuBmXcBpyS/TAKvnflYVYSOJsl6bE7YuwYHngmus04B9ZheP09FmN+1B/ZTQkYcJXXsiaYA80bG2+PCOV+I+6rvAUq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714128409; c=relaxed/simple;
	bh=NUOpz5I5zwt+43ehEK1mOWYVfGMo5kprRfpv1uqpwNg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D7QcWEej9etK9tY5OhUhHJ4NtN4AvFJln6DDuiLRfb8GWgshrK2MinMzZsMQVntYTN9yVZn9lqHuatHMX5JVnstuJbvmX/bPB2L67q2U6fc47RsvjMB4+v0iYpW6tM1REPK8eyvf0gqYsra4hXc955g97BDy9I6KFYMKKdMR0/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SeSWDmVA; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SeSWDmVA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714128408; x=1745664408;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NUOpz5I5zwt+43ehEK1mOWYVfGMo5kprRfpv1uqpwNg=;
  b=SeSWDmVAgp2+e/Yoz9zUpM1MBZYXUVWSwWuZPVzREfICmqP4XUa6jsrF
   vSF+mzK4w+c6j0XY4P3VIZ1R+J8rJOp2wI17J13FFEKgzbH9aC/xj1Q44
   ljI0OpkJzCaIL8kqnX5ndoimeoWFcDcTfN/4vuznFrfI0suifyafm+Nvl
   ozkbvzDHa7mjjaJ1r21HlK5NSviI6NutgUJ1jars/lyHNHWijtG2M//HG
   h7qSTjTV5zOyRs1jduJtR5C5wTUnNe9XNcPDDJmHORUB3QgYcyJRvWnGa
   ECFhQmlCI5F6FvwUGFV1nOOo6Ioy1CSwDLXGz30jOLcO8WZ24ho1OtxoB
   Q==;
X-CSE-ConnectionGUID: JGKqdz+fS0mArhZMLPbG2g==
X-CSE-MsgGUID: 5YoRqHyvRGacBWBIrUKKIw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9721335"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9721335"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 03:46:47 -0700
X-CSE-ConnectionGUID: I4Pf7qkATb2Gze9qOxgy0A==
X-CSE-MsgGUID: dneICB5NQgqmxOUjIs6jhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="25376105"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Apr 2024 03:46:46 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0J6J-0003cH-1m;
	Fri, 26 Apr 2024 10:46:43 +0000
Date: Fri, 26 Apr 2024 18:46:40 +0800
From: kernel test robot <lkp@intel.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-doc@vger.kernel.org
Subject: [atorgue-stm32:stm32-dt-for-v6.10 8/21] dtbs_check:
 Documentation/devicetree/bindings/media/st,stm32mp25-video-codec.yaml:
 access-controllers: missing type definition
Message-ID: <202404261831.rtLHpDon-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-dt-for-v6.10
head:   36cf0d86d760f30b59bc61ffc72c58503c353a17
commit: 13f2bdd7af142c94e2078e1b9db8408d9c1393ed [8/21] media: dt-bindings: add access-controllers to STM32MP25 video codecs
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
dtschema version: 2024.4
reproduce: (https://download.01.org/0day-ci/archive/20240426/202404261831.rtLHpDon-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404261831.rtLHpDon-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/media/st,stm32mp25-video-codec.yaml: access-controllers: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
