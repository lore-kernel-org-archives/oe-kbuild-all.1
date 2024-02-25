Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E780D9450
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Feb 2024 23:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708902045; cv=none; b=c/gTMmTnuzNRVqG3I1Z2NEZEWjQCLNPrnmjnFjjti2Pu7sAslMTrIU1e54KU0az70awtCnO9qvS+cj57BDjUNRmedPI/K3/I3caznJ5CmAd8RdlSCtZd9Ztx+Et3xjyjIaDcm8BCQNHKqZxhZMLG0BU51lNIlO3uO5GcJUgF2p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708902045; c=relaxed/simple;
	bh=albL6F7FkC23WUPOlg6aGTqms9cLylJpRRzHBl28s2M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sn/EyammQfHurhTymncLd8q1rwdMFXU7tFSejeB4Sg8/+7w77T8Ukoq23PkqcpYGIYswGZGHupwRZhNMoRNaJGDDAdgASbv9O0JtEIPXdBRTiu+L+6U9PBrTZev3AzIu5XLzOg6X0wNIMyqmSFMqbrE4/7fJORsSbz5fz8aLQ+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EMDoabZV; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EMDoabZV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708902043; x=1740438043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=albL6F7FkC23WUPOlg6aGTqms9cLylJpRRzHBl28s2M=;
  b=EMDoabZVmEEIrHofTUeNwp0nVqFUg84z3Uf2rCR7gexaRYo/gfJwKen3
   DRJEJFzUF7pJuSaQA7z0ouzplCjlGs/sV8ugGl026gQDYCUC1pQuzaUM0
   e5tOYITyCtmM40RaA535rPvfUONFx/kXUn+BhR3HPASn/3UxaRhhjBNzA
   F/CKeUJeDcVf4UGtGQ4F06WtcXP9IeAaMc0KxCoA4dgXi/2HlwH7nzsWz
   eYkMu43JzVzWD77R8nQlg6gB55Vtap3Q8X44ouI+mixmwOv+Wiklv98R1
   Iq7N43/o+Y90PlqXpmAvoV/Dprt/UNO/mKVCOOHax6Em96AYiQLxnZ20K
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="14303499"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="14303499"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2024 15:00:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="11044752"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 25 Feb 2024 15:00:41 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reNU3-0009qA-2h;
	Sun, 25 Feb 2024 23:00:37 +0000
Date: Mon, 26 Feb 2024 06:59:51 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Suren Baghdasaryan <surenb@google.com>
Subject: [surenbaghdasaryan:memalloc_prof_v4 37/37] lib/alloc_tag.c:157:6:
 sparse: sparse: symbol 'mem_profiling_enabled' was not declared. Should it
 be static?
Message-ID: <202402260628.g62gq573-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/surenbaghdasaryan/linux.git memalloc_prof_v4
head:   7ca367e80232345f471b77b3ea71cf82faf50954
commit: 7ca367e80232345f471b77b3ea71cf82faf50954 [37/37] lib: introduce early boot parameter to avoid page_ext memory overhead
config: x86_64-randconfig-r123-20240226 (https://download.01.org/0day-ci/archive/20240226/202402260628.g62gq573-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240226/202402260628.g62gq573-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402260628.g62gq573-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/alloc_tag.c:157:6: sparse: sparse: symbol 'mem_profiling_enabled' was not declared. Should it be static?
   lib/alloc_tag.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +/mem_profiling_enabled +157 lib/alloc_tag.c

   156	
 > 157	bool mem_profiling_enabled __meminitdata = true;
   158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
