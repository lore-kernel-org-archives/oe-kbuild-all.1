Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4A31EB1A4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 00:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765758594; cv=none; b=sowaMbnadI5JcpSPF9LjlRnZgaitBGVwrBvUdX6RknW8CnbeP4UZLCTL2te3icEOPvJ2Kn6w+L2ak8eQwglAQ9EZ+cOBmOuCJ3TQ+5EyCbQWMxLtIR45d9Wr2FzLWRtqxDjL03A6S4L2dmi+IRInPyG5DUUf0qimzGiSPogu0Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765758594; c=relaxed/simple;
	bh=HOBHlcXSQ8Pn5DtAmLuVNDTx15RRLG1jggqMnPx9plA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ggt3ReI5grbXmIsitgIo5Tfbil+urg5DNyreFx6JrWLARAAOrha50ZE0cme/lEo9JaihW9S8KMdLWafhr5zrx/RJ79Doxl+RIg8q3qLgxBAdaKNXahYryiBHbGrVTN2k510gfzw6IqaDojjjizRfcPDmwI3dn7V4BC/up0RsdnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HRb5jxp0; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HRb5jxp0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765758592; x=1797294592;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HOBHlcXSQ8Pn5DtAmLuVNDTx15RRLG1jggqMnPx9plA=;
  b=HRb5jxp0j6ifHY4Uk1t0GX+4a7NBpsjbs5/IVFZ63tkFNzCSxx5hlg8O
   KzKwz7uBlEk0F1ZFBraUz3IUSuqQmOlXOnSlVjoJwwoYWhRehKEOdpP2a
   atCbbCuf+mZY70mciybg166VHRVqt0rqEgeWmMp4CRQJ6+jzIdi2fHyFM
   DIxpcq7SNc7kC3mKvtYs6BOfMN1ebFQKRY3rWPRqYvMLdLt/a5K4pzxBl
   Xx4omDmtl9J88G+YgdvN0DN2HLhB7O1MJHg3ZJCDZRqbU+ywOnsPnPLx1
   yZIN7xmMBoAH5ln8b63WB+AvNHoVc+A3qDpnSFw7h15i2bnmnCx4lAq6D
   g==;
X-CSE-ConnectionGUID: IL3iiADrQImtHDHKKBo0+A==
X-CSE-MsgGUID: e+yGLZjcRFqPKY3lXhxfgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67538387"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="67538387"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 16:29:52 -0800
X-CSE-ConnectionGUID: xGNszQuiQkKgWkobWZOtdg==
X-CSE-MsgGUID: 19x0wweOT4qyaHzubriHVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="202000373"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 14 Dec 2025 16:29:50 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUwTE-000000002W4-39dQ;
	Mon, 15 Dec 2025 00:29:48 +0000
Date: Mon, 15 Dec 2025 01:29:34 +0100
From: kernel test robot <lkp@intel.com>
To: Olga Kornievskaia <okorniev@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/1] nfsd: check that server is running in
 unlock_filesystem
Message-ID: <202512150151.ZhYPocYi-lkp@intel.com>
References: <20251212164711.55712-1-okorniev@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212164711.55712-1-okorniev@redhat.com>

Hi Olga,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on brauner-vfs/vfs.all v6.16-rc1 next-20251212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Olga-Kornievskaia/nfsd-check-that-server-is-running-in-unlock_filesystem/20251213-010357
base:   linus/master
patch link:    https://lore.kernel.org/r/20251212164711.55712-1-okorniev%40redhat.com
patch subject: [PATCH v2 1/1] nfsd: check that server is running in unlock_filesystem
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251215/202512150151.ZhYPocYi-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512150151.ZhYPocYi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150151.ZhYPocYi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/nfsd/nfs4state.c:1772 function parameter 'nn' not described in 'nfsd4_revoke_states'
>> Warning: fs/nfsd/nfs4state.c:1772 function parameter 'nn' not described in 'nfsd4_revoke_states'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
