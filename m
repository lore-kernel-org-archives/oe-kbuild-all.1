Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C722D1DEFCE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Oct 2024 13:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728392974; cv=none; b=CvdnJzH6VmSOD7wN18PDM68vYbqcBivhRFeQFT3ucr36jobMAKEy2G53G+yBYklLIlZpWzbISjZ8gblfFqHcnVwsrA5tlS+60H2Kk5zq9x7rpvoipZQWlAYzjucQxEYIsAMKvTqpde06sCnB2MaaPfb5jVkpPxVJr1w9ZuKczHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728392974; c=relaxed/simple;
	bh=DitKCkC+jbpKnaLI320XXK4aEx0Cdujhf1TGifz+AW4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=hRV96MhBgbVx608ohr5RhRavVwZ496TMNa6IeJ6Jooc+IZwrsULZelmg5VbjC7N2CUBB5Exz5R8Wk8yoe56tk0+Kdlcg2XWXozjzyA/8Ii+GV1f6hkmQqIKhZYRmeMafhE3GQNpD1ib/LPpdPKBdp2+GycRFfMiw/jFCr73Afxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a2b1omZx; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a2b1omZx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728392973; x=1759928973;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=DitKCkC+jbpKnaLI320XXK4aEx0Cdujhf1TGifz+AW4=;
  b=a2b1omZx3NUSHTkBKdQi/H/m9Nc8ljhffKFMdYscUJvd5W24HwybHb2R
   SeOigzyI/NPW0LQSAlfofsOgHx2kk9F7/VXp7f/9LYD7Z61VC3Wskjt5s
   SE+9MmK3/ltdPwEDAzUPxdnQBgkFWGWE7MbpnT0hCbf/NTqPliPiNovUU
   EmATgOvxBe9Gsuk9UIF+eFZSSgpUVX0VQCPTPh3di6AS2C1YBk5PX3aXQ
   3JzyyCfEyBfXjPf83K53xUvs0LPn+PINXjX/B1CVuCQ4JxIkFHwp+mIgi
   dqwHWNXwIsPge+Z3IXz7BpLqy93tpNHpkNRnt4z7NiSX/POvIb044wyaj
   g==;
X-CSE-ConnectionGUID: KLy3xNZxQ0mVZMDgMM5keg==
X-CSE-MsgGUID: JMp5QRTzRXK2k/BF27WFmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27718078"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="27718078"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 06:09:33 -0700
X-CSE-ConnectionGUID: /7NBJPGkTAa0wBdLeqHn/Q==
X-CSE-MsgGUID: ok1q74dFRcSfVIGDnNu0bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="80618092"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Oct 2024 06:09:31 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sy9xw-0007Sg-38;
	Tue, 08 Oct 2024 13:09:28 +0000
Date: Tue, 8 Oct 2024 21:09:13 +0800
From: kernel test robot <lkp@intel.com>
To: George Kennedy <george.kennedy@oracle.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] [PATCH v3] perf/x86/amd: check event before enable to
 avoid GPF
Message-ID: <ZwUu-bYOIzWNrBfp@b1422e034610>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1728392453-18658-1-git-send-email-george.kennedy@oracle.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] [PATCH v3] perf/x86/amd: check event before enable to avoid GPF
Link: https://lore.kernel.org/stable/1728392453-18658-1-git-send-email-george.kennedy%40oracle.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



