Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B30524339A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Feb 2025 06:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739169637; cv=none; b=EgMyaxI2OV13pAw+juszLVFNo/Sziq029ZeV1IW8spCxStrF97/uBdOVFlmFvZ3S4FzRNKEzA7bxCnGhh11/ZuKIheH7B2yssKZlnwM10walWJFKZJfgC/x6zjh6PWZRGIRz/ztOIuTWqC2TDGBrB73KbvlS4bB6ttdG2yfw2BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739169637; c=relaxed/simple;
	bh=SGTdYPXuhBTefowqsT5zq4kuERa0+UQtn7yYYtHX0pA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FyqKxPewN5lBJw27ID3NSgFmffb4nMe4crlmCBSuE1Q3DoxU20fwzkUmRHXMkEvBTBO9Er+Cctg/rEd945BBeZMhCu4I4Teh1eXClaO9Y8jKylNW6BTvADuGWxCMWo7SirtUqWEyyERhwq05lJ0LQg+gcOoT1o/TtClI7hOg7RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j7I5sNhc; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j7I5sNhc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739169636; x=1770705636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SGTdYPXuhBTefowqsT5zq4kuERa0+UQtn7yYYtHX0pA=;
  b=j7I5sNhcNh0OZXcxZzETYZ75oBmzKIqaddSAfE3/MCuvI+5+WfFsUbnk
   lVadE++0lQp04NzIVsPFoWjv1HqwuZ3/8HnXRIqOFlMdp2jM8sC6+6tWg
   dzSp3r2isbP31TBkd6PlLztqb2F5lGs2bym+raiPeyEYzatSkwq+gu5NS
   gttvhUrx0/C3gvkhif0b/xTT9VYhm5LZaCyNZg/cNhcaAueRKpSf+JQet
   mopf4L6QFnzYJ+M0F6K3EB2JHHqOT3X4HI62fAvz9ZP93OsfP7ZzSiuJ4
   PbrN9WSgedenpoLKJGfvG7xNoBOLsm0C5Az4gBRd/RaSS1gqUBPRY0I3L
   Q==;
X-CSE-ConnectionGUID: fdI+H3+2TourX/506PLUTw==
X-CSE-MsgGUID: wM+h+XRLTNeI8zM4gm9I1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="43395689"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="43395689"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 22:40:35 -0800
X-CSE-ConnectionGUID: JHRY7zehQQu4Z7aMe1g8pA==
X-CSE-MsgGUID: 7iiEPcigR3C4azRCjD08nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="111932311"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Feb 2025 22:40:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thNT5-0012MR-28;
	Mon, 10 Feb 2025 06:40:31 +0000
Date: Mon, 10 Feb 2025 14:40:10 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:crypto-krb5 22/27] fs/afs/cm_security.c:48:undefined
 reference to `rxkad_kernel_respond_to_challenge'
Message-ID: <202502101452.83heiFcl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git crypto-krb5
head:   eb2ef20c8f90912443f70e3cc46ddd4d4dea591f
commit: 6aad41326de842cc9aa4cd58fe8fb4018a5c3241 [22/27] rxrpc: Allow CHALLENGEs to the passed to the app for a RESPONSE
config: sparc-randconfig-002-20250210 (https://download.01.org/0day-ci/archive/20250210/202502101452.83heiFcl-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502101452.83heiFcl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502101452.83heiFcl-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: fs/afs/cm_security.o: in function `afs_respond_to_challenge':
>> fs/afs/cm_security.c:48:(.text+0xbc): undefined reference to `rxkad_kernel_respond_to_challenge'


vim +48 fs/afs/cm_security.c

    14	
    15	/*
    16	 * Respond to an RxGK challenge, adding appdata.
    17	 */
    18	static int afs_respond_to_challenge(struct sk_buff *challenge)
    19	{
    20		struct rxrpc_peer *peer;
    21		unsigned long peer_data;
    22		u16 service_id;
    23		u8 security_index;
    24	
    25		rxrpc_kernel_query_challenge(challenge, &peer, &peer_data,
    26					     &service_id, &security_index);
    27	
    28		_enter("%u,%u", service_id, security_index);
    29	
    30		switch (service_id) {
    31			/* We don't send CM_SERVICE RPCs, so don't expect a challenge
    32			 * therefrom.
    33			 */
    34		case FS_SERVICE:
    35		case VL_SERVICE:
    36		case YFS_FS_SERVICE:
    37		case YFS_VL_SERVICE:
    38			break;
    39		default:
    40			pr_warn("Can't respond to unknown challenge %u:%u",
    41				service_id, security_index);
    42			return rxrpc_kernel_reject_challenge(challenge, RX_USER_ABORT, -EPROTO,
    43							     afs_abort_unsupported_sec_class);
    44		}
    45	
    46		switch (security_index) {
    47		case RXRPC_SECURITY_RXKAD:
  > 48			return rxkad_kernel_respond_to_challenge(challenge);
    49	
    50		default:
    51			return rxrpc_kernel_reject_challenge(challenge, RX_USER_ABORT, -EPROTO,
    52							     afs_abort_unsupported_sec_class);
    53		}
    54	}
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
