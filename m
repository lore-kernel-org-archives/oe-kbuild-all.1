Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606642C182
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Aug 2024 04:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723694940; cv=none; b=gF3UN2mu2f6oMJxT2li9T3J/jOUHWjr3org5R1gNL4SjhWavCDdg8mYSjCHr9tH8SOykM2+uvYC2VwaRMl616edCtAJAyFDFnvleyLBRypS6ZWmxv2efZfTJcVBcyhAMmJP6dhcL/7HWtHNLkl3JAl75/hZ9rBDJtCWOvA9xb4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723694940; c=relaxed/simple;
	bh=trhOyvQI9XKB+RVhhQPeSbuJj3tgDlbkJRE1Az94zik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qGwH76haJI/LpSMIClRgQgxzjsnPft5FxnuVjwLYLIk6VSPNoN2Q4ZZZkIewfVfIGeWCczXonNazw1oCO5OssceOSiPKEa3LmnSBwn3MXd3G4JMOA0CVW9FqNpZ45JiewBgt+P+FBcp08tMDAi3jjnXHBlnXUggJHl7d6lhtshU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zp9MKARi; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zp9MKARi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723694938; x=1755230938;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=trhOyvQI9XKB+RVhhQPeSbuJj3tgDlbkJRE1Az94zik=;
  b=Zp9MKARiWaMu6PTUXIeZmkRCG6eMljSbC+eN6b5izvXkUTpLZe8gdLkV
   uvcfg2pXH6XBGA6X8ML/z4N/BRQ/ZfM3sfkzXQ7ctw18Zsu6oDAqckl5b
   lNIRtfxpAzyG6hix5ttF9gkI81pdCCboEUh3LMJIAgrKE4h9fAtBfdGUM
   V3LZqWxS0xoU4k8G2++2B2vcUhMkQb87Hji/xrHqZr8VONEm+NaqLOBoQ
   MQa+MeE7fqC6t2glCg02CtS243+b0SAMMO7A/B4vVZJibzSNzLQQQ8dzR
   RPlsr4+MtCb3b6v57XPF+0EN4uQmUykDuESgxUyWkMxNkGtlMErWTvHA4
   w==;
X-CSE-ConnectionGUID: 69aFd1RYQ+KOgG4w7DmAtg==
X-CSE-MsgGUID: txpycoHqSpSmVW9zDaaOCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="39447709"
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="39447709"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 21:08:56 -0700
X-CSE-ConnectionGUID: w4Ec40jDRf6x/AX+5v1k0w==
X-CSE-MsgGUID: Gzh5mlHGRuSlnQz7elNEog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="64168149"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Aug 2024 21:08:55 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seRnA-0003Ao-1E;
	Thu, 15 Aug 2024 04:08:52 +0000
Date: Thu, 15 Aug 2024 12:08:50 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 5/5] block: implement io_uring discard cmd
Message-ID: <202408151155.ApEczCa2-lkp@intel.com>
References: <6ecd7ab3386f63f1656dc766c1b5b038ff5353c2.1723601134.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ecd7ab3386f63f1656dc766c1b5b038ff5353c2.1723601134.git.asml.silence@gmail.com>

Hi Pavel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on akpm-mm/mm-everything linus/master v6.11-rc3 next-20240814]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pavel-Begunkov/io_uring-cmd-expose-iowq-to-cmds/20240814-224344
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/6ecd7ab3386f63f1656dc766c1b5b038ff5353c2.1723601134.git.asml.silence%40gmail.com
patch subject: [RFC 5/5] block: implement io_uring discard cmd
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20240815/202408151155.ApEczCa2-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240815/202408151155.ApEczCa2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408151155.ApEczCa2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> powerpc-linux-ld: block/fops.o:(.rodata+0x90): undefined reference to `blkdev_uring_cmd'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
