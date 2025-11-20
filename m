Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C17305940
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 07:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763623660; cv=none; b=qhMaCYSF07ockGx/N308lsn85KZdJL4JiIMQwKPEU4DBVh52kbvK8UWjh6hFE0fmPbWFsKXiOz1KZvbJpYZOSCHcdJVsS2tzfNYm0AgS7/a5P7dmOJlWYhUj6IdR9+VX9jj5OxOOFDtMvW2m9ixBuUgjycxRV7OtonA3IvBIObo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763623660; c=relaxed/simple;
	bh=uhCyuvScHcMXkMrVf5+9mwxwLss7Z70xWsWAgwg65AM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=DofeOsyXRg2CgCrhowQgHW/mNWGcqDhQS4aSR8oyqNZbgAqvZUQJdTLBF2MftlOza7AQBOq8q2wmm6jIx1yNuB7caB03zaBddfXmTXmkq5FBa9w6CApE/X73UyPCrkyMy0PqeLcPBh8RJei40/fNa7becABw1lUIqJkYcZUspwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P6hUNCc4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P6hUNCc4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763623659; x=1795159659;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=uhCyuvScHcMXkMrVf5+9mwxwLss7Z70xWsWAgwg65AM=;
  b=P6hUNCc4QOxcC2S4cm4cDc5IIyOQn6jGCNVp1Hf0grJhlu+yPPl3oDTH
   GU41jznyhgN9l4vzpNkcCJJQCC87V19JLrj4s92RWiNvo4hwW5M1QdE9Q
   uzVGgqKITBVnNS2V9N9crAMxkOojG0R1WLamNaCieLBABO3Kt9Rsx2SOA
   /Z+zbF7Sc2PkRcQ9QUUrX7u6FCKsAvUWVW7P/WxgIzHLslPfzr8wt+Ba+
   UPPuHTD7Wgi3n1Dj/gxtFKGT7u+LMwQLCnyYIotagqsxittT+N7HRNKOI
   kQkmecFi+tHH+DWy5EFppzwRKSblAZSgG85rykV1XUqPi2paiYNQ/SjU0
   A==;
X-CSE-ConnectionGUID: yTwIeS+HTb+Ta3iLOuCjnw==
X-CSE-MsgGUID: vzUKwQ0XQmmx2cKu587QYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="64876494"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="64876494"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 23:27:38 -0800
X-CSE-ConnectionGUID: r+EVo+pVQlmJlU3N4BfPeA==
X-CSE-MsgGUID: fynJ7+m4T5enqxYsI+O2nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="191545264"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 19 Nov 2025 23:27:37 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLz4p-0003it-0Z;
	Thu, 20 Nov 2025 07:27:35 +0000
Date: Thu, 20 Nov 2025 15:27:16 +0800
From: kernel test robot <lkp@intel.com>
To: Suganath Prabu S <suganath-prabu.subramani@broadcom.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH]  mpi3mr: Prevent duplicate SAS/SATA device entries in
 channel 1
Message-ID: <aR7C1O597DimVIaj@9008770f0454>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120071955.463475-1-suganath-prabu.subramani@broadcom.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH]  mpi3mr: Prevent duplicate SAS/SATA device entries in channel 1
Link: https://lore.kernel.org/stable/20251120071955.463475-1-suganath-prabu.subramani%40broadcom.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



