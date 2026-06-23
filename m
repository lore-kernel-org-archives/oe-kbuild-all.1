Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD363D3CF7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 11:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782213305; cv=none; b=erEdUYSMmQJqkzNjNtsnGfbd74ClP6/DfUF1i3cVm0Z0n+bp/razpUbjbMvzxE3VkzuSeaKHwS+OgMaH2g5zVFe3u1MSxPLvKw2I70R8IjfUn5zwI9vEjHIwIfIn5s5bPrpmSCIe8bVPEwQM2DoSpRtWfpDbeAyljQ4XZpRj4V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782213305; c=relaxed/simple;
	bh=wqZcMJLGjMPoiWwScIX3RQTLxDspyOYcDem9+jhHz7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ov6dS6u25fSCa4i+OP1mQOchZiy0Cq4+C0VRw5aiJQGIZPqJ4oNVETMyFz0ulVT+RJ0oTfP5qmUZejaq7my4/674JUgdfig5ctmNPpEzSUiaD5gW+zSuywfyahs++M6J0SCKr0BNeN8ALMjNCIIiYV+0JvXubBUz/1tuKMlIvdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cIGGac7h; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cIGGac7h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782213304; x=1813749304;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wqZcMJLGjMPoiWwScIX3RQTLxDspyOYcDem9+jhHz7s=;
  b=cIGGac7hYTdhEAiE+S1bF5SZvJ3iC6OySpjokK/eHPdqDSh52ruLO1eb
   ZIQgX9AiPRIb/oUL21sXKpImysR7dwpiluwdj6cWQzhaR5wEghnpEv5kf
   LFG/yJrNsAoWMTEaIPfMCeV0mn63Ruw5JcVEquod2UIqJMxelpkkGJVW+
   xWxkSTPvW3E1+UAP8ARer/f/AbrU2QSDsujL3/6KBbYkcNIxPBlNLCmh/
   kWT9Id9STsFWyFQHcysSWEMuo17f9dZbJmvDzrZ/Gss4yUYalBm3dXdUO
   YnhRUVpgtOSmXTDxZ4JHoV9TVrF5k0cKXKSeiqLNH6BqWwYdW8IT7J8pI
   Q==;
X-CSE-ConnectionGUID: loEKrF/JS1O3P8dnwrdsNw==
X-CSE-MsgGUID: CP1bvUe/QyaF+cv/QIWlRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="81933216"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="81933216"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 04:15:04 -0700
X-CSE-ConnectionGUID: UAwfnSysS7aXCPhA5d5nTg==
X-CSE-MsgGUID: 1DtfOqIaSNy8/gFadyNbvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="245136985"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jun 2026 04:15:00 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbz5m-000000006Bt-0oIR;
	Tue, 23 Jun 2026 11:14:58 +0000
Date: Tue, 23 Jun 2026 13:14:01 +0200
From: kernel test robot <lkp@intel.com>
To: Bhargav Joshi <j.bhargav.u@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Tero Kristo <kristo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com,
	simona.toaca@nxp.com, j.bhargav.u@gmail.com
Subject: Re: [PATCH] dt-bindings: clock: ti,clockdomain: Convert to DT schema
Message-ID: <202606231306.COGVL9ZT-lkp@intel.com>
References: <20260621-ti-clockdomain-v1-1-e99a56af98ea@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260621-ti-clockdomain-v1-1-e99a56af98ea@gmail.com>

Hi Bhargav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on acb7500801e98639f6d8c2d796ed9f64cba83d3a]

url:    https://github.com/intel-lab-lkp/linux/commits/Bhargav-Joshi/dt-bindings-clock-ti-clockdomain-Convert-to-DT-schema/20260623-022037
base:   acb7500801e98639f6d8c2d796ed9f64cba83d3a
patch link:    https://lore.kernel.org/r/20260621-ti-clockdomain-v1-1-e99a56af98ea%40gmail.com
patch subject: [PATCH] dt-bindings: clock: ti,clockdomain: Convert to DT schema
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260623/202606231306.COGVL9ZT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606231306.COGVL9ZT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   from /zdci/src/kernel-tests/common.sh:210: redirect_command_errors
   from /zdci/src/kernel-tests/lib/builder/htmldocs.sh:86: builder_execute_build
   from /zdci/src/kernel-tests/lib/kbuild.sh:6419: compile_one_config
   from /zdci/src/kernel-tests/lib/builder/base.sh:88: builder_compile
   from /zdci/src/kernel-tests/bisect-test-build-error.sh:102: main
>> Warning: Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/ti/clockdomain.txt
   Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
   Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
   Warning: Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/rtc/motorola,cpcap-rtc.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
