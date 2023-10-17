Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B2143110
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 22:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GaCw2jsU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697582614; x=1729118614;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qk+aNg6F9aYZeEQxDeE1YbmlSMT8vFRWkcCO0AARI+A=;
  b=GaCw2jsUStEcUTol4zKGOI6dMH3zqiZCp8fp3cwySvwJYxLjsLDktyEL
   C9Rz6sJvJtYzA3H23Hy/S65Ottl3mC57mw5y0DRnxgAjdXnZiIEd/SP/P
   uQ8EggWKW4wRAOTT35PWgecwfb6iFeJZXSE75l+iQ7PdpJA4Wt0shgFnL
   VuT1KGdP6fAYdKk/tpTKvEm3yi+osbiTHNfgnTL+e+EJbv7A/m9PTraaJ
   Z9Wnvt7JyYL4ifquXNbSL6/xOTos/JKhz8uarrm+hSIcGwV19SdZdMEsh
   f/mNDSyXC49q/L6FUK/tO18kwE63gV0X+jy4ooYdVhp9fDpc0ofuW/RfG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="389769704"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="389769704"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 15:43:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="900073867"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="900073867"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 17 Oct 2023 15:41:25 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qssmb-000ABz-0q;
	Tue, 17 Oct 2023 22:43:25 +0000
Date: Wed, 18 Oct 2023 06:43:06 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 07/14] sd: Translate data lifetime information
Message-ID: <202310180631.1XPMVNAI-lkp@intel.com>
References: <20231017204739.3409052-8-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017204739.3409052-8-bvanassche@acm.org>

Hi Bart,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jejb-scsi/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bart-Van-Assche/fs-Move-enum-rw_hint-into-a-new-header-file/20231018-045042
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for-next
patch link:    https://lore.kernel.org/r/20231017204739.3409052-8-bvanassche%40acm.org
patch subject: [PATCH v3 07/14] sd: Translate data lifetime information
reproduce: (https://download.01.org/0day-ci/archive/20231018/202310180631.1XPMVNAI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310180631.1XPMVNAI-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#104: FILE: drivers/scsi/sd.c:2944:
+static bool sd_is_perm_stream(struct scsi_disk *sdkp, unsigned stream_id)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
