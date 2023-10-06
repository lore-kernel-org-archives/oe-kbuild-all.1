Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8319544487
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Oct 2023 23:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KPUa5kjL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696635717; x=1728171717;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z5lw+ELIGqiFFX/8kKpb/SeKX6PDQoTNHop1LwY13SU=;
  b=KPUa5kjLCeQRz+2HoksZkPJHG5unGY4ZHrJVoX+4cLZai/LWBmHt9J5R
   FAOTl1RxTfIEMkOt+u2siL6y/lQ7M9G3fbTzfD2rzHf0ll08h9Z6eUi5I
   o0JUzw27Ye1iXvgMdvW2psRpmid6lpkNiRDFhFHf/T8CDx6o375rzf1uE
   uKmknYaH9MaXmsxV9HmVQs5ZRuhK7nuxPstuPtxITmUAneW43kR1kwTqQ
   weOgJJlY6RND8xXpDho0ZNnhkQ9fYFTQ01vC/C23QEhfWXRhPxCgZ/HfK
   4FONiVAEp2Hm+tHRnJilj1DlwINP8wAGGidnb/ciJT3JdCJT5JIAvWY1u
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="374191564"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="374191564"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 16:41:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="818170703"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="818170703"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 06 Oct 2023 16:41:36 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qouRq-0003kI-0S;
	Fri, 06 Oct 2023 23:41:34 +0000
Date: Sat, 7 Oct 2023 07:40:50 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Nathan Lynch <nathanl@linux.ibm.com>,
	tyreld@linux.ibm.com, gcwilson@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 5/7] powerpc/pseries/papr-sysparm: expose chardev API to
 user space
Message-ID: <202310070732.jj0Y8Vkb-lkp@intel.com>
References: <20231006-papr-sys_rtas-vs-lockdown-v1-5-3a36bfb66e2e@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006-papr-sys_rtas-vs-lockdown-v1-5-3a36bfb66e2e@linux.ibm.com>

Hi Nathan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on eddc90ea2af5933249ea1a78119f2c8ef8d07156]

url:    https://github.com/intel-lab-lkp/linux/commits/Nathan-Lynch-via-B4-Relay/powerpc-uapi-export-papr-miscdev-h-header/20231007-050832
base:   eddc90ea2af5933249ea1a78119f2c8ef8d07156
patch link:    https://lore.kernel.org/r/20231006-papr-sys_rtas-vs-lockdown-v1-5-3a36bfb66e2e%40linux.ibm.com
patch subject: [PATCH 5/7] powerpc/pseries/papr-sysparm: expose chardev API to user space
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20231007/202310070732.jj0Y8Vkb-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231007/202310070732.jj0Y8Vkb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310070732.jj0Y8Vkb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/powerpc/platforms/pseries/papr-sysparm.c: In function 'papr_sysparm_buf_from_user':
>> arch/powerpc/platforms/pseries/papr-sysparm.c:208:24: warning: variable 'param' set but not used [-Wunused-but-set-variable]
     208 |         papr_sysparm_t param;
         |                        ^~~~~


vim +/param +208 arch/powerpc/platforms/pseries/papr-sysparm.c

   203	
   204	static struct papr_sysparm_buf *
   205	papr_sysparm_buf_from_user(const struct papr_sysparm_io_block __user *user_iob)
   206	{
   207		struct papr_sysparm_buf *kern_spbuf;
 > 208		papr_sysparm_t param;
   209		long err;
   210		u16 len;
   211	
   212		/*
   213		 * The parameter index that userspace wants to query or update.
   214		 */
   215		if (get_user(param.token, &user_iob->parameter))
   216			return ERR_PTR(-EFAULT);
   217		/*
   218		 * The length of valid data that userspace claims to be in
   219		 * user_iob->data[].
   220		 */
   221		if (get_user(len, &user_iob->length))
   222			return ERR_PTR(-EFAULT);
   223	
   224		static_assert(sizeof(user_iob->data) >= PAPR_SYSPARM_MAX_INPUT);
   225		static_assert(sizeof(kern_spbuf->val) >= PAPR_SYSPARM_MAX_INPUT);
   226	
   227		if (len > PAPR_SYSPARM_MAX_INPUT)
   228			return ERR_PTR(-EINVAL);
   229	
   230		kern_spbuf = papr_sysparm_buf_alloc();
   231		if (!kern_spbuf)
   232			return ERR_PTR(-ENOMEM);
   233	
   234		papr_sysparm_buf_set_length(kern_spbuf, len);
   235	
   236		if (len > 0 && copy_from_user(kern_spbuf->val, user_iob->data, len)) {
   237			err = -EFAULT;
   238			goto free_sysparm_buf;
   239		}
   240	
   241		return kern_spbuf;
   242	
   243	free_sysparm_buf:
   244		papr_sysparm_buf_free(kern_spbuf);
   245		return ERR_PTR(err);
   246	}
   247	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
