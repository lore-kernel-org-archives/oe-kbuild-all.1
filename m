Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80F831D72E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Oct 2026 23:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792019358; cv=none; b=dcfJLM92eloo3a7gpHRdAfBYos+qmI0mPAIWNkxvRT9jFXBdUicPPZT//nXJPJhfvVgr1vKNdIeZIFPHjkZ7cnWbeGuTILiWD/6c72Zha0DYsUqGBa5Y4wVtYyo9lrfZCP8uZswlIPOcX2wqHuBFmt85AddXGAP67eo0IgBiR9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792019358; c=relaxed/simple;
	bh=OrtcZbcrtNsgq9mKxP4mO0S3UWMUQ5hc58zOZIiX8tA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hd6tYEWl3kgM5G5sfR+bDM71icv9JpRciVQIMkQnrevx4p/4g5+fCp9sclmZEuMczg3+0A40VbURNXfIFdfyN1OBm0ram1EzCGJnR8dMXzgGDlPh5pwVWNjtY0cgAM+Iulz6K85S8FXs+OaHLSJV1ksRFFyL3QtWHWrEoI1OWqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fFBy28C5; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fFBy28C5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792019357; x=1823555357;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OrtcZbcrtNsgq9mKxP4mO0S3UWMUQ5hc58zOZIiX8tA=;
  b=fFBy28C5A1GzDiO3pGYemjJ84bKgaLco0qvp8GiLz+Qou0mn556EExY6
   YEXch0+Z+flobFM/Um85WXzpdSFeRMUxZKxbnL2r2/zeqQPmuuWPFhdij
   Vow0ZnqyJwQEmFa8EkBmm5cmK1BVt17awRp70n4a9zEvmkD5ribTp44H4
   ZSERf6H+Gns9DNg3wjVu/4jYVsnnEUq3YVGT027f4cPgsoB0OZIq8RfxB
   Ta73/VGQ9BGg+JlcQMd+E6gudqVXnbaUk6IrcPWPJPCImwABkWDMP2mcm
   f+6ye/AlMlmuw0/VqJhHTA/tdY+zhTWh1zDCqHRqiM28E1y3lGJwofCyV
   A==;
X-CSE-ConnectionGUID: X0SAhH8MTcKO2HocAQKsUQ==
X-CSE-MsgGUID: n3jkT5DmQ+SaYHzguBS0JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="784613"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="784613"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 16:09:17 -0700
X-CSE-ConnectionGUID: qiNwdMLoTt2luNl9iD7Y1Q==
X-CSE-MsgGUID: +dlLLQivTciQsB00vZkkFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1650449"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Oct 2026 16:09:15 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xH85w-00000000FKd-0Q4c;
	Wed, 14 Oct 2026 23:09:12 +0000
Date: Thu, 15 Oct 2026 07:08:35 +0800
From: kernel test robot <lkp@intel.com>
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>,
	dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Matthew Auld <matthew.auld@intel.com>,
	Arun Pravin <arunpravin.paneerselvam@amd.com>,
	Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH 2/2] gpu/tests/buddy: Add range-bias pruning and
 free-order tracking tests
Message-ID: <202610150607.yXtmKb5N-lkp@intel.com>
References: <20298d0d2eb7f62ed5f75c460710c4e13fc94aee.1791802549.git.sanjay.kumar.yadav@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20298d0d2eb7f62ed5f75c460710c4e13fc94aee.1791802549.git.sanjay.kumar.yadav@intel.com>

Hi Sanjay,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-tip/drm-tip next-20261012]
[cannot apply to linus/master v7.3-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sanjay-Yadav/gpu-buddy-Prune-exhausted-subtrees-in-range-biased-allocation/20261012-164046
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20298d0d2eb7f62ed5f75c460710c4e13fc94aee.1791802549.git.sanjay.kumar.yadav%40intel.com
patch subject: [PATCH 2/2] gpu/tests/buddy: Add range-bias pruning and free-order tracking tests
config: arm-randconfig-1003-20261013 (https://download.01.org/0day-ci/archive/20261015/202610150607.yXtmKb5N-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610150607.yXtmKb5N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610150607.yXtmKb5N-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/gpu/tests/gpu_buddy_tests.ko: symbol '__aeabi_uldivmod' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
