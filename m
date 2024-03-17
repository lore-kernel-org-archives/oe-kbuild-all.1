Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F010DDA0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Mar 2024 07:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710658997; cv=none; b=MHdN7BShbCrZN97EBIBG8anc9gYzi3Sy5gpA+dCqHbc6SqKe33G2GqhciI3+PQh7XoaPMlhJ2Q5MxtYaGM8ViSg+aLbTnqWcRVzb4IyWDjP22SvmlMuyZKc/dQDaV4Nhd9u10g/1qHxvU7xRhMg9DG/dIT0y69kattiV4ML87TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710658997; c=relaxed/simple;
	bh=uQXQGq8y5C5uyUyUoku/r2G9MWA8610WjVpCr7x/ueY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ALrz45gwRvOP2TE8U0iiPj07CX345dBVvGxYgloHMREVx80ZpkSMNVdAdLpnK0NWGqyfK6tSmAcYnGQ5prq8YKZZN5W+sJKGZNcwxDtN2IdRkxhNIpP7Z2LhBY+tndshxDvgpZK+PoWQHWgAE2cPPT/oq8lIjJGtsnvP4XvnsAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fl9BqJbl; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fl9BqJbl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710658995; x=1742194995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uQXQGq8y5C5uyUyUoku/r2G9MWA8610WjVpCr7x/ueY=;
  b=Fl9BqJbl3BxwSAiqZrr76fALwOdDabXDmd8ePIcLILoUfjgSmhu5c/g9
   CNTMDmUf4FGO3zWwgEWoqWjdfurUEYHje2EQFP12YYZ1wUugje2TIWPbf
   Ae60s6X3JEn9sWEZJUJEySoy7PWMb3Voh7vhpc5+/95NCyRXrZ1cc4vzu
   tI96ng+rlRaInxWpP49hz8Q5BHior1EGZ/A3NVS+PmW4m9oossSFDGzDE
   Im20dPyQjo2P1+nWoZDa1qmmH82sA4VFA0IKPY2Wz3pNh4IocvFEMRniI
   1RfaaS6/aAt3/dx4sQ9bMqsWBx/fSkVGN6/z2r8zZ7/9x6Aopocb8K0Vp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11015"; a="9297550"
X-IronPort-AV: E=Sophos;i="6.07,132,1708416000"; 
   d="scan'208";a="9297550"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2024 00:03:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,132,1708416000"; 
   d="scan'208";a="13098772"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Mar 2024 00:03:13 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlkY3-000G5l-1F;
	Sun, 17 Mar 2024 07:03:11 +0000
Date: Sun, 17 Mar 2024 15:02:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:master 129/143] fs/bcachefs/super.c:97:17: warning:
 function 'bch2_print_maybe_redirect' might be a candidate for 'gnu_printf'
 format attribute
Message-ID: <202403171416.bxYJadXf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   529b45e1c13b7e62beb30e3c17fa265ef59f6406
commit: 83338f5b2cb8406cda8bf7be3f566ab97c696917 [129/143] bcachefs: fix for building in userspace
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20240317/202403171416.bxYJadXf-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240317/202403171416.bxYJadXf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403171416.bxYJadXf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/super.c: In function 'bch2_print_maybe_redirect':
>> fs/bcachefs/super.c:97:17: warning: function 'bch2_print_maybe_redirect' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
      97 |                 bch2_stdio_redirect_vprintf(stdio, true, fmt, args);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/super.c:101:9: warning: function 'bch2_print_maybe_redirect' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     101 |         vprintk(fmt, args);
         |         ^~~~~~~


vim +97 fs/bcachefs/super.c

3c471b65889aa2 Kent Overstreet 2023-11-26   89  
83338f5b2cb840 Kent Overstreet 2024-03-16   90  static void bch2_print_maybe_redirect(struct stdio_redirect *stdio, const char *fmt, va_list args)
b63570f7473385 Kent Overstreet 2024-02-12   91  {
83338f5b2cb840 Kent Overstreet 2024-03-16   92  #ifdef __KERNEL__
83338f5b2cb840 Kent Overstreet 2024-03-16   93  	if (unlikely(stdio)) {
b63570f7473385 Kent Overstreet 2024-02-12   94  		if (fmt[0] == KERN_SOH[0])
b63570f7473385 Kent Overstreet 2024-02-12   95  			fmt += 2;
b63570f7473385 Kent Overstreet 2024-02-12   96  
b63570f7473385 Kent Overstreet 2024-02-12  @97  		bch2_stdio_redirect_vprintf(stdio, true, fmt, args);
83338f5b2cb840 Kent Overstreet 2024-03-16   98  		return;
b63570f7473385 Kent Overstreet 2024-02-12   99  	}
83338f5b2cb840 Kent Overstreet 2024-03-16  100  #endif
83338f5b2cb840 Kent Overstreet 2024-03-16  101  	vprintk(fmt, args);
83338f5b2cb840 Kent Overstreet 2024-03-16  102  }
83338f5b2cb840 Kent Overstreet 2024-03-16  103  

:::::: The code at line 97 was first introduced by commit
:::::: b63570f74733851579f489f092b6c28077f57c4a bcachefs: bch2_print_opts()

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
