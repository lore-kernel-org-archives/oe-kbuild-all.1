Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B5248793
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 23:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707175430; cv=none; b=sZ/AKly+axMdSBi7SL+rWPlNKbxf5mnWz+SgNtoIWiMZi62IZk4OzPsnqSFQu8sxFYttn25IjmC1g4RU7enLWxTMFTS02mrxt/Gz76izQYMnlTPdmIZ/hoh6DpOnuH9zlaSI3ZFuDOA0MQCYuMkUHk8JUEcObR31lr1VozwguMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707175430; c=relaxed/simple;
	bh=lp4oNwKDpPwaT7j9+zFHyG9XnfMqCKib3JNHHV1TpDA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fR6H7IwT4Bi7IIcQOPM3647RvuzHk9taTNyOB8ALq9oDrRkrbm7T2UUO8rgj9GbV3BP6+bHJbptK+Ll+Iw//j3NObQlHTp5obEAaFxZCyf5i6sjC3jqmES7SCk/NpfV1vneS2iGwiYgQj4qrcNy2gdPedfoTSZ9TJ5RseHJK12s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jXSGrq27; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jXSGrq27"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707175427; x=1738711427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lp4oNwKDpPwaT7j9+zFHyG9XnfMqCKib3JNHHV1TpDA=;
  b=jXSGrq27u4spUJViJZhp/lDfgJX+or7P8LESjSwSlshjDCYg0wPM74XE
   +o3HKvXez21uw+buC4CWH1WpvyzgYXJzqLfwn50KUEyOlOgYe7lOxZ8gh
   jE9AtT4M/Rpooyy6rPoqdzBKsMvSToQwlrTraDDLwmfWp1J52I5g2B/Ly
   psuS+FaCvC6/QLeztg+sSbTWeMf0wpxs7eTpnEPeF5iGcCE1xnfIwiRYK
   G5yZd/Kr7WfPs4Kr3LBCUmfnrhravaZMCR172lUfuJIMP90tNBN6t0tnN
   etHJvu25ENQ1Dy8oW/5ZMnBX8lIDDfv4cCJqftu+1gmwNj8nlD1uzSYpn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="26072236"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="26072236"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 15:23:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="38276368"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Feb 2024 15:23:44 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rX8JR-0000tM-36;
	Mon, 05 Feb 2024 23:23:41 +0000
Date: Tue, 6 Feb 2024 07:23:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:devel/2-arg-strscpy 3/4] include/linux/string.h:143:21: error:
 '__strscpy_pad' undeclared; did you mean 'strscpy_pad'?
Message-ID: <202402060752.Ab6TLFAi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git devel/2-arg-strscpy
head:   ec83dccab8c18d8482dc1934e7079916508b8eea
commit: dec483587dcaf35a567dc38c50a8800ad4b106d3 [3/4] string: Allow 2-argument strscpy_pad()
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20240206/202402060752.Ab6TLFAi-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240206/202402060752.Ab6TLFAi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402060752.Ab6TLFAi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bitmap.h:12,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from fs/exec.c:27:
   fs/exec.c: In function '__get_task_comm':
   include/linux/string.h:143:9: error: implicit declaration of function 'CONCATENATE' [-Werror=implicit-function-declaration]
     143 |         CONCATENATE(__strscpy_pad, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |         ^~~~~~~~~~~
   fs/exec.c:1234:9: note: in expansion of macro 'strscpy_pad'
    1234 |         strscpy_pad(buf, tsk->comm, buf_size);
         |         ^~~~~~~~~~~
>> include/linux/string.h:143:21: error: '__strscpy_pad' undeclared (first use in this function); did you mean 'strscpy_pad'?
     143 |         CONCATENATE(__strscpy_pad, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |                     ^~~~~~~~~~~~~
   fs/exec.c:1234:9: note: in expansion of macro 'strscpy_pad'
    1234 |         strscpy_pad(buf, tsk->comm, buf_size);
         |         ^~~~~~~~~~~
   include/linux/string.h:143:21: note: each undeclared identifier is reported only once for each function it appears in
     143 |         CONCATENATE(__strscpy_pad, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |                     ^~~~~~~~~~~~~
   fs/exec.c:1234:9: note: in expansion of macro 'strscpy_pad'
    1234 |         strscpy_pad(buf, tsk->comm, buf_size);
         |         ^~~~~~~~~~~
   include/linux/string.h:143:36: error: implicit declaration of function 'COUNT_ARGS' [-Werror=implicit-function-declaration]
     143 |         CONCATENATE(__strscpy_pad, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |                                    ^~~~~~~~~~
   fs/exec.c:1234:9: note: in expansion of macro 'strscpy_pad'
    1234 |         strscpy_pad(buf, tsk->comm, buf_size);
         |         ^~~~~~~~~~~
   fs/exec.c: In function '__set_task_comm':
>> include/linux/string.h:143:21: error: '__strscpy_pad' undeclared (first use in this function); did you mean 'strscpy_pad'?
     143 |         CONCATENATE(__strscpy_pad, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |                     ^~~~~~~~~~~~~
   fs/exec.c:1249:9: note: in expansion of macro 'strscpy_pad'
    1249 |         strscpy_pad(tsk->comm, buf, sizeof(tsk->comm));
         |         ^~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +143 include/linux/string.h

   121	
   122	/**
   123	 * strscpy_pad() - Copy a C-string into a sized buffer
   124	 * @dest: Where to copy the string to
   125	 * @src: Where to copy the string from
   126	 * @count: Size of destination buffer
   127	 *
   128	 * Copy the string, or as much of it as fits, into the dest buffer. The
   129	 * behavior is undefined if the string buffers overlap. The destination
   130	 * buffer is always %NUL terminated, unless it's zero-sized.
   131	 *
   132	 * If the source string is shorter than the destination buffer, zeros
   133	 * the tail of the destination buffer.
   134	 *
   135	 * For full explanation of why you may want to consider using the
   136	 * 'strscpy' functions please see the function docstring for strscpy().
   137	 *
   138	 * Returns:
   139	 * * The number of characters copied (not including the trailing %NULs)
   140	 * * -E2BIG if count is 0 or @src was truncated.
   141	 */
   142	#define strscpy_pad(dst, src, ...)	\
 > 143		CONCATENATE(__strscpy_pad, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
