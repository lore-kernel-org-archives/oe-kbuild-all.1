Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C816F131E27
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Mar 2024 13:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709733147; cv=none; b=eZCbfltlyKNTkVQwryy02EREH/wnE6b3UjBkkkgbEjdk54vd+S2sF+BGWfAPjNGA4ZpznkAnfE0ajNOuO0BItW6kEl7VyyBjX//tgPBhQiMbFYBgQMG8pZb4sl7aF9rc//H3YgSU03tK3Ym+tOTFYnQy+4c3KF7pd4tN6/u4kyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709733147; c=relaxed/simple;
	bh=hLlFWfK7U9czUprUrCxIsJwcRynBq1e3zZxrE3z4kuk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=kpNY5LOfdFGcPTzd7I817v3St0hAnwL7IdfW8VTyc2bXay7jhLUmcMemi0CxyPPYyj9NZYk5jmoTpm2Ha23juQep0uoU/OP/TswWdk6UkwQT72Ek0W4XEe5QBuQDzRkUrN3uOQZenFTjSj6Tg6lKq9NLms45r8C6xS2FlY6O4a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y/a5yc2V; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y/a5yc2V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709733146; x=1741269146;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=hLlFWfK7U9czUprUrCxIsJwcRynBq1e3zZxrE3z4kuk=;
  b=Y/a5yc2VILZXb5IfAbAEXTclBpkCLhLB78DvrlxDQv0Zv3JGGv8MWV8B
   ZsuJqNMAEfBXqfcPfS5HB5CEhdevPtJC+ri+19nLf47asP+iziq85++Gi
   HrbcW08q5vvqWm4hTHE0WhiVPStvC7U7Z/8vkStqNNDP84F9Wra/IKNam
   TmSBE8hrFSmoA77vagTP6Zqeru8Fu9L/nC4gY085kYkGCBNp8bctptWY8
   QbBdTMe8o/m9zTcJSMzapZJSVvG1CoU80oPVtNQkuzw7sggUyhFZdXGV5
   clao3CVuU7MdDCbkKtxGHGQnWKPdSDQC0aIPTCkpzdDLlBfuexfSM2q/0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="14920132"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="14920132"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 05:52:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="9695639"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Mar 2024 05:52:23 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhrgz-0004Gb-0U;
	Wed, 06 Mar 2024 13:52:21 +0000
Date: Wed, 6 Mar 2024 21:51:28 +0800
From: kernel test robot <lkp@intel.com>
To: Mikhail Ukhin <mish.uxin2012@yandex.ru>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5.10/5.15] scsi: add a length check for
 VARIABLE_LENGTH_CMD commands
Message-ID: <Zeh04FzDMBIY4jhQ@0a06dd0f349c>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306135010.9250-1-mish.uxin2012@yandex.ru>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-3

Rule: The upstream commit ID must be specified with a separate line above the commit text.
Subject: [PATCH 5.10/5.15] scsi: add a length check for VARIABLE_LENGTH_CMD commands
Link: https://lore.kernel.org/stable/20240306135010.9250-1-mish.uxin2012%40yandex.ru

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



