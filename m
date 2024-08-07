Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D47D149E16
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Aug 2024 21:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723066168; cv=none; b=JPlnIhrQT85Bnx8XdK7unZ52U9PyMzSuf9k5o80ImWsWs5YdSpUQ3fr4Fhy1YPe+CUYBdJs8t2auakVu3i9EolkDShpeA7oL1ey1dBWzd+HSeeHGgCbFtbmtgyAEC+Dkszo8XkXhRebjWDSDLBpxkquLvHEWw0l8iYN+DHK7FTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723066168; c=relaxed/simple;
	bh=UMW8ZjWFYWzUMZlPzvOnD8SvOFmznM3WZ+q+ybh9Mtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S/s1Z1kvnARwDLWTftxwyhWpiLgJ1kxXZZPoU49Gg+1spUesXzIbGw0OLYlvadPD+Jk/VEttFsJHADh15T+Nm1WGEzKja1MOQm3bbMFTC+OmDEsrN/u2o9lNQkCPsJwzFpU9D/PURXx3lj08SyNrOQW+5e+mBJKoCdwIRdePDS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fGwck0Ny; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fGwck0Ny"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723066166; x=1754602166;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UMW8ZjWFYWzUMZlPzvOnD8SvOFmznM3WZ+q+ybh9Mtc=;
  b=fGwck0NyNVbCeZhg8ep54yfVLjGDixL5grozX9ezCCj307/RCBIFrPcT
   xgxnh8A0cEt2S9lKXUywmYwt7Lu6x6COv9h3J2UTW0RA4owSwJ0OGs4ZD
   yVECCbugBXv9+byCR1GP59hIhY62rH0v9oKVMvvZYcTjqkGDAQXYa8J2f
   i55OLfZBgdT2u8W+UbQZxl47mSz5sGpcmBIMJBaUdlMbugRBphOooSQDx
   xiuvDBWph2fpiB0fV58woyfMAJzga6qq9VhHuOXPe+b+yHfGND88FnJZo
   yVL/6LAXiJe/qf/2/8OnvlFRVTCLkDexjGNRmWmFrlS75qeOVTU46zleq
   A==;
X-CSE-ConnectionGUID: jAXX5SJHR+mkkGwJl+9U+Q==
X-CSE-MsgGUID: RF18N1RjTpOBcG9uCLr9MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21021118"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="21021118"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 14:29:26 -0700
X-CSE-ConnectionGUID: atX5bEDeRKy13kZkUkgljQ==
X-CSE-MsgGUID: yWU5z7LdRnifhCVpkR0W5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="56844713"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 07 Aug 2024 14:29:22 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sboDY-0005jd-0B;
	Wed, 07 Aug 2024 21:29:14 +0000
Date: Thu, 8 Aug 2024 05:27:46 +0800
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
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Mao Jinlong <quic_jinlmao@quicinc.com>,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] coresight: Add remote etm support
Message-ID: <202408080511.RIKNKoHh-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.11-rc2 next-20240807]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mao-Jinlong/dt-bindings-arm-Add-qcom-inst-id-for-remote-etm/20240807-151315
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240807071054.12742-3-quic_jinlmao%40quicinc.com
patch subject: [PATCH v2 2/2] coresight: Add remote etm support
config: arm-kismet-CONFIG_QCOM_QMI_HELPERS-CONFIG_CORESIGHT_REMOTE_ETM-0-0 (https://download.01.org/0day-ci/archive/20240808/202408080511.RIKNKoHh-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240808/202408080511.RIKNKoHh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408080511.RIKNKoHh-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for QCOM_QMI_HELPERS when selected by CORESIGHT_REMOTE_ETM
   WARNING: unmet direct dependencies detected for QCOM_QMI_HELPERS
     Depends on [n]: NET [=n]
     Selected by [y]:
     - CORESIGHT_REMOTE_ETM [=y] && CORESIGHT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
