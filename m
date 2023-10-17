Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6617141754
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 11:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FSe0gUyg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697541652; x=1729077652;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lQC0Kv5Gwr0He8QnN5T9b+WO+HJZm7H5iOPOM9NAgD8=;
  b=FSe0gUygNvLKfOPhsBIKJNmDdNoh6hFPjg8WB6CmeaOXLYzfeU5NEeKf
   yp66Gj2R46PlTirontdjhQOlSoxetfy0hnFGlHQ7mwdODNwBC8qevP3ET
   ua8dIlQ2i8Burx/Klf0+ob/z6IfZaggcXJLz5u9Y/ChnA9b78KhtQW1b7
   x2FS+amotB9mpeQkKFlyx3zd881NjYJxsjYqr717PPxiV5LMXJhazBdj5
   tFe6z4U5pccP9dRZ94ThqjHgiv4z+FUzSTmB1LcqA4uybf7Mi6/I3pZRN
   8NTvClrzn2m/SRL246zmiND8P+Rn3JRunFaQZsfiHwgQ7/aNXNh1m9mHk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="7315886"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="7315886"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 04:20:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="1087474309"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="1087474309"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 17 Oct 2023 04:20:48 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsi7y-0009Ve-2J;
	Tue, 17 Oct 2023 11:20:46 +0000
Date: Tue, 17 Oct 2023 19:19:57 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 02/16] bfa: Do not use scsi command to signal TMF status
Message-ID: <202310171912.yMMyiSY8-lkp@intel.com>
References: <20231017100729.123506-3-hare@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017100729.123506-3-hare@suse.de>

Hi Hannes,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mkp-scsi/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hannes-Reinecke/zfcp-do-not-wait-for-rports-to-become-unblocked-after-host-reset/20231017-181107
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20231017100729.123506-3-hare%40suse.de
patch subject: [PATCH 02/16] bfa: Do not use scsi command to signal TMF status
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310171912.yMMyiSY8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310171912.yMMyiSY8-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPLIT_STRING: quoted string split across lines
#211: FILE: drivers/scsi/bfa/bfad_im.c:407:
+				"target reset failure,"
+				" status: %d\n", task_status);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
