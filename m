Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A284F3B0ADB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Aug 2026 14:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786889380; cv=none; b=mvLT+QXYcJJxGsFAfQTd+bQfL25uIArPkqjERupogC67MYP//WmMwjmmY3frTq2pSovJ5+gDx9ZEolC67cw25uSp+wM/RYz1jxUwbl9k8RPOA5f3GKlQq9wZHInzn+A4Jn/nFarpeNK17am6w//x9831xMqZ9ZWBdm1HaE4GcfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786889380; c=relaxed/simple;
	bh=ixNKXlfbyvYEDhKHRxomUadDZquNpvGYWGT75yks6FA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AkWNGYtBzm2LSnFFLhhBHGaBJrM2CdQttX03qASSTTbg4uMuY2uGH+7ARaITXUNI9As7dBOfQ0bi/pfohaWMYvlhAE5YU+ZwVUUIKJBhgGJQ0Rubyaw4B2q3dChT/GHJdrl/fRbUL2j+J76kjl8MZLGab31yLlZG8n5Hgg9f+8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iFyhHGl6; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iFyhHGl6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786889378; x=1818425378;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ixNKXlfbyvYEDhKHRxomUadDZquNpvGYWGT75yks6FA=;
  b=iFyhHGl6tQ5iB3xURWcpK8WUYMJIWQ1qdoygevVmhhkwEkxi/hP0KSF5
   Z0e1tHR63rAgHbMB05qNi8uW3JD065158k3oGuQba/a25MNOjryz09RTc
   01XZOy8FpiZCcMUNtAqhIgeNgNy0Vf3NZMLcI6lSMe5+nimzUHpaEa5/y
   KWcIsX6wCSTATXkzJP1r2x4RFFOaJsc+ohfza4t2sqqiKelJrlRCM98nm
   ThFb0pVcsXwjRW0IcZDVphNQq5RYYRN16gbnsmB0Bq3GzjyaMNlKcbpWm
   0fU4Q8fNSPWwcFYvY6ZMXoAzzucrW3c17I+oIbKx0FsLeRhTQsWGifri3
   Q==;
X-CSE-ConnectionGUID: c56ron+URFaiSyzvA4qxNQ==
X-CSE-MsgGUID: J3AGt+nCQaqySJ00lKC2iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="98901858"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="98901858"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 07:09:37 -0700
X-CSE-ConnectionGUID: tq0x3LxyQJynKYBgPz5NFg==
X-CSE-MsgGUID: aXFAyCVHR0qo7eslTE8quQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="262036019"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Aug 2026 07:09:34 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvbYJ-00000000cuI-1oGl;
	Sun, 16 Aug 2026 14:09:31 +0000
Date: Sun, 16 Aug 2026 22:08:35 +0800
From: kernel test robot <lkp@intel.com>
To: code_0002@163.com, andersson@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, map220v <map220v300@gmail.com>,
	code002-2 <hiez832670@gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: add Xiaomi Pad 6S Pro (sheng)
Message-ID: <202608162115.dXrmXfLt-lkp@intel.com>
References: <20260721133204.902-1-code_0002@163.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721133204.902-1-code_0002@163.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v7.2-rc7 next-20260814]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/code_0002-163-com/arm64-dts-qcom-sm8550-add-Xiaomi-Pad-6S-Pro-sheng/20260815-144756
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260721133204.902-1-code_0002%40163.com
patch subject: [PATCH] arm64: dts: qcom: sm8550: add Xiaomi Pad 6S Pro (sheng)
config: arm64-randconfig-004-20260816 (https://download.01.org/0day-ci/archive/20260816/202608162115.dXrmXfLt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608162115.dXrmXfLt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608162115.dXrmXfLt-lkp@intel.com/

All errors (new ones prefixed by >>):

   Error: arch/arm64/boot/dts/qcom/sm8550-xiaomi-sheng.dts:947.1-11 Label or path cci1_i2c1 not found
>> FATAL ERROR: Syntax error parsing input tree

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
