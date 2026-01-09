Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B952DCF55
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 18:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767984931; cv=none; b=E/kN6lBXnJbxBkLbdnoAqhIEoeRiUg4xU3NkVRWJY2ASMYFfHPFry89qJxbftgXJd5lM3zp0v4xPjF+J0iyAjFu2uyKRsJ2h0N7UzSyF7VHH0mURsYjfVeTyqTQ/pzRZf/eiGl/ZwMZZ6rL+AJVN8xVphFT+EH/8qa0o3Yzz1jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767984931; c=relaxed/simple;
	bh=MJ9cfUG477ehhq6qEOP+Pf/jPeRV3U1vumE75eYWvxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hXxhaGLhU/OvtRms2CxwUjjZTDRUmgnHIPdZHnYOM/rhnn8Y+gStIySjpXgIEUUwrcEuxzr3EKH/txrPFC6GX7UE8OtA+kDT5JXUjeb5qvLlodNokGHgG2uACoRtHa9C3vQO38P6pcQUKy0WBTZhqbQ7t40Jb43i+476VF8QXdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U+SlxRfH; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U+SlxRfH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767984929; x=1799520929;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MJ9cfUG477ehhq6qEOP+Pf/jPeRV3U1vumE75eYWvxY=;
  b=U+SlxRfHjwSy36qb385tHOnZ31DkxAC3tJJrXeFNbmjg5Hb8xqxqym8h
   iCExLOaEr8ejTD2wCTYb5NKDZ3NU/oNaXwxTqo7CvA/p2wCoISU6umiku
   Hik4E83D3jxC4R/fAWSpdEvkm9ZygzOZKyMaIfj5eyVd4kgPGerqw3tHZ
   PyA8V/BExPwWO3959g/82eaJbcnp5ZTEyMrBpsfHEs7GduQnbFgbPyIOZ
   DBMhoCzm5YMMPRTeEMUxekADmLIirgsjyAOm6xp8qqxQssdttqtTUzmQE
   SISbulwiThaM1o0bSdvi2Sy8C1sAlj9nQs3Y5WWl0xrujL6XSO6QI8qnA
   Q==;
X-CSE-ConnectionGUID: l0htkfX7TKqbMH+OsJ2gCw==
X-CSE-MsgGUID: aQ8JTkj+R5C3Ww9fnFzTSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="56922566"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="56922566"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 10:55:27 -0800
X-CSE-ConnectionGUID: 90dDmkzyTjmxkow9pHnScQ==
X-CSE-MsgGUID: 4ajmpLQKSBalzfk5FyqQSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="204327736"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jan 2026 10:55:26 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veHdr-0000000027c-20hx;
	Fri, 09 Jan 2026 18:55:23 +0000
Date: Fri, 9 Jan 2026 19:54:49 +0100
From: kernel test robot <lkp@intel.com>
To: Jerry Wu <w.7erry@foxmail.com>, marcel@holtmann.org
Cc: oe-kbuild-all@lists.linux.dev, johan.hedberg@gmail.com,
	luiz.dentz@gmail.com, linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org, w.7erry@foxmail.com
Subject: Re: [PATCH] Bluetooth: Perform careful capability checks in
 hci_sock_bind()
Message-ID: <202601091954.GF4GJ2fg-lkp@intel.com>
References: <tencent_2FAB909645504A5E0FDC88F125E139242C05@qq.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_2FAB909645504A5E0FDC88F125E139242C05@qq.com>

Hi Jerry,

kernel test robot noticed the following build errors:

