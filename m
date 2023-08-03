Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2F02585
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Aug 2023 06:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691045823; x=1722581823;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6H0pMdz6tAdJfcaxPmhmDXD2ptEys/6JhCW6JQWRxRc=;
  b=RChkAQm59GJkqzLir72iVmPEvkpk5gqdXPlMeMnVYUttUaTOX5GuOP/u
   p1dZK/SW68tSSqBF5NKNkZ6/GGWOfyyL9nPQv6dTeh0RJXc9LZ8c6Acs8
   7vT6mvoeeebSFeofsz2GoekfjerHR/TQSlqFdmBSDcFHvuUV4oYz5hGwQ
   pGpbZV2UGFbMnuy0byWKVn+rPUrJX1YtEbmvSSkt2AEn2JoTFOnPgH4Es
   3aMQjC+nV1ZL4i/1hPoTNOW1WZGrCI1WEj6pwwBLWjpc7ZCFHDkK+KRJV
   7tR6rADLFsmitFsHy5DuOrWlg4Z6nKx6+20Bpl36AmPSfMqrryKHR5PoA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="436099975"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="436099975"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 23:56:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="706436728"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="706436728"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 02 Aug 2023 23:56:59 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRSGY-0001q0-1D;
	Thu, 03 Aug 2023 06:56:58 +0000
Date: Thu, 3 Aug 2023 14:56:20 +0800
From: kernel test robot <lkp@intel.com>
To: Florent Revest <revest@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/1] crypto: Defer transforms destruction to a worker
 function
Message-ID: <202308031414.WPeu5kKk-lkp@intel.com>
References: <20230802170923.1151605-2-revest@chromium.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802170923.1151605-2-revest@chromium.org>

Hi Florent,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master linus/master v6.5-rc4 next-20230802]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Florent-Revest/crypto-Defer-transforms-destruction-to-a-worker-function/20230803-011553
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20230802170923.1151605-2-revest%40chromium.org
patch subject: [RFC 1/1] crypto: Defer transforms destruction to a worker function
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230803/202308031414.WPeu5kKk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308031414.WPeu5kKk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308031414.WPeu5kKk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/api.c:643:6: warning: no previous prototype for 'crypto_destroy_tfm_workfn' [-Wmissing-prototypes]
     643 | void crypto_destroy_tfm_workfn(struct work_struct *w)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/crypto_destroy_tfm_workfn +643 crypto/api.c

   642	
 > 643	void crypto_destroy_tfm_workfn(struct work_struct *w)
   644	{
   645		struct crypto_alg *alg;
   646		struct crypto_tfm *tfm;
   647	
   648		tfm = container_of(w, struct crypto_tfm, free_work);
   649		alg = tfm->__crt_alg;
   650	
   651		if (!tfm->exit && alg->cra_exit)
   652			alg->cra_exit(tfm);
   653		crypto_exit_ops(tfm);
   654		crypto_mod_put(alg);
   655		kfree_sensitive(tfm->to_free);
   656	}
   657	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
