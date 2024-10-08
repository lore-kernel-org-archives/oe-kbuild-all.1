Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841B81DFE1A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Oct 2024 08:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728375826; cv=none; b=cdbNgT1T1h/kF2MG2DioGFLzmBDCoDiK1A13KGhG6th4k+YLPhbMbCAHXREhrZxjjOON9N897SGE033CLnJx7Gp3nfv+sib2ajjUX3hfSsDUPhV2qDugf4FirzCxgDe5oVaD0+3Ab1aqqA0yVQ34A4mXKGG/ORSGlOVEhW1uxzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728375826; c=relaxed/simple;
	bh=A1L/WgNaV7J3fzpEqZMltpRqcfSEgMFHoESOl6NHrAU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=uueN7uIbyQ1JHY5AmdG6J3u/p2rPWLXE5lppI4DdmwlrHMKCdvsi0O9AO7VR8KTFzPhjFE4AtHNhlzaBGy727U9jYQD11mMnYvABZv8xFOUahhq4vXwF0YYC+x/0S+r/FZu/W42aDTAo9gayMhvZGRHvAK1/zWGOiOke/hnktWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lyn2Q2mX; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lyn2Q2mX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728375825; x=1759911825;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=A1L/WgNaV7J3fzpEqZMltpRqcfSEgMFHoESOl6NHrAU=;
  b=Lyn2Q2mXgRzcuM16LbOkPtmTBd6JjqrwHJ9Jp57s4CHp3l0u9sX4zGLT
   +9erJBjDcIddQhjYvaBxd7t0mw3SQ2X6Ev35runJ1OlDhPX5X7Bv8ECEc
   1LYeO1QVifwTebMxyG6tS8Qfj2VjIckTavOLVJZaQ3oZwYsf+RqK/ZMwF
   RND5Y3A+dgPTVSFzGobMKZRZpy5YQa5geU5ArSVpVYa+2tiBAJPZaKhpW
   KI4/U3Dbyc2F/nxt8gdra3cyMNwfT9994vIbyJ31TsQuPSlv+WCIvgbzZ
   W21sS4P9RZaW1UxrRDjlWh/138n+h8v6hOZpvcD4Bdp/zq/7BDnhY3PGl
   A==;
X-CSE-ConnectionGUID: /GAmVuERSWmFpw9Mk8WC1A==
X-CSE-MsgGUID: Gpzuh8sfSj6ODz+Fs7WOXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38118713"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="38118713"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 01:23:45 -0700
X-CSE-ConnectionGUID: chgoQY0YReqNikuZ4DqAeg==
X-CSE-MsgGUID: nsOW/BlNRnelt5QKhgxJlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="113216829"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Oct 2024 01:23:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sy5VM-00065l-20;
	Tue, 08 Oct 2024 08:23:40 +0000
Date: Tue, 8 Oct 2024 16:23:18 +0800
From: kernel test robot <lkp@intel.com>
To: Yonatan Maman <ymaman@nvidia.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 1/2] nouveau/dmem: Fix privileged error in copy engine
 channel
Message-ID: <ZwTr9gS7G7_T-mNP@b1422e034610>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008073103.987926-2-ymaman@nvidia.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v3 1/2] nouveau/dmem: Fix privileged error in copy engine channel
Link: https://lore.kernel.org/stable/20241008073103.987926-2-ymaman%40nvidia.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



