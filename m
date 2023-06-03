Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F73017D4
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jun 2023 01:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685755034; x=1717291034;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZqjGZ5QOK5/9p0dBTmL1jSNej1ZvjR79xQrDuqbSz60=;
  b=XuLBQWisLM3Yp7n5f3J09ekU3gz5Zz5iTgircL2SJr1o8ulJhSMvosAk
   I8ZvZNrNKvUTjYy+W40cdJe6GhNht6oQXGxlXQgeeAG8D7haapD3Ky27f
   +O0ed0xuJepjsYEKIZuMOFStVrFFZlBpJM1ttBlyXNjdWtbqKxRWv6roG
   GcGTX4AiqXFBJlT6XiE0JkU4ZnHtQZ4DROHBRTnZBECyrCkYVFZ9AONhL
   Raco2jtgF8GuS5PeODuaSfC0eXajn/X3zDG4G6NKDnatrzqhi5uTTQkj+
   T2l3gzolRa9kPO6cPzNtsPEyGwyDApji+4Pn4fxanPxbFQer7QNcmkkac
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="419549581"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; 
   d="scan'208";a="419549581"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 18:17:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="658443953"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; 
   d="scan'208";a="658443953"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 Jun 2023 18:17:10 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5FtG-000185-00;
	Sat, 03 Jun 2023 01:17:10 +0000
Date: Sat, 3 Jun 2023 09:16:25 +0800
From: kernel test robot <lkp@intel.com>
To: Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Robin Murphy <robin.murphy@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>
Subject: Re: [PATCH v2 5/5] perf: arm_cspmu: ampere_cspmu: Add support for
 Ampere SoC PMU
Message-ID: <202306030958.1IskqGEt-lkp@intel.com>
References: <20230601030144.3458136-6-ilkka@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230601030144.3458136-6-ilkka@os.amperecomputing.com>

Hi Ilkka,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm-perf/for-next/perf]
[also build test WARNING on soc/for-next linus/master v6.4-rc4 next-20230602]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ilkka-Koskinen/perf-arm_cspmu-Support-32-bit-accesses-to-64-bit-registers/20230601-110440
base:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git for-next/perf
patch link:    https://lore.kernel.org/r/20230601030144.3458136-6-ilkka%40os.amperecomputing.com
patch subject: [PATCH v2 5/5] perf: arm_cspmu: ampere_cspmu: Add support for Ampere SoC PMU
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/6757d231639bb7a9f0b47f52d7d4f101ad3a0e29
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ilkka-Koskinen/perf-arm_cspmu-Support-32-bit-accesses-to-64-bit-registers/20230601-110440
        git checkout 6757d231639bb7a9f0b47f52d7d4f101ad3a0e29
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306030958.1IskqGEt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/admin-guide/perf/ampere_cspmu.rst: WARNING: document isn't included in any toctree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
