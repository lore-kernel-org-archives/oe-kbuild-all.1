Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F913164A0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 12:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758632167; cv=none; b=Bv1SJEsqpnO3jTbU+PGrXfZD3FKW27cDbbqb54XteYXTwWMsClVWXQ4qGYs7SmQGtUS1Bg2Tb0Nwly83CAJJnpUCtptiozJehZ8g4PdVO231+4AbdtsE2bSW91DdkRKgAfknkjRwtm2aR4fzHO8rdT6PKdshpW1rsgsHtcdYGl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758632167; c=relaxed/simple;
	bh=ro/fypVrPLFhYL54DLWQ3LFD6z9yKDjJo2GgiSOa4Ag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=RvqiKMvENC/y4iy0FR63VIE2Kkj7uuB36NoFiLalVTY2r4yXSJtKAJajg5+ahye5zweYmFT7Rwz6+dB202a4dvRSEqB0aoePevcAy3Hy4S8mUWsWk7o2y9eNRrdz8edLkdf3WajLeho87C+vhdGyx637E8SlAFHRLWBljWLGgao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eLYWD0ua; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eLYWD0ua"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758632165; x=1790168165;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=ro/fypVrPLFhYL54DLWQ3LFD6z9yKDjJo2GgiSOa4Ag=;
  b=eLYWD0uaPdlO1lYSRbUJk9OotbPQf18Df1vg2Vr+tt8G2cP97hUodB1U
   XWafsQ7tsOU9RlJLv2MjK4KHGkYAahijWVraNJnQae0CW+mObJFaRIsJy
   WAQ4D8BktcS1bMHuJreMq3zBsQ8rZmbvTO71G4IYoGg3t5mj9A2exlP9O
   MFnvY+irppKLC67QVNlsxc6qapXXM/nInGw17WOfampp1ybCWpF1dBx5E
   3ntdRgRoVFaUUHl0rJKPKDlV4TfyDsneetkAcYD8H07pKreoVUjpfRGZH
   A9/yuZAYjQ7IyMW9JFBY2BPvvhIWQDlWBMxtPXyj9ATmqjv93bFhYPxXK
   g==;
X-CSE-ConnectionGUID: K2lIsUJWR+mnPiF7Qy9m3A==
X-CSE-MsgGUID: T0A5n1eMRhyiGtDJ74JQPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="59948432"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="59948432"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 05:56:04 -0700
X-CSE-ConnectionGUID: lr4RwLIMSca6t1prO+6Dcg==
X-CSE-MsgGUID: Ju9HihwaSuG3iiOkkbOnmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="207684926"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 23 Sep 2025 05:56:03 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v12Yr-00037Z-1N;
	Tue, 23 Sep 2025 12:56:01 +0000
Date: Tue, 23 Sep 2025 20:55:43 +0800
From: kernel test robot <lkp@intel.com>
To: Xinhui Yang <cyan@cyano.uk>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/2] scsi: dc395x: improve code formatting for the
 macros
Message-ID: <aNKYz_Ljv7MMiBS3@3514630e72f8>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923125226.1883391-3-cyan@cyano.uk>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v3 2/2] scsi: dc395x: improve code formatting for the macros
Link: https://lore.kernel.org/stable/20250923125226.1883391-3-cyan%40cyano.uk

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



