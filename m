Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F73253958
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Sep 2025 06:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758264662; cv=none; b=uNY96D4deNZj/cSDbxEL2Ap4m4Wdr3cxgfYHcwdZurM4Uw+Pm5TFbfaUbjXfdyNWZMJGLtAdfzvcr+8Q1RtCb1OJTSyhD1J73MJohhsvhshrIP43DEmOSCbEHQOcYon1Fvy4aNXmHYg3uaAdE5MyDMtBlcHU/MIVJIpILLzOQA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758264662; c=relaxed/simple;
	bh=AdwyZarcDfvEr7Gktuc8b0xd8HsFf3I29ONB2DDbA6c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=k/urpTDOqqVPaku3jzjwA0waVLnAJ/8YXWFBYdR4KJS15eHKV4BV6FCULR6guU1pWWTOgycOo4804f/YMLuq4JXhnoQkirrqL6crkEfVuqM8OokxfEVZYTPCrY+FVgalqNp4kuC/sL7FVR+x+HvubZMz//3cNCBLcTqjJXaJl68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L96GFg1R; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L96GFg1R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758264660; x=1789800660;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=AdwyZarcDfvEr7Gktuc8b0xd8HsFf3I29ONB2DDbA6c=;
  b=L96GFg1RSlIiVl8pxciBuyOZIyg4PmY2PV0X+EK9KOQKcQT8m08CT32V
   jShNP1PYdwtKa29eBXF/Y9guTRMjHQfGPnXn4vVcvmxo+OLWBqHjee7hD
   8EQf83HP/NFRDguWn242Z1IZGlm7nKk1hcpfg4997iaA+sSs9EddzqeXe
   9af9ZC4sfp8lO73R77UeMCE06T63BYq9AcQT+123hdU9tuNcXj0ucTN2M
   d20Q/mwErHNl2Tb/pH0zUEbDT03dQGMoKqTpuxk1jByQjWi9xqzEa4pf1
   M1MF1hxv3mO1FwmMufHMJ1LvpE+/J4u7RokTAEY96K7oMhYPOAz3ySOy9
   w==;
X-CSE-ConnectionGUID: Tk1OGj80RGOyRHkV01RJ2g==
X-CSE-MsgGUID: OrTlWrvFTfKzqFQN/7rPsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="64247554"
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="64247554"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 23:50:59 -0700
X-CSE-ConnectionGUID: sIt90GDRSXS4ajUN2tC0GQ==
X-CSE-MsgGUID: 7e92MDWvQkyMQiHs8vWfkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="175580365"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Sep 2025 23:50:58 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzUxL-00042x-2S;
	Fri, 19 Sep 2025 06:50:55 +0000
Date: Fri, 19 Sep 2025 14:50:03 +0800
From: kernel test robot <lkp@intel.com>
To: Deepak Sharma <deepak.sharma.472935@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net v3] net: nfc: nci: Add parameter validation for
 packet data
Message-ID: <aMz9G_MPf_aiF8Gh@0ace1d3ee89d>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919064545.4252-1-deepak.sharma.472935@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH net v3] net: nfc: nci: Add parameter validation for packet data
Link: https://lore.kernel.org/stable/20250919064545.4252-1-deepak.sharma.472935%40gmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



