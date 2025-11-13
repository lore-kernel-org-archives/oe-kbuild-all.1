Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DADC2E22BE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 12:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763036834; cv=none; b=GmOZYkmOzB6uwl47tVKNpasM8TJ+qe78xO4mzNAwCzgTmdWTw2FknnCJ7rR2jT2Shtn1UchmBR2lvMfHxQMKAimCxOsh8wH/2oArbTu8sA8ciqaTUovTYkswJUP93Bmo4jdURQj7aqqmXrkRzveuOIZKaUR6/neryWDXn0xt140=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763036834; c=relaxed/simple;
	bh=nFWiEXUiwl19n7yBu6Qcl+UlL4wXqS3etNNXRhMwlQA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rom39TatzlVV/ADZ3/aLfd5fh8K/0VZ63p6kIXvHjkw9DzjEKef0SIeEBmGl66RwTwO+jJRWt1XX/CBflXs8a2nq+kQfk1v8zNT7FNH/Cd5D5LgDmXSX26JLklhytshmU9jIIYd84L/WSRlke0ED/m2xkJhDGzvhW/sUsFT5cME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cG3di2RR; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cG3di2RR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763036832; x=1794572832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nFWiEXUiwl19n7yBu6Qcl+UlL4wXqS3etNNXRhMwlQA=;
  b=cG3di2RR5ME+0C1HniJCMQQqzH9HSLqOQQ6UHmoxIOBcvkAugzo7m09v
   592EPB5BAYSyT2Jg0leElGIXbbpIehwV6fGQyAcu04gVzXfgvHg2NS8B9
   TMKghhw2a2NQhEdBkGLNLFkPTmrJPdSUyFzbbZ5EM0RkvIvFw6Nh0UWve
   FZZMNPl0aMOhD3grn3dMZzVw6k7lbIoULgFsGlsJZxrA0V5RLONe2fAwu
   ovHuZ8RG3hFQjSDn1UcP5drQaht/e0HEbpU7nChhPgyPtRrIhvw/CNB3Y
   O2qHtbypMiT6p4Ni+spcdFLubygS8tVWxdLCc+GW6l7tcnvy5VjwMbr3z
   w==;
X-CSE-ConnectionGUID: CQZnL2VyTHeOEpFAb5FG8g==
X-CSE-MsgGUID: f+QbSzi+SPe3jqtaa3OKSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="75793361"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="75793361"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 04:27:12 -0800
X-CSE-ConnectionGUID: TGBnaki8RiKR5Cq5oEW+Vw==
X-CSE-MsgGUID: ttPoUxxhSGqLQJ+jpy/Xzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="226789282"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Nov 2025 04:27:11 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJWPs-0005Jp-1g;
	Thu, 13 Nov 2025 12:27:08 +0000
Date: Thu, 13 Nov 2025 20:26:41 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:cifs-next 7/9] fs/smb/client/smb1ops.c:449:37: warning:
 passing argument 2 of 'dequeue_mid' makes pointer from integer without a
 cast
Message-ID: <202511132044.l5sVSB1k-lkp@intel.com>
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
config: x86_64-randconfig-072-20251113 (https://download.01.org/0day-ci/archive/20251113/202511132044.l5sVSB1k-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511132044.l5sVSB1k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511132044.l5sVSB1k-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/smb/client/smb1ops.c: In function 'cifs_find_mid':
   fs/smb/client/smb1ops.c:147:34: error: passing argument 1 of 'kref_get' from incompatible pointer type [-Werror=incompatible-pointer-types]
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
>> fs/smb/client/smb1ops.c:449:37: warning: passing argument 2 of 'dequeue_mid' makes pointer from integer without a cast [-Wint-conversion]
     449 |                 dequeue_mid(server, malformed);
         |                                     ^~~~~~~~~
         |                                     |
         |                                     int
   In file included from fs/smb/client/smb1ops.c:12:
   fs/smb/client/cifsproto.h:268:70: note: expected 'struct smb_message *' but argument is of type 'int'
     268 | void dequeue_mid(struct TCP_Server_Info *server, struct smb_message *smb, bool malformed);
         |                                                  ~~~~~~~~~~~~~~~~~~~~^~~
   fs/smb/client/smb1ops.c:449:17: error: too few arguments to function 'dequeue_mid'
     449 |                 dequeue_mid(server, malformed);
         |                 ^~~~~~~~~~~
   fs/smb/client/cifsproto.h:268:6: note: declared here
     268 | void dequeue_mid(struct TCP_Server_Info *server, struct smb_message *smb, bool malformed);
         |      ^~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/dequeue_mid +449 fs/smb/client/smb1ops.c

   432	
   433	static bool
   434	cifs_check_trans2(struct smb_message *smb, struct TCP_Server_Info *server,
   435			  char *buf, int malformed)
   436	{
   437		if (malformed)
   438			return false;
   439		if (check2ndT2(buf) <= 0)
   440			return false;
   441		smb->multiRsp = true;
   442		if (smb->resp_buf) {
   443			/* merge response - fix up 1st*/
   444			malformed = coalesce_t2(buf, smb->resp_buf, &smb->response_pdu_len);
   445			if (malformed > 0)
   446				return true;
   447			/* All parts received or packet is malformed. */
   448			smb->multiEnd = true;
 > 449			dequeue_mid(server, malformed);
   450			return true;
   451		}
   452		if (!server->large_buf) {
   453			/*FIXME: switch to already allocated largebuf?*/
   454			cifs_dbg(VFS, "1st trans2 resp needs bigbuf\n");
   455		} else {
   456			/* Have first buffer */
   457			smb->resp_buf = buf;
   458			smb->large_buf = true;
   459			server->bigbuf = NULL;
   460		}
   461		return true;
   462	}
   463	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
