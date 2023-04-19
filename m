Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CA2C977
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 20:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681934887; x=1713470887;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=umQDVDIX0ShCgFkp09Ac9ZFfUcbvOL76kCr6IWK7ovc=;
  b=ZLtAdIVCuNTWyJz32isgAey/7eiRToaEqqbmYaw+kCFGX1KqXLoAZZ2j
   qo67L2yMetYHTXu/C65/TlhdIecckj27A6cznHPp281SMvSZL+QMhyhGN
   s1ucsvDjdnzwtTbB+zmOO32amZ3sylGDj6fEFJ6jg3Iw05I9bxR7C7cFL
   JYuvvZ5bZd93QY6U0tKnbNLUr+DJoc5cW9xcs9lnVVvawxCxeHx+YNGfh
   hUD1h4br5/H/q2WEJbk1gZb/cxlWmm6XKdL85CHLLFakj99dEbn/J8gcr
   gVD8oh36JjyNMaa6yXXE3DJRBFaOh7cPSgBx1Dz0reSByldv6/zxuK7gH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="344298860"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; 
   d="scan'208";a="344298860"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 13:08:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="1021334550"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; 
   d="scan'208";a="1021334550"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 19 Apr 2023 13:08:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppE5y-000fAE-2e;
	Wed, 19 Apr 2023 20:08:02 +0000
Date: Thu, 20 Apr 2023 04:08:00 +0800
From: kernel test robot <lkp@intel.com>
To: Stanislav Fomichev <sdf@google.com>, bpf@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ast@kernel.org, daniel@iogearbox.net,
	andrii@kernel.org, martin.lau@linux.dev, song@kernel.org,
	yhs@fb.com, john.fastabend@gmail.com, kpsingh@kernel.org,
	sdf@google.com, haoluo@google.com, jolsa@kernel.org
Subject: Re: [PATCH bpf-next 6/6] bpf: Document EFAULT changes for sockopt
Message-ID: <202304200301.XukL6sTb-lkp@intel.com>
References: <20230418225343.553806-7-sdf@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418225343.553806-7-sdf@google.com>

Hi Stanislav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanislav-Fomichev/bpf-Don-t-EFAULT-for-getsockopt-with-optval-NULL/20230419-065442
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230418225343.553806-7-sdf%40google.com
patch subject: [PATCH bpf-next 6/6] bpf: Document EFAULT changes for sockopt
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/789f0fbf25934464ae56e0022939fc77d4615d65
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Stanislav-Fomichev/bpf-Don-t-EFAULT-for-getsockopt-with-optval-NULL/20230419-065442
        git checkout 789f0fbf25934464ae56e0022939fc77d4615d65
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304200301.XukL6sTb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/bpf/prog_cgroup_sockopt.rst:115: WARNING: Unexpected indentation.
>> Documentation/bpf/prog_cgroup_sockopt.rst:111: WARNING: Inline literal start-string without end-string.
>> Documentation/bpf/prog_cgroup_sockopt.rst:111: WARNING: Inline emphasis start-string without end-string.
>> Documentation/bpf/prog_cgroup_sockopt.rst:121: WARNING: Block quote ends without a blank line; unexpected unindent.
>> Documentation/bpf/prog_cgroup_sockopt.rst:159: WARNING: Title level inconsistent:

vim +115 Documentation/bpf/prog_cgroup_sockopt.rst

   110	
 > 111	```
   112	SEC("cgroup/getsockopt")
   113	int getsockopt(struct bpf_sockopt *ctx)
   114	{
 > 115		/* Custom socket option. */
   116		if (ctx->level == MY_SOL && ctx->optname == MY_OPTNAME) {
   117			ctx->retval = 0;
   118			optval[0] = ...;
   119			ctx->optlen = 1;
   120			return 1;
 > 121		}
   122	
   123		/* Modify kernel's socket option. */
   124		if (ctx->level == SOL_IP && ctx->optname == IP_FREEBIND) {
   125			ctx->retval = 0;
   126			optval[0] = ...;
   127			ctx->optlen = 1;
   128			return 1;
   129		}
   130	
   131		/* optval larger than PAGE_SIZE use kernel's buffer. */
   132		if (ctx->optlen > 4096)
   133			ctx->optlen = 0;
   134	
   135		return 1;
   136	}
   137	
   138	SEC("cgroup/setsockopt")
   139	int setsockopt(struct bpf_sockopt *ctx)
   140	{
   141		/* Custom socket option. */
   142		if (ctx->level == MY_SOL && ctx->optname == MY_OPTNAME) {
   143			/* do something */
   144			ctx->optlen = -1;
   145			return 1;
   146		}
   147	
   148		/* Modify kernel's socket option. */
   149		if (ctx->level == SOL_IP && ctx->optname == IP_FREEBIND) {
   150			optval[0] = ...;
   151			return 1;
   152		}
   153	
   154		/* optval larger than PAGE_SIZE use kernel's buffer. */
   155		if (ctx->optlen > 4096)
   156			ctx->optlen = 0;
   157	
   158		return 1;
 > 159	}
   160	```
   161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
