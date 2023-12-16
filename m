Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F18374CD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Dec 2023 23:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="INNXvYIX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702770727; x=1734306727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v+62yeoPQUHNLaatYfUzYq/k+FkhkOJa8YfMoVr5Qpk=;
  b=INNXvYIXXFnByIXXXrEXwkGJHslek9f/qnYa6a+DVWmqxCrfNjBwfGCI
   fv/76z605OevT254nHK8TnFgXtd3J/Ar2rsyPQof+JLddoqKjDMaz3Nfw
   FYK9NfHUCvOdLCI9QhxqNdvmWHjlC2rGnTIczLuf0pm5SO3SiCet+ep+D
   0WzVMGVAGY1G+GfQhgcayf2ngL+ZgVzshpoBcoZhrVaLezQIp+QV0Vm9J
   Ipr8vKoC6tswokvme39mt7C/ik5J4eS1VlZrH+TaF6/zlS9ARbFZl9pqv
   pOdQYZSvTTPzHRutmYsczYePuSlyPayXT7rbzGdtANw7tj9+DYF0sv4vT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="374891677"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="374891677"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 15:52:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="893346301"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="893346301"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 16 Dec 2023 15:52:04 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEeRu-0002Lw-0d;
	Sat, 16 Dec 2023 23:52:02 +0000
Date: Sun, 17 Dec 2023 07:51:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 50/61] include/uapi/linux/fb.h:297:33: error:
 expected identifier before numeric constant
Message-ID: <202312170755.In1ACxQo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   29f593717f831f4fe1c36efd2d1b0404f705bc0f
commit: 9138c2328ccc3a9bc4868c7a74b1539036a92501 [50/61] con: use enum for VESA blanking modes
config: i386-randconfig-013-20231217 (https://download.01.org/0day-ci/archive/20231217/202312170755.In1ACxQo-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170755.In1ACxQo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312170755.In1ACxQo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/fb.h:7,
                    from include/linux/vga_switcheroo.h:34,
                    from sound/pci/hda/hda_intel.c:52:
>> include/uapi/linux/fb.h:297:33: error: expected identifier before numeric constant
     297 | #define VESA_NO_BLANKING        0
         |                                 ^
   include/linux/console.h:36:2: note: in expansion of macro 'VESA_NO_BLANKING'
      36 |  VESA_NO_BLANKING = 0,
         |  ^~~~~~~~~~~~~~~~
--
   In file included from include/linux/fb.h:7,
                    from include/linux/vga_switcheroo.h:34,
                    from sound/pci/hda/hda_intel.c:52:
>> include/uapi/linux/fb.h:297:33: error: expected identifier before numeric constant
     297 | #define VESA_NO_BLANKING        0
         |                                 ^
   include/linux/console.h:36:2: note: in expansion of macro 'VESA_NO_BLANKING'
      36 |  VESA_NO_BLANKING = 0,
         |  ^~~~~~~~~~~~~~~~
   In file included from sound/pci/hda/hda_intel_trace.h:54,
                    from sound/pci/hda/hda_intel.c:60:
   include/trace/define_trace.h:95:42: fatal error: ./hda_intel_trace.h: No such file or directory
      95 | #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
         |                                          ^
   compilation terminated.


vim +297 include/uapi/linux/fb.h

607ca46e97a1b6 David Howells 2012-10-13  295  
607ca46e97a1b6 David Howells 2012-10-13  296  /* VESA Blanking Levels */
607ca46e97a1b6 David Howells 2012-10-13 @297  #define VESA_NO_BLANKING        0
607ca46e97a1b6 David Howells 2012-10-13  298  #define VESA_VSYNC_SUSPEND      1
607ca46e97a1b6 David Howells 2012-10-13  299  #define VESA_HSYNC_SUSPEND      2
607ca46e97a1b6 David Howells 2012-10-13  300  #define VESA_POWERDOWN          3
607ca46e97a1b6 David Howells 2012-10-13  301  
607ca46e97a1b6 David Howells 2012-10-13  302  

:::::: The code at line 297 was first introduced by commit
:::::: 607ca46e97a1b6594b29647d98a32d545c24bdff UAPI: (Scripted) Disintegrate include/linux

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
