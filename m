Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC32374C1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 17:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gN/4/Pr+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696525428; x=1728061428;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xwH19jaXuV3IRiERrelAUrnpdPnnnaE+ZD4sNqe01N8=;
  b=gN/4/Pr+vqAPm2J0F2s/y7X8yMXKRAvY4iRrxeUUTTJ+fzgMNNMTa+oF
   YD6wEsPpKhI7qvK+2lZoYFP2ctL/NuXuv2Iu3v/gbpfqZibGYLdImgFzs
   itT7ebljepUPc5yXB+iRnC1k4aVlUy7ePOLmt4cOJg+PMofsQ+xzAtGLp
   86/ImyyFtN01x0rb8+NcSPi0Jh0Sbc6pMq/XsSdjD5jyewa1/dEChaAAK
   64KjDH8OVkxz/T10qtijFEiWzFGN/JSeyc3e59erS4vYajlJooDmFAnQm
   iKlUcDl4571umqcNeRRCMExSS3KlUFLgrlbPE3D9Wz8wkZfrmLHDYNjAn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="373912244"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="373912244"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 10:03:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="745528485"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="745528485"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 05 Oct 2023 10:03:41 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoRlD-000Lgl-1p;
	Thu, 05 Oct 2023 17:03:39 +0000
Date: Fri, 6 Oct 2023 01:02:54 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] Input: max77693-haptic - add device-tree compatible
 strings
Message-ID: <202310060002.ucD2eiLJ-lkp@intel.com>
References: <20231005114816.1101953-1-m.szyprowski@samsung.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005114816.1101953-1-m.szyprowski@samsung.com>

Hi Marek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on dtor-input/for-linus hid/for-next linus/master v6.6-rc4 next-20231005]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Szyprowski/Input-max77693-haptic-add-device-tree-compatible-strings/20231005-231602
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20231005114816.1101953-1-m.szyprowski%40samsung.com
patch subject: [PATCH] Input: max77693-haptic - add device-tree compatible strings
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231006/202310060002.ucD2eiLJ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231006/202310060002.ucD2eiLJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310060002.ucD2eiLJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/misc/max77693-haptic.c:415:34: warning: 'of_max77693_haptic_dt_match' defined but not used [-Wunused-const-variable=]
     415 | static const struct of_device_id of_max77693_haptic_dt_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/of_max77693_haptic_dt_match +415 drivers/input/misc/max77693-haptic.c

   414	
 > 415	static const struct of_device_id of_max77693_haptic_dt_match[] = {
   416		{ .compatible = "maxim,max77693-haptic", },
   417		{ .compatible = "maxim,max77843-haptic", },
   418		{ /* sentinel */ },
   419	};
   420	MODULE_DEVICE_TABLE(of, of_max77693_haptic_dt_match);
   421	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
