Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D084C96
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Feb 2024 02:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708827860; cv=none; b=pGeySpqKpyA5LG6ImGdkuyK4yPWiZGfqyyHLHYGqtyQFeawQKhccwF7+J3xbnN9KEuVhpkB/fbIQUts/OR+cKpZuFGDGQBEDkdxkX8a+KUcXcrarycniGXukXwds3SK31e8u4d525w9NhCVCFtKsGtljQ8YeEJHu6UBqcEB2KOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708827860; c=relaxed/simple;
	bh=qJZMG6oQD21tiJgy4N3WoXJ3MQIOMHuuOMchILBCISE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BMXJnmu8qDW2Ya4bkMgM6r4ci1I2srDY9kpeyx4+/EoozVXkeM6YL+cp93hHmAHZJ6z1+lIw9Zq+h6TF9pozn7IVHd4JvMahEQFCOah7VZfrLoPjWEquNWptV+eL+pcP3DFnvcm7QnAw6O1M9U5PDId77zU8q5GPnIOZTHJWc4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fBGAn5hl; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fBGAn5hl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708827858; x=1740363858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qJZMG6oQD21tiJgy4N3WoXJ3MQIOMHuuOMchILBCISE=;
  b=fBGAn5hl+UutGUXvtqsoIZ5e/veWMaofYLqi+ZMCLd/jQmDDabZTB/K1
   E2lfiFzecUWdTrj8c57nXEg86pWG1Y4M6bCUna2i/VG6/ie6TDzy4HR7y
   UVOwPnIcZI5QtQGATtj1bH+3wxmV0GBvzJiNGQr1DGzeJeY85PCNEC28w
   XvFn2S1saJhr2vHNAhDVPNNVjKYqqhsEi+VTKeHtvQ9ZcCD1+UMSboIPk
   0lfcbHT9PHzTFLmTCiiQQE+pu434EQbwflUzRN0qBmswJH3Ro2Xl2Tq2f
   FysNNkhDaiCunbRl5bhLTWgvakSsjlGmhEcmtnp9RYvTqXL/OUcko2cZM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="6921441"
X-IronPort-AV: E=Sophos;i="6.06,182,1705392000"; 
   d="scan'208";a="6921441"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 18:24:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,182,1705392000"; 
   d="scan'208";a="10903140"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 24 Feb 2024 18:24:16 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1re4Ba-0009Cu-0f;
	Sun, 25 Feb 2024 02:24:14 +0000
Date: Sun, 25 Feb 2024 10:23:36 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/guard 46/70] sound/core/hwdep.c:291:8: error:
 cannot jump from this asm goto statement to one of its possible targets
