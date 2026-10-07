Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496AD36920C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 09:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366980; cv=none; b=uTH0qdVrkX/j7qAgGQe3Ln5BQNM/RfylezoNlRiary2Ft0Mlu+nof4+rJOQEj3ciBlA/P9/wCm8k2hySoErkFjxFPX6bBA/93LZ3vhsenPQDpxvWXvj1fHlOJr+eM9lm0975HTB9UbDEe1zbVtqc/xAWzoBRU7YMimyHqFNWq6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366980; c=relaxed/simple;
	bh=hyI49LfkX8kRdPr4r0JycqrQk3lYGPmEDcqCtwvCOFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DXOwujLSo4nUe7SSN1j9NfLWu9QdYsDcfjA7hjnSyheFvNC+dn+MDuB+ERH/DGuPwxrlzYIlDOdz8ExHvp4PY8oR7k7epRuVsBWyGMWKP0RbQSWWiv+IqpRvf7w8FM+foEdTV+LAmTeelwWI/L0e6q6QnAvoy+GZoD2xdtRPMSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KHrn/bwF; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KHrn/bwF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791366969; x=1822902969;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=hyI49LfkX8kRdPr4r0JycqrQk3lYGPmEDcqCtwvCOFo=;
  b=KHrn/bwFxQfpHbxn4PscQk09ZZVGaK2ZE+UTDsEt2b89nj3sCmNEOpVy
   JBc7K3dZXkJEQHa8udAY1y/LSQOLdULIco2pqi4AZKYPSLjAhDeRBVfjM
   /G9c2FOpYQIxs4ex0bzt1vlji/ig4Qq5OIdoLg3L5KgPU/fwZvc+ul++9
   N9Glx5w3JrIA2xGRzKl27Oj0U5d6OQNXi6a42AKjMcIC+6YPGxFZBfDS2
   XsYJAiOZZ8s5p7xamX28l18nC2332hQF9uC3whgODJFYCeBXi8ki0Zxhq
   xPkGWfA8MNfQDerdmupYuvB1aLoIppSxZV6qjF5FEKYdrngfhDg2gpgD6
   A==;
X-CSE-ConnectionGUID: +ekxHku4QFq8gE/yE8gWqw==
X-CSE-MsgGUID: aDXfl7miQJGXd1McKAWSdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="116700"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="116700"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 02:56:08 -0700
X-CSE-ConnectionGUID: 88yYiJ7MTuCx73MaPEWrkQ==
X-CSE-MsgGUID: PM33rr+lTe24ppSGkm9rPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="285332292"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Oct 2026 02:56:07 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEONZ-000000002ma-12Qr;
	Wed, 07 Oct 2026 09:56:05 +0000
Date: Wed, 7 Oct 2026 17:55:21 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Isma=EFl?= Bahloul <i.bahloul01@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v6 7/8] ALSA: usb: babyfacepro: add the hardware DSP
 EQ
Message-ID: <202610071736.GTyA7cO8-lkp@intel.com>
References: <20261003194137.86176-8-i.bahloul01@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261003194137.86176-8-i.bahloul01@gmail.com>

Hi Ismaïl,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on tiwai-sound/for-linus linus/master v7.3-rc6 next-20261006]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Isma-l-Bahloul/ALSA-usb-add-RME-Babyface-Pro-driver-core-probe-PCM-stream/20261003-214130
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20261003194137.86176-8-i.bahloul01%40gmail.com
patch subject: [RFC PATCH v6 7/8] ALSA: usb: babyfacepro: add the hardware DSP EQ
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20261007/202610071736.GTyA7cO8-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610071736.GTyA7cO8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610071736.GTyA7cO8-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: sound/usb/babyfacepro/snd-usb-babyface-pro.ko: symbol '__divdi3' undefined!
>> ERROR: modpost: sound/usb/babyfacepro/snd-usb-babyface-pro.ko: symbol '__udivdi3' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
