Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E2C34D921
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 11:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763034792; cv=none; b=Lhmfo+vgXaTtmqrK+aZjt2ZMB+cRMx2x9reoauvlPoAteL40Djz8XKeyTWdhq87EfuKUPwpjSmASZoEDuJE6r+4WarVALaGp3XpyJ5drMIgYVmZ5df+CJxQVeqdcdQ2FY4UiAQNOpt+mpIyYr6xR1jqDj4yS9q1cBfTyd/oTEt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763034792; c=relaxed/simple;
	bh=LWJnu7xPPKtN93jkYQdMOwHx9m+dxSaOGG5ajCsoZwo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q+l/jnVd+GYh42IPbTTabzSutiQZOhiQmF2Nqef2HfHhjJIbYL+0tJZqyrhXZLAy18EVVW0UTYnjFgmktk+i3vwvFA7LaRAXu16i9uZvCrYS5ZNw6AOfBTaM4vlkHp9AWkyuoQi6Qhuc38DGYZavipOtrLKwTwVy9JXHscIRPMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z3Zcig+7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z3Zcig+7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763034791; x=1794570791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LWJnu7xPPKtN93jkYQdMOwHx9m+dxSaOGG5ajCsoZwo=;
  b=Z3Zcig+7IKFkwPLGC3z2oMRX1iUlEC6oErX7I40QZ2xF5lE00NxolLzd
   XHRYMPH7dayouboyTmlPYkupvBy9D+qa/WXDEvL+fYKP8sLagbpvXGjVF
   K1d035bSYlvEJsxmYeJOF5wHyCzbxWC3kuQxg3QKJqzyrU+Iu3fX2kSHK
   nyXCOgp2IA7769as3E4kVmaFM6hht81LPEzHJnbj3FDc9aCHTP+gwuREp
   7xKb+pMFb2YCnDO91m6y5yzfRxbmoyeYmZ2MdAPZsx2D1EflNUX/5B0dm
   unEaRZ1gS4IF5RvPuQ2bvq6PN7aoheHhoj3rBuC0Lp8w7T6l8Mz0GLGzO
   g==;
X-CSE-ConnectionGUID: 8jZKiyL0QsK3R4k22NH8sQ==
X-CSE-MsgGUID: fWBokJaHRzSgNcqu/pHBPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="76572003"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="76572003"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 03:53:09 -0800
X-CSE-ConnectionGUID: mTeL+2cYRsi5IgLovF8f1w==
X-CSE-MsgGUID: rqJDk446SLqWsDBiHv2jTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="226783199"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Nov 2025 03:53:07 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJVsu-0005HZ-2w;
	Thu, 13 Nov 2025 11:53:04 +0000
Date: Thu, 13 Nov 2025 19:52:59 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:cifs-next 7/9] fs/smb/client/smb1ops.c:147:34: error:
 passing argument 1 of 'kref_get' from incompatible pointer type
Message-ID: <202511131945.RtCEsLDW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git cifs-next
head:   4ca2b517a4ff65e3e8e3a7decc78e4a23481a1de
commit: 0f9876e25f620d361808d41f0ffac234ad3712ab [7/9] cifs: Remove the server pointer from smb_message
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20251113/202511131945.RtCEsLDW-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511131945.RtCEsLDW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511131945.RtCEsLDW-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/smb/client/smb1ops.c: In function 'cifs_find_mid':
>> fs/smb/client/smb1ops.c:147:34: error: passing argument 1 of 'kref_get' from incompatible pointer type [-Wincompatible-pointer-types]
     147 |                         kref_get(&smb->refcount);
         |                                  ^~~~~~~~~~~~~~
         |                                  |
         |                                  refcount_t * {aka struct refcount_struct *}
   In file included from include/linux/mm_types.h:8,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/pagemap.h:8,
                    from fs/smb/client/smb1ops.c:8:
   include/linux/kref.h:43:42: note: expected 'struct kref *' but argument is of type 'refcount_t *' {aka 'struct refcount_struct *'}
      43 | static inline void kref_get(struct kref *kref)
         |                             ~~~~~~~~~~~~~^~~~
   fs/smb/client/smb1ops.c: In function 'cifs_check_trans2':
>> fs/smb/client/smb1ops.c:449:37: error: passing argument 2 of 'dequeue_mid' makes pointer from integer without a cast [-Wint-conversion]
     449 |                 dequeue_mid(server, malformed);
         |                                     ^~~~~~~~~
         |                                     |
         |                                     int
   In file included from fs/smb/client/smb1ops.c:12:
   fs/smb/client/cifsproto.h:268:70: note: expected 'struct smb_message *' but argument is of type 'int'
     268 | void dequeue_mid(struct TCP_Server_Info *server, struct smb_message *smb, bool malformed);
         |                                                  ~~~~~~~~~~~~~~~~~~~~^~~
