Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794561246;
	b=Nj+M8y4eaVAy6rvZnkPbyopGtY/68xga6PMLYw21rqUfqBvjf9XhIIpoeM+KCQYJF0zB
	 b4yssN7puJKZgQ+5TkFM+dsQkODhHN9S1l9n4FVC4vs046YK4KcSyDGZD12bQ4UjYUUSS
	 sF1qjo6p0GO9yprvapP8Iu65yBDH7jvckWdiSypsZwae1pxDDENU94+UNjNqqeSBz45r7
	 9zDDrwgHPKwpP08bKnCuWXv4WfRWT9/MtrVrVu8jNk8bzknK7XvtAAyD5qLoBIFpJD/3v
	 9Rqj3Y0wd3BoHO/0haSDBITTPeMlu8ufwVlvmap0pkHzg/jqhf4+4REc1Qin7pVR+Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794561246;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=rcCOAgaNQ6mOxfEeq0aJhRnhXgr/WD3qzoIXLp7iAwM=;
	b=JgJPDvYNnZR2NnlCJFx2s+GvOGxoP/WXNlcN5LCtJpZqr5gUAVAAGNDQuwyMJDNelgX3
	 0WrIyhQ7BunyU6BbTX9ZBlAfvLhK5TLXjFxRKBOx4PlknoNQ84t2Yo0bhTGXUFo/wHkzH
	 6qNazggds1odi1nAzZ2H9ez2xDrCwOH20ckl9dNIb24MwgF3s4Jfm/9mUrmSiX/CI+UKL
	 dBcS71PMo+oFUwS/HWKcGwr+ze2EGpbz/+fCk/z6JNkG98cxSQpSpBkXV1VTZpJN3b5nL
	 W/Ox+39dFFBV7i2R1XIs3Ha0+9eQJ053W8KnKFIUJHJtfokHG10FUnA8+8LQQT0wlWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nzYFBAvs;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F89B606A321
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 09:14:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F89B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nzYFBAvs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794561245; x=1826097245;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3YQC2srLmB0eRjZt+W5Kk9zvcxE/nqYSAZ8PFwWwbRU=;
  b=nzYFBAvs8djHhSdWEJCabzoU5932qyHqClo4rgGp5UbO6hEFTPEAqCl7
   LPf57dpt6er7uYNsQqhPm/4DdQNqFtCSAuTgsxM3zg2OMkaYe1pP1l0Nk
   HGotaAoZ0Q5NIcYH0nNCs7ZbOgWt2ngH9N6rwvmXfjXg1UvQ4OTW1rCMt
   tpO6/qzXK08E8PZg/zlgakjveT+96AXw/a8MTfYvxconEh0m4tqFbnQq2
   iZNWMS5KHMbijP5Gp10r/hkEB7nGzbzY5n/8HRbI0hAuf6m7TQRX5PbLw
   3iON6V4rc1HaW8G12PFkbopwLz5d380qrWOaDz6+52nGIKiYS66zfz1o5
   A==;
X-CSE-ConnectionGUID: epa/QYQ5R+GL/42qaKTJ0A==
X-CSE-MsgGUID: R1zAM3rQTzWdH2XPqLdCEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3388890"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3388890"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 01:14:04 -0800
X-CSE-ConnectionGUID: 918UqnjfQUaNbjvAweC7Xw==
X-CSE-MsgGUID: NDVEmg+mRYOn7n4rQPLLqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="10656371"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 13 Nov 2026 01:14:02 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRnM7-000000012ch-3Yr3;
	Fri, 13 Nov 2026 09:13:59 +0000
Date: Fri, 13 Nov 2026 17:13:20 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, Sudeep Holla <sudeep.holla@kernel.org>,
	Jamie Nguyen <jamien@nvidia.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Dat Mach <dmach@nvidia.com>
Subject: Re: [PATCH v2 3/3] firmware: arm_ffa: Share FF-A version negotiation
Message-ID: <202611131749.3XbZQkPM-lkp@intel.com>
References: <20261112-acpi_ffh_ffa-v2-3-575a9dbed22b@kernel.org>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112-acpi_ffh_ffa-v2-3-575a9dbed22b@kernel.org>

Hi Sudeep,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7475ea8b58616b33c04afb976cf0fbaad9dd63fb]

url:    https://github.com/intel-lab-lkp/linux/commits/Sudeep-Holla/firmware-arm_ffa-Share-FF-A-register-field-definitions/20261112-111406
base:   7475ea8b58616b33c04afb976cf0fbaad9dd63fb
patch link:    https://lore.kernel.org/r/20261112-acpi_ffh_ffa-v2-3-575a9dbed22b%40kernel.org
patch subject: [PATCH v2 3/3] firmware: arm_ffa: Share FF-A version negotiation
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20261113/202611131749.3XbZQkPM-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611131749.3XbZQkPM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611131749.3XbZQkPM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/tee/optee/ffa_abi.c:8:
>> include/linux/arm_ffa.h:189:37: warning: 'struct arm_smccc_1_2_regs' declared inside parameter list will not be visible outside of this definition or declaration
     189 |         void (*invoke)(const struct arm_smccc_1_2_regs *args,
         |                                     ^~~~~~~~~~~~~~~~~~


vim +189 include/linux/arm_ffa.h

   182	
   183	#if IS_BUILTIN(CONFIG_ARM_FFA_VERSION_NEGOTIATION)
   184	int arm_ffa_version_get(void (*invoke)(const struct arm_smccc_1_2_regs *args,
   185					       struct arm_smccc_1_2_regs *res),
   186				u32 input_version, u32 *version);
   187	#else
   188	static inline int arm_ffa_version_get(
 > 189		void (*invoke)(const struct arm_smccc_1_2_regs *args,
   190			       struct arm_smccc_1_2_regs *res),
   191		u32 input_version, u32 *version) { return -EOPNOTSUPP; }
   192	#endif /* CONFIG_ARM_FFA_VERSION_NEGOTIATION */
   193	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
