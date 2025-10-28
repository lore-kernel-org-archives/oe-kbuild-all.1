Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2B529BD9B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Oct 2025 00:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761612810; cv=none; b=Mst8KSgZUnyIDfwxKiW5IYdVBI4mF6qYxvZLaITU9+SMUi/MWaTM7g9oPgTEv91Eb4hiH7vV3ZieWYoATlOdtQS2DOq5EflisbPEBSgV14OJXJxiNChDvwT/Rs8U7YymCHP0/DyIAMqlFWOaoRolBvHGTfZRi3LqHl7P9U9Lfbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761612810; c=relaxed/simple;
	bh=2qTE1R31oXV8vSNiGcaYAHJTgjgp5WkoT/pKVFgWvco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mE44KI9lNE1pEe2rn3upM60GxIvR568JjceES3v09Oa9m9SKqC1V+gwauqaJWCSHnU0cr+lrtl5Onepubdl8iJL2nNgW4X+UrzjdiQnEOkEa+XydBI+DRbr0KgziSZf4yeZ2t9lTIuKz2uYhgv5hakNC5tEnfRQbbp7KNZ9y+7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LPpnyKFs; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LPpnyKFs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761612809; x=1793148809;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2qTE1R31oXV8vSNiGcaYAHJTgjgp5WkoT/pKVFgWvco=;
  b=LPpnyKFsOraTwq0COIEMjxuSAli8QKDOGonlKETJpqwrb5B/FHofgowS
   rFYK6BagwYcNQ078dVim4oqZhrPssZkCyu2PoLFGf/G0iM8088yofJnoJ
   oTkFyFnH/W01ETmN4a6VBezgPxCPnzVDpBikXoq1qnVA6i/TC/rooGntx
   U2lEKH8vptBDtozONGDLafkHJm5Lihqu2k7XJP8ZaO7ryFeKaTQEeAMy0
   UvDX6Is9a+ovshq6D39FKW1MiavIV++zo+HFnFvs7lPAdJz2FkK6SR56f
   O2sixmDpo8YazboTHsgDKFfB+UrJmaE8NN7ps/dYYC5Zd+xp9iceOaMuU
   A==;
X-CSE-ConnectionGUID: k0FsNmfkTXqn/3JMNEomJQ==
X-CSE-MsgGUID: rZRQPoj4Q/eUxYGPR0/Qpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="89173537"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="89173537"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 17:53:28 -0700
X-CSE-ConnectionGUID: 0rbiwMPeQfScfEBv8C16pw==
X-CSE-MsgGUID: DVCPYMwAS5yQ+p7PaIFsYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="185659700"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 27 Oct 2025 17:53:28 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDXxj-000Ic5-0x;
	Tue, 28 Oct 2025 00:53:23 +0000
Date: Tue, 28 Oct 2025 08:52:19 +0800
From: kernel test robot <lkp@intel.com>
To: Naohiro Aota <naohiro.aota@wdc.com>, linux-btrfs@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Naohiro Aota <naohiro.aota@wdc.com>
Subject: Re: [PATCH 2/2] btrfs: zoned: fix stripe width calculation
Message-ID: <202510280859.KwBFlqRE-lkp@intel.com>
References: <20251027072758.1066720-3-naohiro.aota@wdc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027072758.1066720-3-naohiro.aota@wdc.com>

Hi Naohiro,

kernel test robot noticed the following build errors:

[auto build test ERROR on kdave/for-next]
[also build test ERROR on linus/master v6.18-rc3 next-20251027]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Naohiro-Aota/btrfs-zoned-fix-zone-capacity-calculation/20251027-153738
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/20251027072758.1066720-3-naohiro.aota%40wdc.com
patch subject: [PATCH 2/2] btrfs: zoned: fix stripe width calculation
config: i386-buildonly-randconfig-006-20251028 (https://download.01.org/0day-ci/archive/20251028/202510280859.KwBFlqRE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510280859.KwBFlqRE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510280859.KwBFlqRE-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivmoddi4" [fs/btrfs/btrfs.ko] undefined!
ERROR: modpost: "__udivdi3" [drivers/power/supply/intel_dc_ti_battery.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
