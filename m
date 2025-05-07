Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7649D1DF271
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 08:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746607809; cv=none; b=cJgQa9Fo1MSjKs/eBvs0dkULW3XhlrxbkOWvz5cSSEeCjGRTtPmkrZoXnosK3H3jFgJ3xg2Z52iQWUCPd7OLZv6saNA2RAGRr0DsbK3nTKHxE7HM6BZHaa/IhyzhbXSSdljj+tnw4HlwSOx4/9LTr5nHGdAb0zj6g+KePIPGC3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746607809; c=relaxed/simple;
	bh=WyjDwGk/tmGPJ3Kk7SZcBrBofn8Wz6HHKg8I/2ykdos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjSF8HX2HPnOl0viqevuGifcdmZ8AAwujRujvu+blTTNJumnc0YyHp3BzN41fDylltDlR8iU2c7tV2uQCiyecCzykZjs188tx1xagYoFqAUOs0AHPzt6HAg52vgkXG2fkiJmNel8EUFJG19gM7wXIL5lc8i+kJaulmbxjTPCLIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DCHvUAnH; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DCHvUAnH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746607807; x=1778143807;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WyjDwGk/tmGPJ3Kk7SZcBrBofn8Wz6HHKg8I/2ykdos=;
  b=DCHvUAnH8137nWHU2lNXiB/GyaTF/FbifeyxLhKtvlZAiWD5FLc1yRyq
   BROj13WAUKdEhsKM7YZ6bJRa7Mo+DTMCQv5luZI2uk7DiqJzjkc3pPezr
   v6OEVwUzoz9pjF360etnnZWy+Y59XFzrCadIIdsPDMcVMpvSgb/4qTHUt
   wmR4baWB4ekxJSCj6fB2VLYCH9JzIuWY6cJCzPqEypEOdaA9HeOtC4Ttz
   jV8RwakcTRZenzfnqzJrFGdjAhHvGa0HL5GixhGWEq6Xd0Kbd6md2jT4R
   2xbXAgDRXW94YIXZ3MscKqq06MNLk40KcvfF4UnHVIx8nlgdDnDt1GAZY
   g==;
X-CSE-ConnectionGUID: YL88SFMTT8yEFPt88ZEwGg==
X-CSE-MsgGUID: KN5MDuzNTDCs28/Dd94oQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="35953234"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="35953234"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 01:50:07 -0700
X-CSE-ConnectionGUID: tl978WqFRQGjPiYm0wzaiA==
X-CSE-MsgGUID: br/W5vKlSaGTs70TKB57lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="166938098"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 May 2025 01:50:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCaTb-0007RZ-25;
	Wed, 07 May 2025 08:50:03 +0000
Date: Wed, 7 May 2025 16:49:52 +0800
From: kernel test robot <lkp@intel.com>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC/WIP v2 2/9] media: qcom: camss: add generic vfe
 handling in vfe gen3
Message-ID: <202505071629.t2ZIiCIF-lkp@intel.com>
References: <20250427070135.884623-3-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427070135.884623-3-quic_vikramsa@quicinc.com>

Hi Vikram,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250424]
[cannot apply to robh/for-next linus/master v6.15-rc3 v6.15-rc2 v6.15-rc1 v6.15-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vikram-Sharma/media-qcom-camss-add-generic-csid-handling-in-csid-gen3/20250427-150648
base:   next-20250424
patch link:    https://lore.kernel.org/r/20250427070135.884623-3-quic_vikramsa%40quicinc.com
patch subject: [PATCH RFC/WIP v2 2/9] media: qcom: camss: add generic vfe handling in vfe gen3
config: loongarch-randconfig-002-20250427 (https://download.01.org/0day-ci/archive/20250507/202505071629.t2ZIiCIF-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071629.t2ZIiCIF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071629.t2ZIiCIF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[8]: *** No rule to make target 'drivers/media/platform/qcom/camss/camss-vfe-gen2.o', needed by 'drivers/media/platform/qcom/camss/built-in.a'.
   make[8]: Target 'drivers/media/platform/qcom/camss/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
