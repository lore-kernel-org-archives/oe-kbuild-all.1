Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDD41E9B3E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Mar 2025 21:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741814348; cv=none; b=eyb39NJSLaVqtMrxLdnIvmXNZr9PHw4gqx64QescKk5BH57TJmviIetFh83Uhd+o3LvreWKEPDIsg3u9rMAHmkAOB0K8PiDCkqBzWg0yXdOjoOu43yLhaWQ/CyCFlWwG6+ZwA8/ERGV/1H//kI6xDP4X07wlWz5ZY2R0bTJYS/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741814348; c=relaxed/simple;
	bh=pudWzx6/w4XqZ1AtvbBmbJmDREsGrALHOsMBis/1c0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bAIi54FkJVjCIU+gDWl4HvZnt2mwg5IZyRnYpfE/liX3YPOGtZ+K0kwymvdvdMF2dzDH7qydqJOxWDiLh8XoEytg8cRDyjCoShX3rSVeskrOjFXxFsr5hNjR653RY4A1I6to0QRhqO/KX0ZXKV/SJf+dYJimDjwkeR1wSEY27Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SmV8j+V4; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SmV8j+V4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741814346; x=1773350346;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pudWzx6/w4XqZ1AtvbBmbJmDREsGrALHOsMBis/1c0I=;
  b=SmV8j+V4lw5otMTfQ0lgV8YxkFiB2HKB74fTy9Bto2lD5z+byV76/20/
   f3hb0ckDJlIP/kLMVDqUc49Rh0ONKy9/G9Uwdsl1pEFOpF3EHi/9UgfoR
   FRKNth+Xj+zaOHYJVV3+y+LmMmgIiK+TiRBhfBbjmNzbyQgR6ZiC3GSVD
   pHjkSQTQryW3NzptnR28CzB+t+5N/Hq125O0k/J5h919ZYwjcBt7yV9tD
   sAGwr0R3Ycr1HpY4rYpJ4AxtgAbqU1Zixu4dpeWZ0eQ3Az07crRhDlpKk
   MVYq0hDsw8cW7xc8GvyVLrSLxPeYf+CP8HpMuNJBiLksZ+qSlcMAAULdv
   g==;
X-CSE-ConnectionGUID: do5dSma5RueD0CivH+/GkA==
X-CSE-MsgGUID: KfcYYnfmQcaVErCzguP3Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="53545062"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="53545062"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 14:19:05 -0700
X-CSE-ConnectionGUID: 4nIHJ+U5S4WSfjFfpHFZvw==
X-CSE-MsgGUID: OV2P7ORDT9GnVycPM6jUag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="124917821"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 12 Mar 2025 14:18:58 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsTTb-0008uO-1n;
	Wed, 12 Mar 2025 21:18:55 +0000
Date: Thu, 13 Mar 2025 05:18:16 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Kisel <romank@linux.microsoft.com>, arnd@arndb.de,
	bhelgaas@google.com, bp@alien8.de, catalin.marinas@arm.com,
	conor+dt@kernel.org, dave.hansen@linux.intel.com,
	decui@microsoft.com, haiyangz@microsoft.com, hpa@zytor.com,
	joey.gouly@arm.com, krzk+dt@kernel.org, kw@linux.com,
	kys@microsoft.com, lenb@kernel.org, lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org, mark.rutland@arm.com,
	maz@kernel.org, mingo@redhat.com, oliver.upton@linux.dev,
	rafael@kernel.org, robh@kernel.org, ssengar@linux.microsoft.com,
	sudeep.holla@arm.com, suzuki.poulose@arm.com, tglx@linutronix.de,
	wei.liu@kernel.org, will@kernel.org, yuzenghui@huawei.com,
	devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH hyperv-next v5 01/11] arm64: kvm, smccc: Introduce and
 use API for detectting hypervisor presence
