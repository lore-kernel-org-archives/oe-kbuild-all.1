Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDAF3E51C0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 15:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773935383; cv=none; b=n6aqUZyfPguvzeVHrAtSPi7utMojwmm+Y6bKHHDlrwNtyYaEhI67TOU2mjTZZyoFtN341MDCBtApo95SepIFwiNtpoUMp+P7F5BfDYvirQf1w2D+cRW07t0HS9kkpJA40p4ZeSEnDiuYjup+Kx4oDL9t025ZzRHpdrkT44DrBZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773935383; c=relaxed/simple;
	bh=EwC9W1rHh0XDGrFWVqfEoLA2F96yHLrITg/kieBY4g0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fFQ2goaBzF1TvhqL2hXT1ak85Lbew89VVB35X7OLNHhGiu3ADzyYyVffYXqsJr91Wrzu4Vb0O3jPavVMo3yspYOdpwQhvKqsr5b5413FwoN0AEmU5r9Q2nYSWFWxr6yRH9doICp51UQDp6ZG9Ba7WlBLwKXvlp0IYe/jvtqT4XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cHAqGu3a; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cHAqGu3a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773935382; x=1805471382;
  h=date:from:to:cc:subject:message-id;
  bh=EwC9W1rHh0XDGrFWVqfEoLA2F96yHLrITg/kieBY4g0=;
  b=cHAqGu3apAkyDqyphUeH2QuNnYzxScM6Dmz1vv1iG8+LJgpKzRUhzUrV
   gi39O4uUy4jNX+y6tklDOr4ZQJw44QHPdDjyoGqQZBZVxyr7hFAYkPW+m
   Ai/Tx1tNt8xjyGszYH7MKz/gHbmKgcOeNKaQPWnv9R6jBihZrrl5ay+l4
   xuO9e6WwoDuyFzuaT4A49QT1zwrw2UrEiMtWsjg1P6bgeu2JzdmFIkUTH
   CjvqexnkjnFmfsSCiPzPCtCHiRdWf2RYLvTEtlbz++4wbntlFQEsfGkgM
   kkhBms9hCKZSEevYZJGxR/f4k/UXcqOG0r8sfo9Zvd8DqH2whiVHHp6T+
   g==;
X-CSE-ConnectionGUID: /luqNLuUSc6gC3lJ+wxrAQ==
X-CSE-MsgGUID: OcLMf9BhQQGQ1u4F9BlXTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="78870059"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="78870059"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 08:49:42 -0700
X-CSE-ConnectionGUID: VC+s8VuGQxiYzP66qLl/1g==
X-CSE-MsgGUID: Ye2Qj0hCQ7Sot1+NEwAjwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="223215778"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 19 Mar 2026 08:49:40 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3FbC-000000001Er-3bLS;
	Thu, 19 Mar 2026 15:48:34 +0000
Date: Thu, 19 Mar 2026 23:47:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2]
 sound/core/pcm_native.c:3313:6: error: cannot jump from this asm goto
 statement to one of its possible targets
