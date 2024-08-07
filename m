Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFFA153598
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Aug 2024 23:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723071629; cv=none; b=OjtxWHl9+1ZMmkYwsyMM8Zsjbs2wV7uDcZ9tmcHYhi9LSt3JNizMh1BwCzmWaOnSLo/VQAijZDxEFl9rlaUZ7rkLuOZcjr/zUFMDH9lheOjOHFJdJ5IxW38MezsDBHoquNoVPNixktJkHC6mNTXjv9ld28mkQa+PHHEfqSHn+iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723071629; c=relaxed/simple;
	bh=xVWxPxBYRX1Ct5d8y5S5aWZtS9M1p+rAJ47euCUwpKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mq+TivaLDocBhBOIEctL19NJjwVjgmn/pOZjEPDJViF25YqWdP8qupcbTgfAP357GAUd3+1fcUG0DouwKnH55/DkZLP+PiqP4Bd3S2X24oqIkhiuyccvf9nYYCVa+iizZQSAxSkb4ejjRwUkTS+YL+N2xQCJY4aZhyomc+xafbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nb2AAuir; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nb2AAuir"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723071626; x=1754607626;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xVWxPxBYRX1Ct5d8y5S5aWZtS9M1p+rAJ47euCUwpKg=;
  b=nb2AAuira8vya++qkQxAHivUen7s69yKI7Stz4e8W5NAVLkn9CndxHMn
   qyKzBqe66awB9B2U34/yRo2yDp3CaUIUscwSjpeEcvI+91XixFW3s1Iv9
   ucQDlhBBZJ23dzJXbprEpl6hfAu1Zv7rbw4pY7JKY1VAeWjPzpTU/B28S
   8IqLC4mR0szl+H5TMxAjdIcUp9DCh6zU6UUwEVquDKq2uixmIPhfyNID1
   BRXhMipa9XhEobz4umUEp8krYCNmpTNnne4Aj7v3i735y1WUUhG/J9nZD
   AiJ1svZDmOYDiAoyMNtsHwApyIl96KsBki7W8BKp+O3fMhU9/H3yhKX7a
   Q==;
X-CSE-ConnectionGUID: QgDUNEowTBy++wYrXd49tQ==
X-CSE-MsgGUID: qkOX8wMSTP24LcxnIvJE3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="20834988"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="20834988"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 16:00:25 -0700
X-CSE-ConnectionGUID: XQPz50ERQFeoWet59h0gMw==
X-CSE-MsgGUID: Cbufdx/tRb+8dv9JiGpf0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="87674911"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 07 Aug 2024 16:00:22 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbpdi-0005mS-2w;
	Wed, 07 Aug 2024 23:00:18 +0000
Date: Thu, 8 Aug 2024 07:00:08 +0800
From: kernel test robot <lkp@intel.com>
To: Mao Jinlong <quic_jinlmao@quicinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mao Jinlong <quic_jinlmao@quicinc.com>,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] coresight: Add remote etm support
Message-ID: <202408080637.ZZJbuvB3-lkp@intel.com>
References: <20240807071054.12742-3-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807071054.12742-3-quic_jinlmao@quicinc.com>

Hi Mao,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.11-rc2 next-20240807]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mao-Jinlong/dt-bindings-arm-Add-qcom-inst-id-for-remote-etm/20240807-151315
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240807071054.12742-3-quic_jinlmao%40quicinc.com
patch subject: [PATCH v2 2/2] coresight: Add remote etm support
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240808/202408080637.ZZJbuvB3-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408080637.ZZJbuvB3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408080637.ZZJbuvB3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwtracing/coresight/coresight-remote-etm.c:298:27: error: initialization of 'void (*)(struct platform_device *)' from incompatible pointer type 'int (*)(struct platform_device *)' [-Wincompatible-pointer-types]
     298 |         .remove         = remote_etm_remove,
         |                           ^~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-remote-etm.c:298:27: note: (near initialization for 'remote_etm_driver.<anonymous>.remove')


vim +298 drivers/hwtracing/coresight/coresight-remote-etm.c

   295	
   296	static struct platform_driver remote_etm_driver = {
   297		.probe          = remote_etm_probe,
 > 298		.remove         = remote_etm_remove,
   299		.driver         = {
   300			.name   = "coresight-remote-etm",
   301			.of_match_table = remote_etm_match,
   302		},
   303	};
   304	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
