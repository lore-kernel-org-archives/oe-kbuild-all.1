Received: from mgamail.intel.com (unknown [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2823D6C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Jul 2023 15:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690732109; x=1722268109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lt4CimnpGZzZloUYYWdHH6+Ukq+yK3FE8EmDWpCGujg=;
  b=NBp1FGBGbmUgNvBE+aI3l2R2JEQxK0qoZO9Ia68omc5kpzQ69zPF+g6q
   VrTEEvei59zzDJuHXgqcWZIsxFI/K41EKIAjBgA7JEsei9pgnAxGT6Jqx
   3hGSI3f8yF7i0na4bizyNi6Q5FhOZY2Kg5pXUnHGImDjcQCRj260MJpc3
   92mrMPYGIJy/YwBcXdsHzWCkbh9vXRRtYH1pcc2HSa9QndFUPory9g0OD
   TwwUzQ9XjQBVw6HLa6nqbfDQhmcItYb6Z513oEGJKAYyO/RZsclmxXkaj
   O1lhs0cQHm8fTO8o/wrsG/4F9VP2/aCEeVMPP8hxE3iEk/okeXkD4Rt/L
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="367743776"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="367743776"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2023 08:48:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="818048833"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="818048833"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Jul 2023 08:48:26 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQ8ef-0004eh-1y;
	Sun, 30 Jul 2023 15:48:25 +0000
Date: Sun, 30 Jul 2023 23:47:52 +0800
From: kernel test robot <lkp@intel.com>
To: Tomas Winkler <tomas.winkler@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [char-misc:char-misc-testing 5/9] include/linux/moduleparam.h:24:9:
 error: expected ',' or ';' before 'static'
Message-ID: <202307302340.4uDUBI3T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-testing
head:   94e4fbf7c8756d824c51c04be3b58588d67411a4
commit: c8de1d2815aa6669b319d2d71401f35b68bb9aa9 [5/9] mei: gsc: add module description
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230730/202307302340.4uDUBI3T-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307302340.4uDUBI3T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307302340.4uDUBI3T-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/module.h:22,
                    from drivers/misc/mei/gsc-me.c:8:
>> include/linux/moduleparam.h:24:9: error: expected ',' or ';' before 'static'
      24 |         static const char __UNIQUE_ID(name)[]                             \
         |         ^~~~~~
   include/linux/module.h:166:32: note: in expansion of macro '__MODULE_INFO'
     166 | #define MODULE_INFO(tag, info) __MODULE_INFO(tag, tag, info)
         |                                ^~~~~~~~~~~~~
   include/linux/module.h:183:25: note: in expansion of macro 'MODULE_INFO'
     183 | #define MODULE_FILE     MODULE_INFO(file, KBUILD_MODFILE);
         |                         ^~~~~~~~~~~
   include/linux/module.h:230:34: note: in expansion of macro 'MODULE_FILE'
     230 | #define MODULE_LICENSE(_license) MODULE_FILE MODULE_INFO(license, _license)
         |                                  ^~~~~~~~~~~
   drivers/misc/mei/gsc-me.c:316:1: note: in expansion of macro 'MODULE_LICENSE'
     316 | MODULE_LICENSE("GPL");
         | ^~~~~~~~~~~~~~


vim +24 include/linux/moduleparam.h

730b69d2252595 Rusty Russell  2008-10-22  22  
^1da177e4c3f41 Linus Torvalds 2005-04-16  23  #define __MODULE_INFO(tag, name, info)					  \
34182eea36fc1d Rusty Russell  2012-11-22 @24  	static const char __UNIQUE_ID(name)[]				  \
2aec389e19150e Johan Hovold   2020-11-23  25  		__used __section(".modinfo") __aligned(1)		  \
898490c010b5d2 Alexey Gladkov 2019-04-29  26  		= __MODULE_INFO_PREFIX __stringify(tag) "=" info
898490c010b5d2 Alexey Gladkov 2019-04-29  27  

:::::: The code at line 24 was first introduced by commit
:::::: 34182eea36fc1d70d748b0947c873314980ba806 moduleparam: use __UNIQUE_ID()

:::::: TO: Rusty Russell <rusty@rustcorp.com.au>
:::::: CC: Rusty Russell <rusty@rustcorp.com.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
