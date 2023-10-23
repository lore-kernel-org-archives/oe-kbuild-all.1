Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C5224210
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 23:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fUOhDe5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698103949; x=1729639949;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DPABUbbCuZ9PFo1SgZF2n9YSEhD6yThsfdtfsjgSxK0=;
  b=fUOhDe5lMZVX8TkaFWrGpBmmDRMMhsq5EpkB8f6CwwG4Zbkacrz0vc09
   vfiofJG3vqmSlJx3Dg2LeismJPzstr8U7giNs2ezfJTk4p8Ujyhab/ccl
   FiaSXoJ6Ufe51lIQyNjlFUmwnudefdcncbM0XBtWkAzCWFKhlwSCnSb0p
   YSplkzzQWCv+l+W2UYAPzOnz58trk32Hzr3qnY/mOZnz5J0DRdB6BS6g7
   BOtE20r0kAEHzIyed3PqxC1HawQxYtg3uj72AXtqhiovwMNkOsUVKLIMA
   VKZAUpEzHecN7Ni4fhplf7a/2WoexjrAg2dWDw7PwcQ1tDMSkDITXrbjn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="377325340"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="377325340"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 16:32:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="1005479575"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="1005479575"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 23 Oct 2023 16:32:24 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qv4PF-0007N5-2h;
	Mon, 23 Oct 2023 23:32:21 +0000
Date: Tue, 24 Oct 2023 07:32:06 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Marchevsky <davemarchevsky@fb.com>, bpf@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 bpf-next 4/4] selftests/bpf: Add tests exercising
 aggregate type BTF field search
Message-ID: <202310240704.3BxYlwQh-lkp@intel.com>
References: <20231023220030.2556229-5-davemarchevsky@fb.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023220030.2556229-5-davemarchevsky@fb.com>

Hi Dave,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Marchevsky/bpf-Fix-btf_get_field_type-to-fail-for-multiple-bpf_refcount-fields/20231024-060227
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20231023220030.2556229-5-davemarchevsky%40fb.com
patch subject: [PATCH v1 bpf-next 4/4] selftests/bpf: Add tests exercising aggregate type BTF field search
reproduce: (https://download.01.org/0day-ci/archive/20231024/202310240704.3BxYlwQh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310240704.3BxYlwQh-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SPACING: need consistent spacing around '*' (ctx:WxV)
#65: FILE: tools/testing/selftests/bpf/progs/array_kptr.c:12:
+	struct prog_test_ref_kfunc __kptr *ref_ptr;
 	                                  ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