Message-ID: <202402251039.08XAcTR2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Takashi,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/guard
head:   08e50f26c5431175dc7207664c292f3ecc134121
commit: 9c86a0c433a5a99e2d5cc4713609efed801632a1 [46/70] ALSA: hwdep: Use guard() for locking
config: powerpc-randconfig-r081-20240225 (https://download.01.org/0day-ci/archive/20240225/202402251039.08XAcTR2-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240225/202402251039.08XAcTR2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402251039.08XAcTR2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/core/hwdep.c:291:8: error: cannot jump from this asm goto statement to one of its possible targets
                           if (put_user(device, (int __user *)arg))
                               ^
   arch/powerpc/include/asm/uaccess.h:66:5: note: expanded from macro 'put_user'
                     __put_user(x, _pu_addr) : -EFAULT;                    \
                     ^
   arch/powerpc/include/asm/uaccess.h:48:3: note: expanded from macro '__put_user'
                   __put_user_size_goto(__pu_val, __pu_addr, __pu_size, __pu_failed);      \
                   ^
   arch/powerpc/include/asm/uaccess.h:116:10: note: expanded from macro '__put_user_size_goto'
           case 1: __put_user_asm_goto(x, __pus_addr, label, "stb"); break;        \
                   ^
   arch/powerpc/include/asm/uaccess.h:86:2: note: expanded from macro '__put_user_asm_goto'
           asm_volatile_goto(                                      \
           ^
   include/linux/compiler_types.h:366:33: note: expanded from macro 'asm_volatile_goto'
   #define asm_volatile_goto(x...) asm goto(x)
                                   ^
   sound/core/hwdep.c:273:8: note: possible target of asm goto statement
                           if (get_user(device, (int __user *)arg))
                               ^
   arch/powerpc/include/asm/uaccess.h:295:5: note: expanded from macro 'get_user'
                     __get_user(x, _gu_addr) :                             \
                     ^
   arch/powerpc/include/asm/uaccess.h:283:2: note: expanded from macro '__get_user'
           __get_user_size_allowed(__gu_val, __gu_addr, __gu_size, __gu_err);      \
           ^
   arch/powerpc/include/asm/uaccess.h:201:16: note: expanded from macro '__get_user_size_allowed'
                   break;                                                  \
                                                                           ^
   sound/core/hwdep.c:276:4: note: jump exits scope of variable with __attribute__((cleanup))
                           guard(mutex)(&register_mutex);
                           ^
   include/linux/cleanup.h:164:15: note: expanded from macro 'guard'
           CLASS(_name, __UNIQUE_ID(guard))
                        ^
   include/linux/compiler.h:180:29: note: expanded from macro '__UNIQUE_ID'
   #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
                               ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:163:1: note: expanded from here
   __UNIQUE_ID_guard260
   ^
   sound/core/hwdep.c:273:8: error: cannot jump from this asm goto statement to one of its possible targets
                           if (get_user(device, (int __user *)arg))
                               ^
   arch/powerpc/include/asm/uaccess.h:295:5: note: expanded from macro 'get_user'
                     __get_user(x, _gu_addr) :                             \
                     ^
   arch/powerpc/include/asm/uaccess.h:283:2: note: expanded from macro '__get_user'
           __get_user_size_allowed(__gu_val, __gu_addr, __gu_size, __gu_err);      \
           ^
   arch/powerpc/include/asm/uaccess.h:199:3: note: expanded from macro '__get_user_size_allowed'
                   __get_user_size_goto(x, ptr, size, __gus_failed);       \
                   ^
   arch/powerpc/include/asm/uaccess.h:187:10: note: expanded from macro '__get_user_size_goto'
           case 1: __get_user_asm_goto(x, (u8 __user *)ptr, label, "lbz"); break;  \
                   ^
   arch/powerpc/include/asm/uaccess.h:158:2: note: expanded from macro '__get_user_asm_goto'
           asm_volatile_goto(                                      \
           ^
   include/linux/compiler_types.h:366:33: note: expanded from macro 'asm_volatile_goto'
   #define asm_volatile_goto(x...) asm goto(x)
                                   ^
   sound/core/hwdep.c:291:8: note: possible target of asm goto statement
                           if (put_user(device, (int __user *)arg))
                               ^
   arch/powerpc/include/asm/uaccess.h:66:5: note: expanded from macro 'put_user'
                     __put_user(x, _pu_addr) : -EFAULT;                    \
                     ^
   arch/powerpc/include/asm/uaccess.h:52:9: note: expanded from macro '__put_user'
                                                                   \
                                                                   ^
   sound/core/hwdep.c:276:4: note: jump bypasses initialization of variable with __attribute__((cleanup))
                           guard(mutex)(&register_mutex);
                           ^
   include/linux/cleanup.h:164:15: note: expanded from macro 'guard'
           CLASS(_name, __UNIQUE_ID(guard))
                        ^
   include/linux/compiler.h:180:29: note: expanded from macro '__UNIQUE_ID'
   #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
                               ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:163:1: note: expanded from here
   __UNIQUE_ID_guard260
   ^
   2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_MPC5200_AC97
   Depends on [n]: SOUND [=m] && SND [=m] && SND_SOC [=m] && SND_POWERPC_SOC [=m] && PPC_MPC52xx [=y] && PPC_BESTCOMM [=n]
   Selected by [m]:
   - SND_MPC52xx_SOC_EFIKA [=m] && SOUND [=m] && SND [=m] && SND_SOC [=m] && SND_POWERPC_SOC [=m] && PPC_EFIKA [=y]
   WARNING: unmet direct dependencies detected for ADB_CUDA
   Depends on [n]: MACINTOSH_DRIVERS [=n] && (ADB [=n] || PPC_PMAC [=y]) && !PPC_PMAC64 [=n]
   Selected by [y]:
   - PPC_PMAC [=y] && PPC_BOOK3S [=y] && CPU_BIG_ENDIAN [=y] && POWER_RESET [=y] && PPC32 [=y]


vim +291 sound/core/hwdep.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  263  
d9a98de218ce18 Takashi Iwai    2005-11-17  264  static int snd_hwdep_control_ioctl(struct snd_card *card,
d9a98de218ce18 Takashi Iwai    2005-11-17  265  				   struct snd_ctl_file * control,
^1da177e4c3f41 Linus Torvalds  2005-04-16  266  				   unsigned int cmd, unsigned long arg)
^1da177e4c3f41 Linus Torvalds  2005-04-16  267  {
^1da177e4c3f41 Linus Torvalds  2005-04-16  268  	switch (cmd) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  269  	case SNDRV_CTL_IOCTL_HWDEP_NEXT_DEVICE:
^1da177e4c3f41 Linus Torvalds  2005-04-16  270  		{
^1da177e4c3f41 Linus Torvalds  2005-04-16  271  			int device;
^1da177e4c3f41 Linus Torvalds  2005-04-16  272  
^1da177e4c3f41 Linus Torvalds  2005-04-16  273  			if (get_user(device, (int __user *)arg))
^1da177e4c3f41 Linus Torvalds  2005-04-16  274  				return -EFAULT;
f7b2bb8549e352 Dan Carpenter   2011-10-28  275  
9c86a0c433a5a9 Takashi Iwai    2024-02-21  276  			guard(mutex)(&register_mutex);
f7b2bb8549e352 Dan Carpenter   2011-10-28  277  			if (device < 0)
f7b2bb8549e352 Dan Carpenter   2011-10-28  278  				device = 0;
f7b2bb8549e352 Dan Carpenter   2011-10-28  279  			else if (device < SNDRV_MINOR_HWDEPS)
f7b2bb8549e352 Dan Carpenter   2011-10-28  280  				device++;
f7b2bb8549e352 Dan Carpenter   2011-10-28  281  			else
f7b2bb8549e352 Dan Carpenter   2011-10-28  282  				device = SNDRV_MINOR_HWDEPS;
f7b2bb8549e352 Dan Carpenter   2011-10-28  283  
^1da177e4c3f41 Linus Torvalds  2005-04-16  284  			while (device < SNDRV_MINOR_HWDEPS) {
f87135f56cb266 Clemens Ladisch 2005-11-20  285  				if (snd_hwdep_search(card, device))
^1da177e4c3f41 Linus Torvalds  2005-04-16  286  					break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  287  				device++;
^1da177e4c3f41 Linus Torvalds  2005-04-16  288  			}
^1da177e4c3f41 Linus Torvalds  2005-04-16  289  			if (device >= SNDRV_MINOR_HWDEPS)
^1da177e4c3f41 Linus Torvalds  2005-04-16  290  				device = -1;
^1da177e4c3f41 Linus Torvalds  2005-04-16 @291  			if (put_user(device, (int __user *)arg))
^1da177e4c3f41 Linus Torvalds  2005-04-16  292  				return -EFAULT;
^1da177e4c3f41 Linus Torvalds  2005-04-16  293  			return 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  294  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  295  	case SNDRV_CTL_IOCTL_HWDEP_INFO:
^1da177e4c3f41 Linus Torvalds  2005-04-16  296  		{
d9a98de218ce18 Takashi Iwai    2005-11-17  297  			struct snd_hwdep_info __user *info = (struct snd_hwdep_info __user *)arg;
9c86a0c433a5a9 Takashi Iwai    2024-02-21  298  			int device;
d9a98de218ce18 Takashi Iwai    2005-11-17  299  			struct snd_hwdep *hwdep;
^1da177e4c3f41 Linus Torvalds  2005-04-16  300  
^1da177e4c3f41 Linus Torvalds  2005-04-16  301  			if (get_user(device, &info->device))
^1da177e4c3f41 Linus Torvalds  2005-04-16  302  				return -EFAULT;
9c86a0c433a5a9 Takashi Iwai    2024-02-21  303  			guard(mutex)(&register_mutex);
f87135f56cb266 Clemens Ladisch 2005-11-20  304  			hwdep = snd_hwdep_search(card, device);
9c86a0c433a5a9 Takashi Iwai    2024-02-21  305  			if (!hwdep)
9c86a0c433a5a9 Takashi Iwai    2024-02-21  306  				return -ENXIO;
9c86a0c433a5a9 Takashi Iwai    2024-02-21  307  			return snd_hwdep_info(hwdep, info);
^1da177e4c3f41 Linus Torvalds  2005-04-16  308  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  309  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  310  	return -ENOIOCTLCMD;
^1da177e4c3f41 Linus Torvalds  2005-04-16  311  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  312  

:::::: The code at line 291 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
