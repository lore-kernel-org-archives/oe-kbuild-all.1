Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BC2200127
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 05:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746596997; cv=none; b=Y1KL2td86FOeLykvdUYrH/CJDvsHYJgqcPXCe1BIUjf3Tqga8l98cKPOk4+oazQBx6b3wcA89XKd/8sCTAIAbS3dX0JZm/Ret+3tZZ08infALDImO/cc8ZV5QK9Z6bEJ8IgfI2AOPmO0KW4GnWiBK7StFReZZR1ZbWMOIX7DD+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746596997; c=relaxed/simple;
	bh=gMWKuqiccB/vdz3+zeg5KDOgnOnUHr7QCke6tYWkzNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cvnQFBTG1UpQyBKfc8vdDZbQSakRjJ6Yl/8OTCv5V1Sl+o5ECGdxrt7v8oo+7lHTJ4B9A6YdJcdifaFN5Ba3UX7uZFtUNp4znpTqR4gm+5GwVodvgcybdqBH/w7zf/ucWlGWAjsCNtAPfv1mcZhluztNJX3ZgUtdc/OyA7QCv3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i8inIR/K; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i8inIR/K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746596996; x=1778132996;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gMWKuqiccB/vdz3+zeg5KDOgnOnUHr7QCke6tYWkzNo=;
  b=i8inIR/K6/bfDir7QlpH33/dIT4hZt8/fw/ULPizoaMl9+rrP3sM0aBW
   evx9bJDFjnu8p9va9s02hyeM7qVHzqZERkGPIqC53LDWYpHWIdIm6347E
   KRuuEW0Lx6764LPtj9I4FY6KhyAE9GjMwNksnfcIyDEkq0nDhstahET2P
   LJVz8Inxw5tIF2esdU70uIx1Puc8lb9QdG2Y+MffWDdl3N7zTGjjCnyZK
   Cnc4JsUYg532eoZPn6gjPMVTX3kIFU2/2CCR8huvJIyAqJnLEoRyxaNpk
   wwkcIo94Qi3KsdYdVzTyHybclu8U+EcFqfjNJZG9uBUfMgBK1FVytn+Bb
   g==;
X-CSE-ConnectionGUID: iDQda1nrR6qxKww7yLqnVg==
X-CSE-MsgGUID: KjQiD5t7RXKUmk1J7w4Nkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="52120540"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="52120540"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 22:49:54 -0700
X-CSE-ConnectionGUID: Dng6zhbARaqwORnXV3pdkg==
X-CSE-MsgGUID: o/PsYAEDSKS8dWxiGvu4sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="140580415"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 May 2025 22:49:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCXf8-00077Q-1d;
	Wed, 07 May 2025 05:49:46 +0000
Date: Wed, 7 May 2025 13:49:03 +0800
From: kernel test robot <lkp@intel.com>
To: Praveen Talari <quic_ptalari@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, psodagud@quicinc.com, djaggi@quicinc.com,
	quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
	quic_arandive@quicinc.com, quic_mnaresh@quicinc.com,
	quic_shazhuss@quicinc.com
Subject: Re: [PATCH v3 4/9] soc: qcom: geni-se: Enable QUPs on SA8255p
 Qualcomm platforms
Message-ID: <202505071326.jjvv4tTv-lkp@intel.com>
References: <20250502031018.1292-5-quic_ptalari@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502031018.1292-5-quic_ptalari@quicinc.com>

Hi Praveen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3e039dcc9c1320c0d33ddd51c372dcc91d3ea3c7]

url:    https://github.com/intel-lab-lkp/linux/commits/Praveen-Talari/opp-add-new-helper-API-dev_pm_opp_set_level/20250502-111540
base:   3e039dcc9c1320c0d33ddd51c372dcc91d3ea3c7
patch link:    https://lore.kernel.org/r/20250502031018.1292-5-quic_ptalari%40quicinc.com
patch subject: [PATCH v3 4/9] soc: qcom: geni-se: Enable QUPs on SA8255p Qualcomm platforms
config: arc-randconfig-002-20250502 (https://download.01.org/0day-ci/archive/20250507/202505071326.jjvv4tTv-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071326.jjvv4tTv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071326.jjvv4tTv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/soc/qcom/qcom-geni-se.c:109 struct member 'geni_se_rsc_init' not described in 'geni_se_desc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
