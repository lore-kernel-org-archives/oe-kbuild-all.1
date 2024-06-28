Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B035F1C694
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 02:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719542866; cv=none; b=dM+j/6Fi54sluWs54c2Z+gYalU2oGoZWIGNNHwhTEFQFQtT51RoxMNW9FAWy0tg2MeKudmUo2OBIbrlnvF5MUVjVNskQTsfrVTxxS5n8dA+5rD3iRHvdct1CL9e7aIxt1Bsr2+1lRY6qxgDooG4JVyGnQw+lTrCkbT6mZNdSh6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719542866; c=relaxed/simple;
	bh=RugJsmSoFQ0Opqso7x3i6LNEuu1OqPbWR4QAu9YtPQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lcANZQpSVeH47OKTiUaGMEhPnIpvKwQ0yH29F/hwYGg8AWVDIg3F1mvOtIoi7hLZ8luubC5NIOUHp1ZHgGtCXXIiJIzIkG8e4O+Yc4PdmZeL6zeMnXzC463N38sqDxBhNVSWQTuJIVTPZyp4H2Q+oatvkGOFrj7Dl5Qwj+Xkz5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nW1FkHOn; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nW1FkHOn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719542864; x=1751078864;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RugJsmSoFQ0Opqso7x3i6LNEuu1OqPbWR4QAu9YtPQI=;
  b=nW1FkHOnP1gqYRdE4mrG8BYvthA7CXPkNmSTaDM2gn+0QvM4OSYl7+vL
   Hu1maylCNZmgqxTXJdUn2W5+h2s3WFcvbZEwg5csnsECBNrwlNDoNWJjX
   ZkULuCWQo27coMCjdHQO+6/1qY8ULnNH4nwny1rv3UG7L/9ZsXGO58OjH
   KUwQgPlXtLpFodr99GZ9i5yGCtHcvi+STmY7u3G8HFLuJ9CcrilfT2yPh
   g0DkKUKDP8uumtRIWo4OqS6wf0d05ax2liDBQ5P3+sPjT5+olbkpuqjzn
   F+4ptPaGQ19x/dNvqQIysRi3DJ1kNvTn9PjH8bELJyzjtOY8lswkd2Bj7
   w==;
X-CSE-ConnectionGUID: ZH43DaqrQvSLHbY0uHyOYA==
X-CSE-MsgGUID: oFdaESlOQKGIXOaNdeEqRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16841295"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="16841295"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 19:47:43 -0700
X-CSE-ConnectionGUID: 0C3QM5UYRGaMVHm8ynMGug==
X-CSE-MsgGUID: 6Ri0fHKYTxyAa0KtLme04A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="49554408"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Jun 2024 19:47:39 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sN1eC-000Gjq-2k;
	Fri, 28 Jun 2024 02:47:36 +0000
Date: Fri, 28 Jun 2024 10:47:15 +0800
From: kernel test robot <lkp@intel.com>
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>, sboyd@kernel.org,
	andersson@kernel.org, bjorn.andersson@linaro.org,
	david.brown@linaro.org, devicetree@vger.kernel.org,
	jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, mark.rutland@arm.com,
	mturquette@baylibre.com, ohad@wizery.com, robh@kernel.org,
	sricharan@codeaurora.org
Cc: oe-kbuild-all@lists.linux.dev, gokulsri@codeaurora.org
Subject: Re: [PATCH v9 8/8] arm64: dts: qcom: Enable Q6v5 WCSS for ipq8074 SoC
Message-ID: <202406281044.3vIaThJc-lkp@intel.com>
References: <20240621114659.2958170-9-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621114659.2958170-9-quic_gokulsri@quicinc.com>

Hi Gokul,

kernel test robot noticed the following build warnings:

[auto build test WARNING on remoteproc/rproc-next]
[also build test WARNING on clk/clk-next robh/for-next linus/master v6.10-rc5 next-20240627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gokul-Sriram-Palanisamy/remoteproc-qcom-Add-PRNG-proxy-clock/20240625-162317
base:   git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
patch link:    https://lore.kernel.org/r/20240621114659.2958170-9-quic_gokulsri%40quicinc.com
patch subject: [PATCH v9 8/8] arm64: dts: qcom: Enable Q6v5 WCSS for ipq8074 SoC
config: arm64-randconfig-051-20240627 (https://download.01.org/0day-ci/archive/20240628/202406281044.3vIaThJc-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
dtschema version: 2024.6.dev2+g3b69bad
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406281044.3vIaThJc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406281044.3vIaThJc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/ipq8074-hk01.dtb: phy@59000: 'vdda-pll-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/ipq8074-hk01.dtb: phy@59000: 'vdda-phy-dpdm-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/ipq8074-hk01.dtb: phy@79000: 'vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/ipq8074-hk01.dtb: phy@79000: 'vdda-pll-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/ipq8074-hk01.dtb: phy@79000: 'vdda-phy-dpdm-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
>> arch/arm64/boot/dts/qcom/ipq8074-hk01.dtb: /soc@0/remoteproc@cd00000: failed to match any schema with compatible: ['qcom,ipq8074-wcss-pil']
--
>> arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dtb: /soc@0/remoteproc@cd00000: failed to match any schema with compatible: ['qcom,ipq8074-wcss-pil']
--
>> arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dtb: /soc@0/remoteproc@cd00000: failed to match any schema with compatible: ['qcom,ipq8074-wcss-pil']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
