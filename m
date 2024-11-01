Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69019154C17
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 09:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730453013; cv=none; b=qLXI4nLTecfM8vhPgsrjl25e2ld9F8Myg9Qgivd4KPTI4YF7iURgnxDBaNb4J02EqQ1QFqlZeqfcCPsMTjOEnEhjQ5rlgcYKWuZ5CHfzZQMWpHvqMyqHJrlj06c535zqNhtDFBPwCTVE+abdjJU9TiqBVmapBbxVWGO0Cas1V14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730453013; c=relaxed/simple;
	bh=YGNcY5tYRoRv2k5valMilOSX3CobnbPDrnOIKwuVFAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9/xP6QlvAeKJlohHiOi74u88Ldrzl6R0dYqy6twZ7nRhkEMt8+7TSrNeRP0/mGmd+winGmRuIiM48gjcyFi+wwE/DtjrRRvZy5SMdut2tOK+3FWGxPle9i61uyfWioN0PD/0nIGFRjXpGMX/TBkbfzDgfBxxHUpyv4mMvSFiaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ku8QXrN2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ku8QXrN2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730453010; x=1761989010;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YGNcY5tYRoRv2k5valMilOSX3CobnbPDrnOIKwuVFAU=;
  b=ku8QXrN2D1Sqt/3lQNAm4RBfxbtRq1mEkA47G6aX9dH7fl64/IblbQ+h
   jQL23JNde1d+jRgi/aaIHDgampQYcCbh3UhEA36HMaTfynLDUdLL99T7F
   xZpq26TxbSojT1EB+4ZVbcqU6TvLg5rGDE//VzL21Hrs3Z0X2tuhArAsz
   2vLgcPtllF7XDLwHtTnAmBrUvQYiQMteMebByHPHvWofADl4S3u5SWPYs
   NZ6y2JSbKArBI3tanamMbkaX++hILnQcd2RxGUhQAqKem2NNpJ2R24FIH
   bnx9y8UCyeqgDjp5ivhXI2dUnas9HBIO65e9idZGrwZfblZmLyedJV9Sj
   g==;
X-CSE-ConnectionGUID: S8VVujZTSdafX9dR345ydQ==
X-CSE-MsgGUID: YXAfkDSbSh6nfNs1zTioAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30172483"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30172483"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 02:23:29 -0700
X-CSE-ConnectionGUID: lrYhCldkRVCZktQx+6fJDA==
X-CSE-MsgGUID: n7JKL8OVRFOz81qY92LmmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="83032901"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 01 Nov 2024 02:23:29 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6nsN-000hLx-0I;
	Fri, 01 Nov 2024 09:23:27 +0000
Date: Fri, 1 Nov 2024 17:22:58 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 03/13] rust: sync: atomic: Add ordering annotation types
Message-ID: <202411011657.uZYRa8oF-lkp@intel.com>
References: <20241101060237.1185533-4-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101060237.1185533-4-boqun.feng@gmail.com>

Hi Boqun,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on rust/rust-next]
[also build test WARNING on linus/master v6.12-rc5 next-20241101]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Boqun-Feng/rust-Introduce-atomic-API-helpers/20241101-140944
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20241101060237.1185533-4-boqun.feng%40gmail.com
patch subject: [RFC v2 03/13] rust: sync: atomic: Add ordering annotation types
reproduce: (https://download.01.org/0day-ci/archive/20241101/202411011657.uZYRa8oF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411011657.uZYRa8oF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>> Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
