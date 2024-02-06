Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133E4132480
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Feb 2024 12:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707221887; cv=none; b=MCXUKbRU3SwJHpHGCLW8G0eYizsJZHJ9KfmLZn/hpPfLqxDqFo83MuByQgnENg5v5zaar/cMDNAJ5kiGYKkehxfzvv/S4xCTwEnXHR6OVFy4kfWPkiqYxxJEkK79cLQG28Zj6IIv4DiH7sHbC62SJGKjqOM0VlLZ75CKpoqHIyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707221887; c=relaxed/simple;
	bh=lZ3oCXnW9jrqZLVB0ziQtj/m/gYA1Btvkk/G3imwbNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=f75XhUvwr3y6oVyCEW63sZxMkzgAIzdDd2Z++I8AAFcXtrpcJYwR53f8do0FNIjTUKWisjYVHq7sFaWH1SBZIMc/3Jmp4iEhDDVPcl7aIJJETKSfEkE0cf8BFS3fZqKeHxmLVGpv5+tT17Ln0srdgQkvh+0nnnM3oh5U2diJJEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VVGimd2H; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VVGimd2H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707221886; x=1738757886;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=lZ3oCXnW9jrqZLVB0ziQtj/m/gYA1Btvkk/G3imwbNk=;
  b=VVGimd2HtiUbskpPX9uLimfiN1vj1tsYS+ChFt4aDFAgcAhaXuZAMhGp
   o8z3t1ne8ceAX4JMznftmlsWifc9opt4bO5SJzBUZmz1ShICl26tPABVO
   hmgYsrBBnmZxm3U1j3xa+QuBOTJw+6KWdbAS5xQHvLIxz4CWEP2log946
   viT0evL7PHzS5DdtntYQ3zGEdKlgDcjzgHVxfV3mz7+9dC0yeIs1lLwS8
   pHYNZtkv5XJgcEPO6h5ch0KuOEiHmThajcx62ZvmQpAnts9RU/negIFkt
   TXQRSTws0siXYwepnBnVSfiQtJWC06P5KKZyCgz4cC2YClpqm9RfRit8o
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="23207470"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="23207470"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 04:18:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="933443878"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="933443878"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 06 Feb 2024 04:18:03 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXKOm-0001MY-2j;
	Tue, 06 Feb 2024 12:18:00 +0000
Date: Tue, 6 Feb 2024 20:17:03 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [v6.6][PATCH 09/57] eventfs: Use ERR_CAST() in
 eventfs_create_events_dir()
Message-ID: <ZcIjPz0OgAbfVmIb@ddcdc6924185>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240206120947.843106843@rostedt.homelinux.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [v6.6][PATCH 09/57] eventfs: Use ERR_CAST() in eventfs_create_events_dir()
Link: https://lore.kernel.org/stable/20240206120947.843106843%40rostedt.homelinux.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