[auto build test ERROR on bluetooth/master]
[also build test ERROR on bluetooth-next/master linus/master v6.19-rc4 next-20260109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jerry-Wu/Bluetooth-Perform-careful-capability-checks-in-hci_sock_bind/20260109-100553
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
patch link:    https://lore.kernel.org/r/tencent_2FAB909645504A5E0FDC88F125E139242C05%40qq.com
patch subject: [PATCH] Bluetooth: Perform careful capability checks in hci_sock_bind()
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260109/202601091954.GF4GJ2fg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601091954.GF4GJ2fg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601091954.GF4GJ2fg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/capability.h:16,
                    from include/linux/cred.h:11,
                    from include/linux/sched/signal.h:10,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs/super_types.h:13,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/compat.h:17,
                    from net/bluetooth/hci_sock.c:26:
   net/bluetooth/hci_sock.c: In function 'hci_sock_bind':
>> include/uapi/linux/capability.h:205:30: error: passing argument 1 of 'sk_capable' makes pointer from integer without a cast [-Wint-conversion]
     205 | #define CAP_NET_ADMIN        12
         |                              ^~
         |                              |
         |                              int
   net/bluetooth/hci_sock.c:1262:32: note: in expansion of macro 'CAP_NET_ADMIN'
    1262 |                 if (sk_capable(CAP_NET_ADMIN))
         |                                ^~~~~~~~~~~~~
   In file included from include/net/bluetooth/bluetooth.h:30,
                    from net/bluetooth/hci_sock.c:32:
   include/net/sock.h:3023:36: note: expected 'const struct sock *' but argument is of type 'int'
    3023 | bool sk_capable(const struct sock *sk, int cap);
         |                 ~~~~~~~~~~~~~~~~~~~^~
>> net/bluetooth/hci_sock.c:1262:21: error: too few arguments to function 'sk_capable'
    1262 |                 if (sk_capable(CAP_NET_ADMIN))
         |                     ^~~~~~~~~~
   include/net/sock.h:3023:6: note: declared here
    3023 | bool sk_capable(const struct sock *sk, int cap);
         |      ^~~~~~~~~~
>> include/uapi/linux/capability.h:205:30: error: passing argument 1 of 'sk_capable' makes pointer from integer without a cast [-Wint-conversion]
     205 | #define CAP_NET_ADMIN        12
         |                              ^~
         |                              |
         |                              int
   net/bluetooth/hci_sock.c:1430:32: note: in expansion of macro 'CAP_NET_ADMIN'
    1430 |                 if (sk_capable(CAP_NET_ADMIN))
         |                                ^~~~~~~~~~~~~
   include/net/sock.h:3023:36: note: expected 'const struct sock *' but argument is of type 'int'
    3023 | bool sk_capable(const struct sock *sk, int cap);
         |                 ~~~~~~~~~~~~~~~~~~~^~
   net/bluetooth/hci_sock.c:1430:21: error: too few arguments to function 'sk_capable'
    1430 |                 if (sk_capable(CAP_NET_ADMIN))
         |                     ^~~~~~~~~~
   include/net/sock.h:3023:6: note: declared here
    3023 | bool sk_capable(const struct sock *sk, int cap);
         |      ^~~~~~~~~~
--
   In file included from include/linux/capability.h:16,
                    from include/linux/cred.h:11,
                    from include/linux/sched/signal.h:10,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs/super_types.h:13,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/compat.h:17,
                    from hci_sock.c:26:
   hci_sock.c: In function 'hci_sock_bind':
>> include/uapi/linux/capability.h:205:30: error: passing argument 1 of 'sk_capable' makes pointer from integer without a cast [-Wint-conversion]
     205 | #define CAP_NET_ADMIN        12
         |                              ^~
         |                              |
         |                              int
   hci_sock.c:1262:32: note: in expansion of macro 'CAP_NET_ADMIN'
    1262 |                 if (sk_capable(CAP_NET_ADMIN))
         |                                ^~~~~~~~~~~~~
   In file included from include/net/bluetooth/bluetooth.h:30,
                    from hci_sock.c:32:
   include/net/sock.h:3023:36: note: expected 'const struct sock *' but argument is of type 'int'
    3023 | bool sk_capable(const struct sock *sk, int cap);
         |                 ~~~~~~~~~~~~~~~~~~~^~
   hci_sock.c:1262:21: error: too few arguments to function 'sk_capable'
    1262 |                 if (sk_capable(CAP_NET_ADMIN))
         |                     ^~~~~~~~~~
   include/net/sock.h:3023:6: note: declared here
    3023 | bool sk_capable(const struct sock *sk, int cap);
         |      ^~~~~~~~~~
>> include/uapi/linux/capability.h:205:30: error: passing argument 1 of 'sk_capable' makes pointer from integer without a cast [-Wint-conversion]
     205 | #define CAP_NET_ADMIN        12
         |                              ^~
         |                              |
         |                              int
   hci_sock.c:1430:32: note: in expansion of macro 'CAP_NET_ADMIN'
    1430 |                 if (sk_capable(CAP_NET_ADMIN))
         |                                ^~~~~~~~~~~~~
   include/net/sock.h:3023:36: note: expected 'const struct sock *' but argument is of type 'int'
    3023 | bool sk_capable(const struct sock *sk, int cap);
         |                 ~~~~~~~~~~~~~~~~~~~^~
   hci_sock.c:1430:21: error: too few arguments to function 'sk_capable'
    1430 |                 if (sk_capable(CAP_NET_ADMIN))
         |                     ^~~~~~~~~~
   include/net/sock.h:3023:6: note: declared here
    3023 | bool sk_capable(const struct sock *sk, int cap);
         |      ^~~~~~~~~~


vim +/sk_capable +205 include/uapi/linux/capability.h

607ca46e97a1b6 David Howells 2012-10-13  204  
607ca46e97a1b6 David Howells 2012-10-13 @205  #define CAP_NET_ADMIN        12
607ca46e97a1b6 David Howells 2012-10-13  206  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