Message-ID: <202603192325.Md85agdY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   f388cc6f3e5057b373880473fc30b34004a6534d
commit: ed9acd01e907fa0d6d5224b03be2a188c5949d92 [2/2] ALSA: pcm: Relax __free() variable declarations
config: arm64-randconfig-004-20260319 (https://download.01.org/0day-ci/archive/20260319/202603192325.Md85agdY-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603192325.Md85agdY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603192325.Md85agdY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/core/pcm_native.c:3313:6: error: cannot jump from this asm goto statement to one of its possible targets
           if (put_user(result, &_xfern->result))
               ^
   arch/arm64/include/asm/uaccess.h:369:18: note: expanded from macro 'put_user'
   #define put_user        __put_user
                           ^
   arch/arm64/include/asm/uaccess.h:365:2: note: expanded from macro '__put_user'
           __put_user_error((x), (ptr), __pu_err);                         \
           ^
   arch/arm64/include/asm/uaccess.h:355:3: note: expanded from macro '__put_user_error'
                   __raw_put_user((x), __p, __pu_failed);                  \
                   ^
   arch/arm64/include/asm/uaccess.h:339:3: note: expanded from macro '__raw_put_user'
                   __raw_put_mem("sttr", __rpu_val, __rpu_ptr, __rpu_failed, U);   \
                   ^
   arch/arm64/include/asm/uaccess.h:309:3: note: expanded from macro '__raw_put_mem'
                   __put_mem_asm(str "b", "%w", __pu_val, (ptr), label, type);     \
                   ^
   arch/arm64/include/asm/uaccess.h:298:2: note: expanded from macro '__put_mem_asm'
           asm goto(                                                       \
           ^
   sound/core/pcm_native.c:3300:6: note: possible target of asm goto statement
           if (put_user(0, &_xfern->result))
               ^
   arch/arm64/include/asm/uaccess.h:369:18: note: expanded from macro 'put_user'
   #define put_user        __put_user
                           ^
   arch/arm64/include/asm/uaccess.h:365:2: note: expanded from macro '__put_user'
           __put_user_error((x), (ptr), __pu_err);                         \
           ^
   arch/arm64/include/asm/uaccess.h:355:3: note: expanded from macro '__put_user_error'
                   __raw_put_user((x), __p, __pu_failed);                  \
                   ^
   arch/arm64/include/asm/uaccess.h:342:2: note: expanded from macro '__raw_put_user'
           __rpu_failed:                                                   \
           ^
   sound/core/pcm_native.c:3305:8: note: jump exits scope of variable with __attribute__((cleanup))
           void *bufs __free(kfree) =
                 ^
   sound/core/pcm_native.c:3300:6: error: cannot jump from this asm goto statement to one of its possible targets
           if (put_user(0, &_xfern->result))
               ^
   arch/arm64/include/asm/uaccess.h:369:18: note: expanded from macro 'put_user'
   #define put_user        __put_user
                           ^
   arch/arm64/include/asm/uaccess.h:365:2: note: expanded from macro '__put_user'
           __put_user_error((x), (ptr), __pu_err);                         \
           ^
   arch/arm64/include/asm/uaccess.h:355:3: note: expanded from macro '__put_user_error'
                   __raw_put_user((x), __p, __pu_failed);                  \
                   ^
   arch/arm64/include/asm/uaccess.h:339:3: note: expanded from macro '__raw_put_user'
                   __raw_put_mem("sttr", __rpu_val, __rpu_ptr, __rpu_failed, U);   \
                   ^
   arch/arm64/include/asm/uaccess.h:309:3: note: expanded from macro '__raw_put_mem'
                   __put_mem_asm(str "b", "%w", __pu_val, (ptr), label, type);     \
                   ^
   arch/arm64/include/asm/uaccess.h:298:2: note: expanded from macro '__put_mem_asm'
           asm goto(                                                       \
           ^
   sound/core/pcm_native.c:3313:6: note: possible target of asm goto statement
           if (put_user(result, &_xfern->result))
               ^
   arch/arm64/include/asm/uaccess.h:369:18: note: expanded from macro 'put_user'
   #define put_user        __put_user
                           ^
   arch/arm64/include/asm/uaccess.h:365:2: note: expanded from macro '__put_user'
           __put_user_error((x), (ptr), __pu_err);                         \
           ^
   arch/arm64/include/asm/uaccess.h:355:3: note: expanded from macro '__put_user_error'
                   __raw_put_user((x), __p, __pu_failed);                  \
                   ^
   arch/arm64/include/asm/uaccess.h:342:2: note: expanded from macro '__raw_put_user'
           __rpu_failed:                                                   \
           ^
   sound/core/pcm_native.c:3305:8: note: jump bypasses initialization of variable with __attribute__((cleanup))
           void *bufs __free(kfree) =
                 ^
   2 errors generated.


vim +3313 sound/core/pcm_native.c

67616feda99e32c Takashi Iwai 2017-08-30  3288  
67616feda99e32c Takashi Iwai 2017-08-30  3289  static int snd_pcm_xfern_frames_ioctl(struct snd_pcm_substream *substream,
67616feda99e32c Takashi Iwai 2017-08-30  3290  				      struct snd_xfern __user *_xfern)
67616feda99e32c Takashi Iwai 2017-08-30  3291  {
67616feda99e32c Takashi Iwai 2017-08-30  3292  	struct snd_xfern xfern;
67616feda99e32c Takashi Iwai 2017-08-30  3293  	struct snd_pcm_runtime *runtime = substream->runtime;
67616feda99e32c Takashi Iwai 2017-08-30  3294  	snd_pcm_sframes_t result;
67616feda99e32c Takashi Iwai 2017-08-30  3295  
f0061c18c169f0c Takashi Iwai 2022-09-26  3296  	if (runtime->state == SNDRV_PCM_STATE_OPEN)
67616feda99e32c Takashi Iwai 2017-08-30  3297  		return -EBADFD;
67616feda99e32c Takashi Iwai 2017-08-30  3298  	if (runtime->channels > 128)
67616feda99e32c Takashi Iwai 2017-08-30  3299  		return -EINVAL;
67616feda99e32c Takashi Iwai 2017-08-30  3300  	if (put_user(0, &_xfern->result))
67616feda99e32c Takashi Iwai 2017-08-30  3301  		return -EFAULT;
67616feda99e32c Takashi Iwai 2017-08-30  3302  	if (copy_from_user(&xfern, _xfern, sizeof(xfern)))
67616feda99e32c Takashi Iwai 2017-08-30  3303  		return -EFAULT;
67616feda99e32c Takashi Iwai 2017-08-30  3304  
ed9acd01e907fa0 Takashi Iwai 2025-12-16  3305  	void *bufs __free(kfree) =
ed9acd01e907fa0 Takashi Iwai 2025-12-16  3306  		memdup_array_user(xfern.bufs, runtime->channels, sizeof(void *));
67616feda99e32c Takashi Iwai 2017-08-30  3307  	if (IS_ERR(bufs))
40a024b81d1cbad Takashi Iwai 2024-09-02  3308  		return PTR_ERR(bufs);
67616feda99e32c Takashi Iwai 2017-08-30  3309  	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
67616feda99e32c Takashi Iwai 2017-08-30  3310  		result = snd_pcm_lib_writev(substream, bufs, xfern.frames);
67616feda99e32c Takashi Iwai 2017-08-30  3311  	else
67616feda99e32c Takashi Iwai 2017-08-30  3312  		result = snd_pcm_lib_readv(substream, bufs, xfern.frames);
ebe6976d3634a31 Al Viro      2020-03-19 @3313  	if (put_user(result, &_xfern->result))
ebe6976d3634a31 Al Viro      2020-03-19  3314  		return -EFAULT;
67616feda99e32c Takashi Iwai 2017-08-30  3315  	return result < 0 ? result : 0;
67616feda99e32c Takashi Iwai 2017-08-30  3316  }
67616feda99e32c Takashi Iwai 2017-08-30  3317  

:::::: The code at line 3313 was first introduced by commit
:::::: ebe6976d3634a311367f72c2402f148ab9f23920 pcm_native: result of put_user() needs to be checked

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
