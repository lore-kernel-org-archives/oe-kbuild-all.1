Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD881D2A1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jun 2023 23:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687388424; x=1718924424;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3RT/5684Q1ijU9k/2p40Kx/8EHboxj6ZazMl9ZCqG3E=;
  b=m6xecQcXoOlpghzfWsvjO+DFJ1FXe0dNQM8OpFdkfJT5rrm5ephPIm24
   4QsHqIsooDpzFpGQF1iKBEo9qvGcFv8Acl1KYvS+7ffq8BW4IaGR6Kf6h
   Spl9d2qnVYVs661ajxDilvpBrdg2WXxcfUoH8xhyIOMu8+tMRRYTqf5tG
   uRYQTEqcLPgZEfP+H8vfAZjjWCTtrNvZ/7wOCQjKoATVzFjJt8scI/Rmh
   5HVoBZk4zktMxQy2ZcRoi0+03PBxX7z+EAB5lYri+4c8L6SyZ4w9uaKE6
   yMianAXzU3EC/rpHxmA3RaGe63c0Npv77QigoCG575SVhUlh6CPfMv6Qv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="423998682"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="423998682"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 16:00:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="804555954"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="804555954"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Jun 2023 16:00:21 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qC6oG-00078t-2y;
	Wed, 21 Jun 2023 23:00:20 +0000
Date: Thu, 22 Jun 2023 06:59:23 +0800
From: kernel test robot <lkp@intel.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next] bpf: Add two new bpf helpers
 bpf_perf_type_[uk]probe()
Message-ID: <202306220613.ELA8zSbJ-lkp@intel.com>
References: <20230621120042.3903-3-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621120042.3903-3-laoar.shao@gmail.com>

Hi Yafang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/bpf-Add-two-new-bpf-helpers-bpf_perf_type_-uk-probe/20230621-200309
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230621120042.3903-3-laoar.shao%40gmail.com
patch subject: [RFC PATCH bpf-next] bpf: Add two new bpf helpers bpf_perf_type_[uk]probe()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230622/202306220613.ELA8zSbJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306220613.ELA8zSbJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306220613.ELA8zSbJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/helpers.c: In function '____bpf_perf_type_kprobe':
>> kernel/bpf/helpers.c:1660:16: error: implicit declaration of function 'perf_type_kprobe'; did you mean 'bpf_perf_type_kprobe'? [-Werror=implicit-function-declaration]
    1660 |         return perf_type_kprobe();
         |                ^~~~~~~~~~~~~~~~
         |                bpf_perf_type_kprobe
   kernel/bpf/helpers.c: In function '____bpf_perf_type_uprobe':
>> kernel/bpf/helpers.c:1671:16: error: implicit declaration of function 'perf_type_uprobe'; did you mean 'bpf_perf_type_uprobe'? [-Werror=implicit-function-declaration]
    1671 |         return perf_type_uprobe();
         |                ^~~~~~~~~~~~~~~~
         |                bpf_perf_type_uprobe
   cc1: some warnings being treated as errors


vim +1660 kernel/bpf/helpers.c

  1657	
  1658	BPF_CALL_0(bpf_perf_type_kprobe)
  1659	{
> 1660		return perf_type_kprobe();
  1661	}
  1662	
  1663	const struct bpf_func_proto bpf_perf_type_kprobe_proto = {
  1664		.func		= bpf_perf_type_kprobe,
  1665		.gpl_only	= false,
  1666		.ret_type	= RET_INTEGER,
  1667	};
  1668	
  1669	BPF_CALL_0(bpf_perf_type_uprobe)
  1670	{
> 1671		return perf_type_uprobe();
  1672	}
  1673	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