>> fs/smb/client/smb1ops.c:449:17: error: too few arguments to function 'dequeue_mid'; expected 3, have 2
     449 |                 dequeue_mid(server, malformed);
         |                 ^~~~~~~~~~~
   fs/smb/client/cifsproto.h:268:6: note: declared here
     268 | void dequeue_mid(struct TCP_Server_Info *server, struct smb_message *smb, bool malformed);
         |      ^~~~~~~~~~~
--
   fs/smb/client/cifstransport.c: In function 'alloc_mid':
>> fs/smb/client/cifstransport.c:48:19: error: passing argument 1 of 'kref_init' from incompatible pointer type [-Wincompatible-pointer-types]
      48 |         kref_init(&smb->refcount);
         |                   ^~~~~~~~~~~~~~
         |                   |
         |                   refcount_t * {aka struct refcount_struct *}
   In file included from include/linux/mm_types.h:8,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:16,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs.h:14,
                    from fs/smb/client/cifstransport.c:10:
   include/linux/kref.h:29:43: note: expected 'struct kref *' but argument is of type 'refcount_t *' {aka 'struct refcount_struct *'}
      29 | static inline void kref_init(struct kref *kref)
         |                              ~~~~~~~~~~~~~^~~~


vim +/kref_get +147 fs/smb/client/smb1ops.c

eb37871118abfc fs/cifs/smb1ops.c       Pavel Shilovsky 2012-05-17  135  
982884b7141b12 fs/smb/client/smb1ops.c David Howells   2025-07-31  136  static struct smb_message *
8aa26f3ed80ddb fs/cifs/smb1ops.c       Pavel Shilovsky 2012-05-17  137  cifs_find_mid(struct TCP_Server_Info *server, char *buffer)
8aa26f3ed80ddb fs/cifs/smb1ops.c       Pavel Shilovsky 2012-05-17  138  {
8aa26f3ed80ddb fs/cifs/smb1ops.c       Pavel Shilovsky 2012-05-17  139  	struct smb_hdr *buf = (struct smb_hdr *)buffer;
982884b7141b12 fs/smb/client/smb1ops.c David Howells   2025-07-31  140  	struct smb_message *smb;
8aa26f3ed80ddb fs/cifs/smb1ops.c       Pavel Shilovsky 2012-05-17  141  
f3ba7c9b0421e3 fs/smb/client/smb1ops.c Wang Zhaolong   2025-08-04  142  	spin_lock(&server->mid_queue_lock);
982884b7141b12 fs/smb/client/smb1ops.c David Howells   2025-07-31  143  	list_for_each_entry(smb, &server->pending_mid_q, qhead) {
982884b7141b12 fs/smb/client/smb1ops.c David Howells   2025-07-31  144  		if (compare_mid(smb->mid, buf) &&
982884b7141b12 fs/smb/client/smb1ops.c David Howells   2025-07-31  145  		    smb->mid_state == MID_REQUEST_SUBMITTED &&
982884b7141b12 fs/smb/client/smb1ops.c David Howells   2025-07-31  146  		    le16_to_cpu(smb->command) == buf->Command) {
982884b7141b12 fs/smb/client/smb1ops.c David Howells   2025-07-31 @147  			kref_get(&smb->refcount);
f3ba7c9b0421e3 fs/smb/client/smb1ops.c Wang Zhaolong   2025-08-04  148  			spin_unlock(&server->mid_queue_lock);
982884b7141b12 fs/smb/client/smb1ops.c David Howells   2025-07-31  149  			return smb;
8aa26f3ed80ddb fs/cifs/smb1ops.c       Pavel Shilovsky 2012-05-17  150  		}
8aa26f3ed80ddb fs/cifs/smb1ops.c       Pavel Shilovsky 2012-05-17  151  	}
f3ba7c9b0421e3 fs/smb/client/smb1ops.c Wang Zhaolong   2025-08-04  152  	spin_unlock(&server->mid_queue_lock);
8aa26f3ed80ddb fs/cifs/smb1ops.c       Pavel Shilovsky 2012-05-17  153  	return NULL;
8aa26f3ed80ddb fs/cifs/smb1ops.c       Pavel Shilovsky 2012-05-17  154  }
8aa26f3ed80ddb fs/cifs/smb1ops.c       Pavel Shilovsky 2012-05-17  155  

:::::: The code at line 147 was first introduced by commit
:::::: 982884b7141b12c9c654dc657724605a87961809 cifs: Rename mid_q_entry to smb_message

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
