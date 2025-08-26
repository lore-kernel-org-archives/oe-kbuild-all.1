Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7E92F3603
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Aug 2025 18:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756231594; cv=none; b=GtveFAEXGG6b3/ct9Qv9mNkB2eCUTopTm2U3svSFWnoMdxZjxUhsSP5TexB9uViBAvVVoxaOZD2h0FyWlPau9vftXqaboh/vlpUywnc0VI6zTyOIy+1asCKQdo+Z95UHlzVgoZEqq+nqmJ4Z4xn24bUeEDxKV6myInU3ouXUKvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756231594; c=relaxed/simple;
	bh=3yt5dOdcqi7JGAGEQsZkI9ccgNfNqzXU958A0PhGxqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ZGIsLK+UIgahMI5sMGe47hM8jTXfrVc/3TFNnTk4bfHVZFCCqWBliHuces57piHKZsCRNHubmSxDGp6Hajm7edSMXtb0UpdtQ7yVPDhlIWujqXRlgUSmxEU+JXmGMdWmEOrtnPWZZuUNTM8nBK86TamRbb630HzFOJ+1lQPG4k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QTXW+oMP; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QTXW+oMP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756231593; x=1787767593;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=3yt5dOdcqi7JGAGEQsZkI9ccgNfNqzXU958A0PhGxqA=;
  b=QTXW+oMPXwfdk44MdjQkPBns+gek19H90G4RX8FxIEgjpIyEIW6rUKF2
   YvFiQBvkbzPsY16CqKQoAUHVroXEflYi6nColjph4j1mdF/CzK81NQXie
   hwW8P1psdsH/bqKTY7rjrQbSgRRLmZk6zXtZpaiwR7lqsLFGnJ/qLpR5n
   idY51SnARwSbUpU0vmdO7amwLFq+1HVKE2XrOyrtwyEqGJQDAmuXZ7oK/
   TCBW/kSsCIAu+LqJLOiaPAOrZ1jEChptkD+qhh9//z80Qrv8gsUSkFZw/
   YOiQpeVJQhwPCq7w8XaiM5manRVJ8A+jUujcI4Q2IN2c9+zgtb6JNCYn4
   g==;
X-CSE-ConnectionGUID: KnqUNv/HQWaX8XgFVcJFZA==
X-CSE-MsgGUID: dZNXLy74RLSfN/YVOgqbIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="61112418"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="61112418"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 11:06:32 -0700
X-CSE-ConnectionGUID: er6Fx+x4RqySklPC0To5sg==
X-CSE-MsgGUID: 2Bpn9sKBRPWBY521WW4+jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169155966"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 26 Aug 2025 11:06:31 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqy3x-000SHT-11;
	Tue, 26 Aug 2025 18:06:29 +0000
Date: Wed, 27 Aug 2025 02:06:24 +0800
From: kernel test robot <lkp@intel.com>
To: Abin Joseph <abin.joseph@amd.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next] net: xilinx: axienet: Add error handling for RX
 metadata pointer retrieval
Message-ID: <aK33oFxPKeH2eACr@0d8035a08681>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250826180549.2178147-1-abin.joseph@amd.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH net-next] net: xilinx: axienet: Add error handling for RX metadata pointer retrieval
Link: https://lore.kernel.org/stable/20250826180549.2178147-1-abin.joseph%40amd.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



