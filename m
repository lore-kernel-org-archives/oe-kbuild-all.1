Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3C43081C5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 21:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763675066; cv=none; b=A0NTw+Uu6NDqwIoBSbOWP9cfYQoWnci9PnZ+PaQ0Y8FOIqoVMatM1pWw0ryLL84bhT9ZgOqDP48pPckmsd86fIAIdB8xnyUwzWKVv3jpPEOOGqB+AYB478zT94ssf26muuTacftS01IpWYTrlqzpI7AVmRVyCyBdv6worRKFdks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763675066; c=relaxed/simple;
	bh=XySvt0lCaViTqTWWhO6/l4pCGEaIlkk736s+fhpn5UM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=n9RORjIn85yFH/IIwla6PD9IIDmuorRxVpDOE/OAOJTDM3URrAyQ//2wGgQjV1zMSpeIKFCZmnEow7kTk2feSz2K/R+RguebUp8XP8yfVbmgG2XcwxBKv2raPpdmOwYMCS/I3QrDjmrNcvjB7yZt4Sk+ghhHBnLPDInrW+BFGVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U/UKRryp; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U/UKRryp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763675065; x=1795211065;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=XySvt0lCaViTqTWWhO6/l4pCGEaIlkk736s+fhpn5UM=;
  b=U/UKRrypfWGewqs6CV5djEVKgcf6XD6J69D1YHes8tLwqNKNE8WfP11X
   S40Oz7d2FqYPRZkO7vkG7TML23PUUt82gBbI0h6AsdsfCeZ7Nn12ooqf/
   SWZGWmxf/axc48dVONqNRciADJE7eWsZIy/RMuKrcynE0AMKXoV4r0UPK
   vENyshXTB6wh3omdqUcJKTpKRzkuHBfAFzR2QIY/R4sNSPUJVaHzrlLZ1
   RzmfmeC78gsjO32t8ohMzqiDLAnWmeKYgNTkRGek65lpsZza5CB26eQV+
   mrELjqFSNZ/2Lrtt+9Hv6L12fTSY+v4bXMrcvtCBj/SKTv6yDqStforuJ
   w==;
X-CSE-ConnectionGUID: pRIAO4GVRByUqC851YTtAg==
X-CSE-MsgGUID: +Oy1McW5SSagevTucuUMEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65799595"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="65799595"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 13:44:24 -0800
X-CSE-ConnectionGUID: lQABUD91SGyi/5iHNxEiaA==
X-CSE-MsgGUID: z/gItPqSQ7m/IjtURs8qww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="191305806"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Nov 2025 13:44:23 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMCRw-0004bj-2Z;
	Thu, 20 Nov 2025 21:44:20 +0000
Date: Fri, 21 Nov 2025 05:43:36 +0800
From: kernel test robot <lkp@intel.com>
To: Avadhut Naik <avadhut.naik@amd.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] x86/mce: Handle AMD threshold interrupt storms
Message-ID: <aR-LiMSfDZq8R1AM@efd0745277e3>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120214139.1721338-1-avadhut.naik@amd.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] x86/mce: Handle AMD threshold interrupt storms
Link: https://lore.kernel.org/stable/20251120214139.1721338-1-avadhut.naik%40amd.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



