Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4D11953A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jun 2023 23:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686267050; x=1717803050;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nkvHn65bSJcOEwQSDwOpqWWcGk7kc2Xl1OOn28fNzyM=;
  b=Zv6nzE/kLohh/gpakXK19kFW19eRcXzstaiwCMJPCccSNTz+/H8glc6c
   E4A7oh05GevAy0fA3U6zY+bql+mkLRXeBmq4PNYG3VTkS4n/wPe4T8pOg
   3JZAVhBRSM68oJdJTwcuPk0gIsELWoAmQ9MNSNf+e+yUJsH9OlP4ze3JW
   Y8pNQAJHEBIcD1/kOEtlPh8QZnAZ124yrbZWJgB2d7ZKhrky8hiymWnFs
   0bZt3nLKNMvu+r4aMaaYKUg7NceyRHz8QxO0rYM7Q6GVN7psAZJPmMy1a
   bvntNpTIaZHN+EqBAr2Dk4+nNz5svVMDTXWLXkRKcKLDedVgZABGgdm0J
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="443830261"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="443830261"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 16:30:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="1040289580"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="1040289580"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 08 Jun 2023 16:30:48 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7P5b-0008Lc-1G;
	Thu, 08 Jun 2023 23:30:47 +0000
Date: Fri, 9 Jun 2023 07:30:32 +0800
From: kernel test robot <lkp@intel.com>
To: Enzo Matsumiya <ematsumiya@suse.de>, linux-cifs@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, smfrench@gmail.com, pc@cjr.nz,
	ronniesahlberg@gmail.com, nspmangalore@gmail.com
Subject: Re: [PATCH] smb/client: print "Unknown" instead of bogus link speed
 value
Message-ID: <202306090720.TEZbrpR8-lkp@intel.com>
References: <20230608201055.9716-1-ematsumiya@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230608201055.9716-1-ematsumiya@suse.de>

Hi Enzo,

kernel test robot noticed the following build errors:

[auto build test ERROR on cifs/for-next]
[also build test ERROR on linus/master v6.4-rc5 next-20230608]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Enzo-Matsumiya/smb-client-print-Unknown-instead-of-bogus-link-speed-value/20230609-041241
base:   git://git.samba.org/sfrench/cifs-2.6.git for-next
patch link:    https://lore.kernel.org/r/20230608201055.9716-1-ematsumiya%40suse.de
patch subject: [PATCH] smb/client: print "Unknown" instead of bogus link speed value
config: i386-randconfig-m021-20230608 (https://download.01.org/0day-ci/archive/20230609/202306090720.TEZbrpR8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add cifs git://git.samba.org/sfrench/cifs-2.6.git
        git fetch cifs for-next
        git checkout cifs/for-next
        b4 shazam https://lore.kernel.org/r/20230608201055.9716-1-ematsumiya@suse.de
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306090720.TEZbrpR8-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "phy_speed_to_str" [fs/smb/client/cifs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
