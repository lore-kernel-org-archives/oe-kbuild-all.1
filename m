Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D9D18C359
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Oct 2024 11:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728385696; cv=none; b=Snm2G0OzrDMHOfXJqn5t74sm+WGORrx92rn4bi/4coHqh7TiAX0PWT/9aXI/sm35bgmNRpHr6C9EFfk9fopuHNN4JAjzw/tOV488ziRUpLh4icxEdr1JWuYdyo8dP1pIuWa7h+11NKvffL9ZsKJN4riiNYunZHuvW3tH/CbRAh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728385696; c=relaxed/simple;
	bh=0ctU/+14S8CDrzijH8uO02zNos9uf++LoeJ+64lPr9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bd7quq0+DO0QQT3yO/6HM3JNz2OrmD9vgsnY4GkGJVT3NYSAnVc2R4HeLBrSQYYkbDi37POO1kHAiel2op/iBtHVypHZv4AjhkAGHUFLho+IPNEnhgY1EEALvFQ2/uNNoRR5TupfOlfNUMONLPtP24Zy3Vsm1bo0e4JNEHPqwqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gVfmUQPz; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gVfmUQPz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728385695; x=1759921695;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0ctU/+14S8CDrzijH8uO02zNos9uf++LoeJ+64lPr9A=;
  b=gVfmUQPzEHkqXPe2yqPhtgOCGWLNnfrU5NCjTV4b668Y5SqvCC0hPRK7
   3UoCo4KJDIvs2ieMGRdDseGi/L+ZB9wwaC9fvBK267qHZJFtZ1uR2jfTb
   +F4oruGhnf2mMYqiz6I9SiTy/k+Ey28i6U5ktZINnbskOGZzGDyeZYyVt
   VJVJp2+tVgcwKpUjwoYAG19IswQ6ee8ods/Fq2MaPoYmnEx1NwVG3Skvc
   EZ8k09t1sbv6YT9wfxktAEN/I8XOvA4H1aI9DGTKBd+OCqwG9SF1zt3xe
   Iv3tKUejSmY2BeHGGrVUqX6YsoBpwR3MQMRXkuzVAUAvPW7+1ViQ+5+NJ
   A==;
X-CSE-ConnectionGUID: 5WT5f3vHQCafDGOizY9MbA==
X-CSE-MsgGUID: TGxoXZjPReey9M0zFbgCLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="45036654"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="45036654"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 04:07:55 -0700
X-CSE-ConnectionGUID: K5QEvV6/TSqPAEBrw6T91A==
X-CSE-MsgGUID: reBnuTEBQL+O6BgutpnMBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="76173153"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Oct 2024 04:07:51 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sy84D-0006HV-0W;
	Tue, 08 Oct 2024 11:07:49 +0000
Date: Tue, 8 Oct 2024 19:07:40 +0800
From: kernel test robot <lkp@intel.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: Re: [PATCH v10 7/7] remoteproc: stm32: Add support of an OP-TEE TA
 to load the firmware
Message-ID: <202410081902.TwQcmWjk-lkp@intel.com>
References: <20241007131620.2090104-8-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007131620.2090104-8-arnaud.pouliquen@foss.st.com>

Hi Arnaud,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9852d85ec9d492ebef56dc5f229416c925758edc]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnaud-Pouliquen/remoteproc-core-Introduce-rproc_pa_to_va-helper/20241007-212358
base:   9852d85ec9d492ebef56dc5f229416c925758edc
patch link:    https://lore.kernel.org/r/20241007131620.2090104-8-arnaud.pouliquen%40foss.st.com
patch subject: [PATCH v10 7/7] remoteproc: stm32: Add support of an OP-TEE TA to load the firmware
config: alpha-kismet-CONFIG_REMOTEPROC_TEE-CONFIG_STM32_RPROC-0-0 (https://download.01.org/0day-ci/archive/20241008/202410081902.TwQcmWjk-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241008/202410081902.TwQcmWjk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410081902.TwQcmWjk-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for REMOTEPROC_TEE when selected by STM32_RPROC
   WARNING: unmet direct dependencies detected for REMOTEPROC_TEE
     Depends on [n]: REMOTEPROC [=y] && OPTEE [=n]
     Selected by [y]:
     - STM32_RPROC [=y] && (ARCH_STM32 || COMPILE_TEST [=y]) && REMOTEPROC [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