Message-ID: <202503130604.s2xx8AY1-lkp@intel.com>
References: <20250307220304.247725-2-romank@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307220304.247725-2-romank@linux.microsoft.com>

Hi Roman,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3a7f7785eae7cf012af128ca9e383c91e4955354]

url:    https://github.com/intel-lab-lkp/linux/commits/Roman-Kisel/arm64-kvm-smccc-Introduce-and-use-API-for-detectting-hypervisor-presence/20250308-060639
base:   3a7f7785eae7cf012af128ca9e383c91e4955354
patch link:    https://lore.kernel.org/r/20250307220304.247725-2-romank%40linux.microsoft.com
patch subject: [PATCH hyperv-next v5 01/11] arm64: kvm, smccc: Introduce and use API for detectting hypervisor presence
config: arm64-randconfig-r131-20250312 (https://download.01.org/0day-ci/archive/20250313/202503130604.s2xx8AY1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250313/202503130604.s2xx8AY1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503130604.s2xx8AY1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/firmware/smccc/smccc.c:19:21: sparse: sparse: symbol 'smccc_soc_id_version' was not declared. Should it be static?
   drivers/firmware/smccc/smccc.c:20:21: sparse: sparse: symbol 'smccc_soc_id_revision' was not declared. Should it be static?
>> drivers/firmware/smccc/smccc.c:81:37: sparse: sparse: restricted __le32 degrades to integer
>> drivers/firmware/smccc/smccc.c:81:37: sparse: sparse: restricted __le32 degrades to integer
>> drivers/firmware/smccc/smccc.c:81:37: sparse: sparse: restricted __le32 degrades to integer
>> drivers/firmware/smccc/smccc.c:81:37: sparse: sparse: restricted __le32 degrades to integer
>> drivers/firmware/smccc/smccc.c:81:37: sparse: sparse: restricted __le32 degrades to integer
>> drivers/firmware/smccc/smccc.c:81:37: sparse: sparse: restricted __le32 degrades to integer
>> drivers/firmware/smccc/smccc.c:81:37: sparse: sparse: restricted __le32 degrades to integer
>> drivers/firmware/smccc/smccc.c:81:37: sparse: sparse: restricted __le32 degrades to integer
>> drivers/firmware/smccc/smccc.c:81:37: sparse: sparse: restricted __le32 degrades to integer
>> drivers/firmware/smccc/smccc.c:81:37: sparse: sparse: restricted __le32 degrades to integer
>> drivers/firmware/smccc/smccc.c:81:37: sparse: sparse: restricted __le32 degrades to integer
>> drivers/firmware/smccc/smccc.c:81:37: sparse: sparse: restricted __le32 degrades to integer
>> drivers/firmware/smccc/smccc.c:81:37: sparse: sparse: restricted __le32 degrades to integer
>> drivers/firmware/smccc/smccc.c:81:37: sparse: sparse: restricted __le32 degrades to integer
>> drivers/firmware/smccc/smccc.c:81:37: sparse: sparse: restricted __le32 degrades to integer
>> drivers/firmware/smccc/smccc.c:81:37: sparse: sparse: restricted __le32 degrades to integer

vim +81 drivers/firmware/smccc/smccc.c

    69	
    70	bool arm_smccc_hyp_present(const uuid_t *hyp_uuid)
    71	{
    72		struct arm_smccc_res res = {};
    73	
    74		if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_HVC)
    75			return false;
    76		arm_smccc_1_1_hvc(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID, &res);
    77		if (res.a0 == SMCCC_RET_NOT_SUPPORTED)
    78			return false;
    79	
    80		return ({
  > 81			const uuid_t uuid = SMCCC_RES_TO_UUID(res.a0, res.a1, res.a2, res.a3);
    82			const bool present = uuid_equal(&uuid, hyp_uuid);
    83	
    84			present;
    85		});
    86	}
    87	EXPORT_SYMBOL_GPL(arm_smccc_hyp_present);
    88	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
