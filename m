Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BE118B09
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Feb 2024 02:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709002743; cv=none; b=CtHIEUlpZjZDdyLu4fbAuqvRF8LuzQWYbsKLPuow12HyCFTjdSaCqK+VqkhkrLXBxAI26l8Ch5GAs6sLT9qgbZgHN7sNi98tWgMi0Bmhq89AEADbne3+dWCYvbr+u48jnPZShvzZ3GTg5S6rKcUBi1wnAX8KnXLWV0TaIS6A7oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709002743; c=relaxed/simple;
	bh=pG8UkASBn+kleG4FpXjHGWcWzXdV2rPxUqvjSKr6tiE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gUsHk/4LOPI36+EY0PT0NVuSyUngEno84SCvSW7yDtCpa3nvpBjbFI6ion9YaglLbRj4SHS8yNzrhyRMs8IB9BFODmoZOeaVXbcYBf6OAgkoEgZuyXU00DGy5SNpx+aYgYmAMFXv/ac2dy5aqC2HmIUtywFaP9ExK7cY0P+WmYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XHXSkwFa; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XHXSkwFa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709002742; x=1740538742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pG8UkASBn+kleG4FpXjHGWcWzXdV2rPxUqvjSKr6tiE=;
  b=XHXSkwFad9a4niwilHezt7R6/ielF9mWPQo49ZHfEaolbfbRv8xQmpQE
   zt51htkxdCPsOUnkEkz5TfHHNyy2btAked5td6SNWl2iSEy5z0jTgZCLT
   NVhggCn/CPHucO2YWl1adeureWirPL0k9w1yvbgc1rIcoDVAS1N+K3Nrr
   Ap8jZtA3eLqsFcTuFBm4Q6B+EPcsPMuaIVwuzXBuaY5L/joPkRCbPnYjg
   1j085IfPGFB0cSG/chj07+fHcWrcqf5uNwcwYytSsjKEQJLwffHDjFfBx
   NYG64DER9Aj81oMlNP60vzhPx7oiUpXxMePKgQC8RcJd8GdmVq5JFa263
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="20769734"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="20769734"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 18:59:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="7242879"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 26 Feb 2024 18:59:00 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1renfq-000At7-1r;
	Tue, 27 Feb 2024 02:58:34 +0000
Date: Tue, 27 Feb 2024 10:55:46 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>
Subject: [tip:x86/apic 1/2] include/linux/smp.h:221:27: error:
 'setup_max_cpus' defined but not used
Message-ID: <202402271008.YvpQ54cP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/apic
head:   62aaed88843a9a69b5614f99ec4a2930edd09658
commit: 429bb0269058e2e1f4ab69a0d33d374933aa15b9 [1/2] smp: Provide 'setup_max_cpus' definition on UP too
config: arm-randconfig-004-20240227 (https://download.01.org/0day-ci/archive/20240227/202402271008.YvpQ54cP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240227/202402271008.YvpQ54cP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402271008.YvpQ54cP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_bitops.c:9:
>> include/linux/smp.h:221:27: error: 'setup_max_cpus' defined but not used [-Werror=unused-const-variable=]
     221 | static const unsigned int setup_max_cpus = 0;
         |                           ^~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/setup_max_cpus +221 include/linux/smp.h

   220	
 > 221	static const unsigned int setup_max_cpus = 0;
   222	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
