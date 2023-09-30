Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA7E361
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 02:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696039287; x=1727575287;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9p/MmbFubZ7+onPM66zGlCc5VukskJwqDk7TgoZizQ4=;
  b=mAj3VOZ3+TxcqGyBt735lXWrryQN90uvuabN2t5sCjHpkOSnRZXZVHAU
   BkMQEw6EAWGI0fqvuIW61345cc+iPGwKQlXSwc01jD5UQuuIgZcgpgY7w
   LSvz1IRCOghrAux2NrDbQ4vEzW+HsfoHfv+LURpRfbKBNf9DzPP8CYTqy
   XYRRgLPEAgoXbOkY9gT/VsXIaeR+zv4YuON8snNvQgnfys/9CKpynU6VU
   x+r2931Vl86X4T//rGy2p/iCNcE659LgHjUqUu5uuVLxD0stpzjjNFO3K
   CCmzwo5ttrMebrp3OtwqLca3mOFHa+qzB8UMh8aGior+LY8Z1v5EhiiLy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="1012982"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; 
   d="scan'208";a="1012982"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 19:01:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="815767776"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; 
   d="scan'208";a="815767776"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 29 Sep 2023 19:01:23 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmPIH-0003YX-2B;
	Sat, 30 Sep 2023 02:01:21 +0000
Date: Sat, 30 Sep 2023 10:00:26 +0800
From: kernel test robot <lkp@intel.com>
To: KaiLong Wang <wangkailong@jari.cn>, arnd@arndb.de
Cc: oe-kbuild-all@lists.linux.dev, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] vmlinux.lds.h: Clean up errors in vmlinux.lds.h
Message-ID: <202309300943.xp3w8c0g-lkp@intel.com>
References: <72e80688.8a8.18ad9bba905.Coremail.wangkailong@jari.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72e80688.8a8.18ad9bba905.Coremail.wangkailong@jari.cn>

Hi KaiLong,

kernel test robot noticed the following build errors:

[auto build test ERROR on arnd-asm-generic/master]
[also build test ERROR on soc/for-next linus/master v6.6-rc3 next-20230929]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/KaiLong-Wang/vmlinux-lds-h-Clean-up-errors-in-vmlinux-lds-h/20230928-110313
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
patch link:    https://lore.kernel.org/r/72e80688.8a8.18ad9bba905.Coremail.wangkailong%40jari.cn
patch subject: [PATCH] vmlinux.lds.h: Clean up errors in vmlinux.lds.h
config: csky-randconfig-001-20230930 (https://download.01.org/0day-ci/archive/20230930/202309300943.xp3w8c0g-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230930/202309300943.xp3w8c0g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309300943.xp3w8c0g-lkp@intel.com/

All errors (new ones prefixed by >>):

>> csky-linux-ld:./arch/csky/kernel/vmlinux.lds:32: syntax error

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
