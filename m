Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C9F3BB5A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Nov 2025 10:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763981227; cv=none; b=h6noyCbq1zuAyoUIpFCk3f3MsnwIFjmy9ChDfDFG4C44oXqZRkALDib5bxxOQuVcD+lzPbcgd4Yq3QWKpsqwVYm6fvw3bQmmy0sp02YyLKyJsIrPItMLZXoyUbNiiUltFgSkM7UjIw7BGvTdSlIw4C2Rf4ppVGvfJRyjUmEiLnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763981227; c=relaxed/simple;
	bh=O1DoJQRcsVDEuEHmu6uH3W3rQ/B5VVI6DKhygLJlqCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rvurxa5+OcpFm7IsEU/0ohZoeGj81hdOhXsB327ErVeUpXIKCCotV3reN7Q/BD8w3LGnN+DEdR5V97+bQdU5KTOo+u5YSWe+L4LeE7p+0e0fLzeX+qPNAWI9KPcQ8h1zPPwy0D96vGRc+EEz8Y04ElaK5RryOgsP0pWIZGh4kKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F+flXnpO; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F+flXnpO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763981225; x=1795517225;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O1DoJQRcsVDEuEHmu6uH3W3rQ/B5VVI6DKhygLJlqCE=;
  b=F+flXnpOKar/fNo1lrD4gFT4Xfyj3OU1C8FvYIu5kPUoQItZ5ADTqy4g
   tss62cy5PFA4LfzajmBgw0XkhIwXmcMDP1D4/F6UeN3xDIfUB944nFqIP
   TF+S5aMtTY4A28lFiWRMFDGpUMZGJ8lhUjfSceC1McNPDXnyHAYfFdQG2
   lQm/R7WPpyJajNrPg4w869lmaFdrLAfWv6JradfOSjvcH47/zvRuV6ySn
   mX3nJmYJDSN7/k13TUYNw9H3lvLrMMd6lmpnH2fNvUmoug53IfyLkl6vK
   S5HpCt5ELj1muGCfUsxjuG8RWTJ2UzuBFqWcL50XV9ArTLPel1cdTXMVX
   w==;
X-CSE-ConnectionGUID: Z1dbr38gSIOvA3A2x8uWOw==
X-CSE-MsgGUID: 9/tcuFkjT/mCOQKFKI6dqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="65673776"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="65673776"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 02:47:04 -0800
X-CSE-ConnectionGUID: 504uDi2WTcSU/QPWo04NTA==
X-CSE-MsgGUID: 0CQkW1s6REqH3Iq/jvAOcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="197228550"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Nov 2025 02:47:01 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNU5y-000000000cX-3mux;
	Mon, 24 Nov 2025 10:46:58 +0000
Date: Mon, 24 Nov 2025 18:46:30 +0800
From: kernel test robot <lkp@intel.com>
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vishnu Saini <vishsain@qti.qualcomm.com>,
	prahlad.valluru@oss.qualcomm.com,
	Prahlad Valluru <vvalluru@qti.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: monaco: add lt8713sx bridge with
 displayport
Message-ID: <202511241826.Maela061-lkp@intel.com>
References: <20251120-lt8713sx-bridge-linux-for-next-v1-1-2246fc5fb490@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120-lt8713sx-bridge-linux-for-next-v1-1-2246fc5fb490@qti.qualcomm.com>

Hi Vishnu,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3c3d81183061b9e49dd3207fbbbc36314744bf3f]

url:    https://github.com/intel-lab-lkp/linux/commits/Vishnu-Saini/arm64-dts-qcom-monaco-add-lt8713sx-bridge-with-displayport/20251120-190522
base:   3c3d81183061b9e49dd3207fbbbc36314744bf3f
patch link:    https://lore.kernel.org/r/20251120-lt8713sx-bridge-linux-for-next-v1-1-2246fc5fb490%40qti.qualcomm.com
patch subject: [PATCH 1/2] arm64: dts: qcom: monaco: add lt8713sx bridge with displayport
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251124/202511241826.Maela061-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511241826.Maela061-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511241826.Maela061-lkp@intel.com/

All errors (new ones prefixed by >>):

   Error: arch/arm64/boot/dts/qcom/monaco-evk.dts:413.1-6 Label or path mdss not found
   Error: arch/arm64/boot/dts/qcom/monaco-evk.dts:417.1-10 Label or path mdss_dp0 not found
   Error: arch/arm64/boot/dts/qcom/monaco-evk.dts:421.1-14 Label or path mdss_dp0_out not found
   Error: arch/arm64/boot/dts/qcom/monaco-evk.dts:426.1-14 Label or path mdss_dp0_phy not found
>> FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
