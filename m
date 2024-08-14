Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D091B29C0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Aug 2024 14:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723644360; cv=none; b=rCvsjLfA+VjGTwXs8m2Gawb5f3f/F/XxVmp8qJyV5kFXDOYH4zTK6T+kl3TVFTX1fowwrgvpwcJfVLSGVKhckzK5fUspw2rvZRMJCurTh0LPoJ61C3M2KFlFem/7ARUZRIGAS0vlPVxfEF+1ynKDhIPavt5PfppCzbvAO/Ebxn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723644360; c=relaxed/simple;
	bh=tbPARqUuZyD60aX7fbd3GcCDXAeAcn/UkIS4M9KW59k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=tJhupiFG6J08qea/DfCqXlvQe29HHkU3rpw7ha5Z6UYUCCT1dEY9nnQqVBK/rc3SrDRW7z5xAMyoj/kzW8dDSxdhLCayIwnAbxrqWkl31SZZGLNEBq/8hispPQe/tTMoCtN3TitMKQycjtglpwDxVp4GqNVGPrqFKPcULO6lVXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZmP1U1SP; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZmP1U1SP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723644360; x=1755180360;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=tbPARqUuZyD60aX7fbd3GcCDXAeAcn/UkIS4M9KW59k=;
  b=ZmP1U1SPJpniKmipeIFfOgZ+h+9IKaljg34uzDyQPpLF3Ts6qvuRq0lT
   lr+Os+6qCaEPShMD9DG84tMjCHIhw9WVFwQjFfWdNGr1cyBUnLNh8VORC
   KKu1ybKwEbEVSp7aXQFCIn6n819RjjVxR4nBh2/jNlaq+1IS1O7QwWa1h
   1YuBsR/7S6tV+CyfWNCBY50OP0awREqiyLjy/dtMH6F669x1RcyZQeFGC
   qBRrcwlJa7xtB7U/WMlFy5AojtqUOms2PLjhax8sBov+IeMRo9qeKqwzC
   BhGbUJ0eogQJugA13M7fN5vdRehIl5vTleF7IpuCNBG4eWSiP3FkAVeQp
   Q==;
X-CSE-ConnectionGUID: EPfm/7oKTEmwn6tu3rfeAA==
X-CSE-MsgGUID: ogkm+V+FSa6Q9Uexidy3uA==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="13010047"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="13010047"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 07:05:59 -0700
X-CSE-ConnectionGUID: RZN5A0z6TVe0tdKebXmotg==
X-CSE-MsgGUID: Dt4SX2QySHC99b3cNlp9Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="59305541"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Aug 2024 07:05:57 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seEdP-0001rO-1J;
	Wed, 14 Aug 2024 14:05:55 +0000
Date: Wed, 14 Aug 2024 22:05:44 +0800
From: kernel test robot <lkp@intel.com>
To: Petr Vorel <pvorel@suse.cz>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RESEND v2 1/1] nfsstat01: Update client RPC calls for
 kernel 6.9
Message-ID: <Zry5uO_YWTWIfvN5@6301b87c729b>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814093022.522534-1-pvorel@suse.cz>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH RESEND v2 1/1] nfsstat01: Update client RPC calls for kernel 6.9
Link: https://lore.kernel.org/stable/20240814093022.522534-1-pvorel%40suse.cz

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



