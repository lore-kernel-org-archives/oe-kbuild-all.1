Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6549932F742
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jan 2026 03:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769745333; cv=none; b=M2BJJy5hbQOL3QCrFtNdT6gJtQYSDYZhWENFnVEtLwKIyDJk7HG0wzOL9u7gy6X3P7JZKJapjFVTvCSYqr9ymsV/fY3IMmDq2EGJxn8LisVq/2P+Aluj+ibOXhTbWNkge5wjH0Hc5qObtPeKKGeGIgpq+TTCDUbAPM9FrzWQsDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769745333; c=relaxed/simple;
	bh=KhWGgwgvDPdOVyC1KHPlz0xY4hWUFHb7XvduW4ZcQFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PFEJathW+tnTR0koKEUecRBlO7wY2aKGmaPImljWTG79mtky2SQztnxBNcaP4UjVL/dAQfnWInEdsMFnWprst3TqEaBaxs/pQ6yoojAV/AZ8vzt9rwdOtjrrqhwuNU8W+tcCF8qUNlCT0xnSmKrsuuKYnUHXB7nKGLEaBRAO60M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V8xKN1v1; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V8xKN1v1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769745333; x=1801281333;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KhWGgwgvDPdOVyC1KHPlz0xY4hWUFHb7XvduW4ZcQFQ=;
  b=V8xKN1v1jqmPYKQL9I9gwbGO0Qp7CCmQlUZo82Lmu3A0ou1wswY7yvGO
   2FnNq/XCEkwECtDQqzOBAUlid7FiQh5/07Lb2KLbOeG4gJWu2c6fo3M5u
   Jud3e5PB2Rat4J69Uc7JPsyh26ru3VkbDDh7bToCp6/oOW1Apgi9AiTbm
   QlLIn1gPlDo9BGtGaQMR8DMW2pu8SfFK7AfHM8PMbxhB7DSrlCTTcsSsl
   2fuQIn4R8IzmVT6vRockigDMOWvywPfDvhWyfWhx2kOz3A4UkwmuIMxSy
   KrElFGt7IDrMvJypJE1RPxbHfhhHySYnJyF5kUOmOFm891cQiaDICmSd4
   w==;
X-CSE-ConnectionGUID: fWspP8yiRGaiaMGE2fXYMw==
X-CSE-MsgGUID: SJMPMwK/SvymcdboQN97RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71048421"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="71048421"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 19:55:31 -0800
X-CSE-ConnectionGUID: jLLz5KQMSPqMJFNaKzPA+A==
X-CSE-MsgGUID: 4w2UY78vRCeyyD7R/ZCT7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="240005116"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Jan 2026 19:55:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlfbR-00000000c98-3Q7O;
	Fri, 30 Jan 2026 03:55:25 +0000
Date: Fri, 30 Jan 2026 11:55:02 +0800
From: kernel test robot <lkp@intel.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
	andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, sumit.garg@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: ipq9574: Enable eMMC variant
Message-ID: <202601301122.Oy62xjdX-lkp@intel.com>
References: <20260129062825.666457-5-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129062825.666457-5-varadarajan.narayanan@oss.qualcomm.com>

Hi Varadarajan,

kernel test robot noticed the following build errors:

[auto build test ERROR on fcb70a56f4d81450114034b2c61f48ce7444a0e2]

url:    https://github.com/intel-lab-lkp/linux/commits/Varadarajan-Narayanan/arm64-dts-qcom-ipq9574-Add-gpio-details-for-eMMC/20260129-143219
base:   fcb70a56f4d81450114034b2c61f48ce7444a0e2
patch link:    https://lore.kernel.org/r/20260129062825.666457-5-varadarajan.narayanan%40oss.qualcomm.com
patch subject: [PATCH v3 4/4] arm64: dts: qcom: ipq9574: Enable eMMC variant
config: arm64-randconfig-001-20260129 (https://download.01.org/0day-ci/archive/20260130/202601301122.Oy62xjdX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601301122.Oy62xjdX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601301122.Oy62xjdX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb', needed by 'arch/arm64/boot/dts/qcom/'.
   make[4]: Target 'arch/arm64/boot/dts/qcom/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
