Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C42848E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 10:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714386643; cv=none; b=unzShBOmnOiq4nqZtKY/JdVsJ/oab3Esmu3oGN25cI03mrlw30QVl+ZBGaLaLtzh9IoyG66X4tTukMTw47aSLBBHb3Mn8XgfOUGAtlH1lCprEaXtCnIhhCeSCHrG9BzHeNeeTRN27AxeG938d85yxcM8sim2McTCNzplhxU4Wa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714386643; c=relaxed/simple;
	bh=fUKZ0gUAIoGgJVUdSZ8KUz9shqg+rNKn0PtLBKluMz4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hHile9t7z33NyKiRP52UTuofZxYYNoa+UPCWEvt30qRSOCr6YyiHCOYOOzlSQuDU9AJP+jY819bXXEagz3Wke8rtQmcgkGemscmd3vI3kHLSqieF5hDh2pMRBOmNjQt2pTnczBtmfRV8RSYY5Begd9wTyetcmVlSg45kj2AiIQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nhGqSycK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nhGqSycK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714386641; x=1745922641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fUKZ0gUAIoGgJVUdSZ8KUz9shqg+rNKn0PtLBKluMz4=;
  b=nhGqSycKlwFFjI5raSaV8ZoV7nYIexFoP4IOax7vT6z1vTPXpkSc/PdN
   BfuDemyxKFSOkEwsNrdiCFfGqWdgwdtKEQNohE6+YCu4B0KIOY8r/vbWM
   /zDUzfZuRbi11bxXN0dC6hkZ2f98Ic7nNNHdAlwAKQPa6j+m32kgJiO2Y
   4vR+4wXvQ7DGcu36P6r+kgJLYqVfqLdBjsovGUGxsGH4DwgEned2jP+Si
   aA4U5z9kn8BJDeHdIX3Yg4TGoT4RfZzAhe2Zgdl3n0Xsa33FNB/HAxi4z
   Oh5FJrOugIMHBjvStngutVJYnt5Ldd7BTNDDyywuy//x2X29Z6anS0y7H
   w==;
X-CSE-ConnectionGUID: ytDKIUdkSvuWwkSZ1tWqjA==
X-CSE-MsgGUID: 9xkHgX+kRJCx4CtJfYgzug==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="12974792"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="12974792"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 03:30:39 -0700
X-CSE-ConnectionGUID: f3F6ax+pTl+HTch8oQkk+A==
X-CSE-MsgGUID: Gv9+2kznQu6fGQYMHiShcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26694585"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Apr 2024 03:30:38 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1OHL-00077a-29;
	Mon, 29 Apr 2024 10:30:35 +0000
Date: Mon, 29 Apr 2024 18:30:20 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 9857/29983]
 drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c:716:15: error: redefinition of
 'up' as different kind of symbol
