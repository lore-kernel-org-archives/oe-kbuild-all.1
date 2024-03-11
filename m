Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CBC11181
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 06:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710139838; cv=none; b=VAD0Ar0tTAQjSNYq/kXJ/t+aB9Sv8/6WdufJ7tvKV7ef+ZNNxcytWwE8X/m4eyL2UQlr9H9Te3mtqRYRJmprEKP4HvdDD5PiiogR+nI0FzHGAtK0zY+xH7hXTYMTo157Glg+X1GL8Tn+Uj9UK8kcFuyUgmjlKhfL9vhMgMmYKpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710139838; c=relaxed/simple;
	bh=nEFKirIi/OPtUiDx+M+tbhcWJaMsx6KesBu3zUie8pE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JUR8ueKSPMeCnyRHUUIIBHR0kh84GlO0XtwWU47KCZyKE6MaKQYF1y7YVwJIYgte6+wOyiVhqNLodF7jBEn84CdnsFlai3ZrSOaMUN8St96vZgtSdydiy9Fy8mqY7fJFcExzuTzv5u8wVJCE63HhQof2HInTU1Llxb6TP8VnIKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E/EucV5e; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E/EucV5e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710139837; x=1741675837;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nEFKirIi/OPtUiDx+M+tbhcWJaMsx6KesBu3zUie8pE=;
  b=E/EucV5ew9CoGmc6UBGZ7kbdL4n+RRj50Wo6qiMS9TTkZeDmvk9uStaR
   AwOwegevHEZrG0CzXjEKGkl7QGCe74zq/DwXQUu/V2neeE13LRXifBczP
   7EOjWewbENf0CBKX/5pqA7rALmGkG+dPdfv63H0pOdjTIPBW9X9Yto72K
   DoNTkAjWgdgY5XIBK6S/IowrQN37YKX1CdCZLf3v6YwC5ymeX+KkmMzPy
   QEFDiPCr031bx0HlzgPdTm+Gz1u4/Ah9UgAePUJGn1kXCxrNsh+3rn1yH
   PyA6aMaCpA//YSP3sJX/vBHjDy9+07cYUz8K52KWamGOgfgF6cRHPlnAE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4925284"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="4925284"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 23:50:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="15563323"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Mar 2024 23:50:35 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjZUX-0008xv-0F;
	Mon, 11 Mar 2024 06:50:33 +0000
Date: Mon, 11 Mar 2024 14:49:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [geoffreybennett-scarlett-gen2:vocaster 12/14]
 mixer_scarlett2.c:undefined reference to `__aeabi_ldivmod'
Message-ID: <202403111412.ScKRvZ9a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/geoffreybennett/scarlett-gen2.git vocaster
head:   ce1668580ca3badaca4f8350f738ae5e91ee50c1
commit: dd8657c33cf1b8145bab99aba647a8791f8f81f2 [12/14] ALSA: scarlett2: Add DSP controls
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20240311/202403111412.ScKRvZ9a-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403111412.ScKRvZ9a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403111412.ScKRvZ9a-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: sound/usb/mixer_scarlett2.o: in function `scarlett2_compressor_ctl_put':
>> mixer_scarlett2.c:(.text+0xbca8): undefined reference to `__aeabi_ldivmod'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
