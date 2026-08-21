Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9745C3F23A1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Aug 2026 19:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787341816; cv=none; b=TkMN95+rm2xNAuKXjAF637bfG8NWCHnOxGzvI3NQOdJRGngtambBHElkG2awkpdhkjO0/hSuHo8mnuX9AtW2mE6BGVSnLbUADXEn0y95l1aaAIbfj1FvxEpS6v3pvvnTb12hDVGielWx77hFLLfO8+iEo0mzoCYmPm66RW2izyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787341816; c=relaxed/simple;
	bh=gskV1hJQCG80AV4sNz1PxU26bxcRffrp5JsfEjeOvlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TS5jCKVuO8OiEgAJCVkgK2m4zpVYAhA812Ksg96SY0oOctrDraYliCIpQe1AzYjfP7lLOVws7glkGUvDhqir1ZjnSG08rEG8brDjAfanDOnBpUtL/0CJ7UGXhkO4+2Uh3qxm9NXkflbCfKvr3dv50cXXT1Zhd1vDboA/zSH0lmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RiK/1GqV; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RiK/1GqV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787341815; x=1818877815;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gskV1hJQCG80AV4sNz1PxU26bxcRffrp5JsfEjeOvlI=;
  b=RiK/1GqVo/qlRu/6sYin/03VO3V3MCd3uKEcKOPCKMOqRD3DUWV/JxQF
   iBVbdgS/e4EFnqrIAidJMyFU39dpCCY3qCYZBCI52NYl5cNO2HUtzPlQC
   Mke8N9gEdJxet/2Qm4+8nBKb3B801NJuLSwdxtb2IgHyI/OSLBHKHVKD4
   Soa0dcluKdCUps3ZRzdk9gI5aT1to2gozSayYaBAnFe6uo97sEUtzFC41
   YdHTZIRNwYoA+0fOV9dyxNGFtptLTDMs45Mr93vX+/vmMXBsFAsczqi6B
   rq85mEW9LFgEIgjqocuWp1OMyTA9en+mDMDv9dRCzgiUe6T+FL9fDG1Kq
   g==;
X-CSE-ConnectionGUID: iVlnq9G1TB+pFXWz88cy3Q==
X-CSE-MsgGUID: jk8rwZLPTp2+dY9LMKCJhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="98488866"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="98488866"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 12:50:07 -0700
X-CSE-ConnectionGUID: xkIZl3E1Tz6OWRhR/OsIqQ==
X-CSE-MsgGUID: fO2cT9PJQZqNZeZ/uqVhfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="270264721"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Aug 2026 12:50:06 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxVFa-00000000qOr-298q;
	Fri, 21 Aug 2026 19:50:02 +0000
Date: Sat, 22 Aug 2026 03:49:59 +0800
From: kernel test robot <lkp@intel.com>
To: Li Jun <lijun01@kylinos.cn>, marcel@holtmann.org, luiz.dentz@gmail.com,
	linux-bluetooth@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] bluetooth: pm: use SIMPLE_DEV_OPS for pm struct
Message-ID: <202608220346.df2N3qLw-lkp@intel.com>
References: <20260819054525.2325031-1-lijun01@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819054525.2325031-1-lijun01@kylinos.cn>

Hi Li,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bluetooth/master]
[also build test WARNING on bluetooth-next/master linus/master v7.2 next-20260820]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Li-Jun/bluetooth-pm-use-SIMPLE_DEV_OPS-for-pm-struct/20260819-134525
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
patch link:    https://lore.kernel.org/r/20260819054525.2325031-1-lijun01%40kylinos.cn
patch subject: [PATCH] bluetooth: pm: use SIMPLE_DEV_OPS for pm struct
config: powerpc-randconfig-r123-20260821 (https://download.01.org/0day-ci/archive/20260822/202608220346.df2N3qLw-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608220346.df2N3qLw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608220346.df2N3qLw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/bluetooth/btmrvl_sdio.c:1729:1: sparse: sparse: symbol 'btmrvl_sdio_pm_ops' was not declared. Should it be static?

vim +/btmrvl_sdio_pm_ops +1729 drivers/bluetooth/btmrvl_sdio.c

  1728	
> 1729	SIMPLE_DEV_PM_OPS(btmrvl_sdio_pm_ops, btmrvl_sdio_suspend, btmrvl_sdio_resume);
  1730	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
