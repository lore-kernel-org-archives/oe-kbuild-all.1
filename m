Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBCD651AE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Mar 2024 16:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711642351; cv=none; b=Q+HRqaclY3qI37jobO1Qn8c7PU+5gSxbleeDoi916K2k0yk8qz3P/jtnXCUjERBe/dCTO9sd6gKS8tjY+bcORs+m2HaaBr++AuuaeEYwXElzLWiOFdV7aphAJlbkXX4uvwoWbW4qfFBXfSyAVrfuzvOUqaKT/81yfk1y4ZyXp5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711642351; c=relaxed/simple;
	bh=/8GP8z5umjlvZRYL/u0lQ5WKvxrXJn0bO0Gwl6xJAiU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=jrNGIu/Izew37GXEtI2btIO4BXd9103Jr69NGQnrxuMfZID8TOMuSUpwta2J85tYi90t6u88q3k8QD/Mwni8fhl1rJ13FZVuOJN7avFxmwCA3qjvfjSOh2XDDEm588Ve7cgJoJZIznoM7VcognYBU795b07pZeiFJ8aLpgXcJUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XjnvPcSw; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XjnvPcSw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711642349; x=1743178349;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=/8GP8z5umjlvZRYL/u0lQ5WKvxrXJn0bO0Gwl6xJAiU=;
  b=XjnvPcSwLwB4zkB4LOBQnPawoTYBGP/MeGoVePnYJH+Y8uJQEfqYFv3N
   a6UWFZN72tk0mGXcRarS7j2FLK1z62H9L91vx40mIgkds6R+cbcUXxXui
   XnCfZGpawJmtKopOCZntxVMbODkBS0TpzTjK0OdYJbGA++MFPrlt8y1NM
   vx5OMqjrQjRtQ5mKy8hqyFjxVFlFcyHSM5rEkagskcj68j0S05Nua5bkP
   cdJLY13DKSSaZGx54CRoP7y4f0nA5GH9tILT7Gp7HgB0rHTZzhbvSm+uz
   OEmSFI9wBT1OoApcTud5R57eVoGJxw/dzgrIXojfcly8vXbt2sFcWhpXI
   A==;
X-CSE-ConnectionGUID: QBg8FIz5Th2f43uWLo+x+Q==
X-CSE-MsgGUID: 3KPO9MGeTDCwzCbtke7zeQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6921830"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="6921830"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 09:11:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="21367075"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Mar 2024 09:11:14 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpsLP-0002JE-0S;
	Thu, 28 Mar 2024 16:11:11 +0000
Date: Fri, 29 Mar 2024 00:10:48 +0800
From: kernel test robot <lkp@intel.com>
To: Steve Wahl <steve.wahl@hpe.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4] x86/mm/ident_map: On UV systems, use gbpages only
 where full GB page should be mapped.
Message-ID: <ZgWWiBzhrvHMPjZd@f34f6e606ddc>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328160614.1838496-1-steve.wahl@hpe.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v4] x86/mm/ident_map: On UV systems, use gbpages only where full GB page should be mapped.
Link: https://lore.kernel.org/stable/20240328160614.1838496-1-steve.wahl%40hpe.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



