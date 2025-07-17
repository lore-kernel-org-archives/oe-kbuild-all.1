Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2906DBA27
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Jul 2025 07:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752738049; cv=none; b=lnU1uOGnQAOk63p4xIWeK7Opz/1xGOAt7EogbhXbRX3OxWuYR4DvRt51kunUIskzOlnlmUkOBvhyoaB3QiWm76cpDRZwPbNMT1k6PjBiozEO+0X6d9+PXKKaAgOKlMnQtnPnCnnxENtnnorncXa9LL0JAFM7hH4O4i8yjoKEDFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752738049; c=relaxed/simple;
	bh=vkaYyWFrwmZiPQ4cIDb/NnU2DKiItaPAjiIfoWUNgpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a3mPnGTP49XUPY9CAtvOufezcfBnr3X/pEmXIm3edjJZyE2PZrTsa5MTYmaZqm3TsmhRYZ96Op/5SmIx4yU71eE3pAQGl/JrugUYjbKu1SXt02+j4VZZNQJ2bbgGol3praw55K7L5E++as08IeY8ALFSjoku5Th9S3QbVx0fLBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F6cr6yjO; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F6cr6yjO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752738049; x=1784274049;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vkaYyWFrwmZiPQ4cIDb/NnU2DKiItaPAjiIfoWUNgpE=;
  b=F6cr6yjOx0BS32PbG50KWNnS8fIBRS/a4oe06C7YwVq6z3m6jd26uOxP
   OEt+Zz39PzunECaCdJ6VYa3ZC8NNLJc9p0lypKiz8TcsrQD3vLrcWqBej
   ykQuzQLnlF4DE/wKnN9vQVvACVgw+gA1y+5UmbE69kk0rzAas7fPlHq9G
   ljuPFkXwhIqiVPX+1Vk3Yxu1Yegw5NsftlMpO7TzIfu213xyKS/OE2UfO
   ig5K3URFAKUUcyQl948soDdYUJ53/yAuFQB8CzZiS9upzQBf4FFpvXkxV
   dX/BCTBTnr2vWiLQJDuEpLB3IA52D+HC4zvUph9DcDfbHdQ6c0yHY/43g
   A==;
X-CSE-ConnectionGUID: 3iMBlkPQRhWai4+iFwBeow==
X-CSE-MsgGUID: rizwxq1/RJ+0fzice5Thmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="58810558"
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="58810558"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 00:40:48 -0700
X-CSE-ConnectionGUID: OmEoH91BTma8PSyYha5gHg==
X-CSE-MsgGUID: E5c/8QccSP2S9brhX6r/sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="157113116"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Jul 2025 00:40:47 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucJER-000DJb-2g;
	Thu, 17 Jul 2025 07:40:43 +0000
Date: Thu, 17 Jul 2025 15:40:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] tpm, tpm_vtpm_proxy: boot-time TPM
Message-ID: <202507171525.4Yz1y9Uv-lkp@intel.com>
References: <20250716121823.173949-1-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716121823.173949-1-jarkko@kernel.org>

Hi Jarkko,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on char-misc/char-misc-testing]
[also build test ERROR on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.16-rc6 next-20250716]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jarkko-Sakkinen/tpm-tpm_vtpm_proxy-boot-time-TPM/20250716-201945
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20250716121823.173949-1-jarkko%40kernel.org
patch subject: [RFC PATCH] tpm, tpm_vtpm_proxy: boot-time TPM
config: s390-randconfig-001-20250717 (https://download.01.org/0day-ci/archive/20250717/202507171525.4Yz1y9Uv-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250717/202507171525.4Yz1y9Uv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507171525.4Yz1y9Uv-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/char/tpm/tpm_vtpm_proxy.c: In function 'vtpmx_supplicant_init':
>> drivers/char/tpm/tpm_vtpm_proxy.c:699:39: error: initializer element is not constant
     static const char * const argv[] = { supplicant, NULL };
                                          ^~~~~~~~~~
   drivers/char/tpm/tpm_vtpm_proxy.c:699:39: note: (near initialization for 'argv[0]')
   drivers/char/tpm/tpm_vtpm_proxy.c: In function 'vtpmx_init':
>> drivers/char/tpm/tpm_vtpm_proxy.c:727:24: error: 'vtpmx_miscdev' undeclared (first use in this function); did you mean 'vtpmx_init'?
     return misc_register(&vtpmx_miscdev);
                           ^~~~~~~~~~~~~
                           vtpmx_init
   drivers/char/tpm/tpm_vtpm_proxy.c:727:24: note: each undeclared identifier is reported only once for each function it appears in
   At top level:
>> drivers/char/tpm/tpm_vtpm_proxy.c:719:12: warning: 'vtpmx_init' defined but not used [-Wunused-function]
    static int vtpmx_init(void)
               ^~~~~~~~~~


vim +699 drivers/char/tpm/tpm_vtpm_proxy.c

   696	
   697	static int vtpmx_supplicant_init(void)
   698	{
 > 699		static const char * const argv[] = { supplicant, NULL };
   700		struct subprocess_info *info;
   701		int ret;
   702	
   703		if (!supplicant)
   704			return 0;
   705	
   706		info = call_usermodehelper_setup(argv[0], (char **)argv, NULL,
   707						 GFP_KERNEL, vtpmx_supplicant_setup,
   708						 vtpmx_supplicant_cleanup, NULL);
   709		if (!info)
   710			return -ENOMEM;
   711	
   712		ret = call_usermodehelper_exec(info, UMH_KILLABLE | UMH_NO_WAIT);
   713		if (ret)
   714			return ret;
   715	
   716		return 0;
   717	}
   718	
 > 719	static int vtpmx_init(void)
   720	{
   721		int ret;
   722	
   723		ret = vtpmx_supplicant_init();
   724		if (ret)
   725			return ret;
   726	
 > 727		return misc_register(&vtpmx_miscdev);
   728	}
   729	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
