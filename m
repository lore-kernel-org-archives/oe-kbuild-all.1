Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EBC78F4F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 22:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766355013; cv=none; b=M8EHZNLz/eKs+hJ/DfxYqLmVlcN8B8Po7ch0L45HQkb3/yvQX4tuGvXF3cm9NJZ4aA6SLlT9FZn+c6WdGFAot3OC2waLDt/8gRaW3z/KUKgO5F1qZCdvbpPL1f/UowhqDJ2/uFw/u4dK4df4+DaZX6kVwQKLc7BNsCPxElE81ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766355013; c=relaxed/simple;
	bh=1h+WmbrnZU+X13Q7IA8YWgPTvCOn7uDgzDXI0r/oKu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m2sF8xRaPeH7h0vsuukw2NlGOY7f3Rb37xeTL09/gShZiuZEPgiurO/BL3I5MT3fQRKFAg4AiguDgqFYckBASUPxRl5DNAA+a5ELlZSlbAVJQMUIQZPMZMEaIw1Z3sh5coNaQV8+FMkk+a4eD0Ge8kqF6tgy9RH5GsOh05YrEBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JXYUCoR4; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JXYUCoR4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766355011; x=1797891011;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1h+WmbrnZU+X13Q7IA8YWgPTvCOn7uDgzDXI0r/oKu4=;
  b=JXYUCoR4Vo73B9/Ia0FafFLEIfprUM4ISREvxOkdq6L9Eybm75ruhHgo
   A0N6JWQzFbxhniANwj9msqRc0gzbGCp9HaO+n4fZcNpnvd7e9F83lRqbD
   PnJI6nF/sahIuLLEOIJ62+MrQW6wMzxMBB2R4jNyfMN41odO7Yryxub0C
   CbRp1jO7UnzyJac4Hu9BrtfMWHiMI1Ms5iyLVuqVAdXkIaikV1hI0msMB
   9MEOZeSuVW/g8r+Avj/6xxoUugEV92/AjNY4f/P93HePitXtaMExh5Tjn
   SaNJtJfmU/I3eX5cNbSk4812nDvWZ7HWdqV/SqVIMgD6C+Gra4KI4KI69
   Q==;
X-CSE-ConnectionGUID: jZTUVsMMQy+1lAQEvBqWTA==
X-CSE-MsgGUID: habNdg2/Tk61Cw34PLL0gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="67974088"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="67974088"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 14:10:09 -0800
X-CSE-ConnectionGUID: PwmtY8EXRAuJdsLxvgHhDw==
X-CSE-MsgGUID: ZvBet02rQMO8cBbjezuu9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="236791026"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 21 Dec 2025 14:10:09 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXRcs-000000005Fs-2gMF;
	Sun, 21 Dec 2025 22:10:06 +0000
Date: Sun, 21 Dec 2025 23:09:14 +0100
From: kernel test robot <lkp@intel.com>
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/3] dt-bindings: remoteproc: qcom: add IPQ9574 image
 loader
Message-ID: <202512212326.2s5WmRdf-lkp@intel.com>
References: <20251210003729.3909663-3-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210003729.3909663-3-mr.nuke.me@gmail.com>

Hi Alexandru,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on remoteproc/rproc-next linus/master v6.19-rc1 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandru-Gagniuc/dt-bindings-remoteproc-qcom-ipq8074-wcss-pil-convert-to-DT-schema/20251210-084421
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20251210003729.3909663-3-mr.nuke.me%40gmail.com
patch subject: [PATCH RFC 2/3] dt-bindings: remoteproc: qcom: add IPQ9574 image loader
config: openrisc-randconfig-2051-20251221 (https://download.01.org/0day-ci/archive/20251221/202512212326.2s5WmRdf-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512212326.2s5WmRdf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512212326.2s5WmRdf-lkp@intel.com/

All errors (new ones prefixed by >>):

   Lexical error: Documentation/devicetree/bindings/remoteproc/qcom,ipq9574-wcss-pil.example.dts:49.28-51 Unexpected 'GCC_ANOC_WCSS_AXI_M_CLK'
   Lexical error: Documentation/devicetree/bindings/remoteproc/qcom,ipq9574-wcss-pil.example.dts:50.28-46 Unexpected 'GCC_WCSS_AHB_S_CLK'
   Lexical error: Documentation/devicetree/bindings/remoteproc/qcom,ipq9574-wcss-pil.example.dts:51.28-46 Unexpected 'GCC_WCSS_ECAHB_CLK'
   Lexical error: Documentation/devicetree/bindings/remoteproc/qcom,ipq9574-wcss-pil.example.dts:52.28-45 Unexpected 'GCC_WCSS_ACMT_CLK'
   Lexical error: Documentation/devicetree/bindings/remoteproc/qcom,ipq9574-wcss-pil.example.dts:53.28-46 Unexpected 'GCC_WCSS_AXI_M_CLK'
   Lexical error: Documentation/devicetree/bindings/remoteproc/qcom,ipq9574-wcss-pil.example.dts:54.28-43 Unexpected 'GCC_Q6_AXIM_CLK'
   Lexical error: Documentation/devicetree/bindings/remoteproc/qcom,ipq9574-wcss-pil.example.dts:55.28-44 Unexpected 'GCC_Q6_AXIM2_CLK'
   Lexical error: Documentation/devicetree/bindings/remoteproc/qcom,ipq9574-wcss-pil.example.dts:56.28-42 Unexpected 'GCC_Q6_AHB_CLK'
   Lexical error: Documentation/devicetree/bindings/remoteproc/qcom,ipq9574-wcss-pil.example.dts:57.28-44 Unexpected 'GCC_Q6_AHB_S_CLK'
   Lexical error: Documentation/devicetree/bindings/remoteproc/qcom,ipq9574-wcss-pil.example.dts:58.28-45 Unexpected 'GCC_Q6SS_BOOT_CLK'
   Lexical error: Documentation/devicetree/bindings/remoteproc/qcom,ipq9574-wcss-pil.example.dts:59.28-50 Unexpected 'GCC_MEM_NOC_Q6_AXI_CLK'
   Lexical error: Documentation/devicetree/bindings/remoteproc/qcom,ipq9574-wcss-pil.example.dts:60.28-47 Unexpected 'GCC_WCSS_Q6_TBU_CLK'
   Lexical error: Documentation/devicetree/bindings/remoteproc/qcom,ipq9574-wcss-pil.example.dts:61.28-52 Unexpected 'GCC_SYS_NOC_WCSS_AHB_CLK'
>> FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
