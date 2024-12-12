Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585622010F2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 07:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733989982; cv=none; b=ZYxBobdiHeV49iKuxfVyyuGps9WUC3gW1TOm4AObxhlW/Pr697TckFh7rg5KeY8BtV7VmFX2shB5b4B6DxEPfIo+2KjviTnlk+KHR+zUl4awydfZgsBcs3gtxog7u4RZcHfBeQ0JvtA/rEJVFbVcR1baA1UrtlzQQWspBF3a2jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733989982; c=relaxed/simple;
	bh=FeN+kYGhSLU2OdeZAKeGBynGBn+5/wsVp9ZIQAxUo4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=kez3awsYh8UkSTXbAbrmz4B+gxeGTXllK9Hs4K4uoZiw8KE3ssNL3Pu1dtnn7ClSzUyA3wesWS0vgT/FSOJqWQY+eUQIBWKsrLO8NMVCEKOeUq69csEQU9Oa5/JM3bcslG55+XGDMqGJo4VM3ziudtNTTqXGaR7fu0T7jrPcxjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CwACS3BW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CwACS3BW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733989980; x=1765525980;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=FeN+kYGhSLU2OdeZAKeGBynGBn+5/wsVp9ZIQAxUo4E=;
  b=CwACS3BWtUUbFUex1IfBUCSgERt6nBbefr8XWUOaxbR1Ix1LoN6RcC4h
   1qNZNZ7Bqn/zr/XvU3uFKtegiz+jV0hQ80U1YGBoH3GxnbxnIJgdamdyt
   7VHMIZYapsYmW0/jNVgr8CdPOyPBf7hi6czEJBkBgkJlDc7MC/io/OWf2
   IUWDgv4BUDMdNiF+LRovi7P1xcxgPtntVdq+ro1xN9oofLBLTp+W58RPI
   FgOSdngPiFP5sM2KeoM2x0Qp89UAtSfEQHxmxYZBLuUTLVR/GKCrIjMQc
   6nsF1I0Vk4tKj2mMfmQoC/lYjf8/ShefyPUnLdN/1c//NK7lWe8D8tJc+
   g==;
X-CSE-ConnectionGUID: Rv1T2d91S+a1mv8HN8rDnw==
X-CSE-MsgGUID: OSfo8uvDSF2L3NXXGHOujw==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="59794692"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="59794692"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 23:53:00 -0800
X-CSE-ConnectionGUID: ficu/U+9S4+rvTxZ3cNz7A==
X-CSE-MsgGUID: Nv7k/bueSayhIuv7P6FHaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="95906844"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Dec 2024 23:52:58 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLe0F-0007bB-2W;
	Thu, 12 Dec 2024 07:52:55 +0000
Date: Thu, 12 Dec 2024 15:52:51 +0800
From: kernel test robot <lkp@intel.com>
To: Narayana Murty N <nnmlinux@linux.ibm.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] powerpc/pseries/eeh: Fix get PE state translation
Message-ID: <Z1qWU9RAvhIma6b7@3b9f04db549b>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212075044.10563-1-nnmlinux@linux.ibm.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v2] powerpc/pseries/eeh: Fix get PE state translation
Link: https://lore.kernel.org/stable/20241212075044.10563-1-nnmlinux%40linux.ibm.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



