Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D422A40243E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 15:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774970208; cv=none; b=VZ/AX9+SWlgy8w3UaWmy2Hh9SYthSpvm1OfUu5tzGkSSV1GGfaGrwkHMV9LOUjKbteK3ax9rWvmH8zTRc7SiXGhV4QGy6R+vX80unwSHq7sXLg+7oJBF0L9NE1nu4PUxgdswYY7UhvfWXWNEaMSsT0NrcC0dYukb/JoXtcSRJDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774970208; c=relaxed/simple;
	bh=YsW1N9WT2ID9oJMzACJzBddesMiBDzlZf4pdPRbOW2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fdkxTOFXXn0uzx3XNcv+YVecralmgjQWvzbH24ucVL8W/zCRCYDz3wuPe8pKBHSexQHAHVFFl0dGbofWC6ZI98XA6X+BObd8fwzPGDLBQYuSwGVeEvfWrHU1WbmC1wVQ3RXAB7pkzRcUgXnxc6yScm4JvGGdSGT/TESanDRWgr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J3QQNbvC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J3QQNbvC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774970207; x=1806506207;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YsW1N9WT2ID9oJMzACJzBddesMiBDzlZf4pdPRbOW2U=;
  b=J3QQNbvCEGQr9gVc/iD81CqP4MxVGT1YzDMnWJDe9XjGYaPICFMsdkNx
   ZwwSERowzAgapTHvGSOtaD9Yx2dzA39BdGUewldPkEeNPJhrycIxAlZ2z
   7G16a+j4D7kOSlzqstHIHLOUPuMK/puWSpAHVAeNm5zeHLp0OTW+juDn0
   fOO4ialInyDTTnAqESkP75qPMvSSp032mQn8WIoUqEv46TpzJZSgM+Ad1
   Yq9A+KJQbRY2Kzmc25CLNNkzFoDt2ODLim5CGN9+6YGpR4nXh/DxmeLH5
   MN+cqREKRDS7NBC3GSZPKgZJ+m+HbsfJabiBOQfrF2J19S4pFytlyADmO
   A==;
X-CSE-ConnectionGUID: OcYoz2xDShCAJ3JE2vk+fg==
X-CSE-MsgGUID: 56EPYsyaRRq16YuQLt2pKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="63539392"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="63539392"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 08:16:46 -0700
X-CSE-ConnectionGUID: Y+3x6NRoQReOsR9Ar1v3FQ==
X-CSE-MsgGUID: 0O1dDmciTx+c3uIU00ykYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="223091922"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Mar 2026 08:16:44 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7apd-000000002nn-2EqM;
	Tue, 31 Mar 2026 15:16:41 +0000
Date: Tue, 31 Mar 2026 23:16:23 +0800
From: kernel test robot <lkp@intel.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, richard@nod.at,
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net
Cc: oe-kbuild-all@lists.linux.dev, linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
Subject: Re: [PATCH] um: mconsole: validate notify socket path length
Message-ID: <202603312336.UUqJ8pFo-lkp@intel.com>
References: <20260329030945.32368-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329030945.32368-1-pengpeng@iscas.ac.cn>

Hi Pengpeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on uml/next]
[also build test ERROR on wireless-next/main wireless/main uml/fixes linus/master v7.0-rc6 next-20260330]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pengpeng-Hou/um-mconsole-validate-notify-socket-path-length/20260331-052930
base:   https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux next
patch link:    https://lore.kernel.org/r/20260329030945.32368-1-pengpeng%40iscas.ac.cn
patch subject: [PATCH] um: mconsole: validate notify socket path length
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20260331/202603312336.UUqJ8pFo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603312336.UUqJ8pFo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603312336.UUqJ8pFo-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/um/drivers/mconsole_user.c: In function 'mconsole_notify':
>> arch/um/drivers/mconsole_user.c:203:13: error: implicit declaration of function 'snprintf' [-Wimplicit-function-declaration]
     203 |         if (snprintf(target.sun_path, sizeof(target.sun_path), "%s", sock_name) >=
         |             ^~~~~~~~
   arch/um/drivers/mconsole_user.c:14:1: note: 'snprintf' is defined in header '<stdio.h>'; this is probably fixable by adding '#include <stdio.h>'
      13 | #include "mconsole.h"
     +++ |+#include <stdio.h>
      14 | 


vim +/snprintf +203 arch/um/drivers/mconsole_user.c

   180	
   181	int mconsole_notify(char *sock_name, int type, const void *data, int len)
   182	{
   183		struct sockaddr_un target;
   184		struct mconsole_notify packet;
   185		int n, err = 0;
   186	
   187		lock_notify();
   188		if (notify_sock < 0) {
   189			notify_sock = socket(PF_UNIX, SOCK_DGRAM, 0);
   190			if (notify_sock < 0) {
   191				err = -errno;
   192				printk(UM_KERN_ERR "mconsole_notify - socket failed, "
   193				       "errno = %d\n", errno);
   194			}
   195		}
   196		unlock_notify();
   197	
   198		if (err)
   199			return err;
   200	
   201		memset(&target, 0, sizeof(target));
   202		target.sun_family = AF_UNIX;
 > 203		if (snprintf(target.sun_path, sizeof(target.sun_path), "%s", sock_name) >=

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
