Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C8639B974
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Apr 2026 22:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777502408; cv=none; b=d6FAAwVNMQ+ZBxhgAt7ZZtbVqxgEhEIvs8P/PM3Ce5XK2ZMXSA4cYv9JE0U/9m0BereAVeeatxSrczJE6/91AfnTaAcRcbHk5T9C79WGsdNYKT1SzELIjw5HmqhICGytd4/LsqA1c0vSXRZsg+qJUBd1nXGM3nuY9pgAV0Ht48g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777502408; c=relaxed/simple;
	bh=hXB1y2ylPEmcAloNbq7aS8ySLvDCml0iWZuLDnI2OkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hShRWrZ/YDBAj0q0VnEYDg30xD8R0QfDP3xxnIYJSvfozT3FSXXfu2M60EOpa5VFDJn3eS+09Dlq6MyX0xcqws6ETn5m6XtsP4ohbxoMeSaqjZRDhCqqz/JjKQK0bS8PTMIhgRW4nntXbr7GTzkLyx+iAmbym5eETlIkAMzPnJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VxhObwnb; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VxhObwnb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777502406; x=1809038406;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hXB1y2ylPEmcAloNbq7aS8ySLvDCml0iWZuLDnI2OkY=;
  b=VxhObwnbmh0tiO8hpP9FHCXClSCrvPSR5fzZ3QHhDrRtsJa2CqAkHwFS
   ihWq0t0imLozudfxc0Lyy6PdsoEcAfHp4AqvXCFNj720NwwqEiD5SiMVb
   Pa11w+kvhufTq+h0Kc6/+5P0aH85Q/b3H6hNGtd+q0oBgCiHb4ofXt1sG
   FqSY+EPXoerWwoY5yKhp7T6Vo0LX4Du/foPp7OSYknuaHRbtAjUTecH55
   f1H3HDungT7mTh1kN3ZCW5vXwdXvHzb8mvO8suncHBHX8Y7qzcJ/NUah2
   AvbZ7FH5i12mHxCTHGtfPprZLPNxdcaprcOLKheoRpY8xU/BX8NWoengL
   A==;
X-CSE-ConnectionGUID: 2/fm46IXSnm1/XVFMzwupw==
X-CSE-MsgGUID: UdA7Eo4rTrmaQUqkBhpS2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89135877"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="89135877"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 15:40:06 -0700
X-CSE-ConnectionGUID: /yxEjHmTTEaA4sl64NiLYg==
X-CSE-MsgGUID: fkWGh+z2SkGYFeLOdktjsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="234670644"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Apr 2026 15:40:03 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIDZY-00000000BbM-3Gdx;
	Wed, 29 Apr 2026 22:40:00 +0000
Date: Thu, 30 Apr 2026 06:39:33 +0800
From: kernel test robot <lkp@intel.com>
To: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>,
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	decui@microsoft.com, longli@microsoft.com
Cc: oe-kbuild-all@lists.linux.dev, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mshv: Add dedicated ioctl for GVA to GPA translation
Message-ID: <202604300619.sZX0K2OC-lkp@intel.com>
References: <177741648871.626779.11067281081219290277.stgit@skinsburskii-cloud-desktop.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177741648871.626779.11067281081219290277.stgit@skinsburskii-cloud-desktop.internal.cloudapp.net>

Hi Stanislav,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.1-rc1 next-20260429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanislav-Kinsburskii/mshv-Add-dedicated-ioctl-for-GVA-to-GPA-translation/20260429-094326
base:   linus/master
patch link:    https://lore.kernel.org/r/177741648871.626779.11067281081219290277.stgit%40skinsburskii-cloud-desktop.internal.cloudapp.net
patch subject: [PATCH] mshv: Add dedicated ioctl for GVA to GPA translation
config: x86_64-buildonly-randconfig-005-20260430 (https://download.01.org/0day-ci/archive/20260430/202604300619.sZX0K2OC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300619.sZX0K2OC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300619.sZX0K2OC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/mshv.h:325:14: error: use of enum 'hv_translate_gva_result_code' without previous declaration
     325 |         enum hv_translate_gva_result_code *result;
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
