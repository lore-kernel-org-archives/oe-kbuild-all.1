Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6905C524B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Oct 2023 03:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aiguO3LP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698722283; x=1730258283;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KhUyFYNfZFh/v81qiplfJb7+C9WjHlLSGl/6XH9ssqo=;
  b=aiguO3LPGYMB8h7w1L0M9ht1jMQfqn538wezPYO+m+h1eFBFiWgdHLKW
   nhtKgwRCnYn9cs+MYNP2HRiulv/97gdveujFNUYVWdX5QZfnj6/Ikxm4t
   a6K81Ec0sc0V7zlARXnTrlMAK7xNPgly6N87nQSeBuTQfqC5om2zrNdJm
   w+0rZ8RRoS4MhePKa9GyakyEMD7C5Oq8IzGtRMcU7AfLomf7Wc7EseIuO
   18oEiF3IIjmgU5PfZMX/3nbHdnHWO3UIwSxQvGHEPqNopgt8HKu7xqQfq
   NwSylN7JmDEquNccpcTj57EB7GVbzks28eFsT5qX4jKkc2yMLZCZMRfqs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="474446124"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="474446124"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 20:18:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="826262180"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="826262180"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 30 Oct 2023 20:18:00 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxfGQ-000Dml-0v;
	Tue, 31 Oct 2023 03:17:58 +0000
Date: Tue, 31 Oct 2023 11:17:31 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neilb@suse.de>, Chuck Lever <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-nfs@vger.kernel.org,
	Olga Kornievskaia <kolga@netapp.com>, Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>
Subject: Re: [PATCH 1/6] nfsd: prepare for supporting admin-revocation of
 state
Message-ID: <202310311114.Ym5PyQ5Z-lkp@intel.com>
References: <20231027015613.26247-2-neilb@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231027015613.26247-2-neilb@suse.de>

Hi NeilBrown,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.6 next-20231030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/NeilBrown/nfsd-prepare-for-supporting-admin-revocation-of-state/20231027-095832
base:   linus/master
patch link:    https://lore.kernel.org/r/20231027015613.26247-2-neilb%40suse.de
patch subject: [PATCH 1/6] nfsd: prepare for supporting admin-revocation of state
config: mips-maltaup_xpa_defconfig (https://download.01.org/0day-ci/archive/20231031/202310311114.Ym5PyQ5Z-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310311114.Ym5PyQ5Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310311114.Ym5PyQ5Z-lkp@intel.com/

All errors (new ones prefixed by >>):

   mipsel-linux-ld: fs/nfsd/nfsctl.o: in function `write_unlock_fs':
>> nfsctl.c:(.text+0x4cc): undefined reference to `nfsd4_revoke_states'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