Message-ID: <202404291827.3LjNIxnJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   5134e031114e613cb04858e248af5e65fe1e112f
commit: e5f6c88bebcc7392ffecb160ade7d87b0164e8c1 [9857/29983] MA-20005-12 hantro_vc8000e: Fix build error exposed by -Wunused-variable
config: arm64-randconfig-001-20240429 (https://download.01.org/0day-ci/archive/20240429/202404291827.3LjNIxnJ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404291827.3LjNIxnJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404291827.3LjNIxnJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c:29:
   In file included from include/linux/mm.h:1608:
   include/linux/vmstat.h:436:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:443:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     443 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     444 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:450:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     450 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:455:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     455 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     456 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c:369:6: warning: variable 'core_num' set but not used [-Wunused-but-set-variable]
     369 |         u32 core_num = 0;
         |             ^
>> drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c:716:15: error: redefinition of 'up' as different kind of symbol
     716 |         void __user *up = compat_ptr(arg);
         |                      ^
   include/linux/semaphore.h:43:13: note: previous definition is here
      43 | extern void up(struct semaphore *sem);
         |             ^
>> drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c:716:31: error: use of undeclared identifier 'arg'
     716 |         void __user *up = compat_ptr(arg);
         |                                      ^
>> drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c:718:2: error: expected identifier or '('
     718 |         switch (_IOC_NR(cmd)) {
         |         ^
   drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c:798:2: error: expected identifier or '('
     798 |         return 0;
         |         ^
>> drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c:799:1: error: extraneous closing brace ('}')
     799 | }
         | ^
   5 warnings and 5 errors generated.


vim +/up +716 drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c

633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  711  
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  712  union {
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  713  	unsigned long kux;
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  714  	unsigned int kui;
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  715  } karg;
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07 @716  	void __user *up = compat_ptr(arg);
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  717  
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07 @718  	switch (_IOC_NR(cmd)) {
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  719  	case _IOC_NR(HX280ENC_IOCGHWOFFSET): {
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  720  		err = get_user(karg.kux, (s32 __user *)up);
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  721  		if (err)
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  722  			return err;
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  723  		HX280ENC_IOCTL32(err, filp, cmd, (unsigned long)&karg);
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  724  		err = put_user(((s32)karg.kux), (s32 __user *)up);
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  725  		break;
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  726  	}
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  727  	case _IOC_NR(HX280ENC_IOCGHWIOSIZE): {
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  728  		err = get_user(karg.kui, (s32 __user *)up);
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  729  		if (err)
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  730  			return err;
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  731  		HX280ENC_IOCTL32(err, filp, cmd, (unsigned long)&karg);
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  732  		err = put_user(((s32)karg.kui), (s32 __user *)up);
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  733  		break;
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  734  	}
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  735  	case _IOC_NR(HX280ENC_IOCGSRAMOFFSET): {
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  736  		err = get_user(karg.kux, (s32 __user *)up);
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  737  		if (err)
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  738  			return err;
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  739  		HX280ENC_IOCTL32(err, filp, cmd, (unsigned long)&karg);
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  740  		err = put_user(((s32)karg.kux), (s32 __user *)up);
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  741  		break;
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  742  	}
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  743  	case _IOC_NR(HX280ENC_IOCGSRAMEIOSIZE):{
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  744  		err = get_user(karg.kui, (s32 __user *)up);
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  745  		if (err)
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  746  			return err;
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  747  		HX280ENC_IOCTL32(err, filp, cmd, (unsigned long)&karg);
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  748  		err = put_user(((s32)karg.kui), (s32 __user *)up);
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  749  		break;
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  750  	}
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  751  	case _IOC_NR(HX280ENC_IOCG_CORE_NUM): {
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  752  		err = get_user(karg.kui, (s32 __user *)up);
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  753  		if (err)
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  754  			return err;
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  755  		HX280ENC_IOCTL32(err, filp, cmd, (unsigned long)&karg);
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  756  		err = put_user(((s32)karg.kui), (s32 __user *)up);
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  757  		break;
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  758  	}
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  759  	case _IOC_NR(HX280ENC_IOCH_ENC_RESERVE): {
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  760  		err = get_user(karg.kui, (s32 __user *)up);
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  761  		if (err)
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  762  			return err;
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  763  		HX280ENC_IOCTL32(err, filp, cmd, (unsigned long)&karg);
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  764  		err = put_user(((s32)karg.kui), (s32 __user *)up);
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  765  		break;
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  766  	}
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  767  	case _IOC_NR(HX280ENC_IOCH_ENC_RELEASE): {
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  768  		err = get_user(karg.kui, (s32 __user *)up);
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  769  		if (err)
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  770  			return err;
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  771  		HX280ENC_IOCTL32(err, filp, cmd, (unsigned long)&karg);
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  772  		break;
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  773  	}
5c99e084992745 drivers/mxc/hantro_vc8000e/hx280enc.c         Zhou Peng   2020-03-11  774  	case _IOC_NR(HX280ENC_IOCG_EN_CORE): {
5c99e084992745 drivers/mxc/hantro_vc8000e/hx280enc.c         Zhou Peng   2020-03-11  775  		err = get_user(karg.kui, (s32 __user *)up);
5c99e084992745 drivers/mxc/hantro_vc8000e/hx280enc.c         Zhou Peng   2020-03-11  776  		if (err)
5c99e084992745 drivers/mxc/hantro_vc8000e/hx280enc.c         Zhou Peng   2020-03-11  777  			return err;
5c99e084992745 drivers/mxc/hantro_vc8000e/hx280enc.c         Zhou Peng   2020-03-11  778  		HX280ENC_IOCTL32(err, filp, cmd, (unsigned long)&karg);
5c99e084992745 drivers/mxc/hantro_vc8000e/hx280enc.c         Zhou Peng   2020-03-11  779  		break;
5c99e084992745 drivers/mxc/hantro_vc8000e/hx280enc.c         Zhou Peng   2020-03-11  780  	}
5c99e084992745 drivers/mxc/hantro_vc8000e/hx280enc.c         Zhou Peng   2020-03-11  781  
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  782  	case _IOC_NR(HX280ENC_IOCG_CORE_WAIT): {
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  783  		HX280ENC_IOCTL32(err, filp, cmd, (unsigned long)up);
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  784  		break;
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  785  	}
74964174821803 drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c Shijie Qin  2021-09-15  786  
74964174821803 drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c Shijie Qin  2021-09-15  787  	case _IOC_NR(HX280ENC_IOC_WRITE_REGS): {
74964174821803 drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c Shijie Qin  2021-09-15  788  		HX280ENC_IOCTL32(err, filp, cmd, (unsigned long)up);
74964174821803 drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c Shijie Qin  2021-09-15  789  		break;
74964174821803 drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c Shijie Qin  2021-09-15  790  	}
74964174821803 drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c Shijie Qin  2021-09-15  791  
74964174821803 drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c Shijie Qin  2021-09-15  792  	case _IOC_NR(HX280ENC_IOC_READ_REGS): {
74964174821803 drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c Shijie Qin  2021-09-15  793  		HX280ENC_IOCTL32(err, filp, cmd, (unsigned long)up);
74964174821803 drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c Shijie Qin  2021-09-15  794  		break;
74964174821803 drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c Shijie Qin  2021-09-15  795  	}
74964174821803 drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c Shijie Qin  2021-09-15  796  
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  797  	}
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  798  	return 0;
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07 @799  }
633d2300b1721e drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  800  

:::::: The code at line 716 was first introduced by commit
:::::: 633d2300b1721e58582981ce7643fada28693f48 MA-16211: imx8mp: vpu: Implement hantro vc8000e ioctl32

:::::: TO: xiahong.bao <xiahong.bao@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
