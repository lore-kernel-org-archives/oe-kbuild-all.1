Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5C013A890
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 22:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713307578; cv=none; b=ijKCKYTY2UVgl/HT3cyjNjHsv1Uk92d1v7vgsUQx2nhWSt5DliDmEIvRvWGwF09aG4PGWtFXPcMUFOkQGlJf8ShEu6/SbSofX+8XfPGSVkY8EhNVJ38eGI4MoXrUdSsGo+eaJBGfIh8/t9IKXe/QKp30l7m118Htikof73F7YWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713307578; c=relaxed/simple;
	bh=llxZo58VP9At2K8lhG3Bchvf9TeT0/Wc3kqodjf0g5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oV8koP1c3GGZlPcR1TbVD00fPgNtt7hGJxEWoiMT4Qjfo1tPM+0AL1IPP5NWyDFmXRwnsLkX6Lwt4B9r6HGWfXUJH1yyfRzKHOtlCWogRPWXvdPa09iluE3NNLDBojLtswqHQon3mGbDXIpj6Y94C5ws1lSQpgD71cOG+CZ0+rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ldtuQV0L; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ldtuQV0L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713307575; x=1744843575;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=llxZo58VP9At2K8lhG3Bchvf9TeT0/Wc3kqodjf0g5U=;
  b=ldtuQV0LGbagicObrNxGJReppzd2E04ODtx6XWK8GULxHFNJHU7eR7O7
   S0KBKJpvVq3ypMzF6IInKlPyVELWK1CUAk7cwjzaes7ZHzqbEpTYH4OAZ
   vtfyGSoo4xPjwT25zXtvFuIFo55PQD/KWMvYNPsQuf8MYvEPNfHExDbQ0
   9BCaH8xhnR3RQkjR82kLTipqVpbCFSTxpY1z8HSkvNwHJXbe4jSACKbyI
   vUabdjorata/GtINvVWjxPB0wDr/84C9otork/O7etYqdG55h0iyVaChN
   1YGeFFHwIBHJJtSmDLo2QjzZR2bfiG3YbR2n7ueSogUrGpE1VLOjwVjjf
   Q==;
X-CSE-ConnectionGUID: VMpmz9vYTKKPNNCr5P4IOQ==
X-CSE-MsgGUID: fDsLrJJGTgOYbigflMmQFw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8641069"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="8641069"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 15:46:14 -0700
X-CSE-ConnectionGUID: IwhoHhQ0SmaPL59GKQy8TQ==
X-CSE-MsgGUID: CI93jiQiTi2bbLD+EoKvsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="22480291"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 16 Apr 2024 15:46:13 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwrZ5-0005o0-0K;
	Tue, 16 Apr 2024 22:46:11 +0000
Date: Wed, 17 Apr 2024 06:45:55 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 4/4] kbuild: use $(src) instead of $(srctree)/$(src) for
 source directory
Message-ID: <202404170634.BlqTaYA0-lkp@intel.com>
References: <20240416121838.95427-5-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240416121838.95427-5-masahiroy@kernel.org>

Hi Masahiro,

kernel test robot noticed the following build warnings:

[auto build test WARNING on masahiroy-kbuild/for-next]
[cannot apply to masahiroy-kbuild/fixes wireless-next/main wireless/main linus/master v6.9-rc4 next-20240416]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Masahiro-Yamada/arch-use-obj-instead-of-src-for-preprocessed-linker-scripts/20240416-202308
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
patch link:    https://lore.kernel.org/r/20240416121838.95427-5-masahiroy%40kernel.org
patch subject: [PATCH 4/4] kbuild: use $(src) instead of $(srctree)/$(src) for source directory
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20240417/202404170634.BlqTaYA0-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240417/202404170634.BlqTaYA0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404170634.BlqTaYA0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> cc1: warning: -I: No such file or directory [-Wmissing-include-dirs]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
