Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AAD21FF21
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 02:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764988596; cv=none; b=YcOAexov1vigJxa/Lc1AsQzdFaGWJx93W2V8/ETpKmuvndxDKUqnuFaMHQqUssy5oWo+MjW620jrLc6LIHY7hA1k+YSpJ5dTUwZZ59MQoRB2rjCueyxc8SgkuGQrA083RmyupBb2aQMR2tZlCnYSWclxrIF2k5s0Y6gugKJM76o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764988596; c=relaxed/simple;
	bh=6Fr5zJ5OHeAJjj3L0gcJm+prwqZuaXJ8SpC14v5TNOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=daF0NQavK2a5oAcXNCWuxkOIC+6VXgn21C8wuPuShGMSBbPEo0JhYp0ORuya5gqsC/EPle6TEUyk52Mfp+HqU+1YzVNHu/0NBp7I6NFkTRVIVCl7yAVtZonhf1Wtvag3aPo18CIZUcNEzoLZ/gPwCx4EO5ZThU183cYtlPOQO5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hh+gmWd/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hh+gmWd/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764988594; x=1796524594;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6Fr5zJ5OHeAJjj3L0gcJm+prwqZuaXJ8SpC14v5TNOA=;
  b=Hh+gmWd/oKJLLTwY663UR37amC/PjnXa8sQpa2zgMUHBFNPS/SUn/pjo
   NkE8N3e/7eQ0MDYOoIhiH8ZKHvGpFr9x9cSdTxGdyVqNB/BxbaBeqRFCg
   92xISbhek9zY5F/Gh433Umcl49h1eve/7bwk/V/zr4mRVwIEbneGFpahx
   VYAmuebFwLNrSWFCfGlXsABYwdwI14D50CJuoFvpM0VEsSYdLOEfanLEY
   hDFe0EU5XKNh36U9AKnC7YvqCpcLVX/FL5hBZG2tP31/Hmb/GzjWfob4n
   fiBdor699kOuq9bfVjE50vkOODpVUAs003Y5swnthy3T8vmT/nMHHx+zh
   Q==;
X-CSE-ConnectionGUID: mStFf9jfTuCdk4yyg//+jA==
X-CSE-MsgGUID: UubHCd8LTVynV+SksJYzdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66909817"
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; 
   d="scan'208";a="66909817"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 18:36:34 -0800
X-CSE-ConnectionGUID: OmFx/ZvOTJS5NB9XVy/hiw==
X-CSE-MsgGUID: D/OKPa+dS0GwM0f5/uO/Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; 
   d="scan'208";a="195692089"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Dec 2025 18:36:33 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRi9u-00000000Fl3-2kcz;
	Sat, 06 Dec 2025 02:36:30 +0000
Date: Sat, 6 Dec 2025 10:35:47 +0800
From: kernel test robot <lkp@intel.com>
To: Breno Leitao <leitao@debian.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/2] netconsole: Plug to dynamic configfs item
Message-ID: <202512061018.Q68LVWTz-lkp@intel.com>
References: <20251202-configfs_netcon-v1-2-b4738ead8ee8@debian.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202-configfs_netcon-v1-2-b4738ead8ee8@debian.org>

Hi Breno,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on e538109ac71d801d26776af5f3c54f548296c29c]

url:    https://github.com/intel-lab-lkp/linux/commits/Breno-Leitao/configfs-add-kernel-space-item-registration-API/20251202-233234
base:   e538109ac71d801d26776af5f3c54f548296c29c
patch link:    https://lore.kernel.org/r/20251202-configfs_netcon-v1-2-b4738ead8ee8%40debian.org
patch subject: [PATCH RFC 2/2] netconsole: Plug to dynamic configfs item
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20251206/202512061018.Q68LVWTz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061018.Q68LVWTz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061018.Q68LVWTz-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: init_netconsole+0x309 (section: .init.text) -> dynamic_netconsole_exit (section: .exit.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
