Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC1E3E479
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Apr 2024 08:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712046894; cv=none; b=FXPT7gEk/bUVPCTqcuhhHIfT08JSiqgZR/I2qxoq3OG+KOVZfm4RGyQpymTKRYq0wyXdLiI8PdGs0t0uaq2RGa+eumtlN4evHDYNytJEb2QdmEG5sAWM/IqBpk5lBVZAZ9HktcqaI3W47vBFVEaJ1MH98vudD2ociNGfNoJ9kjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712046894; c=relaxed/simple;
	bh=N+vg+rqPUjXewNa+Z2tDR6F5vyf+yMWtt3YikIb7Uec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mw0D84Lw0knJUpa9r8Boc8/B/YpydznLcLv3FDaI8VRYQ1QrKFbt8K5JW98Sx6gM4Ny/KA0bxJMXNhJDrl2M1fmDhlBx9rGB526TYAxi4rOGHBDpqnTPOLcxREZrlS5qa6ZpmJ7UnFtFhheDkhXQX0Vt3SGNZqL+U6GxxELQTZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RqWWptxM; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RqWWptxM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712046892; x=1743582892;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N+vg+rqPUjXewNa+Z2tDR6F5vyf+yMWtt3YikIb7Uec=;
  b=RqWWptxMM5UYU/GVo0OX3TBB4vnczv5SwamEjToxIsY6EVcMjzwIlqeZ
   auHShYRSniWopW3msKAReGQ6mJ4ME8qW0JWdL0uVhQjZLX6r/o5K54c7A
   i1X9kTST5ETjXl8yUeY1TAdcUXa+ek9NI2ZZ+IFLD5l/vjonIcIkA2KHE
   jkOfXbTCYzU92vBF8aE/ewl/T80pd2q4Oj8Bbw38Dq+YFLkV9l0CC0VwY
   0znCno2LpK6VJY4F3qf0tQegWwe2TMTpO+80GWEYNBBWlQUeUC8yvVvjW
   9TgFoELoM+caa0vFIIj2vNZ0Gpd2mXw41GCVG1u/poZ/A8sv2HVqWX4GX
   w==;
X-CSE-ConnectionGUID: cHgtRx0IQzyKQu9k6Iukvw==
X-CSE-MsgGUID: tSphMVcVTdSD7TeUgZZP2Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="29680617"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="29680617"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 01:34:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="22439172"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 02 Apr 2024 01:34:49 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrZbS-00013J-30;
	Tue, 02 Apr 2024 08:34:46 +0000
Date: Tue, 2 Apr 2024 16:34:24 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 11/11] pinctrl: aw9523: Remove redundant dependency to
 OF
Message-ID: <202404021642.1I0w7URO-lkp@intel.com>
References: <20240329105634.712457-12-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329105634.712457-12-andy.shevchenko@gmail.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next linus/master v6.9-rc2 next-20240402]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/pinctrl-aw9523-Destroy-mutex-on-remove/20240329-185957
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20240329105634.712457-12-andy.shevchenko%40gmail.com
patch subject: [PATCH v2 11/11] pinctrl: aw9523: Remove redundant dependency to OF
config: i386-randconfig-054-20240401 (https://download.01.org/0day-ci/archive/20240402/202404021642.1I0w7URO-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240402/202404021642.1I0w7URO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404021642.1I0w7URO-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/pinctrl/pinctrl-aw9523.o: in function `pinconf_generic_dt_node_to_map_pin':
   include/linux/pinctrl/pinconf-generic.h:216:(.text+0x891): undefined reference to `pinconf_generic_dt_node_to_map'
>> ld: drivers/pinctrl/pinctrl-aw9523.o:(.rodata+0x4f4): undefined reference to `pinconf_generic_dt_free_map'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
