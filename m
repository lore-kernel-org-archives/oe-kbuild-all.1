Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016A8219FC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 07:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766302263; cv=none; b=X17Dzq7VU9aIHZoTxTvBi7SnWlFtSCCq1Y/kYKly4uVcpyimG8yczHPzisWuy+8zlPwYVHHqq55jwewOtPa7gXqqfi6HFha6RhYCn9RG5imUqYSBdPcbCnYU8EF9rJ3B/AnnxTNrrbYH0NklukCp5dq+DEHK3ya8GSudaT0KhdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766302263; c=relaxed/simple;
	bh=I4Mbo/UiRVxhYMX/GFqeqeb30wJzIzUWgeTT0Quc3c0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=mug8ZCkha23iNcSbVbWeJcQt4xE2vOR5KhlvPPxyh9UFUXnpWuEaAKb9lEGVZ1SKFdLEyrgo4WjGpKzjB4kFatbrM+a7p5vREAMY/TFVRQGFbKdaa7ybTDi6zLH80rG8iN2d6hkDjQEd+uYHfE+yDzi0rYKrU1u4H2jsgQzAuUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K01XhdFo; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K01XhdFo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766302261; x=1797838261;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=I4Mbo/UiRVxhYMX/GFqeqeb30wJzIzUWgeTT0Quc3c0=;
  b=K01XhdFoJmA8d8CTc6XMVl7Os7PYnp9JZTZ83E1448yqpU1k3LtA7KNt
   PsDfaR8iSe4CkQ72HEiudTPFyGiyW/Fy2hUmVif6y3t1cBwcPQv958aes
   sB4sQqqlme8hu0DghsrlvTB+VvkyLcW7aDlyNcHRlUjMIE2ENyTbx8p+w
   NaKNkXbmM8xClyBYIwSPoBLbjQ/SKpMuIpZdtXxat4Hn7Oy/6vhS2mt/A
   FXKGPrPSXhZANGZ1MgYT9/TFKERvYwl4zlSqKnC3bf0dvmHbCuCh/ksO8
   FvwwvDo4+YN4pgs2j6xMKaPmOAfRE9crFw52werpeqOtyoIfs7AuQqRyC
   Q==;
X-CSE-ConnectionGUID: zz5AXtm7TMKi0no2ADCpSQ==
X-CSE-MsgGUID: cshWMikESdyzCnN8uj3j3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="71830799"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="71830799"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 23:31:01 -0800
X-CSE-ConnectionGUID: FtV1NawtQpeEh9/ANTAlxQ==
X-CSE-MsgGUID: q2OMrSYBSvyeTrPL8+jBrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="198496333"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 Dec 2025 23:30:59 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXDu5-000000005On-1UHj;
	Sun, 21 Dec 2025 07:30:57 +0000
Date: Sun, 21 Dec 2025 15:30:55 +0800
From: kernel test robot <lkp@intel.com>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] net: usb: sr9700: fix incorrect command used to write
 single register
Message-ID: <aUeiLz-0bv9GSkxJ@7f1fa5bf6f72>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251221072732.41426-1-enelsonmoore@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] net: usb: sr9700: fix incorrect command used to write single register
Link: https://lore.kernel.org/stable/20251221072732.41426-1-enelsonmoore%40gmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



