Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B0F3CBE8F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 12:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792326597; cv=none; b=AIjIaCiomTlAt9+IBVVQczYBFfyQnCFLaqSxJznbCbn1CDWpgavK6VnoOgkeuDyP32GvAuShdHQ0w++4DJUHI3aVOfnxkAvlqpPEQRgHv5CtMLEmnvFcC2Y2fvCEAQIK+w9CaW0LK7bsdVqCyNXYZRhgqE1G5bQ1C8CCUvSYXOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792326597; c=relaxed/simple;
	bh=wjDqK5mZgCoEIBuQTPemzMKVxy2/iuPrDAGczGjKRVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n1d6f0lLljEBG/64tnYGrqqrc4vFYoZFjRRpFlUvezphwywpVRlNXf2wkYrOq0wOSJptU2ne1HejjKWNlODUmuLwc0hAnSMiHynIJTKymm236cfWwcViwY5MeQVVOxw4e5GjznXg1vEkvZGD2tfuKAb2XDiOhFcGt6VlkDb1kfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=icXceauT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="icXceauT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792326595; x=1823862595;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wjDqK5mZgCoEIBuQTPemzMKVxy2/iuPrDAGczGjKRVQ=;
  b=icXceauTPCrd3kTkM2+YlsZigTldQ7J74U3ntzM8gWqmn2/FQHLhoCDT
   7tjcdmbfr1LdE/TS7s3JhEf1Caag3YQVJj4r9P7ZJnLWkBijKZym3jFa1
   ROBewy2c5uogFa1IzomxARDYbRvjVnzu60tUV/FyhDBDRM+1BInmEGP0L
   J6pdFf87q+7ak56kQQin3DS+WoZBPzXlJqGa44gaX7ppu+TmILBvuXFyl
   R11cNk72Gh4TWjq+W3Nx+c5I/iMI2Z5jgX9usLF1cmY+mVkL78fU2Pgej
   1utpNfRI8Hq848jW5/Jh4iE5666q44+unl5JoWo1BqY6Y7fXBpa/y/UYK
   g==;
X-CSE-ConnectionGUID: 1suHDhVGSxK/3yq2sUXb/A==
X-CSE-MsgGUID: cYxhvGvHRB6DijcxF0EMLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="926655"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="926655"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 05:07:54 -0700
X-CSE-ConnectionGUID: xJ8GZFGVS/uQX1pUzNDLyQ==
X-CSE-MsgGUID: TwPhWXe+TwSWJAk4S7Y1HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="2192237"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 Oct 2026 05:07:53 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIPg6-00000000KOM-3JRx;
	Sun, 18 Oct 2026 12:07:50 +0000
Date: Sun, 18 Oct 2026 20:06:59 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 02/16] clk: Acquire resources for clock transitions
Message-ID: <202610182026.p5KsQAau-lkp@intel.com>
References: <20261014-topic-qc_clk_dvfs-v1-2-3041b788e9f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-2-3041b788e9f7@oss.qualcomm.com>

Hi Konrad,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 4eb2586bd40db27d77cc5b724ca9386ed0c71d53]

url:    https://github.com/intel-lab-lkp/linux/commits/Konrad-Dybcio/clk-Propagate-rate-programming-failures/20261014-141901
base:   4eb2586bd40db27d77cc5b724ca9386ed0c71d53
patch link:    https://lore.kernel.org/r/20261014-topic-qc_clk_dvfs-v1-2-3041b788e9f7%40oss.qualcomm.com
patch subject: [PATCH RFC 02/16] clk: Acquire resources for clock transitions
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20261018/202610182026.p5KsQAau-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610182026.p5KsQAau-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610182026.p5KsQAau-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: drivers/clk/clk_resource_test.ko: missing MODULE_DESCRIPTION()
>> ERROR: modpost: drivers/clk/clk_resource_test.ko: symbol '__clk_get_enable_count' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
