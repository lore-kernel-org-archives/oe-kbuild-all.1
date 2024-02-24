Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9B81AACB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 11:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708774137; cv=none; b=QrGxEB4Pz4eK8VEuGq84ibLDJifK4K3TYi+eobi6NYwNG3Wxf/X06f/iKTff2RG9B9ui2ONwfLkZpIz6e1cvGmCw+te1miSyPFAhi3Oqu8iZmj05lQJu8RzWcEN1HGKPswOwPg1ylUg79LuDiZ/C02quBM5dY9uLkySagztUskc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708774137; c=relaxed/simple;
	bh=Vb3AmBP21cxSBdyDHrL1c1aBIg3C6LvQw/nrfUjrbXI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PCqos4NZ/xwyFZ8xLkf83U5XLgJdhfwifFqCHlTV1aOdR6BPzKN2qFhYPYZtiVhSp817xEzTerqJcFowYaA5sw/SDcMNg3C4Wosi1nXfC1IFR6e/8zWGLWWHwntK905EqjRv8HAsJVplRfopIYBADHGWm+04JSUXTIq++PzPx48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G6PT1z+Q; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G6PT1z+Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708774136; x=1740310136;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vb3AmBP21cxSBdyDHrL1c1aBIg3C6LvQw/nrfUjrbXI=;
  b=G6PT1z+QkicTgil96Yp6P5ATMgvdRpAQm9gniMF2lPTE++RQ3vOYa3b/
   ojpXAOTkB7PCaVgxr9IUeXsa1eBtIFqUKX1+bhzJaR5hThYY0XSqfSzR+
   WnvCbPqPotIPZdXIZhCVC8VqKNpbe/8gbkzeAP6dX7DMl17AIQpukkNHx
   t4Bhon/sOhvkkVCEsOcsqTTtj7W51ss2k7ZJqX1jRLdUWqCGA9chuzd26
   uVYhiHgBLhrGRzd72aA1AtNGtR7sMoh4y1s3JxaVpE3lOLNj0cC6eJhjM
   J9YjUPa9qe12uV36PE77l9EpH3gddPQeq5AxxF5IsxvQxccKMA5yP+r7Z
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="2985605"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="2985605"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 03:28:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="10740518"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 24 Feb 2024 03:28:54 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdqD5-0008Uc-0l;
	Sat, 24 Feb 2024 11:28:51 +0000
Date: Sat, 24 Feb 2024 19:28:11 +0800
From: kernel test robot <lkp@intel.com>
To: Yang Deokgyu <secugyu@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-5.15.y 28/204] make[4]: *** No rule to make target
 'drivers/staging/fbtft/fb_hktft35.o', needed by
 'drivers/staging/fbtft/fb_hktft35.mod'.
Message-ID: <202402241952.DD869UiN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yang,

First bad commit (maybe != root cause):

tree:   https://github.com/tobetter/linux odroid-5.15.y
head:   200d2466033be9a082bfb81368de8a994e399a02
commit: da67b773b1fcd150b4fce3af576ca96813cbf334 [28/204] ODROID-XU4: drivers/fbtft: Add fb_hktft32 module for Hardkernel 3.2 inch TFT LCD
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20240224/202402241952.DD869UiN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402241952.DD869UiN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402241952.DD869UiN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'drivers/staging/fbtft/fb_hktft35.o', needed by 'drivers/staging/fbtft/fb_hktft35.mod'.
   make[4]: Target '__build' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
