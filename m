Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCE67EA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 00:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681520046; x=1713056046;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BaBaSZvIdqqeUdPYY6SOwnbn8OIbBnqhJrQSQnGFXNI=;
  b=cMXQWY9enN0zzoVF/sLI9Y9SD1clq5OwOD7MQbUsWzdxW5oCIfxhOIkM
   LahVdHtmlIYqlTlwNAI8iK8MUpg4ekRw7BjBxO89HZTgaRPRC7ytKBJCF
   uMWN301JLgJzL+qA7uUuuaXlwiTk3sVYx5FdQHz+CwzbzjpjgEtZMMKE4
   0X85ZmXsSGFz6u1rGwu7g92Ks3MjfhQoD7WmZeJGXGpC0Wm1OwHKpcc9O
   cLG3ZchvcQfIcchOrjAFM0UZO+F21HzzTxQLzp3uebQpXtP4VzNUxNWIy
   kGLBZoaiJdT0a80hutU6cRpv3gxi+O3rLv1f3vQQPM2u+Fn+lSQSQG7dq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="342093260"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; 
   d="scan'208";a="342093260"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 17:54:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="833736948"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; 
   d="scan'208";a="833736948"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 14 Apr 2023 17:54:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnUAy-000aC1-10;
	Sat, 15 Apr 2023 00:54:00 +0000
Date: Sat, 15 Apr 2023 08:53:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jinrong Liang <ljr.kernel@gmail.com>,
	Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Like Xu <like.xu.linux@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Aaron Lewis <aaronlewis@google.com>,
	David Matlack <dmatlack@google.com>,
	Vishal Annapurve <vannapurve@google.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jinrong Liang <cloudliang@tencent.com>,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] KVM: x86/pmu: Add documentation for fixed ctr on PMU
 filter
Message-ID: <202304150850.rx4UDDsB-lkp@intel.com>
References: <20230414110056.19665-5-cloudliang@tencent.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230414110056.19665-5-cloudliang@tencent.com>

Hi Jinrong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a25497a280bbd7bbcc08c87ddb2b3909affc8402]

url:    https://github.com/intel-lab-lkp/linux/commits/Jinrong-Liang/KVM-selftests-Replace-int-with-uint32_t-for-nevents/20230414-190401
base:   a25497a280bbd7bbcc08c87ddb2b3909affc8402
patch link:    https://lore.kernel.org/r/20230414110056.19665-5-cloudliang%40tencent.com
patch subject: [PATCH 4/7] KVM: x86/pmu: Add documentation for fixed ctr on PMU filter
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/b0effe04478df3b33a26331f48540851c4d33173
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jinrong-Liang/KVM-selftests-Replace-int-with-uint32_t-for-nevents/20230414-190401
        git checkout b0effe04478df3b33a26331f48540851c4d33173
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304150850.rx4UDDsB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/virt/kvm/api.rst:5133: WARNING: Definition list ends without a blank line; unexpected unindent.

vim +5133 Documentation/virt/kvm/api.rst

  5130	
  5131	  FixCtr[i]_is_allowed = (action == ALLOW) && (bitmap & BIT(i)) ||
  5132	    (action == DENY) && !(bitmap & BIT(i));
> 5133	  FixCtr[i]_is_denied = !FixCtr[i]_is_allowed;
  5134	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
