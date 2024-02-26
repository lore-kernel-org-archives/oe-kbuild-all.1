Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5B05D479
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Feb 2024 10:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708942409; cv=none; b=kvk/7o4JGGqc2YxqkgG7K01WqQaypOTyGmHhPqQxEvZHCLSUhUuUpTP8PQ1JflPpZrIFqIHgFP1HP1FexSxA5X0ptx4BTI0f48RnvMMGALYjdvuoVI7YxmeLF5huPwfFT9o0XXZzgoK5Q/EUKs70uxqnew6LWeAjQocDE4peSDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708942409; c=relaxed/simple;
	bh=xQl4Y5Xf2tWR3JxdHU2jdE068lsasi2wz4L1l27WpRo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=bXXGrnL+Vij/LtJZHqLQA0RSmhRAJqilf67r4GYU8DK8Mk/iT2qhSSl3WTG0UryoJiP/BuHbrQ5R1hSCEm+cv+ze2E+PjNM0DtaQ5iZRfU62fyLWNEub7MIV/7CGZ+j2y3uCuH1TORal5Abkdga5qI0vU7g76fA+GPl3mCe2Do4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fUb0rwi3; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fUb0rwi3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708942408; x=1740478408;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=xQl4Y5Xf2tWR3JxdHU2jdE068lsasi2wz4L1l27WpRo=;
  b=fUb0rwi3eoKDTuNz9fofeowbyIuxEvOVSDebTaFH9Hi6YKFbvq66N4uQ
   aNBaHaTMEW9hzdxOKN0vesTLhmNya4crqnfZC5VwDy86YYLaieT62gDjk
   cNo+pqrr+MhMuRJd9GkLAu9PJf8bwKECYK8kD4uaKnpx5ZcwbuNLrP1/X
   EeZnYdLdFJX/Eozlg+VIWJ3PfVGmLuIRx7cZmnHTUU8S5KNntIjCw0T34
   1E4DsgF0+H13uV5UIctO70qcpxRwpiWg0WBaO6M+UdGmnHsec1SQUyVmZ
   8SOjEz2+9CX5HGFjAjvz+o+zDkJFss9wsVt5zH1uCvkWlzdvWm+zsB0QS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="28642557"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="28642557"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 02:13:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6609537"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 26 Feb 2024 02:13:25 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reXz7-000AF9-36;
	Mon, 26 Feb 2024 10:13:22 +0000
Date: Mon, 26 Feb 2024 18:12:59 +0800
From: kernel test robot <lkp@intel.com>
To: Rui Qi <qirui.001@bytedance.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/3] x86/speculation: Support intra-function call
 validation
Message-ID: <ZdxkK5uArTDX6I5d@fdb2c0c3c270>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226094925.95835-4-qirui.001@bytedance.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH 3/3] x86/speculation: Support intra-function call validation
Link: https://lore.kernel.org/stable/20240226094925.95835-4-qirui.001%40bytedance.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



