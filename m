Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23DC2AE8C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 13:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730122386; cv=none; b=LVRbGEMSaOrIUEuuG63SF7c2oSKhFWr9Pmw8pYQ1e0R+2mDomh1xALYcfXhaRnVEPuSSAxedOUAuKNq4D+bLv7f8xev1HMUhoD4IRIl2sinyrMvTqV+1pydZxxAFuACewrF+imVxuIeMH/8gh4fWW9gKbV7Fh81rxWTmEvB0D0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730122386; c=relaxed/simple;
	bh=K3JTVNxt4daTB+iZYPMb6lhrl/O9vAeWrW/JfFvSVs0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=SkJo3W+bUpHoYsiBRLwiRbLRLBaVXfe90h5VRk6yHkWncd9YU/ExrizHKVHHPhyCfiwuG0jHVXNlUxISTdvN9a3uz41tNZE7lK4ReXV5s11Yr1B70OMFcC2p9u7ouRdraaZkH/KSNabLDkGzu2vXy+q42AF3F4VnP8TwdLp85Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jrr6CxFo; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jrr6CxFo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730122383; x=1761658383;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=K3JTVNxt4daTB+iZYPMb6lhrl/O9vAeWrW/JfFvSVs0=;
  b=Jrr6CxFoeX/Ol5AQnycftJ9YeNBKNXGFnPc6dLiOwoKYKukvtoI4/MKo
   j9FmJhOBrkIX5qXFXatF7nHF60JDmpDahW7bdESgOZy7CYRRKryqSVaaf
   AchRe8aatnOxMb0uhg86nIoRMjP8cPpVfy/Ezbh+5a81tat06Dmrj3IxL
   47mXVyFFcBtClkFzFPF5l9q+GDMJqW9fvhtKcMJNoZDViXpC/ujtqalH2
   4UUE/AdPtKdLW2OWyhBq6fKKSY2TUft8ApdbPK5BQ4821QkzrVA1bAHy6
   Z3LlG8MoJWkoIkmFjpFRZvbsvN0G3SWOLH2iRhPUWonCr1bopMMn6pt/v
   w==;
X-CSE-ConnectionGUID: iV0DNZK8Qa2gzisSHqezRQ==
X-CSE-MsgGUID: 73z/Hv/TTeSOlDFtlcx2EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29580097"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29580097"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 06:33:03 -0700
X-CSE-ConnectionGUID: iZOndzyDRXObJjHvPpDWBQ==
X-CSE-MsgGUID: 2lRfUCrDS06nimMahXgflQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="119081705"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Oct 2024 06:33:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5Prg-000cTv-0b;
	Mon, 28 Oct 2024 13:33:00 +0000
Date: Mon, 28 Oct 2024 21:32:50 +0800
From: kernel test robot <lkp@intel.com>
To: Steffen Dirkwinkel <lists@steffen.cc>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] drm: xlnx: zynqmp_dpsub: fix hotplug detection
Message-ID: <Zx-Sgv9-7QWYiJwN@433b1ac7a1a4>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028133138.52973-1-lists@steffen.cc>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v2] drm: xlnx: zynqmp_dpsub: fix hotplug detection
Link: https://lore.kernel.org/stable/20241028133138.52973-1-lists%40steffen.cc

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



